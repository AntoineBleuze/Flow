# Pointers.pdf

## Page 1

SwiftUI provides view modifiers that enable your app to listen for and react to various kinds of use
input. For example, you can create keyboard shortcuts, respond to a form submission, or take inp
from the digital crown of an Apple Watch.
For design guidance, see Inputs in the Human Interface Guidelines.
func onKeyPress(KeyEquivalent, action: () -> KeyPress.Result) -> some 
View
Performs an action if the user presses a key on a hardware keyboard while the view has focu
Overview
Topics
Responding to keyboard input
SwiftUI / Input events
API Collection
Input events
Respond to input from a hardware device, like a keyboard or a Touch Bar.


## Page 2

func onKeyPress(phases: KeyPress.Phases, action: (KeyPress) -> KeyPress
Result) -> some View
Performs an action if the user presses any key on a hardware keyboard while the view has
focus.
func onKeyPress(KeyEquivalent, phases: KeyPress.Phases, action: (Key
Press) -> KeyPress.Result) -> some View
Performs an action if the user presses a key on a hardware keyboard while the view has focu
func onKeyPress(characters: CharacterSet, phases: KeyPress.Phases,
action: (KeyPress) -> KeyPress.Result) -> some View
Performs an action if the user presses one or more keys on a hardware keyboard while the
view has focus.
func onKeyPress(keys: Set<KeyEquivalent>, phases: KeyPress.Phases,
action: (KeyPress) -> KeyPress.Result) -> some View
Performs an action if the user presses one or more keys on a hardware keyboard while the
view has focus.
struct KeyPress
func keyboardShortcut(_:)
Assigns a keyboard shortcut to the modified control.
func keyboardShortcut(KeyEquivalent, modifiers: EventModifiers) -> some
View
Defines a keyboard shortcut and assigns it to the modified control.
func keyboardShortcut(KeyEquivalent, modifiers: EventModifiers,
localization: KeyboardShortcut.Localization) -> some View
Defines a keyboard shortcut and assigns it to the modified control.
var keyboardShortcut: KeyboardShortcut?
The keyboard shortcut that buttons in this environment will be triggered with.
struct KeyboardShortcut
Keyboard shortcuts describe combinations of keys on a keyboard that the user can press in
order to activate a button or toggle.
struct KeyEquivalent
Creating keyboard shortcuts


## Page 3

Key equivalents consist of a letter, punctuation, or function key that can be combined with a
optional set of modifier keys to specify a keyboard shortcut.
struct EventModifiers
A set of key modifiers that you can add to a gesture.
func onModifierKeysChanged(mask: EventModifiers, initial: Bool, (Event
Modifiers, EventModifiers) -> Void) -> some View
Performs an action whenever the user presses or releases a hardware modifier key.
func modifierKeyAlternate<V>(EventModifiers, () -> V) -> some View
Builds a view to use in place of the modified view when the user presses the modifier key(s)
indicated by the given set.
func onHover(perform: (Bool) -> Void) -> some View
Adds an action to perform when the user moves the pointer over or away from the view’s
frame.
func onContinuousHover(coordinateSpace:perform:)
Adds an action to perform when the pointer enters, moves within, and exits the view’s bound
func hoverEffect(_:isEnabled:)
Applies a hover effect to this view.
func hoverEffectDisabled(Bool) -> some View
Adds a condition that controls whether this view can display hover effects.
func defaultHoverEffect(_:)
Sets the default hover effect to use for views within this view.
var isHoverEffectEnabled: Bool
A Boolean value that indicates whether the view associated with this environment allows hov
effects to be displayed.
enum HoverPhase
The current hovering state and value of the pointer.
struct HoverEffectPhaseOverride
Responding to modifier keys
Responding to hover events


## Page 4

Options for overriding a hover effect’s current phase.
struct OrnamentHoverContentEffect
Presents an ornament on hover using a custom effect.
struct OrnamentHoverEffect
Presents an ornament on hover.
func pointerStyle(PointerStyle?) -> some View
Sets the pointer style to display when the pointer is over the view.
struct PointerStyle
A style describing the appearance of the pointer (also called a cursor) when it’s hovered ove
a view.
func pointerVisibility(Visibility) -> some View
Sets the visibility of the pointer when it’s over the view.
func hoverEffect(HoverEffect) -> some View
Applies a hover effect to this view.
struct HoverEffect
An effect applied when the pointer hovers over a view.
func hoverEffect(some CustomHoverEffect, in: HoverEffectGroup?, is
Enabled: Bool) -> some View
Applies a hover effect to this view, optionally adding it to a HoverEffectGroup.
func hoverEffect(in: HoverEffectGroup?, isEnabled: Bool, body: (Empty
HoverEffectContent, Bool, GeometryProxy) -> some HoverEffectContent) ->
some View
Applies a hover effect to this view described by the given closure.
protocol CustomHoverEffect
A type that represents how a view should change when a pointer hovers over a view, or when
someone looks at the view.
struct ContentHoverEffect
Modifying pointer appearance
Changing view appearance for hover events


## Page 5

A CustomHoverEffect that applies effects to a view on hover using a closure.
struct HoverEffectGroup
Describes a grouping of effects that activate together.
func hoverEffectGroup() -> some View
Adds an implicit HoverEffectGroup to all effects defined on descendant views, so that al
effects added to subviews activate as a group whenever this view or any descendant views
are hovered.
func hoverEffectGroup(HoverEffectGroup?) -> some View
Adds a HoverEffectGroup to all effects defined on descendant views, and activates the
group whenever this view or any descendant views are hovered.
func hoverEffectGroup(id: String?, in: Namespace.ID, behavior: Hover
EffectGroup.Behavior) -> some View
Adds a HoverEffectGroup to all effects defined on descendant views, and activates the
group whenever this view or any descendant views are hovered.
struct GroupHoverEffect
A CustomHoverEffect that activates a named group of effects.
protocol HoverEffectContent
A type that describes the effects of a view for a particular hover effect phase.
struct EmptyHoverEffectContent
An empty base effect that you use to build other effects.
func handPointerBehavior(HandPointerBehavior?) -> some View
Sets the behavior of the hand pointer while the user is interacting with the view.
struct HandPointerBehavior
A behavior that can be applied to the hand pointer while the user is interacting with a view.
func onSubmit(of: SubmitTriggers, () -> Void) -> some View
Adds an action to perform when the user submits a value to this view.
func submitScope(Bool) -> some View
Prevents submission triggers originating from this view to invoke a submission action
configured by a submission modifier higher up in the view hierarchy.
Responding to submission events


## Page 6

struct SubmitTriggers
A type that defines various triggers that result in the firing of a submission action.
func submitLabel(SubmitLabel) -> some View
Sets the submit label for this view.
struct SubmitLabel
A semantic label describing the label of submission within a view hierarchy.
func onMoveCommand(perform: ((MoveCommandDirection) -> Void)?) -> some 
View
Adds an action to perform in response to a move command, like when the user presses an
arrow key on a Mac keyboard, or taps the edge of the Siri Remote when controlling an Apple
TV.
func onDeleteCommand(perform: (() -> Void)?) -> some View
Adds an action to perform in response to the system’s Delete command, or pressing either t
⌫ (backspace) or ⌦ (forward delete) keys while the view has focus.
func pageCommand<V>(value: Binding<V>, in: ClosedRange<V>, step: V) ->
some View
Steps a value through a range in response to page up or page down commands.
func onExitCommand(perform: (() -> Void)?) -> some View
Sets up an action that triggers in response to receiving the exit command while the view has
focus.
func onPlayPauseCommand(perform: (() -> Void)?) -> some View
Adds an action to perform in response to the system’s Play/Pause command.
func onCommand(Selector, perform: (() -> Void)?) -> some View
Adds an action to perform in response to the given selector.
enum MoveCommandDirection
Specifies the direction of an arrow key movement.
Labeling a submission event
Responding to commands
Controlling hit testing


## Page 7

func allowsTightening(Bool) -> some View
Sets whether text in this view can compress the space between characters when necessary 
fit text in a line.
func contentShape<S>(S, eoFill: Bool) -> some View
Defines the content shape for hit testing.
func contentShape<S>(ContentShapeKinds, S, eoFill: Bool) -> some View
Sets the content shape for this view.
struct ContentShapeKinds
A kind for the content shape of a view.
func digitalCrownAccessory(Visibility) -> some View
Specifies the visibility of Digital Crown accessory Views on Apple Watch.
func digitalCrownAccessory<Content>(content: () -> Content) -> some Vie
Places an accessory View next to the Digital Crown on Apple Watch.
func digitalCrownRotation<V>(Binding<V>, from: V, through: V,
sensitivity: DigitalCrownRotationalSensitivity, isContinuous: Bool, is
HapticFeedbackEnabled: Bool, onChange: (DigitalCrownEvent) -> Void, on
Idle: () -> Void) -> some View
Tracks Digital Crown rotations by updating the specified binding.
func digitalCrownRotation<V>(Binding<V>, onChange: (DigitalCrownEvent) 
> Void, onIdle: () -> Void) -> some View
Tracks Digital Crown rotations by updating the specified binding.
func digitalCrownRotation(detent:from:through:by:sensitivity:is
Continuous:isHapticFeedbackEnabled:onChange:onIdle:)
Tracks Digital Crown rotations by updating the specified binding.
func digitalCrownRotation<V>(Binding<V>) -> some View
Tracks Digital Crown rotations by updating the specified binding.
func digitalCrownRotation<V>(Binding<V>, from: V, through: V, by: V.
Stride?, sensitivity: DigitalCrownRotationalSensitivity, isContinuous:
Bool, isHapticFeedbackEnabled: Bool) -> some View
Tracks Digital Crown rotations by updating the specified binding.
Interacting with the Digital Crown


## Page 8

struct DigitalCrownEvent
An event emitted when the user rotates the Digital Crown.
enum DigitalCrownRotationalSensitivity
The amount of Digital Crown rotation needed to move between two integer numbers.
func touchBar<Content>(content: () -> Content) -> some View
Sets the content that the Touch Bar displays.
func touchBar<Content>(TouchBar<Content>) -> some View
Sets the Touch Bar content to be shown in the Touch Bar when applicable.
func touchBarItemPrincipal(Bool) -> some View
Sets principal views that have special significance to this Touch Bar.
func touchBarCustomizationLabel(Text) -> some View
Sets a user-visible string that identifies the view’s functionality.
func touchBarItemPresence(TouchBarItemPresence) -> some View
Sets the behavior of the user-customized view.
struct TouchBar
A container for a view that you can show in the Touch Bar.
enum TouchBarItemPresence
Options that affect user customization of the Touch Bar.
func onCameraCaptureEvent(isEnabled: Bool, action: (AVCaptureEvent) ->
Void) -> some View
Used to register an action triggered by system capture events.
func onCameraCaptureEvent(isEnabled: Bool, primaryAction: (AVCapture
Event) -> Void, secondaryAction: (AVCaptureEvent) -> Void) -> some View
Used to register actions triggered by system capture events.
Managing Touch Bar input
Responding to capture events


## Page 9

Gestures
Define interactions from taps, clicks, and swipes to fine-grained gestures.
Clipboard
Enable people to move or duplicate items by issuing Copy and Paste commands.
Drag and drop
Enable people to move or duplicate items by dragging them from one location to another.
Focus
Identify and control which visible object responds to user interaction.
System events
React to system events, like opening a URL.
See Also
Event handling


## Page 10

iPadOS 13.4 introduces dynamic pointer effects and behaviors that enhance the experience of
using an external input device, like a trackpad or mouse, with iPad. As people use an input device
iPadOS automatically adapts the pointer to the current context, providing rich visual feedback and
just the right level of precision needed to enhance productivity and simplify common tasks.
UIKit automatically handles pointer interactions if you’re using UIButton, UIBarButtonItem, o
UISegmentedControl. If you use custom views to display your content, you must define pointe
effects and styles yourself.
For more information, see Human Interface Guidelines.
To add a custom pointer style effect to a view:
1. Create a UIPointerInteraction instance.
2. Specify the pointer interaction’s delegate (an object that conforms to the UIPointer
InteractionDelegate protocol).
3. Add the interaction to the view’s interactions property.
4. Add the pointerInteraction(_:styleFor:) delegate method.
5. Return UIPointerStyle from that delegate method.
This example uses a custom helper method, which you typically call within a view controller’s vie
DidLoad() method:
Overview
Specify custom pointer styles
UIKit / Pointer interactions
API Collection
Pointer interactions
Support pointer interactions in your custom controls and views.


## Page 11

The pointerInteraction(_:styleFor:) delegate method is called when the pointer enters
the view’s region. The following example shows an interaction that applies a UIPointerLift
Effect effect by returning a UIPointerStyle object:
Including animations can be helpful in pointer interactions, especially when views contain elemen
that interfere with pointer effects. For example, hiding the separator bars in a UISegmented
Control when the pointer enters the control allows the active segment effect to appear visually
uncluttered.
The following example performs a simple animation to change the alpha value of the view when th
pointer enters and exits the region:
Add interaction animations


## Page 12

If you want to distinguish between pointing device touch events and touch events from other
sources, like the user’s fingers or Apple Pencil, you can enable the UIApplicationSupports
IndirectInputEvents key in the Info.plist file. With this key enabled, your app can
respond to specific gestures targeted at touches of UITouch.TouchType.indirectPointer
For more information, see UIApplicationSupportsIndirectInputEvents.
class UIPointerInteraction
An interaction that enables support for effects on a view or customizes the pointer’s
appearance within a region of an app.
protocol UIPointerInteractionDelegate
An interface for handling pointer movements within the interaction’s view.
Integrating pointer interactions into your iPad app
Support touch interactions in your iPad app by adding pointer interactions to your views.
Enhancing your iPad app with pointer interactions
Provide a great user experience with pointing devices, by incorporating pointer content
effects and shape customizations.
protocol UIPointerInteractionAnimating
An interface for modifying an interaction animation in coordination with the pointer effect
animations.
class UIPointerStyle
An object that defines the pointer shape and effect.
enum UIPointerShape
An object that defines the shape of custom pointers.
Distinguish pointing device input events
Topics
Essentials
Interaction animations
Pointer styles


## Page 13

enum UIPointerEffect
An effect that alters a view’s appearance when a pointer enters the current region.
class UIPointerAccessory
Constants that describe accessories to display alongside the primary pointer.
class UIPointerRegion
A rectangular region that interacts with pointer movements.
class UIPointerRegionRequest
An object to describe the pointer’s location in the interaction’s view.
class UIPointerLockState
An object that contains information about a scene’s pointer lock state.
class UIBandSelectionInteraction
An object that tracks the selection of multiple items using pointer-based input.
enum State
Constants that indicate whether a band selection interaction object is inactive or currently
tracking an interaction.
Touches, presses, and gestures
Encapsulate your app’s event-handling logic in gesture recognizers so that you can reuse th
code throughout your app.
Menus and shortcuts
Pointer region
Lock state
Band selection
See Also
User interactions


## Page 14

Simplify interactions with your app using menu systems, contextual menus, Home Screen
quick actions, and keyboard shortcuts.
Drag and drop
Bring drag and drop to your app by using interaction APIs with your views.
Apple Pencil interactions
Handle user interactions like double tap and squeeze on Apple Pencil.
Focus-based navigation
Navigate the interface of your UIKit app using a remote, game controller, or keyboard.
Accessibility for UIKit
Make your UIKit apps accessible to everyone who uses iOS and tvOS.


## Page 15

This sample code project shows how to use the UIPointerInteraction class. A pointer
interaction enables support for adding effects to a view, and for customizing the pointer’s
appearance within a region of an app. It enhances user experience with mouse and trackpad
devices and reduces the need for users to move their hands between a hardware keyboard and th
touchscreen of an iPad. The sample places four shape views in a canvas within the app’s View
Controller, each of which can be moved around. The shape views are a rectangle, oval, round
rectangle, and triangle. Each of these takes on a different pointer effect when the user tracks the
cursor over them. In addition, the sample shows a custom UIControl subclass, to illustrate how
controls can adopt pointer interaction.
The sample adds a pointer interaction to a UIButton. Custom pointer interactions require a
UIButtonPointerStyleProvider function. When applying a style provider function, UIKit
hands a pointer effect and pointer shape within that function to an app; the app then returns a
pointer style for that particular button. Developers can pick and choose between the proposed
effect and shape that the system recommends, replace one or the other, or create an entirely
custom style. The sample applies four different pointer effects to its buttons: automatic, highlight
lift, and hover. For the fifth button a custom pointer hover effect is applied, so its effect remains th
same size while hovered, and uses a custom UIPointerShape.
Overview
Add a pointer interaction to a button
UIKit / Pointer interactions / Integrating pointer interactions into your iPad app
Sample Code
Integrating pointer interactions into your
iPad app
Support touch interactions in your iPad app by adding pointer interactions to your
views.
Download
iOS 13.4+
iPadOS 13.4+
Xcode 12.5+


## Page 16

The sample implements shape views, which are a subclass of UIView called ShapeView. They
interact with touch events with both the device’s touchscreen and touch pad. To visually interact
with a shape view a UIPointerInteraction object is assigned to it. View controllers adopt
UIPointerInteractionDelegate to help describe how that pointer interaction operates.
A pointer interaction is described by a pointer style or visual representation. The pointer style is
made up of both a UIPointerEffect with a UITargetedPreview, and a UIPointerShape.
commonly used shape for pointer effects is a rounded rectangle. A pointer shape or UIPointer
Shape requires a UIBezierPath, which describes that shape. The sample associates a pointer
interaction to a shape view by adding one like this:
For a shape view to describe its appearance during a pointer interaction, it must provide a
UITargetedPreview. UITargetedPreview gives UIKit a view to which to apply an effect
during pointer interactions:
As the user moves the points within a shape view, the pointer interaction displays this targeted
preview. Note that targeted previews are also used with context menus through the use of
UIContextMenuConfiguration. In the sample, shape views have context menus.
A pointer interaction needs a visual effect to describe how it will render the shape view’s targeted
preview. The oval shape view, for example, uses UIPointerLiftEffect, which slightly lifts the
Provide a custom view for a pointer interaction
Add a pointer interaction to a view
Create a targeted preview for a pointer interaction
Create a pointer effect for a pointer interaction


## Page 17

targeted preview and slides it around as the pointer is moved within the oval shape. The other
shape views have their own pointer effects. The rectangle view uses a UIPointerEffect, a
rounded rectangle view uses a UIPointerHighlightEffect, and a triangle view uses a
UIPointerHoverEffect, which allows for its UIPointerShape to be revealed as a triangle.
The sample creates either a region or shape, defined for each of its shape views, so a pointer
interaction detects where to interact. The sample also implements pointerInteraction(_:
regionFor:defaultRegion:) as the UIPointerInteractionDelegate. This delegate is
called by UIKit as the pointer moves within the pointer interaction’s view. Returning a UIPointer
Region in which to apply a pointer style or returning nil indicates that this interaction does not
customize the pointer for the current location.
Create a shape for a pointer interaction


## Page 18

The oval shape view, for example, interacts with the pointer from within its oval shaped UIBezie
Path.
To make the shape views more interactive and provide custom behaviors driven by a mouse or
trackpad, the sample attaches four different gesture recognizers to each shape view, to work
alongside their pointer interactions.
A UIPanGestureRecognizer moves a shape view and the frame color changes to orange whe
the command key is pressed during the pan gesture.
A UIPinchGestureRecognizer changes the shape’s size with a two-finger pinch gesture.
A UITapGestureRecognizer brings the tapped shape view to the front.
A UIHoverGestureRecognizer changes the frame color of a shape view to blue when the
cursor is positioned over it. If the user presses the command key while hovering, the frame color
toggles to pink.
Below is an example of handling the UIHoverGestureRecognizer to a ShapeView:
Interact with views using gesture recognizers


## Page 19

The UIPanGestureRecognizer recognizes continuous scrolling that originates from devices li
the trackpad. The sample adds a pan gesture recognizer to a custom UIControl subclass Alph
Control that recognizes a two-finger scroll gesture to change the alpha value of a given color.
With allowedScrollTypesMask set to continuous, apps recognize continuous scrolling. Th
control’s color swatch changes as the user performs a pan scroll gesture, or through a direct touc
class UIPointerInteraction
An interaction that enables support for effects on a view or customizes the pointer’s
appearance within a region of an app.
protocol UIPointerInteractionDelegate
An interface for handling pointer movements within the interaction’s view.
Enhancing your iPad app with pointer interactions
Provide a great user experience with pointing devices, by incorporating pointer content
effects and shape customizations.
Create a gesture recognizer for continuous scrolling
See Also
Essentials


