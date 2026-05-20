# 001_ASDiscoveredDisplayItem.pdf

## Page 1

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


## Page 2

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


