# 000_AVCustomRoutingController.pdf

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


