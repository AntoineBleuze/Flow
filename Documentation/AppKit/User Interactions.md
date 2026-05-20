# User Interactions.pdf

## Page 1

The NSResponder class defines the responder chain, an ordered list of objects that respond to
user events. When the user clicks the mouse button, taps on the trackpad, or presses a key, an
event is generated and passed up the responder chain in search of an object that can respond to 
Any object that handles events must inherit from the NSResponder class. The core AppKit
classes, NSApplication, NSWindow, and NSView, inherit from NSResponder.
An NSApplication object maintains a list of NSWindow objects—one for each window belongin
to the app—and each NSWindow object maintains a hierarchy of NSView objects. This view
hierarchy is used for both drawing the user interface and for handling events.
An NSWindow object handles window-level events and distributes other events to its views. An
NSWindow object also has a delegate allowing you to customize its behavior.
class NSResponder
An abstract class that forms the basis of event and command processing in AppKit.
class NSEvent
An object that contains information about an input action, such as a mouse click or a key
press.
Overview
Topics
Responder Objects
Mouse, Keyboard, and Touch Events
AppKit / Mouse, Keyboard, and Trackpad
API Collection
Mouse, Keyboard, and Trackpad
Handle events related to mouse, keyboard, and trackpad input.


## Page 2

class NSTouch
A snapshot of a particular touch at an instant in time.
class NSPressureConfiguration
An encapsulation of the behavior and progression of a Force Touch trackpad as it responds t
specific events.
class NSHapticFeedbackManager
An object that provides access to the haptic feedback management attributes on a system
with a Force Touch trackpad.
struct EventTypeMask
Constants that you use to filter out specific event types from the stream of incoming events.
struct ButtonMask
Constants you use to identify the activated tablet buttons in an event.
struct ModifierFlags
Flags that represent key states in an event object.
struct Phase
Constants that represent the possible phases during an event phase.
struct SwipeTrackingOptions
Constants that specify swipe-tracking options.
init(type: NSEvent.EventType)
Returns the event mask for the specified type.
Menus, Cursors, and the Dock
Trackpad
Constants
See Also
User Interactions


## Page 3

Implement menus and cursors to facilitate interactions with your app, and use your app’s Do
tile to convey updated information.
Gestures
Encapsulate your app’s event-handling logic in gesture recognizers so that you can reuse th
code throughout your app.
Touch Bar
Display interactive content and controls in the Touch Bar.
Drag and Drop
Support the direct manipulation of your app’s content using drag and drop.
Accessibility for AppKit
Make your AppKit apps accessible to everyone who uses macOS.


## Page 4

class NSMenu
An object that manages an app’s menus.
class NSMenuItem
A command item in an app menu.
class NSMenuItemBadge
A control that provides additional quantitative information specific to a menu item, such as th
number of available updates.
protocol NSMenuDelegate
The optional methods implemented by delegates of NSMenu objects to manage menu displa
and handle some events.
protocol NSMenuItemValidation
class NSStatusBar
An object that manages a collection of status items displayed within the system-wide menu
bar.
Topics
Menus
Menu Validation
Menu Bar Items
AppKit / Menus, Cursors, and the Dock
API Collection
Menus, Cursors, and the Dock
Implement menus and cursors to facilitate interactions with your app, and use you
app’s Dock tile to convey updated information.


## Page 5

class NSStatusItem
An individual element displayed in the system menu bar.
class NSStatusBarButton
The appearance and behavior of an item in the systemwide menu bar.
class NSCursor
A pointer (also called a cursor).
class NSTrackingArea
A region of a view that generates mouse-tracking and cursor-update events when the pointe
is over that region.
class NSDockTile
The visual representation of your app’s miniaturized windows and app icon as they appear in
the Dock.
protocol NSDockTilePlugIn
A set of methods implemented by plug-ins that allow an app’s Dock tile to be customized
while the app is not running.
Mouse, Keyboard, and Trackpad
Handle events related to mouse, keyboard, and trackpad input.
Gestures
Encapsulate your app’s event-handling logic in gesture recognizers so that you can reuse th
code throughout your app.
Touch Bar
Display interactive content and controls in the Touch Bar.
Cursors
The Dock
See Also
User Interactions


## Page 6

Drag and Drop
Support the direct manipulation of your app’s content using drag and drop.
Accessibility for AppKit
Make your AppKit apps accessible to everyone who uses macOS.


## Page 7

class NSClickGestureRecognizer
A discrete gesture recognizer that tracks a specified number of mouse clicks.
class NSPressGestureRecognizer
A discrete gesture recognizer that tracks whether the user holds down a mouse button for a
minimum amount of time before releasing it.
class NSPanGestureRecognizer
A continuous gesture recognizer for panning gestures.
class NSRotationGestureRecognizer
A continuous gesture recognizer that tracks two trackpad touches moving opposite each
other in a circular motion.
class NSMagnificationGestureRecognizer
A continuous gesture recognizer that tracks a pinch gesture that magnifies content.
class NSGestureRecognizer
An object that monitors events and calls its action method when a predefined sequence of
events occur.
Topics
Standard Gestures
Custom Gestures
AppKit / Gestures
API Collection
Gestures
Encapsulate your app’s event-handling logic in gesture recognizers so that you ca
reuse that code throughout your app.


## Page 8

protocol NSGestureRecognizerDelegate
A set of methods for fine-tuning a gesture recognizer’s behavior.
Mouse, Keyboard, and Trackpad
Handle events related to mouse, keyboard, and trackpad input.
Menus, Cursors, and the Dock
Implement menus and cursors to facilitate interactions with your app, and use your app’s Do
tile to convey updated information.
Touch Bar
Display interactive content and controls in the Touch Bar.
Drag and Drop
Support the direct manipulation of your app’s content using drag and drop.
Accessibility for AppKit
Make your AppKit apps accessible to everyone who uses macOS.
See Also
User Interactions


## Page 9

Integrating a Toolbar and Touch Bar into Your App
Provide users quick access to your app’s features from a toolbar and corresponding Touch
Bar.
Creating and Customizing the Touch Bar
Adopt Touch Bar support by displaying interactive content and controls for your macOS app
class NSTouchBar
An object that provides dynamic contextual controls in the Touch Bar of supported models o
MacBook Pro.
protocol NSTouchBarDelegate
A protocol that allows you to provide the items for a bar dynamically.
protocol NSTouchBarProvider
A protocol that an object adopts to create a bar object in your app.
class NSTouchBarItem
A UI control shown in the Touch Bar on supported models of MacBook Pro.
class NSCandidateListTouchBarItem
Topics
Essentials
Touch Bar items
AppKit / Touch Bar
API Collection
Touch Bar
Display interactive content and controls in the Touch Bar.


## Page 10

A bar item that, along with its delegate, provides a list of textual suggestions for the current
text view.
class NSColorPickerTouchBarItem
A bar item that provides a system-defined color picker.
class NSCustomTouchBarItem
A bar item that contains a responder of your choice, such as a view, a button, or a scrubber.
class NSGroupTouchBarItem
A bar item that provides a bar to contain other items.
class NSPopoverTouchBarItem
A bar item that provides a two-state control that can expand into its second state, showing t
contents of a bar that it owns.
class NSSharingServicePickerTouchBarItem
A bar item that, along with its delegate, provides a list of objects eligible for sharing.
class NSSliderTouchBarItem
A bar item that provides a slider control for choosing a value in a range.
class NSStepperTouchBarItem
A bar item that provides a stepper control for incrementing or decrementing a value.
class NSUserInterfaceCompressionOptions
An object that specifies how user interface elements resize themselves when space is
constrained.
class NSButtonTouchBarItem
A bar item that provides a button.
class NSPickerTouchBarItem
A bar item that provides a picker control with multiple options.
enum ControlRepresentation
Constants that specify display styles for picker bar items.
enum SelectionMode
Constants that specify selection modes for picker bar items.
Scrubbers


## Page 11

class NSScrubber
A customizable item picker control for the Touch Bar.
protocol NSScrubberDataSource
A set of methods that a scrubber data source object implements to provide items to the
scrubber from an associated data collection in your app.
protocol NSScrubberDelegate
A set of methods that a scrubber delegate implements to respond to user interactions.
class NSScrubberItemView
An item at a specific index position in the scrubber.
class NSScrubberArrangedView
An abstract base class for the views whose layout is managed by a scrubber.
class NSScrubberImageItemView
A concrete view subclass for displaying images in a scrubber items.
class NSScrubberSelectionStyle
An abstract class that provides decorative accessory views for selected and highlighted item
within a scrubber control.
class NSScrubberSelectionView
An abstract base class for specifying the appearance of a highlighted or selected item in a
scrubber.
class NSScrubberTextItemView
A concrete view subclass for displaying text for an item in a scrubber.
class NSScrubberFlowLayout
A concrete layout object that arranges items end-to-end in a linear strip.
protocol NSScrubberFlowLayoutDelegate
A protocol that a scrubber delegate can adopt to provide the size of an item.
class NSScrubberProportionalLayout
A concrete layout object that sizes each item to some fraction of the scrubber’s visible size.
Scrubber items
Scrubber layouts


## Page 12

class NSScrubberLayoutAttributes
The layout of a scrubber item.
class NSScrubberLayout
An abstract class that describes the layout of items within a scrubber control.
Mouse, Keyboard, and Trackpad
Handle events related to mouse, keyboard, and trackpad input.
Menus, Cursors, and the Dock
Implement menus and cursors to facilitate interactions with your app, and use your app’s Do
tile to convey updated information.
Gestures
Encapsulate your app’s event-handling logic in gesture recognizers so that you can reuse th
code throughout your app.
Drag and Drop
Support the direct manipulation of your app’s content using drag and drop.
Accessibility for AppKit
Make your AppKit apps accessible to everyone who uses macOS.
See Also
User Interactions


## Page 13

With very little programming on your part, custom-view objects can be dragged and dropped
anywhere. Objects become part of this dragging mechanism by conforming to dragging protocols
Draggable objects conform to the NSDraggingSource protocol, and destination objects (that is
receivers of a drop) conform to the NSDraggingDestination protocol. AppKit hides all the
details of tracking the cursor and displaying the dragged image.
Note
To learn how to adopt drag and drop in your iOS app, see Drag and drop.
To learn how to use drag and drop for an image view, see Supporting Drag and Drop Through File
Promises. To use drag and drop in a table view, see Supporting Table View Drag and Drop Throug
File Promises. For an example of drag and drop in a collection view, see Supporting Collection Vie
Drag and Drop Through File Promises, and for an outline view: Navigating Hierarchical Data Using
Outline and Split Views.
Originate content from a drag source by creating items to represent that content.
protocol NSDraggingSource
A set of methods that are implemented by the source object in a dragging session.
Overview
Topics
Drag Sources
AppKit / Drag and Drop
API Collection
Drag and Drop
Support the direct manipulation of your app’s content using drag and drop.


## Page 14

class NSDraggingItem
A single dragged item within a dragging session.
class NSDraggingSession
The encapsulation of a drag-and-drop action that supports modification of the drag while in
progress.
class NSDraggingImageComponent
A single object in a dragging item.
Receive dragged content in your app’s objects.
protocol NSDraggingDestination
A set of methods that the destination object (or recipient) of a dragged image must
implement.
protocol NSDraggingInfo
A set of methods that supply information about a dragging session.
protocol NSSpringLoadingDestination
A set of methods that the destination object (or recipient) of a dragged object can implemen
to support spring-loading.
Mouse, Keyboard, and Trackpad
Handle events related to mouse, keyboard, and trackpad input.
Menus, Cursors, and the Dock
Implement menus and cursors to facilitate interactions with your app, and use your app’s Do
tile to convey updated information.
Gestures
Encapsulate your app’s event-handling logic in gesture recognizers so that you can reuse th
code throughout your app.
Drop Targets
See Also
User Interactions


## Page 15

Touch Bar
Display interactive content and controls in the Touch Bar.
Accessibility for AppKit
Make your AppKit apps accessible to everyone who uses macOS.


## Page 16

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


## Page 17

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


## Page 18

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


## Page 19

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


