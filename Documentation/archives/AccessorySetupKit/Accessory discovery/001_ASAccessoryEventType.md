# 001_ASAccessoryEventType.pdf

## Page 1

init?(rawValue: Int)
case accessoryAdded
The session added an accessory.
case accessoryChanged
The properties of an accessory changed.
case accessoryRemoved
The session removed an accessory.
case activated
The discovery session activated.
case invalidated
Topics
Creating an event type instance
Accessory events
Life cycle events
AccessorySetupKit / ASAccessoryEventType
Enumeration
ASAccessoryEventType
An enumeration of the types of events encountered during accessory discovery
iOS 18.0+
iPadOS 18.0+
Mac Catalyst


## Page 2

The discovery session invalidated.
case accessoryDiscovered
The session discovered an accessory.
case pickerDidPresent
The discovery session picker appeared.
case pickerDidDismiss
The discovery session picker dismissed.
case pickerSetupBridging
The discovery session picker started bridging with an accessory.
case pickerSetupPairing
The discovery session picker started pairing with a Bluetooth accessory.
case pickerSetupFailed
The discovery session picker setup failed.
case pickerSetupRename
The discovery session picker started renaming an accessory.
case migrationComplete
The migration of an accessory completed.
case unknown
An unknown event occurred.
Discovery events
Picker events
Migration events
Unclassified events
Relationships


## Page 3

BitwiseCopyable
Equatable
Hashable
RawRepresentable
Sendable
SendableMetatype
class ASAccessoryEvent
Properties of an event encountered during accessory discovery.
class ASDiscoveryDescriptor
Descriptive traits used to discover accessories.
Conforms To
See Also
Accessory discovery


