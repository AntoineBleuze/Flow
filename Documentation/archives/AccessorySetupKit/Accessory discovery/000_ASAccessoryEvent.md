# 000_ASAccessoryEvent.pdf

## Page 1

Discovering and configuring accessories
The event handler you register with the session’s activate(on:eventHandler:) method
receives objects of this type from the session. Each event identifies the type of event and which
accessory (if any) is involved.
var accessory: ASAccessory?
The accessory involved in the event, if any.
class ASAccessory
An accessory discovered by the accessory session.
var eventType: ASAccessoryEventType
Mentioned in
Overview
Topics
Inspecting the event
AccessorySetupKit / ASAccessoryEvent
Class
ASAccessoryEvent
Properties of an event encountered during accessory discovery.
iOS 18.0+
iPadOS 18.0+


## Page 2

The type of event, such as accessory addition or removal, or picker presentation or removal.
enum ASAccessoryEventType
An enumeration of the types of events encountered during accessory discovery
var error: (any Error)?
The error associated with the event, if any.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Sendable
SendableMetatype
enum ASAccessoryEventType
An enumeration of the types of events encountered during accessory discovery
class ASDiscoveryDescriptor
Handling errors
Relationships
Inherits From
Conforms To
See Also
Accessory discovery


## Page 3

Descriptive traits used to discover accessories.


