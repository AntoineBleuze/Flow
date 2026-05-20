# 001_Focus.pdf

## Page 1

People use Focus on macOS, iOS, and iPadOS to minimize distractions. For example, someone
might use a Work Focus to hide notifications from personal email or message accounts. When
someone engages a Focus, the system executes your app’s custom SetFocusFilterIntent.
Define a version of this intent to update your app’s configuration and filter incoming notifications.
Related sessions from WWDC22
Session 10121: Meet Focus filters.
Overview
Topics
App Intents / Focus
API Collection
Focus
Adjust your app’s behavior and filter incoming notifications when the current Focu
changes.


## Page 2

protocol SetFocusFilterIntent
An interface for providing an app intent that you use to adapt your app’s behavior when Focu
changes.
Defining your app’s Focus filter
Customize your app’s behavior to reflect the device’s current Focus.
struct FocusFilterAppContext
A type that contains app-specific contextual information for a particular Focus, such as the
notification filter criteria to apply.
struct FocusFilterSuggestionContext
A type you use to suggest app configurations for a given Focus.
enum SetFocusFilterIntentError
Errors that can occur when you try to retrieve the current Focus configuration settings.
Making app entities available in Spotlight
Allow people to find your app’s content in Spotlight by donating app entities to its semantic
index.
Action button on iPhone and Apple Watch
Enable people to run your App Shortcuts with the Action button on iPhone or to start your
app’s workout or dive sessions using the Action button on Apple Watch.
Launching your voice-based conversational app from the side button of iPhone
Let people in Japan configure the side button of iPhone to launch your voice-based
conversational app.
Developing a WidgetKit strategy
Focus filters
Errors
See Also
Other system experiences


## Page 3

Explore features, tasks, related frameworks, and constraints as you make a plan to implemen
widgets, controls, watch complications, and Live Activities.


