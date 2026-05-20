# 003_Launching your voice-based conversational app from the side button of iPhone.pdf

## Page 1

By adopting the App Intents framework and offering App Shortcuts, you let people instantly acces
app functionality and integrate it with system experiences like Spotlight or App Shortcuts. For
example, a person might place an App Shortcut you provide on the Action button. In Japan, peop
might place an action on the side button of iPhone that instantly launches your voice-based
conversational app. People expect the voice-based conversational functionality to be instantly
available when they launch your app with the side button, so make sure to let them immediately u
it by starting an audio session – for example, with AVFoundation.
Important
Functionality provided by the activate schema API in App Intents is only available on iPhone
in Japan and requires the Side Button Access entitlement. During development, install
your provisioning profile on your iPhone test device to test the functionality. For a production
device, the country or region of your Apple Account must be set to Japan, and you must
physically be located in Japan.
To allow people to press and hold the side button to launch your voice-based conversational app 
its conversation experience:
1. Add the com.apple.developer.side-button-access.allow entitlement to the
.entitlements file in your app’s Xcode project. For details on adding this entitlement, see
Side Button Access.
Overview
App Intents / Launching your voice-based conversational app from the side button of iPhone
Article
Launching your voice-based
conversational app from the side button of
iPhone
Let people in Japan configure the side button of iPhone to launch your voice-
based conversational app.


## Page 2

2. Create an app intent that conforms to the activate app intent schema.
3. In the app intent’s perform() implementation, navigate to the scene that provides voice-base
conversational functionality and start an audio session.
The following example shows how an app that provides voice-based conversational functionality
might implement an app intent that people in Japan can place on the side button of iPhone:
If you’re new to the AppIntents framework, refer to Creating your first app intent and Making
actions and content discoverable and widely available for additional information.
Making app entities available in Spotlight
Allow people to find your app’s content in Spotlight by donating app entities to its semantic
index.
Focus
Adjust your app’s behavior and filter incoming notifications when the current Focus changes
Action button on iPhone and Apple Watch
Enable people to run your App Shortcuts with the Action button on iPhone or to start your
app’s workout or dive sessions using the Action button on Apple Watch.
See Also
Other system experiences


## Page 3

Developing a WidgetKit strategy
Explore features, tasks, related frameworks, and constraints as you make a plan to implemen
widgets, controls, watch complications, and Live Activities.


