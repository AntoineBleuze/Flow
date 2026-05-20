# 000_Playing haptic feedback in your app.pdf

## Page 1

Haptic feedback provides a tactile response, such as a tap, that draws attention and reinforces
both actions and events. While many system-provided interface elements (for example, pickers,
switches, and sliders) automatically provide haptic feedback, you can add feedback to custom
views and controls in your app when it’s suitable.
When providing feedback:
Always use feedback for its intended purpose. Don’t select a haptic because of the way it feels
The source of the feedback must be clear to the user. For example, the feedback must match a
visual change in the user interface, or must be in response to a user action. Feedback should
never come as a surprise.
Don’t overuse feedback. Overuse can cause confusion and diminish the feedback’s significanc
For design guidance, read Human Interface Guidelines > Playing haptics.
SwiftUI and UIKit have different APIs for providing haptic feedback. Learn more about each style o
haptic feedback and choose what makes sense for your app.
Overview
Use feedback intentionally
Choose the type of feedback
UIKit
To learn more about different types of feedback in SwiftUI, read SensoryFeedback.
Apple Pencil / Playing haptic feedback in your app
Article
Playing haptic feedback in your app
Provide tactile feedback when people perform certain actions in your app.
SwiftUI


## Page 2

To play haptic feedback in your app, you need to add the feedback to a view.
Haptic feedback occurs in response to something, like an action or event. You need to define wha
to trigger feedback in response to.
Using the feedback APIs in SwiftUI and UIKit doesn’t play haptics directly. Instead, it informs the
system of the event. The system then determines whether to play the haptics based on the devic
the app state, the amount of battery power remaining, and other factors.
For example, haptic feedback plays only:
On a device with hardware for haptic feedback
When the app is running in the foreground
When the system Haptics setting is on
Not all types of haptic feedback play on every type of device. As a general rule, trust the system t
determine whether it should play feedback. Don’t check the device type or app state to
conditionally trigger feedback. After you decide how you want to use feedback, always trigger it
when the appropriate events occur. The system ignores any requests that it can’t fulfill.
Use selection feedback to communicate movement through a series of discrete values. For
example, you might trigger selection feedback to indicate that a UI element’s values are changing
Associate the feedback with a view
UIKit
The following SwiftUI code example shows how to associate selection feedback with a view.
Add a sensoryFeedback(_:trigger:) view modifier to your view. For the trigger
parameter, pass a value to monitor for changes.
Define when to play feedback
Play feedback for selection events
UIKit
SwiftUI
SwiftUI


## Page 3

Use canvas feedback to indicate when a drawing event occurs, such as an object snapping to a
guide or ruler. When using Apple Pencil Pro with a compatible iPad, this type of feedback can
provide a tactile response.
The following SwiftUI code example shows how to use a long-press gesture to toggle an accesso
view, playing haptic feedback to indicate when the accessory appears or disappears.
Play feedback for canvas events
UIKit
The following SwiftUI code example shows how to use a drag gesture to drag a square, playing
haptic feedback to indicate when the square aligns with a gridline on the canvas.
SwiftUI


## Page 4

func sensoryFeedback<T>(SensoryFeedback, trigger: T) -> some View
Plays the specified `feedback` when the provided `trigger` value changes.
func sensoryFeedback(trigger:_:)
Plays feedback when returned from the `feedback` closure after the provided `trigger` valu
changes.
func sensoryFeedback<T>(SensoryFeedback, trigger: T, condition: (T, T) 
> Bool) -> some View
Plays the specified `feedback` when the provided `trigger` value changes and the
`condition` closure returns `true`.
See Also
Related reference in SwiftUI


## Page 5

struct SensoryFeedback
Represents a type of haptic and/or audio feedback that can be played.
class UIFeedbackGenerator
The abstract superclass for all feedback generators.
class UICanvasFeedbackGenerator
A concrete feedback generator subclass that creates haptics to indicate events on a drawing
canvas.
class UIImpactFeedbackGenerator
A concrete feedback generator subclass that creates haptics to simulate physical impacts.
class UISelectionFeedbackGenerator
A concrete feedback generator subclass that creates haptics to indicate a change in selectio
class UINotificationFeedbackGenerator
A concrete feedback generator subclass that creates haptics to communicate successes,
failures, and warnings.
Related reference in UIKit


