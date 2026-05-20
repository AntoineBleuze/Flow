# User Interface.pdf

## Page 1

Views and controls are the building blocks of your app’s user interface.
Views can host other views. Embedding one view inside another creates a containment relationsh
between the host view (known as the superview) and the embedded view (known as the subview
View hierarchies make it easier to manage views.
You can also use views to do any of the following:
Respond to touches and other events (either directly or in coordination with gesture
recognizers).
Draw custom content using Core Graphics.
Respond to focus changes.
Animate the size, position, and appearance attributes of the view using Core Animation.
Favor AppKit views and controls whenever possible. These components adapt automatically to
system changes, and many support appearance customizations to support the look and feel you
Overview
AppKit / Views and Controls
API Collection
Views and Controls
Present your content onscreen and handle user input and events.


## Page 2

want in your app. When AppKit doesn’t provide the exact view or control you need, you can creat
a custom view.
NSView is the root class for all views and defines their common behavior. NSControl defines
additional behaviors that are specific to buttons, switches, and other views designed for user
interactions.
For additional information about how to use views and controls, see Human Interface Guidelines.
class NSView
The infrastructure for drawing, printing, and handling events in an app.
class NSControl
A specialized view, such as a button or text field, that notifies your app of relevant events
using the target-action design pattern.
class NSCell
A mechanism for displaying text or images in a view object without the overhead of a full
NSView subclass.
class NSActionCell
An active area inside a control.
Use container views to arrange the views of your interface and to facilitate navigation among thos
views.
Localization-friendly layouts in macOS
This project demonstrates localization-friendly auto layout constraints.
Grid View
Arrange views in a flexible grid, and handle the layout associated with those views.
class NSSplitView
A view that arranges two or more views in a linear stack running horizontally or vertically.
Organize Your User Interface with a Stack View
Group individual views in your app’s user interface into a scrollable stack view.
Topics
View fundamentals
Container views


## Page 3

class NSStackView
A view that arranges an array of views horizontally or vertically and updates their placement
and sizing when the window size changes.
class NSTabView
A multipage interface that displays one page at a time.
Scroll View
Provide an interface for navigating content that is too large to fit in the available space.
Use content views to organize and display your app’s data.
Browser View
Provide a column-based interface for viewing and navigating hierarchical information.
Collection View
Display one or more subviews in a highly configurable arrangement.
Outline View
Display a list-based interface for hierarchical data, where each level of hierarchy is indented
from the previous one.
Table View
Display custom data in rows and columns.
class NSTextView
A view that draws text and handles user interactions with that text.
Use controls to handle specific types of user interactions. Controls are specialized views that use
the target-action design pattern to notify your app of interactions with their content.
Responding to control-based events using target-action
Handle user input by connecting buttons, sliders, and other controls to your app’s code usin
the target-action design pattern.
class NSButton
A control that defines an area on the screen that a user clicks to trigger an action.
class NSColorWell
Content views
Controls


## Page 4

A control that displays a color value and lets the user change that color value.
Combo Box
Display a list of values in a pop-up menu that lets the user select a value or type in a custom
value.
class NSComboButton
A button with a pull-down menu and a default action.
Date Picker
Display a calendar date and provide controls for editing the date value.
class NSImageView
A display of image data in a frame.
class NSLevelIndicator
A visual representation of a level or quantity, using discrete values.
Path Control
A display of a file system path or virtual path information.
class NSPopUpButton
A control for selecting an item from a list.
class NSProgressIndicator
An interface that provides visual feedback to the user about the status of an ongoing task.
class NSRuleEditor
An interface for configuring a rule-based list of options.
class NSPredicateEditor
A defined set of rules that allows the editing of predicate objects.
Search Field
Provide a text field that is optimized for text-based search interfaces.
class NSSegmentedControl
Display one or more buttons in a single horizontal group.
Slider
Display a range of values from which the user selects a single value.
class NSStepper
An interface with up and down arrow buttons for incrementing or decrementing a value.


## Page 5

Text Field
Provide a simple interface for displaying and editing text, including support for password fiel
and secure forms of text entry.
Token Field
Provide a text field whose text can be rendered in a visually distinct way so that users can
recognize portions more easily.
Toolbar
Provide a space for controls under a window’s title bar and above your custom content.
class NSSwitch
A control that offers a binary choice.
class NSMatrix
A legacy interface for grouping radio buttons or other types of cells together.
class NSGlassEffectView
A view that embeds its content view in a dynamic glass effect.
enum Style
class NSGlassEffectContainerView
A view that efficiently merges descendant glass effect views together when they are within a
specified proximity to each other.
class NSBackgroundExtensionView
A view that extends content to fill its own bounds.
Add purely decorative elements to your user interface.
class NSVisualEffectView
A view that adds translucency and vibrancy effects to the views in your interface.
class NSBox
A stylized rectangular box with an optional title.
Liquid Glass effects
Interacting with adjacent views
Visual adornments


## Page 6

protocol NSUserInterfaceValidations
A protocol that a custom class can adopt to manage the enabled state of a UI element.
protocol NSValidatedUserInterfaceItem
A protocol that a custom class can adopt to manage the automatic enablement of a UI contr
protocol NSViewToolTipOwner
A set of methods for dynamically associating a tool tip with a view.
enum NSRectAlignment
Constants that specify alignment to an edge or a set of edges depending on the user interfa
layout direction.
struct NSDirectionalEdgeInsets
The inset distances for views, taking the user interface layout direction into account.
struct NSDirectionalRectEdge
View Management
Manage your user interface, including the size and position of views in a window.
View Layout
Position and size views using a stack view or Auto Layout constraints.
Appearance Customization
Add Dark Mode support to your app, and use appearance proxies to modify your UI.
Animation
UI validation
Tool tips
Related types
See Also
User Interface


## Page 7

Animate your views and other content to create a more engaging experience for users.
Windows, Panels, and Screens
Organize your view hierarchies and facilitate their display onscreen.
Sound, Speech, and Haptics
Play sounds and haptic feedback, and incorporate speech recognition and synthesis into you
interface.
Supporting Continuity Camera in Your Mac App
Incorporate scanned documents and pictures from a user’s iPhone, iPad, or iPod touch into
your Mac app using Continuity Camera.


## Page 8

class NSWindowController
A controller that manages a window, usually a window stored in a nib file.
class NSViewController
A controller that manages a view, typically loaded from a nib file.
class NSTitlebarAccessoryViewController
An object that manages a custom view—known as an accessory view—in the title bar–toolba
area of a window.
class NSSplitViewController
An object that manages an array of adjacent child views, and has a split view object for
managing dividers between those views.
class NSSplitView
A view that arranges two or more views in a linear stack running horizontally or vertically.
class NSSplitViewItem
An item in a split view controller.
Topics
Content Controllers
Split View Interface
Stack View Interface
AppKit / View Management
API Collection
View Management
Manage your user interface, including the size and position of views in a window.


## Page 9

class NSStackView
A view that arranges an array of views horizontally or vertically and updates their placement
and sizing when the window size changes.
class NSTabViewController
A container view controller that manages a tab view interface, which organizes multiple page
of content but displays only one page at a time.
class NSTabView
A multipage interface that displays one page at a time.
class NSTabViewItem
An item in a tab view.
class NSPageController
An object that controls swipe navigation and animations between views or view content.
class NSMediaLibraryBrowserController
An object that configures and displays a Media Library Browser panel.
Views and Controls
Present your content onscreen and handle user input and events.
View Layout
Position and size views using a stack view or Auto Layout constraints.
Appearance Customization
Add Dark Mode support to your app, and use appearance proxies to modify your UI.
Tab View Interface
Paged Interface
Media Library Interface
See Also
User Interface


## Page 10

Animation
Animate your views and other content to create a more engaging experience for users.
Windows, Panels, and Screens
Organize your view hierarchies and facilitate their display onscreen.
Sound, Speech, and Haptics
Play sounds and haptic feedback, and incorporate speech recognition and synthesis into you
interface.
Supporting Continuity Camera in Your Mac App
Incorporate scanned documents and pictures from a user’s iPhone, iPad, or iPod touch into
your Mac app using Continuity Camera.


## Page 11

When you design your app’s interface, you position views and other interface elements in your
app’s windows and size them appropriately. However, the size and position of those views may
need to change at runtime for a few reasons:
The user resizes the window containing your views.
The user’s language choice requires size changes for labels and text-based views.
NSStackView objects adjust the position of their contained views automatically when interface
dimensions change. Alternatively, Auto Layout constraints let you specify the rules that determine
the precise size and position of the views in your interface
class NSStackView
A view that arranges an array of views horizontally or vertically and updates their placement
and sizing when the window size changes.
class NSLayoutConstraint
The relationship between two user interface objects that must be satisfied by the constraint-
based layout system.
Overview
Topics
Stack View
Auto Layout Constraints
AppKit / View Layout
API Collection
View Layout
Position and size views using a stack view or Auto Layout constraints.


## Page 12

class NSLayoutGuide
A rectangular area that can interact with Auto Layout.
class NSLayoutDimension
A factory class for creating size-based layout constraint objects using a fluent API.
class NSLayoutAnchor
A factory class for creating layout constraint objects using a fluent API.
class NSLayoutXAxisAnchor
A factory class for creating horizontal layout constraint objects using a fluent API.
class NSLayoutYAxisAnchor
A factory class for creating vertical layout constraint objects using a fluent API.
protocol NSUserInterfaceCompression
A protocol that describes how a UI control should redisplay when space is restricted.
Views and Controls
Present your content onscreen and handle user input and events.
View Management
Manage your user interface, including the size and position of views in a window.
Appearance Customization
Add Dark Mode support to your app, and use appearance proxies to modify your UI.
Layout Guides
Anchors
View Compression
See Also
User Interface


## Page 13

Animation
Animate your views and other content to create a more engaging experience for users.
Windows, Panels, and Screens
Organize your view hierarchies and facilitate their display onscreen.
Sound, Speech, and Haptics
Play sounds and haptic feedback, and incorporate speech recognition and synthesis into you
interface.
Supporting Continuity Camera in Your Mac App
Incorporate scanned documents and pictures from a user’s iPhone, iPad, or iPod touch into
your Mac app using Continuity Camera.


## Page 14

Supporting Dark Mode in your interface
Update colors, images, and behaviors so that your app adapts automatically when Dark Mod
is active.
Apply standard themes to the views in your interface.
class NSAppearance
An object that manages standard appearance attributes for UI elements in an app.
protocol NSAppearanceCustomization
A set of methods for getting and setting the appearance attributes of a view.
Views and Controls
Present your content onscreen and handle user input and events.
Topics
Dark Mode
Appearance System
See Also
User Interface
AppKit / Appearance Customization
API Collection
Appearance Customization
Add Dark Mode support to your app, and use appearance proxies to modify your
UI.


## Page 15

View Management
Manage your user interface, including the size and position of views in a window.
View Layout
Position and size views using a stack view or Auto Layout constraints.
Animation
Animate your views and other content to create a more engaging experience for users.
Windows, Panels, and Screens
Organize your view hierarchies and facilitate their display onscreen.
Sound, Speech, and Haptics
Play sounds and haptic feedback, and incorporate speech recognition and synthesis into you
interface.
Supporting Continuity Camera in Your Mac App
Incorporate scanned documents and pictures from a user’s iPhone, iPad, or iPod touch into
your Mac app using Continuity Camera.


## Page 16

class NSViewAnimation
An animation of an app’s views, limited to changes in frame location and size, and to fade-in
and fade-out effects.
protocol NSAnimatablePropertyContainer
A set of methods that defines a way to add animation to an existing class with a minimum of
API impact.
class NSAnimationContext
An animation context, which contains information about environment and state.
typealias Progress
The animation progress, as a floating-point number between 0.0 and 1.0.
enum NSAnimationEffect
The type for standard system animation effects, which include both display and sound.
Deprecated
protocol NSViewControllerPresentationAnimator
A set of methods that let you define animations to play when transitioning between two view
controllers.
Topics
View-Based Animations
Presentations
AppKit / Animation
API Collection
Animation
Animate your views and other content to create a more engaging experience for
users.


## Page 17

class NSAnimation
An object that manages the timing and progress of animations in the user interface.
protocol NSAnimationDelegate
A set of optional methods implemented by delegates of NSAnimation objects.
Views and Controls
Present your content onscreen and handle user input and events.
View Management
Manage your user interface, including the size and position of views in a window.
View Layout
Position and size views using a stack view or Auto Layout constraints.
Appearance Customization
Add Dark Mode support to your app, and use appearance proxies to modify your UI.
Windows, Panels, and Screens
Organize your view hierarchies and facilitate their display onscreen.
Sound, Speech, and Haptics
Play sounds and haptic feedback, and incorporate speech recognition and synthesis into you
interface.
Supporting Continuity Camera in Your Mac App
Incorporate scanned documents and pictures from a user’s iPhone, iPad, or iPod touch into
your Mac app using Continuity Camera.
Custom Animations
See Also
User Interface


## Page 18

class NSWindow
A window that an app displays on the screen.
class NSPanel
A special kind of window that typically performs a function that is auxiliary to the main
window.
protocol NSWindowDelegate
A set of optional methods that a window’s delegate can implement to respond to events, suc
as window resizing, moving, exposing, and minimizing.
class NSWindowTab
A tab associated with a window that is part of a tabbing group.
class NSWindowTabGroup
A group of windows that display together as a single tabbed window.
protocol NSWindowRestoration
A set of methods that restoration classes must implement to handle the recreation of
windows.
protocol NSUserInterfaceItemIdentification
Topics
Windows
Window Restoration
AppKit / Windows, Panels, and Screens
API Collection
Windows, Panels, and Screens
Organize your view hierarchies and facilitate their display onscreen.


## Page 19

A set of methods used to associate a unique identifier with objects in your user interface.
class NSScreen
An object that describes the attributes of a computer’s monitor or screen.
class NSPopover
A means to display additional content related to existing content on the screen.
protocol NSPopoverDelegate
A set of optional methods that a popover delegate can implement to provide additional or
custom functionality.
class NSAlert
A modal dialog or sheet attached to a document window.
protocol NSAlertDelegate
A set of optional methods implemented by the delegate of an NSAlert object to respond to
user’s request for help.
class NSOpenPanel
A panel that prompts the user to select a file to open.
class NSSavePanel
A panel that prompts the user for information about where to save a file.
protocol NSOpenSavePanelDelegate
A set of methods for managing interactions with an open or save panel.
class NSSharingServicePicker
A list of sharing services that the user can choose from.
Screens
Popovers
Alerts
Open and Save Panels
Share Panel


## Page 20

protocol NSPreviewRepresentableActivityItem
An interface you adopt in custom objects that you want to share using the macOS share
sheet.
class NSPreviewRepresentingActivityItem
A type that adds metadata to an item you share using the macOS share sheet.
class NSPDFPanel
A Save or Export as PDF panel that’s consistent with the macOS user interface.
protocol NSPrintPanelAccessorizing
A set of methods that a Print panel object can use to get information from a printing
accessory controller.
class NSColorPanel
A standard user interface for selecting color in an app.
protocol NSColorPickingCustom
A set of methods that provides a way to add color pickers—custom user interfaces for color
selection—to an app’s color panel.
protocol NSColorPickingDefault
A set of methods that provides basic behavior for a color picker.
class NSColorPicker
An abstract superclass that implements the default color picking protocol.
class NSFontPanel
The Font panel—a user interface object that displays a list of available fonts, letting the user
preview them and change the font used to display text.
struct ModeMask
NSFontPanelValidation
A set of methods you use to tell the Font panel to display some or all of its elements.
Print and PDF Panels
Color Panels
Font Panels


## Page 21

protocol NSFontChanging
Views and Controls
Present your content onscreen and handle user input and events.
View Management
Manage your user interface, including the size and position of views in a window.
View Layout
Position and size views using a stack view or Auto Layout constraints.
Appearance Customization
Add Dark Mode support to your app, and use appearance proxies to modify your UI.
Animation
Animate your views and other content to create a more engaging experience for users.
Sound, Speech, and Haptics
Play sounds and haptic feedback, and incorporate speech recognition and synthesis into you
interface.
Supporting Continuity Camera in Your Mac App
Incorporate scanned documents and pictures from a user’s iPhone, iPad, or iPod touch into
your Mac app using Continuity Camera.
See Also
User Interface


## Page 22

class NSSound
A simple interface for loading and playing audio files.
class NSSpeechRecognizer
The Cocoa interface to speech recognition in macOS.
class NSSpeechSynthesizer
The Cocoa interface to speech synthesis in macOS.
Deprecated
class NSHapticFeedbackManager
An object that provides access to the haptic feedback management attributes on a system
with a Force Touch trackpad.
protocol NSHapticFeedbackPerformer
A set of methods and constants that a haptic feedback performer implements.
protocol NSAlignmentFeedbackToken
Topics
Sounds
Speech
Haptics
AppKit / Sound, Speech, and Haptics
API Collection
Sound, Speech, and Haptics
Play sounds and haptic feedback, and incorporate speech recognition and
synthesis into your interface.


## Page 23

class NSAlignmentFeedbackFilter
An object that can filter the movement of an object and provides haptic feedback when
alignment occurs.
Views and Controls
Present your content onscreen and handle user input and events.
View Management
Manage your user interface, including the size and position of views in a window.
View Layout
Position and size views using a stack view or Auto Layout constraints.
Appearance Customization
Add Dark Mode support to your app, and use appearance proxies to modify your UI.
Animation
Animate your views and other content to create a more engaging experience for users.
Windows, Panels, and Screens
Organize your view hierarchies and facilitate their display onscreen.
Supporting Continuity Camera in Your Mac App
Incorporate scanned documents and pictures from a user’s iPhone, iPad, or iPod touch into
your Mac app using Continuity Camera.
See Also
User Interface


## Page 24

With Continuity Camera in macOS 10.14 and later, and iOS 12 and later, you can use your iPhone,
iPad, or iPod touch to scan documents or take a picture of something nearby and then access
those documents or pictures instantly from your app.
If your app works with images, this feature can be a convenient way to get images into the app. Fo
example, a text-editing app can use this feature to easily incorporate images into a document. It
can also be a handy way to bring images into a social media app.
Apps using NSTextView get Continuity Camera support automatically. When the user Control-
clicks in an app’s text view, a Continuity Camera menu item appears. The user can then capture a
photo or scan a document on their iPhone or iPad, and it automatically appears in the text view. T
image is then accessible as an attachment in the NSTextView text storage object.
If you’re not using NSTextView, you need to add support to your macOS interface to enable
Continuity Camera, and to merge photos taken from the user’s iOS device.
Overview
AppKit / Supporting Continuity Camera in Your Mac App
Article
Supporting Continuity Camera in Your Mac
App
Incorporate scanned documents and pictures from a user’s iPhone, iPad, or iPod
touch into your Mac app using Continuity Camera.


## Page 25

You must tell AppKit that your app can take advantage of any image data originating from
Continuity Camera. You do this in responder objects, such as a view controller.
When the Continuity Camera menu item appears, AppKit calls the validRequestor(forSend
Type:returnType:) method of your responder objects in the current responder chain to find a
object that can handle image data from Continuity Camera. Override this method to let AppKit
know that your responder object supports image data that Continuity Camera generates. When th
user captures a photo or scans a document using Continuity Camera, AppKit places the image da
on the pasteboard and calls the designated responder object to handle the data.
Your responder’s validRequestor(forSendType:returnType:) implementation must ver
that it can receive pasteboard image data of the specified type, then return the object to receive
the image data when AppKit places it on the pasteboard. Your validRequestor(forSend
Type:returnType:) method can designate the same receiver object to handle the image data
Here’s an example implementation:
Note that your validRequestor(forSendType:returnType:) method can return a differen
object to receive the image data. For example, implement the validRequestor(forSendType
returnType:) method in your view controller and perform the checks, but return a view object 
incorporate the data. You can also return a parent or managing object instead. For example, the
following code implements validRequestor(forSendType:returnType:) in a window
controller, but returns the active view controller to target the pasted image:
Enable Support in Your Responder Objects


## Page 26

After you implement validRequestor(forSendType:returnType:) and specify an object 
receive the image data, AppKit enables the Continuity Camera menu item for the designated men
in your app, including contextual menus associated with your view.
The user initiates Continuity Camera by using a menu item in one of your app’s menu bar menus o
contextual menus. You can add a Continuity Camera menu item to any of your app’s menu bar
menus, or have AppKit automatically add a Continuity Camera menu item to one of your app’s
contextual menus. A good place to include a Continuity Camera menu item is in menus that conta
options for performing editing-related activities, such as the File and Insert menus.
To add a Continuity Camera menu item to one of your app’s menu bar menus, locate the storyboa
file where your menu bar is defined, and follow these steps in Interface Builder:
1. Add an item to your app’s menu.
2. Set the name of the item, such as “Take Picture.” AppKit provides the name later.
3. In the Identity inspector, set the Identifier property of the menu item to NSMenuItemImport
FromDeviceIdentifier (defined in NSMenuItem.h).
Here’s how it looks:
If your app doesn’t use a storyboard, you can programmatically add the menu item by following
these steps:
1. Get the app’s main menu bar.
Add a Continuity Camera Menu Item


## Page 27

2. Get the desired menu item for the insertion from the menu bar.
3. Get the submenu for the menu item.
4. Create the Camera menu item and specify the name, such as “Take Picture.”
5. Set the Identifier property for the Camera menu item to NSMenuItem.importFromDevice
Identifier.
6. Add the Camera menu item to the submenu.
A good place to do this is in your app delegate’s applicationWillFinishLaunching(_:)
method as the following example shows:
You don’t add a Continuity Camera menu item directly to your app’s contextual menus. Instead, y
enable the appropriate support in your app’s responder objects as the previous section describes
and AppKit adds the menu item for you.
For example, the following code demonstrates how to display a contextual menu in response to a
mouse-down event, and have AppKit insert the menu item. This code overrides the mouse
Down(with:) method and creates a menu. It then invokes the NSMenu class method popUp
ContextMenu(_:with:for:), passing the event object related to the mouse-down event and
the view that owns the contextual menu. AppKit automatically inserts the Continuity Camera men
item in the contextual menu for you.


## Page 28

When the user selects the Continuity Camera menu item, the system automatically launches the
Continuity Camera interface on the user’s device. After the user captures an image, AppKit place
that image on the app’s pasteboard.
You need to incorporate the captured images into your app after AppKit places them on the
pasteboard. AppKit then calls the active responder object’s readSelection(from:) method t
read the image data. The readSelection(from:) method supports Continuity Camera image
data and other types of data in your app. Use that method to determine whether the image is in a
format your app supports, and incorporate that image data into your app.
Here’s an example implementation of the readSelection(from:) method:
Views and Controls
Present your content onscreen and handle user input and events.
View Management
Manage your user interface, including the size and position of views in a window.
Incorporate the Image Data from the Pasteboard
See Also
User Interface


## Page 29

View Layout
Position and size views using a stack view or Auto Layout constraints.
Appearance Customization
Add Dark Mode support to your app, and use appearance proxies to modify your UI.
Animation
Animate your views and other content to create a more engaging experience for users.
Windows, Panels, and Screens
Organize your view hierarchies and facilitate their display onscreen.
Sound, Speech, and Haptics
Play sounds and haptic feedback, and incorporate speech recognition and synthesis into you
interface.


