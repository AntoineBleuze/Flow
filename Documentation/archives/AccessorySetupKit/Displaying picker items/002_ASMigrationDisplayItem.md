# 002_ASMigrationDisplayItem.pdf

## Page 1

Discovering and configuring accessories
Create instances of ASMigrationDisplayItem by calling the superclass’s initializer
init(name:productImage:descriptor:), then specify the Bluetooth peripheral
Identifier, the Wi-Fi hotspotSSID, or both, for the specific accessory you want to migrate.
var peripheralIdentifier: UUID?
The Bluetooth identifier of the accessory to migrate.
var hotspotSSID: String?
The Wi-Fi hotspot SSID of the accessory to migrate.
Mentioned in
Overview
Topics
Accessory identifiers
AccessorySetupKit / ASMigrationDisplayItem
Class
ASMigrationDisplayItem
A previously-discovered accessory as presented by the discovery picker, for use
when migrating it to AccessorySetupKit.
iOS 18.0+
iPadOS 18.0+


## Page 2

var wifiAwarePairedDeviceID: ASAccessory.WiFiAwarePairedDeviceID
The Wi-Fi Aware paired device identififer of the accessory to migrate.
ASPickerDisplayItem
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Sendable
SendableMetatype
class ASPickerDisplayItem
An accessory as presented by the discovery picker.
class ASDiscoveredDisplayItem
A picker display item created from customizing a discovered accessory.
Relationships
Inherits From
Conforms To
See Also
Displaying picker items


