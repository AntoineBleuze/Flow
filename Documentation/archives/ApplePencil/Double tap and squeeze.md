# Double tap and squeeze.pdf

## Page 1

Apple Pencil interactions let a person perform certain actions in your app by double-tapping or
squeezing an Apple Pencil. Support Apple Pencil interactions to give people a quick way to perfor
their preferred action, such as switching between drawing tools, or a custom action that you defin
in your app.
To learn more about supporting double-tap and squeeze interactions, read Handling double tap
from Apple Pencil and Handling squeezes from Apple Pencil.
To learn more about handling touches, read Handling input from Apple Pencil.
To learn more about incorporating hand-drawn content in your app, see Drawing with PencilKit
Note
Only Apple Pencil Pro supports squeeze interactions. The first-generation Apple Pencil doesn’t
support Apple Pencil interactions.
Overview
UIKit / Apple Pencil interactions
API Collection
Apple Pencil interactions
Handle user interactions like double tap and squeeze on Apple Pencil.


## Page 2

Handling double taps from Apple Pencil
Detect and respond to double taps a person makes on Apple Pencil.
Handling squeezes from Apple Pencil
Detect and respond to squeezes a person makes on Apple Pencil Pro.
Handling input from Apple Pencil
Learn how to detect and respond to touches from Apple Pencil.
func onPencilDoubleTap(perform: (PencilDoubleTapGestureValue) -> Void) 
> some View
Adds an action to perform after the user double-taps their Apple Pencil.
struct PencilDoubleTapGestureValue
Describes the value of an Apple Pencil double-tap gesture.
func onPencilSqueeze(perform: (PencilSqueezeGesturePhase) -> Void) ->
some View
Adds an action to perform when the user squeezes their Apple Pencil.
enum PencilSqueezeGesturePhase
Describes the phase and value of an Apple Pencil squeeze gesture.
struct PencilSqueezeGestureValue
Describes the value of an Apple Pencil squeeze gesture.
struct PencilPreferredAction
An action that the user prefers to perform after double-tapping their Apple Pencil.
struct PencilHoverPose
A value describing the location and distance of an Apple Pencil hovering in the area above a
view’s bounds.
Topics
Essentials
Apple Pencil interactions in SwiftUI
Apple Pencil interactions in UIKit


## Page 3

class UIPencilInteraction
An interaction that tells your app when a person double-taps or squeezes Apple Pencil.
protocol UIPencilInteractionDelegate
The interface an object implements to handle double taps or squeezes a person makes on
Apple Pencil.
class Tap
An interaction that represents a double tap on Apple Pencil.
class Squeeze
An interaction that represents a squeeze on Apple Pencil.
enum Phase
Constants that describe the phases of an interaction on Apple Pencil.
class UIPencilHoverPose
An object that describes the hover pose of Apple Pencil during an interaction like double tap
or squeeze.
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
Focus-based navigation
Navigate the interface of your UIKit app using a remote, game controller, or keyboard.
See Also
User interactions


## Page 4

Accessibility for UIKit
Make your UIKit apps accessible to everyone who uses iOS and tvOS.


## Page 5

You can use Apple Pencil interactions to allow people to access functionality in your app quickly.
Squeezing Apple Pencil Pro lets a person perform actions such as showing a contextual palette
without moving the pencil to another location on the screen.
Note
Only Apple Pencil Pro supports squeeze interactions.
To respond to squeezes from Apple Pencil Pro in your app, you need to register your view to
receive squeeze interactions.
Overview
Register for a squeeze
UIKit
Add an onPencilSqueeze(perform:) view modifier to your view.
Apple Pencil / Handling squeezes from Apple Pencil
Article
Handling squeezes from Apple Pencil
Detect and respond to squeezes a person makes on Apple Pencil Pro.
SwiftUI


## Page 6

A person can choose which action they prefer to perform when they squeeze Apple Pencil Pro.
They choose this preference in Settings > Apple Pencil > Actions > Squeeze. In addition to
drawing-specific actions like switching drawing tools, people can configure the preferred action f
squeeze to perform any App Shortcut, including pre-configured shortcuts you provide for your ap
In your app, you can check the value of this preferred action for squeeze.
When possible, perform the preferred action to provide a consistent user experience across apps
that support squeezes. If the preferred action doesn’t make sense in your app, consider giving
people a way to specify a custom action that’s suitable for your app. For design guidance, read
Human Interface Guidelines > Apple Pencil and Scribble > Squeeze.
The following code shows a snippet from a drawing app that provides custom drawing tools. This
app allows a person to configure a custom action to quickly swap to their favorite custom drawing
tool instead of using the systemwide preferred action for squeezes. This app also supports the
preferred actions to ignore squeezes, switch to the previous tool, and show a custom contextual
palette near the Apple Pencil Pro tip.
Check the preferred squeeze action
UIKit
To check the preferred action, use the preferredPencilSqueezeAction environment value.
For possible values, see PencilPreferredAction.
Choose the action to perform
UIKit
SwiftUI
SwiftUI


## Page 7



## Page 8

Handling double taps from Apple Pencil
Detect and respond to double taps a person makes on Apple Pencil.
func onPencilSqueeze(perform: (PencilSqueezeGesturePhase) -> Void) ->
some View
Adds an action to perform when the user squeezes their Apple Pencil.
enum PencilSqueezeGesturePhase
Describes the phase and value of an Apple Pencil squeeze gesture.
struct PencilSqueezeGestureValue
Describes the value of an Apple Pencil squeeze gesture.
struct PencilPreferredAction
An action that the user prefers to perform after double-tapping their Apple Pencil.
struct PencilHoverPose
A value describing the location and distance of an Apple Pencil hovering in the area above a
view’s bounds.
class UIPencilInteraction
An interaction that tells your app when a person double-taps or squeezes Apple Pencil.
See Also
Related articles
Related reference in SwiftUI
Related reference in UIKit


## Page 9

protocol UIPencilInteractionDelegate
The interface an object implements to handle double taps or squeezes a person makes on
Apple Pencil.
class Squeeze
An interaction that represents a squeeze on Apple Pencil.
enum Phase
Constants that describe the phases of an interaction on Apple Pencil.
class UIPencilHoverPose
An object that describes the hover pose of Apple Pencil during an interaction like double tap
or squeeze.


## Page 10

You can use Apple Pencil interactions to allow people to access functionality in your app quickly.
Double-tapping Apple Pencil lets a person perform actions such as switching between drawing
tools without moving the pencil to another location on the screen.
To respond to double taps from Apple Pencil in your app, you need to register your view to receive
double-tap interactions.
Overview
Register for a double tap
UIKit
Add an onPencilDoubleTap(perform:) view modifier to your view.
Apple Pencil / Handling double taps from Apple Pencil
Article
Handling double taps from Apple Pencil
Detect and respond to double taps a person makes on Apple Pencil.
SwiftUI


## Page 11

A person can choose which action they prefer to perform when they double-tap Apple Pencil. The
choose this systemwide preference in Settings > Apple Pencil > Actions > Double Tap.
In your app, you can check the value of this preferred action for double tap.
When possible, perform the preferred action to provide a consistent user experience across apps
that support double taps. If the preferred action doesn’t make sense in your app, consider giving
people a way to choose a custom action that’s suitable for your app. For design guidance, read
Human Interface Guidelines > Apple Pencil and Scribble > Double tap.
The following code shows a snippet from a drawing app that provides custom drawing tools. This
app allows a person to configure a custom action to quickly swap to their favorite custom drawing
tool instead of using the systemwide preferred action for double taps. This app also supports the
preferred actions to ignore double taps, switch to the previous tool, and switch to the eraser tool.
Check the preferred double-tap action
UIKit
To check the preferred action, use the preferredPencilDoubleTapAction environment
value. For possible values, see PencilPreferredAction.
Choose the action to perform
UIKit
SwiftUI
SwiftUI


## Page 12

Handling squeezes from Apple Pencil
Detect and respond to squeezes a person makes on Apple Pencil Pro.
See Also
Related articles


## Page 13

func onPencilDoubleTap(perform: (PencilDoubleTapGestureValue) -> Void) 
> some View
Adds an action to perform after the user double-taps their Apple Pencil.
struct PencilDoubleTapGestureValue
Describes the value of an Apple Pencil double-tap gesture.
struct PencilPreferredAction
An action that the user prefers to perform after double-tapping their Apple Pencil.
struct PencilHoverPose
A value describing the location and distance of an Apple Pencil hovering in the area above a
view’s bounds.
class UIPencilInteraction
An interaction that tells your app when a person double-taps or squeezes Apple Pencil.
protocol UIPencilInteractionDelegate
The interface an object implements to handle double taps or squeezes a person makes on
Apple Pencil.
class Tap
An interaction that represents a double tap on Apple Pencil.
enum Phase
Constants that describe the phases of an interaction on Apple Pencil.
class UIPencilHoverPose
An object that describes the hover pose of Apple Pencil during an interaction like double tap
or squeeze.
Related reference in SwiftUI
Related reference in UIKit


