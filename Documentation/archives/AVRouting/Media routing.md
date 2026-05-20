# Media routing.pdf

## Page 1

A routing controller also informs its delegate object about which routes the user previously
authorized, so it can reconnect, if appropriate.
var authorizedRoutes: [AVCustomDeviceRoute]
A list of authorized routes.
class let authorizedRoutesDidChange: NSNotification.Name
A notification the system posts when the list of authorized routes changes.
func invalidateAuthorization(for: AVCustomDeviceRoute)
Revokes an app’s authorization to connect to a route.
var knownRouteIPs: [AVCustomRoutingPartialIP]
Overview
Topics
Managing authorization
Configuring route addresses
AVRouting / AVCustomRoutingController
Class
AVCustomRoutingController
An object that manages the connection from a device to a destination.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
visionOS 1.0+


## Page 2

An array of route addresses known to be on the local network.
class AVCustomRoutingPartialIP
An object that represents a full or partial IP address.
func isRouteActive(AVCustomDeviceRoute) -> Bool
Returns a Boolean value that indicates whether a route is active.
func setActive(Bool, for: AVCustomDeviceRoute)
Sets the active state of a route.
var delegate: (any AVCustomRoutingControllerDelegate)?
A delegate object for a routing controller.
var customActionItems: [AVCustomRoutingActionItem]
An array of custom action items to add to a route picker.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Activating a route
Accessing the delegate
Customizing the user interface
Relationships
Inherits From
Conforms To


## Page 3

protocol AVCustomRoutingControllerDelegate
A protocol for delegates of a custom routing controller.
class AVCustomRoutingEvent
An object that represents an event that occurs on a route.
class AVCustomRoutingActionItem
An object that represents a custom action item to display in a device route picker.
See Also
Media routing


## Page 4

func customRoutingController(AVCustomRoutingController, handle: AVCusto
RoutingEvent, completionHandler: (Bool) -> Void)
Connects to, or disconnects from, a device when a user requests it in the picker.
Required
func customRoutingController(AVCustomRoutingController, eventDidTimeOut
AVCustomRoutingEvent)
Tells the delegate when a routing event times out.
func customRoutingController(AVCustomRoutingController, didSelect:
AVCustomRoutingActionItem)
Tells the delegate when a user selects a custom item in the route picker.
Topics
Handling controller events
Relationships
Inherits From
AVRouting / AVCustomRoutingControllerDelegate
Protocol
AVCustomRoutingControllerDelegate
A protocol for delegates of a custom routing controller.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
visionOS 1.0+


## Page 5

NSObjectProtocol, Sendable, SendableMetatype
class AVCustomRoutingController
An object that manages the connection from a device to a destination.
class AVCustomRoutingEvent
An object that represents an event that occurs on a route.
class AVCustomRoutingActionItem
An object that represents a custom action item to display in a device route picker.
See Also
Media routing


## Page 6

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


## Page 7

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


## Page 8

Use this class to specify supplemental action items to display in the list of discovered routes.
Tapping a custom item dismisses the picker and calls the customRoutingController(_:did
Select:) method of AVCustomRoutingControllerDelegate.
var type: UTType
A type with an identifier that matches a value in the app’s configuration.
var overrideTitle: String?
A string to use to override the title of the item’s type.
Overview
Topics
Configuring an item
Relationships
AVRouting / AVCustomRoutingActionItem
Class
AVCustomRoutingActionItem
An object that represents a custom action item to display in a device route picker.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
visionOS 1.0+


## Page 9

NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
class AVCustomRoutingController
An object that manages the connection from a device to a destination.
protocol AVCustomRoutingControllerDelegate
A protocol for delegates of a custom routing controller.
class AVCustomRoutingEvent
An object that represents an event that occurs on a route.
Inherits From
Conforms To
See Also
Media routing


