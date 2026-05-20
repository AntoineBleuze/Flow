# 002_Action button on iPhone and Apple Watch.pdf

## Page 1

On supported iPhone models, people can choose a single App Shortcut to perform an app’s actio
when they press the Action button by selecting an App Shortcut in Settings > Action button. To
give users quick access to your app’s functionality, create App Shortcuts for your high-value app
intents using the init(intent:phrases:shortTitle:systemImageName:) or
init(intent:phrases:shortTitle:systemImageName:parameterPresentation:)
initializer. For additional information, see App Shortcuts.
On supported Apple Watch models, people can choose to start workout or dive session using the
Action button in Settings > Action Button. To add your app to the list of available workout or dive
apps, implement an App Intent that adopts the StartWorkoutIntent or StartDiveIntent
protocol. For more information, see Responding to the Action button on Apple Watch Ultra.
For design guidance, see Human Interface Guidelines > App Shortcuts and Human Interface
Guidelines > Action button.
Responding to the Action button on Apple Watch Ultra
Use App Intents to register actions for your app.
protocol StartWorkoutIntent
An App Intent for starting a workout.
Overview
Topics
Responding to the Action button
App Intents / Action button on iPhone and Apple Watch
API Collection
Action button on iPhone and Apple Watch
Enable people to run your App Shortcuts with the Action button on iPhone or to
start your app’s workout or dive sessions using the Action button on Apple Watch


## Page 2

protocol PauseWorkoutIntent
An App Intent that lets someone pause your app’s current workout session.
protocol ResumeWorkoutIntent
An App Intent that lets someone resume your app’s paused workout session.
protocol StartDiveIntent
An App Intent that lets people start a dive session when they press the Action button on App
Watch Ultra.
struct ConfirmationActionName
Making app entities available in Spotlight
Allow people to find your app’s content in Spotlight by donating app entities to its semantic
index.
Focus
Adjust your app’s behavior and filter incoming notifications when the current Focus changes
Launching your voice-based conversational app from the side button of iPhone
Let people in Japan configure the side button of iPhone to launch your voice-based
conversational app.
Developing a WidgetKit strategy
Explore features, tasks, related frameworks, and constraints as you make a plan to implemen
widgets, controls, watch complications, and Live Activities.
See Also
Other system experiences


