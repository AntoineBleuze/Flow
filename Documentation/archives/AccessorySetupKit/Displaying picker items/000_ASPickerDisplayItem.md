# 000_ASPickerDisplayItem.pdf

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


