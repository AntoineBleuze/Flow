# Displaying picker items.pdf

## Page 1

Discovering and configuring accessories
Create instances of ASPickerDisplayItem that describe the accessories you want to discove
Each item contains a name and product image to display, plus an ASDiscoveryDescriptor th
identifies the kind of accessories to match. Pass these in an array to showPicker(for:
completionHandler:) to display a picker that allows the person using your app to discover an
select nearby accessories.
Filter the matched accessories by supplying a descriptor, which contains various Bluetooth an
Wi-Fi properties to match. The descriptor also allows you to set the bluetoothRange of matche
accessories; set its value to ASDiscoveryDescriptor.Range.immediate to limit discovery 
Bluetooth accessories to those within the immediate proximity of the device running your app.
To enable different behaviors during setup, use the setupOptions property, which is an option
set (Swift) or bitfield (Objective-C) of behavior options. The defined options in ASPickerDispla
Item.SetupOptions allow you to specify behaviors like allowing renaming of the accessory
during setup, or confirming accessory authorization before showing the setup view.
Mentioned in
Overview
Topics
AccessorySetupKit / ASPickerDisplayItem
Class
ASPickerDisplayItem
An accessory as presented by the discovery picker.
iOS 18.0+
iPadOS 18.0+


## Page 2

init(name: String, productImage: UIImage, descriptor: ASDiscovery
Descriptor)
Creates a picker display item with a name and image to display and a descriptor to match
discovered accessories.
var descriptor: ASDiscoveryDescriptor
A descriptor that the picker uses to determine which discovered accessories to display.
var name: String
The accessory name to display in the picker.
var productImage: UIImage
An image of the accessory to display in the picker.
var setupOptions: ASPickerDisplayItem.SetupOptions
Custom setup options for the accessory.
struct SetupOptions
Setup options offered by the accessory picker.
var renameOptions: ASAccessory.RenameOptions
Options to allow renaming a matched accessory.
struct RenameOptions
Options that affect the behavior of an accessory renaming operation.
Creating a display item
Specifying discovery properties
Customizing display properties
Customizing setup options
Relationships
Inherits From


## Page 3

NSObject
ASDiscoveredDisplayItem, ASMigrationDisplayItem
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Sendable
SendableMetatype
class ASDiscoveredDisplayItem
A picker display item created from customizing a discovered accessory.
class ASMigrationDisplayItem
A previously-discovered accessory as presented by the discovery picker, for use when
migrating it to AccessorySetupKit.
Inherited By
Conforms To
See Also
Displaying picker items


## Page 4

Discovering and configuring accessories
Use this type when your app’s picker uses the filterDiscoveryResults option. With this
option enabled, your discovery session receives ASAccessoryEventType.accessory
Discovered events with discovered accessories. To include a discovered accessory in the picke
create an instance of this class, optionally using the Bluetooth properties of the event’s
ASDiscoveredAccessory to provide a more specific name or product image. Then send the
ASDiscoveredDisplayItem to the picker with the session’s updatePicker(showing:
completionHandler:) method.
init(name: String, productImage: UIImage, accessory: ASDiscovered
Accessory)
Mentioned in
Overview
Topics
Creating an updated display item
AccessorySetupKit / ASDiscoveredDisplayItem
Class
ASDiscoveredDisplayItem
A picker display item created from customizing a discovered accessory.
iOS 26.1+
iPadOS 26.1+


## Page 5

Creates a discovered picker display item with a name and image to display and a descriptor 
match discovered accessories.
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
class ASMigrationDisplayItem
A previously-discovered accessory as presented by the discovery picker, for use when
migrating it to AccessorySetupKit.
Relationships
Inherits From
Conforms To
See Also
Displaying picker items


## Page 6

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


## Page 7

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


