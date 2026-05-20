# 000_AssetPackManifest.pdf

## Page 1

This structure applies only when you want to manage your asset packs manually. Don’t use this
structure if you want to opt in to automatic management of asset packs.
init(contentsOf: URL, appGroupID: String) throws
Creates a representation of a manifest in memory given a URL to the manifest’s representati
as a JSON file on disk.
init(from: Data, appGroupID: String) throws
Creates a representation of a manifest in memory given JSON-encoded data.
func allDownloads(for: BAContentRequest?) -> Set<BADownload>
Creates download objects for every applicable asset pack, which can be scheduled with the
download manager.
Overview
Topics
Creating an asset pack manifest
Accessing downloads
Background Assets / AssetPackManifest
Structure
AssetPackManifest
A representation of a manifest that lists asset packs that are available to downloa
iOS 26.0+
iPadOS 26.0+
Mac Catalyst 26.0+
macOS 26.0+
tvOS 26.0+
visionOS 26.0+


## Page 2

let assetPacks: Set<AssetPack>
The asset packs that are available to download.
struct DecodingConfiguration
A structure that includes information for decoding an asset-pack manifest.
CustomStringConvertible
DecodableWithConfiguration
Encodable
Sendable
SendableMetatype
Getting asset packs
Structures
Relationships
Conforms To


