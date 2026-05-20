# 002_AVCustomRoutingEvent.pdf

## Page 1

Depending on the route’s reason, apps establish or tear down a connection to a specified route.
var route: AVCustomDeviceRoute
A route for the event.
class AVCustomDeviceRoute
An object that represents a custom device route.
var reason: AVCustomRoutingEventReason
A reason for an event, such as a user request to activate or deactivate a route.
enum AVCustomRoutingEventReason
Values that indicate the reason for a routing event.
Overview
Topics
Inspecting an event
AVRouting / AVCustomRoutingEvent
Class
AVCustomRoutingEvent
An object that represents an event that occurs on a route.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
visionOS 1.0+


## Page 2

NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Sendable
SendableMetatype
class AVCustomRoutingController
An object that manages the connection from a device to a destination.
protocol AVCustomRoutingControllerDelegate
A protocol for delegates of a custom routing controller.
class AVCustomRoutingActionItem
An object that represents a custom action item to display in a device route picker.
Relationships
Inherits From
Conforms To
See Also
Media routing


