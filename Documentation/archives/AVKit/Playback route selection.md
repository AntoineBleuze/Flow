# Playback route selection.pdf

## Page 1

This view represents a button that users tap to stream audio/video content to a media receiver,
such as a Mac or Apple TV.
When the user taps the button, the system presents a popover that displays all of the nearby
AirPlay devices that can receive and play back media. If your app prefers video content, the syste
displays video-capable devices higher in the list.
Overview
AVKit / AVRoutePickerView
Class
AVRoutePickerView
A view that presents a list of nearby media receivers.
iOS 11.0+
iPadOS 11.0+
Mac Catalyst 13.1+
macOS 10.15+
tvOS 11.0+


## Page 2

In iOS 16 and later, you can add devices to the list that implement custom protocols. For more
information about displaying third-party routes, see AVRouting.
The following code example creates the view alongside custom text:
Your app configures the button’s color scheme and indicates whether your app prefers video
content, as the following code demonstrates:
Configure the button’s text, color, and media preference


## Page 3

var delegate: (any AVRoutePickerViewDelegate)?
The delegate object for the route picker.
protocol AVRoutePickerViewDelegate
A protocol that defines the methods to adopt to respond to route picker view presentation
events.
var activeTintColor: UIColor!
The view’s tint color when AirPlay is active.
var isRoutePickerButtonBordered: Bool
A Boolean value that indicates whether the route picker button has a border.
var prioritizesVideoDevices: Bool
A Boolean value that indicates whether the route picker sorts video output devices to the top
of the list.
var routePickerButtonStyle: AVRoutePickerViewButtonStyle
The button style for the route picker.
enum AVRoutePickerViewButtonStyle
Topics
Configuring the delegate
Configuring the route picker view


## Page 4

Constants that define the button styles a route picker view supports.
func routePickerButtonColor(for: AVRoutePickerView.ButtonState) ->
NSColor
Returns the color of the picker button for the specified state.
func setRoutePickerButtonColor(NSColor?, for: AVRoutePickerView.Button
State)
Sets the route picker button color for the specified state.
enum ButtonState
Constants that describe the available button states.
var player: AVPlayer?
The player object to perform routing operations for.
var customRoutingController: AVCustomRoutingController?
A routing controller that enables connections to non-AirPlay devices.
NSView, UIView
CALayerDelegate
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSAccessibilityElementProtocol
NSAccessibilityProtocol
Accessing the player
Setting a custom routing controller
Relationships
Inherits From
Conforms To


## Page 5

NSAnimatablePropertyContainer
NSAppearanceCustomization
NSCoding
NSDraggingDestination
NSObjectProtocol
NSStandardKeyBindingResponding
NSTouchBarProvider
NSUserActivityRestoring
NSUserInterfaceItemIdentification
Sendable
SendableMetatype
UIAccessibilityIdentification
UIActivityItemsConfigurationProviding
UIAppearance
UIAppearanceContainer
UICoordinateSpace
UIDynamicItem
UIFocusEnvironment
UIFocusItem
UIFocusItemContainer
UILargeContentViewerItem
UIPasteConfigurationSupporting
UIPopoverPresentationControllerSourceItem
UIResponderStandardEditActions
UITraitChangeObservable
UITraitEnvironment
UIUserActivityRestoring


