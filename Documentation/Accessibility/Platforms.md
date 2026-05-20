# Platforms.pdf

## Page 1

Like all Apple UI frameworks, SwiftUI comes with built-in accessibility support. The framework
introspects common elements like navigation views, lists, text fields, sliders, buttons, and so on,
and provides basic accessibility labels and values by default. You don’t have to do any extra work
enable these standard accessibility features.
SwiftUI also provides tools to help you enhance the accessibility of your app. To find out what
enhancements you need, try using your app with accessibility features like VoiceOver, Voice
Control, and Switch Control, or get feedback from users of your app that regularly use these
features. Then use the accessibility view modifiers that SwiftUI provides to improve the experienc
For example, you can explicitly add accessibility labels to elements in your UI using the
accessibilityLabel(_:) or the accessibilityValue(_:) view modifier.
Customize your use of accessibility modifiers for all the platforms that your app runs on. For
example, you may need to adjust the accessibility elements for a companion Apple Watch app tha
shares a common code base with an iOS app. If you integrate AppKit or UIKit controls in SwiftUI,
expose any accessibility labels and make them accessible from your NSViewRepresentable or
UIViewRepresentable views, or provide custom accessibility information if the underlying
accessibility labels aren’t available.
Overview
SwiftUI / Accessibility fundamentals
API Collection
Accessibility fundamentals
Make your SwiftUI apps accessible to everyone, including people with disabilities


## Page 2

For design guidance, see Accessibility in the Human Interface Guidelines.
Creating accessible views
Make your app accessible to everyone by applying accessibility modifiers to your SwiftUI
views.
func accessibilityElement(children: AccessibilityChildBehavior) -> some
View
Creates a new accessibility element, or modifies the AccessibilityChildBehavior of
the existing accessibility element.
func accessibilityChildren<V>(children: () -> V) -> some View
Replaces the existing accessibility element’s children with one or more new synthetic
accessibility elements.
func accessibilityRepresentation<V>(representation: () -> V) -> some 
View
Replaces one or more accessibility elements for this view with new accessibility elements.
struct AccessibilityChildBehavior
Defines the behavior for the child elements of the new parent element.
func accessibilityIdentifier(String) -> ModifiedContent<Self,
AccessibilityAttachmentModifier>
Uses the string you specify to identify the view.
func accessibilityIdentifier(String, isEnabled: Bool) -> ModifiedConten
<Self, AccessibilityAttachmentModifier>
Uses the string you specify to identify the view.
Topics
Essentials
Creating accessible elements
Identifying elements
Hiding elements


## Page 3

func accessibilityHidden(Bool) -> ModifiedContent<Self, Accessibility
AttachmentModifier>
Specifies whether to hide this view from system accessibility features.
func accessibilityHidden(Bool, isEnabled: Bool) -> ModifiedContent<Self
AccessibilityAttachmentModifier>
Specifies whether to hide this view from system accessibility features.
struct AccessibilityTechnologies
Accessibility technologies available to the system.
struct AccessibilityAttachmentModifier
A view modifier that adds accessibility properties to the view
Accessible appearance
Enhance the legibility of content in your app’s interface.
Accessible controls
Improve access to actions that your app can undertake.
Accessible descriptions
Describe interface elements to help people understand what they represent.
Accessible navigation
Enable users to navigate to specific user interface elements using rotors.
Supporting types
See Also
Accessibility


## Page 4

Making your app accessible means making it usable by everyone. By designing your app with
accessibility in mind, you make it possible for everyone to enjoy your app. For more information,
see Accessibility.
UIKit controls and views come with built-in accessibility, providing an accessible user experience
by default. Typically, you don’t need to do extra work to enable the standard accessibility features
In some cases, you might want to modify the default values to better represent your app, to provid
additional context, or to modify the user’s flow through the app. UIKit makes these customization
straightforward, involving a few lines of code or Interface Builder adjustments as you define your
user interface. For more information about customizing accessibility for UIKit elements, see
UIAccessibility.
If your app contains custom user interface elements that don’t inherit from UIView or one of the
other UIKit classes with built-in accessibility, make those elements accessible by subclassing
UIAccessibilityElement.
If you build your app with SwiftUI, see Accessibility modifiers.
UIAccessibility
A set of methods that provides accessibility information about views and controls in an app’s
user interface.
Overview
Topics
Essentials
UIKit / Accessibility for UIKit
API Collection
Accessibility for UIKit
Make your UIKit apps accessible to everyone who uses iOS and tvOS.


## Page 5

UIAccessibilityContainer
Provide a set of methods that view subclasses use to make subcomponents accessible as
separate elements.
Supporting VoiceOver in your app
Add VoiceOver support to make your iOS app more accessible to users who are blind or have
low vision.
UIAccessibilityFocus
An informal protocol that provides a way to determine whether an assistive app, such as
VoiceOver, has focus on an accessible element.
protocol UIAccessibilityIdentification
Methods that associate a unique identifier with elements in your user interface.
protocol UIAccessibilityReadingContent
Methods to implement for an object that represents content that users read, such as a book
or an article.
protocol UIAccessibilityContentSizeCategoryImageAdjusting
Methods to determine when to adjust images for different content size categories.
struct UIAccessibilityTextualContext
Constants that describe a named context that helps identify and classify the type of text
inside an element.
static func configureForGuidedAccess(features: UIGuidedAccess
AccessibilityFeature, enabled: Bool, completionHandler: (Bool, (any
Error)?) -> Void)
Enables or disables the specified accessibility features while using Guided Access.
struct UIGuidedAccessAccessibilityFeature
Constants that describe accessibility features for Guided Access.
enum Code
Error codes for Guided Access.
Behaviors
Guided Access


## Page 6

UIAccessibilityAction
A set of methods that accessibility elements can use to support specific actions.
class UIAccessibilityCustomAction
A custom action to perform on an accessible object.
typealias Handler
A closure type that defines a handler to perform for an action.
Delivering an exceptional accessibility experience
Make improvements to your app’s interaction model to support assistive technologies such a
VoiceOver.
class UIAccessibilityElement
An element that should be accessible to users with disabilities, but that isn’t accessible by
default.
protocol UIScrollViewAccessibilityDelegate
A set of methods you can implement to provide accessibility information for a scroll view.
protocol UIPickerViewAccessibilityDelegate
A set of methods you can implement to provide accessibility information for individual
components of a picker view.
protocol UIAccessibilityContainerDataTable
Methods that convey information about the contents of a table.
protocol UIAccessibilityContainerDataTableCell
Methods that provide the location of a cell in a table.
enum UIAccessibilityContainerType
Constants that indicate the type of content in a data-based container.
Actions
Elements
Containers
Navigation


## Page 7

class UIAccessibilityCustomRotor
A context-sensitive function that helps VoiceOver users find the next instance of a related
element.
class UIAccessibilityCustomRotorItemResult
A target element that a custom rotor references.
class UIAccessibilityCustomRotorSearchPredicate
The search parameters that help determine the next matching custom rotor item result.
class UIAccessibilityLocationDescriptor
An accessibility descriptor for a specific geometric point of interest within a view, for use by
assistive apps.
Notification names
The names of notifications that the accessibility system generates.
Notification dictionary keys
Handle notifications with keys in the user info dictionary.
static func post(notification: UIAccessibility.Notification, argument:
Any?)
Posts a notification to assistive apps.
static func convertToScreenCoordinates(CGRect, in: UIView) -> CGRect
Converts the specified rectangle from view coordinates to screen coordinates.
static func convertToScreenCoordinates(UIBezierPath, in: UIView) ->
UIBezierPath
Converts the specified path object to screen coordinates and returns a new path object with
the results.
Drag and drop support
Notifications
Conversions
Convenience functions


## Page 8

static func focusedElement(using: UIAccessibility.AssistiveTechnology
Identifier?) -> Any?
Returns the accessibility element that’s currently in focus by the specified assistive app.
static var hearingDevicePairedEar: UIAccessibility.HearingDeviceEar
The current pairing status of Made for iPhone hearing devices.
struct HearingDeviceEar
Constants that specify how a person is using a hearing device.
static func registerGestureConflictWithZoom()
Warns users that app-specific gestures conflict with the system-defined Zoom accessibility
gestures.
static func requestGuidedAccessSession(enabled: Bool, completionHandler
(Bool) -> Void)
Transitions the app to or from Single App mode asynchronously.
static func zoomFocusChanged(zoomType: UIAccessibility.ZoomType, toFram
: CGRect, in: UIView)
Notifies the system when the app’s focus changes to a new location.
static var isAssistiveTouchRunning: Bool
A Boolean value that indicates whether AssistiveTouch is in an enabled state.
static var isVoiceOverRunning: Bool
A Boolean value that indicates whether VoiceOver is in an enabled state.
static var isSwitchControlRunning: Bool
A Boolean value that indicates whether the Switch Control setting is in an enabled state.
static var isShakeToUndoEnabled: Bool
A Boolean value that indicates whether the Shake to Undo setting is in an enabled state.
static var isClosedCaptioningEnabled: Bool
A Boolean value that indicates whether the Closed Captions + SDH setting is in an enabled
state.
static var isBoldTextEnabled: Bool
A Boolean value that indicates whether the Bold Text setting is in an enabled state.
Capabilities


## Page 9

static var isDarkerSystemColorsEnabled: Bool
A Boolean value that indicates whether the Increase Contrast setting is in an enabled state.
static var isGrayscaleEnabled: Bool
A Boolean value that indicates whether the Color Filters and the Grayscale settings are in an
enabled state.
static var isGuidedAccessEnabled: Bool
A Boolean value that indicates whether the Guided Access setting is in an enabled state.
static var isInvertColorsEnabled: Bool
A Boolean value that indicates whether the Classic Invert setting is in an enabled state.
static var isMonoAudioEnabled: Bool
A Boolean value that indicates whether the Mono Audio setting is in an enabled state.
static var isReduceMotionEnabled: Bool
A Boolean value that indicates whether the Reduce Motion setting is in an enabled state.
static var isReduceTransparencyEnabled: Bool
A Boolean value that indicates whether the Reduce Transparency setting is in an enabled
state.
static var isSpeakScreenEnabled: Bool
A Boolean value that indicates whether the Speak Screen setting is in an enabled state.
static var isSpeakSelectionEnabled: Bool
A Boolean value that indicates whether the Speak Selection setting is in an enabled state.
static var isOnOffSwitchLabelsEnabled: Bool
A Boolean value that indicates whether the On/Off Labels setting is in an enabled state.
static var isVideoAutoplayEnabled: Bool
A Boolean value that indicates whether the Auto-Play Video Previews setting is in an enabled
state.
static var buttonShapesEnabled: Bool
A Boolean value that indicates whether the Button Shapes setting is in an enabled state.
Deprecated
static var prefersCrossFadeTransitions: Bool
A Boolean value that indicates whether the Reduce Motion and the Prefer Cross-Fade
Transitions settings are in an enabled state.


## Page 10

static var shouldDifferentiateWithoutColor: Bool
A Boolean value that indicates whether the Differentiate Without Color setting is in an enable
state.
Touches, presses, and gestures
Encapsulate your app’s event-handling logic in gesture recognizers so that you can reuse th
code throughout your app.
Menus and shortcuts
Simplify interactions with your app using menu systems, contextual menus, Home Screen
quick actions, and keyboard shortcuts.
Drag and drop
Bring drag and drop to your app by using interaction APIs with your views.
Pointer interactions
Support pointer interactions in your custom controls and views.
Apple Pencil interactions
Handle user interactions like double tap and squeeze on Apple Pencil.
Focus-based navigation
Navigate the interface of your UIKit app using a remote, game controller, or keyboard.
See Also
User interactions


## Page 11

Making your app accessible means making it usable by everyone. By designing your app with
accessibility in mind, you make it possible for everyone to enjoy your app. For more information,
see Accessibility.
AppKit controls and views come with built-in accessibility, providing an accessible user experienc
by default. Typically, you don’t need to do extra work to enable the standard accessibility features
In some cases, you might want to modify the default values to better represent your app, to provid
additional context, or to modify the user’s flow through the app. AppKit makes these
customizations straightforward, involving a few lines of code or Interface Builder adjustments as
you define your user interface. For more information about customizing accessibility for AppKit
elements, see NSAccessibilityProtocol.
If your app contains custom user interface elements that subclass NSView, enhance the
accessibility of those elements using the role-based protocols in Custom Controls. If your app
contains custom user interface elements that don’t inherit from NSView or one of the other AppK
classes with built-in accessibility, make those elements accessible by subclassing
NSAccessibilityElement.
If you build your app with SwiftUI, see Accessibility modifiers.
Integrating accessibility into your app
Overview
Topics
Essentials
AppKit / Accessibility for AppKit
API Collection
Accessibility for AppKit
Make your AppKit apps accessible to everyone who uses macOS.


## Page 12

Make your app more accessible to users with disabilities by adding accessibility features.
Accessibility design for Mac Catalyst
Improve navigation in your app by using keyboard shortcuts and accessibility containers.
If you’re using a standard AppKit user interface element, you can override its existing accessibility
attributes or use it as-is.
protocol NSAccessibilityProtocol
The complete list of properties and methods for accessible elements.
struct NSAccessibility
A namespace for accessibility symbols for AppKit apps.
If you’re subclassing an AppKit view to create a custom user interface element, you can adopt on
or more role-specific protocols to enhance that element’s accessibility.
Custom Controls
Support accessibility for custom user interface elements by adopting a role-specific protoco
and implementing its methods.
Accessibility Functions
Global accessibility functions for custom views and controls.
If you’re designing a completely custom user interface element that doesn’t subclass an AppKit
view, you must subclass the accessibility element class.
class NSAccessibilityElement
The basic infrastructure necessary for interacting with an assistive app.
struct Action
Constants that describe types of actions.
struct AnnotationAttributeKey
AppKit Elements
Custom View Subclasses
Custom Elements
Accessibility Types


## Page 13

Keys for annotation attributes.
enum NSAccessibilityAnnotationPosition
Constants that specify the position where the annotation applies.
struct Attribute
Constants that describe attributes.
struct FontAttributeKey
Keys for font attributes.
enum NSAccessibilityOrientation
Values that indicate the orientation of accessibility elements, such as scroll bars and split
views.
struct OrientationValue
Values that indicate the orientation of user interface elements, such as scroll bars and split
views.
struct ParameterizedAttribute
Values that describe parameterized attributes.
struct Role
Values that describe types of objects that accessibility elements represent.
enum NSAccessibilityRulerMarkerType
Values that indicate the marker type of an accessibility element.
struct RulerMarkerTypeValue
Values that describe ruler marker types.
struct RulerUnitValue
Values that indicate the unit values of a ruler or layout area.
struct SortDirectionValue
Values that indicate the sort direction of a column.
enum NSAccessibilitySortDirection
Values that indicate the sort direction of a column.
struct Subrole
Values that describe specialized object subtypes that accessibility elements represent.
enum NSAccessibilityUnits


## Page 14

Values that indicate the unit values of a ruler or layout area.
Mouse, Keyboard, and Trackpad
Handle events related to mouse, keyboard, and trackpad input.
Menus, Cursors, and the Dock
Implement menus and cursors to facilitate interactions with your app, and use your app’s Do
tile to convey updated information.
Gestures
Encapsulate your app’s event-handling logic in gesture recognizers so that you can reuse th
code throughout your app.
Touch Bar
Display interactive content and controls in the Touch Bar.
Drag and Drop
Support the direct manipulation of your app’s content using drag and drop.
See Also
User Interactions


## Page 15

Design your visionOS app with accessibility in mind. Incorporate the accessibility features in
SwiftUI and UIKit, and support additional features that are specific to visionOS.
Improving accessibility support in your visionOS app
Update your code to ensure everyone can access your app’s content in visionOS.
static var prefersHeadAnchorAlternative: Bool
A Boolean value that indicates the person’s preference for content that follows their head
position.
static var prefersHeadAnchorAlternativeDidChangeNotification:
Notification.Name
A notification that posts when the system setting for head-anchored content changes.
Overview
Topics
Design
Head-anchored content
See Also
Accessibility / Accessibility for visionOS
API Collection
Accessibility for visionOS
Make your apps accessible to everyone who uses visionOS.


## Page 16

Accessibility fundamentals
Make your SwiftUI apps accessible to everyone, including people with disabilities.
Accessibility for UIKit
Make your UIKit apps accessible to everyone who uses iOS and tvOS.
Accessibility for AppKit
Make your AppKit apps accessible to everyone who uses macOS.
Platforms


