import Foundation

/// Erreurs de lecture/écriture des données horaires compactes CSA.
enum CSADataLoaderError: Error, LocalizedError, Equatable {
    case resourceNotFound(String)
    case invalidMagic
    case unsupportedVersion(UInt32)
    case truncatedData
    case invalidUTF8String
    case unsortedConnections

    var errorDescription: String? {
        switch self {
        case .resourceNotFound(let name):
            return "Ressource horaire CSA introuvable : \(name)"
        case .invalidMagic:
            return "En-tête binaire CSA invalide (attendu : FCSA)."
        case .unsupportedVersion(let version):
            return "Version de format binaire CSA non supportée : \(version)."
        case .truncatedData:
            return "Fichier binaire CSA tronqué ou corrompu."
        case .invalidUTF8String:
            return "Chaîne UTF-8 invalide dans le binaire CSA."
        case .unsortedConnections:
            return "Les connexions CSA ne sont pas triées par heure de départ croissante."
        }
    }
}

/// Chargeur haute performance pour le format binaire plat `FCSA` v1 et le JSON compact indexé par `Int32`.
enum CSADataLoader {
    static let formatMagic: [UInt8] = [0x46, 0x43, 0x53, 0x41] // "FCSA"
    static let formatVersion: UInt32 = 1

    // MARK: - Chargement depuis le Bundle / Workspace

    /// Charge le dataset ferré local (`transit_schedule.bin`) en mémoire.
    static func loadBundledNetwork(resourceName: String = "transit_schedule") throws -> CSANetworkData {
        if let bundleURL = Bundle.main.url(forResource: resourceName, withExtension: "bin") {
            let data = try Data(contentsOf: bundleURL, options: .mappedIfSafe)
            return try decodeBinary(data)
        }

        // Chemins de repli utiles en environnement de test unitaire ou SwiftUI Preview
        let sourceDir = URL(fileURLWithPath: #filePath)
            .deletingLastPathComponent() // CSA
            .deletingLastPathComponent() // Services
            .deletingLastPathComponent() // Flow
        let fallbackURL = sourceDir.appendingPathComponent("Data/\(resourceName).bin")

        if FileManager.default.fileExists(atPath: fallbackURL.path) {
            let data = try Data(contentsOf: fallbackURL, options: .mappedIfSafe)
            return try decodeBinary(data)
        }

        throw CSADataLoaderError.resourceNotFound("\(resourceName).bin")
    }

    // MARK: - Décodage Binaire Plat (`FCSA` v1)

    static func decodeBinary(_ data: Data) throws -> CSANetworkData {
        assert(MemoryLayout<Connection>.size == 24 && MemoryLayout<Connection>.stride == 24)

        return try data.withUnsafeBytes { rawBuffer -> CSANetworkData in
            var cursor = BinaryCursor(buffer: rawBuffer)

            // Header (24 octets) : magic(4), version(UInt32), stopCount, lineCount, transferCount, connectionCount
            let m0 = try cursor.readUInt8()
            let m1 = try cursor.readUInt8()
            let m2 = try cursor.readUInt8()
            let m3 = try cursor.readUInt8()
            guard [m0, m1, m2, m3] == formatMagic else {
                throw CSADataLoaderError.invalidMagic
            }

            let version = try cursor.readUInt32()
            guard version == formatVersion else {
                throw CSADataLoaderError.unsupportedVersion(version)
            }

            let stopCount = Int(try cursor.readUInt32())
            let lineCount = Int(try cursor.readUInt32())
            let transferCount = Int(try cursor.readUInt32())
            let connectionCount = Int(try cursor.readUInt32())

            // Section 1 : Lines
            var lines = ContiguousArray<CSALine>()
            lines.reserveCapacity(lineCount)
            for _ in 0..<lineCount {
                let id = try cursor.readInt32()
                let modeRaw = try cursor.readUInt8()
                let mode = CSATransportMode(rawValue: modeRaw) ?? .metro
                let codeLen = Int(try cursor.readUInt16())
                let code = try cursor.readString(byteCount: codeLen)
                let nameLen = Int(try cursor.readUInt16())
                let name = try cursor.readString(byteCount: nameLen)
                let colorLen = Int(try cursor.readUInt8())
                let colorHex = try cursor.readString(byteCount: colorLen)

                lines.append(
                    CSALine(
                        id: id,
                        code: code,
                        name: name,
                        mode: mode,
                        colorHex: colorHex
                    )
                )
            }

            // Section 2 : Stops
            var stops = ContiguousArray<Stop>()
            stops.reserveCapacity(stopCount)
            for _ in 0..<stopCount {
                let id = try cursor.readInt32()
                let rawParent = try cursor.readInt32()
                let parentId: Int32? = rawParent < 0 ? nil : rawParent
                let latitude = try cursor.readDouble()
                let longitude = try cursor.readDouble()
                let nameLen = Int(try cursor.readUInt16())
                let name = try cursor.readString(byteCount: nameLen)

                stops.append(
                    Stop(
                        id: id,
                        name: name,
                        latitude: latitude,
                        longitude: longitude,
                        parentStationId: parentId
                    )
                )
            }

            // Alignement sur 4 octets avant les tables d'entiers 32 bits
            try cursor.align(to: 4)

            // Section 3 : Transfers (12 octets par entrée)
            let requiredTransferBytes = transferCount * 12
            guard cursor.remaining >= requiredTransferBytes else {
                throw CSADataLoaderError.truncatedData
            }
            var transfers = ContiguousArray<CSAFootpath>()
            transfers.reserveCapacity(transferCount)
            for _ in 0..<transferCount {
                let fromStop = try cursor.readInt32()
                let toStop = try cursor.readInt32()
                let duration = try cursor.readInt32()
                transfers.append(
                    CSAFootpath(
                        fromStop: fromStop,
                        toStop: toStop,
                        durationSeconds: duration
                    )
                )
            }

            // Section 4 : Connections (24 octets par entrée, triées par departureTime croissant)
            let requiredConnectionBytes = connectionCount * 24
            guard cursor.remaining >= requiredConnectionBytes else {
                throw CSADataLoaderError.truncatedData
            }

            let connections = try cursor.readConnectionsContiguous(count: connectionCount)
            guard CSANetworkData.isSortedByDeparture(connections) else {
                throw CSADataLoaderError.unsortedConnections
            }

            return CSANetworkData(
                stops: stops,
                lines: lines,
                transfers: transfers,
                connections: connections,
                ensureSortedConnections: false
            )
        }
    }

    // MARK: - Encodage Binaire Plat (`FCSA` v1)

    static func encodeBinary(_ network: CSANetworkData) -> Data {
        var data = Data()
        data.reserveCapacity(24 + network.stops.count * 40 + network.connections.count * 24)

        data.append(contentsOf: formatMagic)
        appendUInt32(&data, formatVersion)
        appendUInt32(&data, UInt32(network.stops.count))
        appendUInt32(&data, UInt32(network.lines.count))
        appendUInt32(&data, UInt32(network.transfers.count))
        appendUInt32(&data, UInt32(network.connections.count))

        for line in network.lines {
            let codeBytes = Array(line.code.utf8)
            let nameBytes = Array(line.name.utf8)
            let colorBytes = Array(line.colorHex.utf8)
            appendInt32(&data, line.id)
            data.append(line.mode.rawValue)
            appendUInt16(&data, UInt16(codeBytes.count))
            data.append(contentsOf: codeBytes)
            appendUInt16(&data, UInt16(nameBytes.count))
            data.append(contentsOf: nameBytes)
            data.append(UInt8(colorBytes.count))
            data.append(contentsOf: colorBytes)
        }

        for stop in network.stops {
            let nameBytes = Array(stop.name.utf8)
            appendInt32(&data, stop.id)
            appendInt32(&data, stop.parentStationId ?? -1)
            appendDouble(&data, stop.latitude)
            appendDouble(&data, stop.longitude)
            appendUInt16(&data, UInt16(nameBytes.count))
            data.append(contentsOf: nameBytes)
        }

        let rem = data.count % 4
        if rem != 0 {
            data.append(contentsOf: repeatElement(UInt8(0), count: 4 - rem))
        }

        for tr in network.transfers {
            appendInt32(&data, tr.fromStop)
            appendInt32(&data, tr.toStop)
            appendInt32(&data, tr.durationSeconds)
        }

        for conn in network.connections {
            appendInt32(&data, conn.departureStop)
            appendInt32(&data, conn.arrivalStop)
            appendInt32(&data, conn.departureTime)
            appendInt32(&data, conn.arrivalTime)
            appendInt32(&data, conn.tripId)
            appendInt32(&data, conn.lineId)
        }

        return data
    }

    // MARK: - Décodage JSON Compact

    private struct CompactJSONPayload: Decodable {
        let version: Int
        let lines: [CSALine]
        let stops: [Stop]
        let transfers: [[Int32]]
        let connections: [[Int32]]
    }

    static func decodeCompactJSON(_ data: Data) throws -> CSANetworkData {
        let payload = try JSONDecoder().decode(CompactJSONPayload.self, from: data)

        var transfers = ContiguousArray<CSAFootpath>()
        transfers.reserveCapacity(payload.transfers.count)
        for row in payload.transfers where row.count >= 3 {
            transfers.append(
                CSAFootpath(fromStop: row[0], toStop: row[1], durationSeconds: row[2])
            )
        }

        var connections = ContiguousArray<Connection>()
        connections.reserveCapacity(payload.connections.count)
        for row in payload.connections where row.count >= 6 {
            connections.append(
                Connection(
                    departureStop: row[0],
                    arrivalStop: row[1],
                    departureTime: row[2],
                    arrivalTime: row[3],
                    tripId: row[4],
                    lineId: row[5]
                )
            )
        }

        return CSANetworkData(
            stops: ContiguousArray(payload.stops),
            lines: ContiguousArray(payload.lines),
            transfers: transfers,
            connections: connections,
            ensureSortedConnections: true
        )
    }

    // MARK: - Helpers d'écriture Little-Endian

    @inline(__always)
    private static func appendUInt16(_ data: inout Data, _ value: UInt16) {
        var le = value.littleEndian
        withUnsafeBytes(of: &le) { data.append(contentsOf: $0) }
    }

    @inline(__always)
    private static func appendUInt32(_ data: inout Data, _ value: UInt32) {
        var le = value.littleEndian
        withUnsafeBytes(of: &le) { data.append(contentsOf: $0) }
    }

    @inline(__always)
    private static func appendInt32(_ data: inout Data, _ value: Int32) {
        var le = value.littleEndian
        withUnsafeBytes(of: &le) { data.append(contentsOf: $0) }
    }

    @inline(__always)
    private static func appendDouble(_ data: inout Data, _ value: Double) {
        var bits = value.bitPattern.littleEndian
        withUnsafeBytes(of: &bits) { data.append(contentsOf: $0) }
    }
}

// MARK: - Curseur binaire sans allocation

private struct BinaryCursor {
    let buffer: UnsafeRawBufferPointer
    var offset: Int = 0

    var remaining: Int {
        buffer.count - offset
    }

    mutating func align(to alignment: Int) throws {
        let rem = offset % alignment
        if rem != 0 {
            let skip = alignment - rem
            guard remaining >= skip else { throw CSADataLoaderError.truncatedData }
            offset += skip
        }
    }

    @inline(__always)
    mutating func readUInt8() throws -> UInt8 {
        guard remaining >= 1 else { throw CSADataLoaderError.truncatedData }
        let val = buffer[offset]
        offset += 1
        return val
    }

    @inline(__always)
    mutating func readUInt16() throws -> UInt16 {
        guard remaining >= 2 else { throw CSADataLoaderError.truncatedData }
        let val = buffer.loadUnaligned(fromByteOffset: offset, as: UInt16.self)
        offset += 2
        return UInt16(littleEndian: val)
    }

    @inline(__always)
    mutating func readUInt32() throws -> UInt32 {
        guard remaining >= 4 else { throw CSADataLoaderError.truncatedData }
        let val = buffer.loadUnaligned(fromByteOffset: offset, as: UInt32.self)
        offset += 4
        return UInt32(littleEndian: val)
    }

    @inline(__always)
    mutating func readInt32() throws -> Int32 {
        guard remaining >= 4 else { throw CSADataLoaderError.truncatedData }
        let val = buffer.loadUnaligned(fromByteOffset: offset, as: Int32.self)
        offset += 4
        return Int32(littleEndian: val)
    }

    @inline(__always)
    mutating func readDouble() throws -> Double {
        guard remaining >= 8 else { throw CSADataLoaderError.truncatedData }
        let bits = buffer.loadUnaligned(fromByteOffset: offset, as: UInt64.self)
        offset += 8
        return Double(bitPattern: UInt64(littleEndian: bits))
    }

    mutating func readString(byteCount: Int) throws -> String {
        if byteCount == 0 { return "" }
        guard remaining >= byteCount else { throw CSADataLoaderError.truncatedData }
        let slice = UnsafeRawBufferPointer(rebasing: buffer[offset..<(offset + byteCount)])
        offset += byteCount
        guard let str = String(bytes: slice, encoding: .utf8) else {
            throw CSADataLoaderError.invalidUTF8String
        }
        return str
    }

    mutating func readConnectionsContiguous(count: Int) throws -> ContiguousArray<Connection> {
        let byteLen = count * 24
        guard remaining >= byteLen else { throw CSADataLoaderError.truncatedData }
        guard let basePtr = buffer.baseAddress else {
            return ContiguousArray()
        }
        let startPtr = basePtr.advanced(by: offset)
        offset += byteLen

        return ContiguousArray<Connection>(unsafeUninitializedCapacity: count) { destBuffer, initializedCount in
            #if _endian(little)
            if let destBase = destBuffer.baseAddress {
                memcpy(destBase, startPtr, byteLen)
                initializedCount = count
                return
            }
            #endif
            for i in 0..<count {
                let itemOffset = i * 24
                let depStop = Int32(littleEndian: startPtr.loadUnaligned(fromByteOffset: itemOffset, as: Int32.self))
                let arrStop = Int32(littleEndian: startPtr.loadUnaligned(fromByteOffset: itemOffset + 4, as: Int32.self))
                let depTime = Int32(littleEndian: startPtr.loadUnaligned(fromByteOffset: itemOffset + 8, as: Int32.self))
                let arrTime = Int32(littleEndian: startPtr.loadUnaligned(fromByteOffset: itemOffset + 12, as: Int32.self))
                let tripId = Int32(littleEndian: startPtr.loadUnaligned(fromByteOffset: itemOffset + 16, as: Int32.self))
                let lineId = Int32(littleEndian: startPtr.loadUnaligned(fromByteOffset: itemOffset + 20, as: Int32.self))
                destBuffer[i] = Connection(
                    departureStop: depStop,
                    arrivalStop: arrStop,
                    departureTime: depTime,
                    arrivalTime: arrTime,
                    tripId: tripId,
                    lineId: lineId
                )
            }
            initializedCount = count
        }
    }
}
