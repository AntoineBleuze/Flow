# 002_Handling double taps from Apple Pencil.pdf

## Page 1

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


## Page 2

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


## Page 3

Handling squeezes from Apple Pencil
Detect and respond to squeezes a person makes on Apple Pencil Pro.
See Also
Related articles


## Page 4

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


