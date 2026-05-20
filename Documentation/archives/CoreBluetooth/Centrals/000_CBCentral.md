# 000_CBCentral.pdf

## Page 1

The CBCentral class represents remote central devices (or centrals) that have connected to an
app implementing the peripheral role on a local device. Remote centrals use universally unique
identifiers (UUIDs), represented by NSUUID objects, to identify themselves.
var maximumUpdateValueLength: Int
The maximum amount of data, in bytes, that the central can receive in a single notification o
indication.
CBPeer
Overview
Topics
Identifying a Remote Central
Relationships
Inherits From
Core Bluetooth / CBCentral
Class
CBCentral
A remote device connected to a local app, which is acting as a peripheral.
iOS 6.0+
iPadOS 6.0+
Mac Catalyst 13.1+
macOS 10.9+
tvOS 9.0+
visionOS 1.0+
watchOS 2.0+


## Page 2

CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCopying
NSObjectProtocol
class CBCentralManager
An object that scans for, discovers, connects to, and manages peripherals.
protocol CBCentralManagerDelegate
A protocol that provides updates for the discovery and management of peripheral devices.
Conforms To
See Also
Centrals


