# 000_ASAccessory.pdf

## Page 1

var bluetoothIdentifier: UUID?
The accessory’s unique Bluetooth identifier, if any.
var bluetoothTransportBridgingIdentifier: Data?
The accessory’s Bluetooth identifier, if any, for use when bridging classic transport profiles.
var ssid: String?
The accessory’s Wi-Fi SSID, if any.
var displayName: String
The accessory’s name, suitable for displaying to someone using your app.
var descriptor: ASDiscoveryDescriptor
The descriptor used to discover the accessory.
Topics
Accessing identifiers
Presenting a display name
Inspecting the accessory’s descriptor
AccessorySetupKit / ASAccessory
Class
ASAccessory
An accessory discovered by the accessory session.
iOS 18.0+
iPadOS 18.0+


## Page 2

var state: ASAccessory.AccessoryState
The current authorization state of the accessory.
enum AccessoryState
An enumeration of possible authorization states of an accessory.
var wifiAwarePairedDeviceID: ASAccessory.WiFiAwarePairedDeviceID
The accessory’s Wi-Fi Aware Pairing Identifier.
typealias WiFiAwarePairedDeviceID
The type used for an accessory’s Wi-Fi Aware Pairing Identifier.
NSObject
ASDiscoveredAccessory
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Sendable
SendableMetatype
Inspecting accessory state
Working with Wi-Fi Aware
Relationships
Inherits From
Inherited By
Conforms To


## Page 3

class ASDiscoveredAccessory
A discovered accessory, for use in creating a customized picker display item.
enum AccessoryState
An enumeration of possible authorization states of an accessory.
See Also
Accessory description


