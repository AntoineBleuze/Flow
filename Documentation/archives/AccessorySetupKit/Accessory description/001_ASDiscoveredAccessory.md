# 001_ASDiscoveredAccessory.pdf

## Page 1

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


## Page 2

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


