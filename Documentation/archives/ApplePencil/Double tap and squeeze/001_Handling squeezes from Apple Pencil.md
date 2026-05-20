# 001_Handling squeezes from Apple Pencil.pdf

## Page 1

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


## Page 2

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


## Page 3



## Page 4

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


## Page 5

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


