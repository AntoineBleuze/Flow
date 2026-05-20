# 003_AVCustomRoutingActionItem.pdf

## Page 1

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


## Page 2

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


