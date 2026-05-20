# Accessory description.pdf

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


## Page 4

When your app’s picker uses the filterDiscoveryResults option, you receive ASAccessor
EventType.accessoryDiscovered events that contain this type. Use the discovered
accessory’s Bluetooth properties to create a new ASDiscoveredDisplayItem, incorporating
traits like a custom accessory name or a newly downloaded product image. You can then add this
item to the picker to allow the person using the app to set up the accessory.
var bluetoothAdvertisementData: [AnyHashable : Any]?
The Bluetooth advertisement data from the discovered accessory.
var bluetoothRSSI: Int?
The Bluetooth RSSI (Received Signal Strength Indicator) value from the discovered accessor
Overview
Topics
Working with accessory properties
Relationships
AccessorySetupKit / ASDiscoveredAccessory
Class
ASDiscoveredAccessory
A discovered accessory, for use in creating a customized picker display item.
iOS 26.1+
iPadOS 26.1+


## Page 5

ASAccessory
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Sendable
SendableMetatype
class ASAccessory
An accessory discovered by the accessory session.
enum AccessoryState
An enumeration of possible authorization states of an accessory.
Inherits From
Conforms To
See Also
Accessory description


## Page 6

init?(rawValue: Int)
case unauthorized
The accessory is invalid or unauthorized.
case awaitingAuthorization
The accessory is selected, but full authorization is still pending.
case authorized
The accessory is authorized and available.
Topics
Creating a state instance
Accessory states
Relationships
Conforms To
AccessorySetupKit / ASAccessory / ASAccessory.AccessoryState
Enumeration
ASAccessory.AccessoryState
An enumeration of possible authorization states of an accessory.
iOS 18.0+
iPadOS 18.0+


## Page 7

BitwiseCopyable
Equatable
Hashable
RawRepresentable
Sendable
SendableMetatype
class ASAccessory
An accessory discovered by the accessory session.
class ASDiscoveredAccessory
A discovered accessory, for use in creating a customized picker display item.
See Also
Accessory description


