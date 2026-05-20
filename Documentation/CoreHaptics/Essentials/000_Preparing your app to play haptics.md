# 000_Preparing your app to play haptics.pdf

## Page 1

This article describes the process of setting up your app to play haptics. You’ll check for device
compatibility, create a haptic engine, and then configure the engine’s handler properties.
Note
Make sure you set the engine’s handler properties before starting it to play a haptic.
Before you create and configure a haptic engine, check the hardware capabilities to see what typ
of feedback the device supports. Some devices don’t support haptic feedback, including iPad, iPo
touch, and Apple Vision Pro. Checking the hardware capabilities lets you adjust your app’s behavi
to provide alternative types of feedback as needed. For example, you might play stronger audio o
multimedia, or you might provide visual feedback instead.
The following example fetches the hardware capabilities and checks the value of the supports
Haptics property to determine whether haptic feedback is available. The app then saves the
result to a variable, which it uses later to determine what type of feedback to provide.
Overview
Check for device compatibility
Objective-C
Core Haptics / Preparing your app to play haptics
Article
Preparing your app to play haptics
Set up your app to play haptics.
Swift


## Page 2

For an example of conditioning haptic playback, see Playing a Custom Haptic Pattern from a File.
The CHHapticEngine is your app’s interface to the haptic device. Use an instance of a haptic
engine to perform these key tasks:
Create players to play those haptic and audio patterns.
Play haptic patterns directly from a file URL.
Modulate haptic patterns during playback.
Create this engine early in your app’s life cycle—for example, in your main view controller’s view
DidLoad()—and store it in an instance variable or property so it doesn’t go out of scope during
playback.
Note
The haptic engine isn’t a singleton; you can create multiple instances in different parts of your
app or game, like different view controllers or levels. Each instance of the haptic engine
behaves independently. Core Haptics is thread-safe, meaning you can execute player
operations on separate threads.
Core Haptics calls the reset handler after the media server has recovered from failure. When this
occurs, inside the reset handler, your app should do the following:
Restart the haptic engine, if it was running at the time reset happened, by calling start().
Create a haptic engine
Objective-C
Set the reset handler to recover from failure
Swift


## Page 3

Reregister any custom audio resources you had registered, using registerAudio
Resource(_:options:).
Recreate all haptic pattern players you had created, using makePlayer(with:).
Your app could attempt to restart the engine inside the handler, allowing it to recover on its own.
However, as shown in the code listing above, a restart may still fail if the external reason for the
reset hasn’t subsided.
When external factors cause the haptic engine to stop, like audio interruptions from a phone call o
because the user has put your app in the background, Core Haptics calls the stoppedHandler.
The reason for the stoppage is passed into the handler. Because stopping is a normal part of the
life cycle, you need to restart the engine before it can play the next haptic.
As you’re testing your app, set the stoppedHandler to debug the precise cause of the engine
stoppage, as shown below.
Objective-C
Receive notification of haptic engine stoppage due to
outside causes
Objective-C
Swift
Swift


## Page 4

In production, your app can handle each cause in a different way. For example, you could handle
the case CHHapticEngine.StoppedReason.systemError by continuing the app without
haptics, or by throwing a fatal error to terminate the app.
Note
The stopped handler defined in the code above is called only when external causes trigger an
engine stoppage. The stopped handler isn’t called if you manually stop the engine through an
explicit stop(completionHandler:) call. Instead, Core Haptics calls the completion
handler passed as input to the explicit stop call.
Once you’ve set up your app to play haptics, you can incorporate haptic patterns. See:
Simple haptic patterns defined inline as dictionaries: Playing a single-tap haptic pattern
Custom file-based haptic patterns: Playing a Custom Haptic Pattern from a File
Programmatic haptics tied to real-time physics: Playing Collision-Based Haptic Patterns
Playing a single-tap haptic pattern
Create and play a transient haptic pattern from a dictionary literal inline.
Define and play haptics
See Also
Essentials


## Page 5

class CHHapticEngine
An object that represents the connection to the haptic server.
class CHHapticPattern
An object representing a haptic waveform.
protocol CHHapticPatternPlayer
A protocol that defines a standard pattern player capable of playing haptic patterns with fixe
parameters.
protocol CHHapticAdvancedPatternPlayer
A protocol that defines an advanced pattern player capable of looping, seeking, pausing, and
resuming haptic playback.


