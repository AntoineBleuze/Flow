# Essentials.pdf

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


## Page 6

This article describes how to define the haptic pattern for a single haptic tap and how to play that
haptic pattern through a haptic engine.
The CHHapticEngine is your app’s interface to the haptic device. An instance of a haptic engin
allows you to create a CHHapticPatternPlayer or CHHapticAdvancedPatternPlayer to
play individual haptics. Create the haptic engine as described in Preparing your app to play haptic
The next step is to create a dictionary literal representing the haptic. The following represents a
single haptic tap:
Overview
Create a haptic engine
Specify a dictionary literal
Objective-C
Core Haptics / Playing a single-tap haptic pattern
Article
Playing a single-tap haptic pattern
Create and play a transient haptic pattern from a dictionary literal inline.
Swift


## Page 7

Each entry in the dictionary shown above is a haptic event, with an event type, a start time, and a
duration. In this case, the event type is hapticTransient because a single tap is a transient
pattern — a quick impulse. The time is CHHapticTimeImmediate to indicate that the event
begins immediately, right after time 0. The duration of 1.0 indicates that the event lasts one
second.
Initialize a CHHapticPattern from the dictionary you just created.
When you’re ready to play your haptic, create a player for that pattern. Each player is responsible
for playing one pattern. You can reuse a player to play its pattern as many times as you like.
Use one of the haptic engine’s factory methods, like makePlayer(with:), to create the haptic
pattern player.
If you call start(atTime:) on a player that’s already playing, it restarts itself at the beginning o
the pattern.
Haptic players are inexpensive, lightweight objects, so create and discard them freely. Unless you
app requires real-time, latency-free haptic feedback in response to user interaction — like precise
ticks on a dial — you can create your player right before playing the haptic.
Start the haptic engine before you play a haptic player, and stop the engine once you’ve finished
playing all haptic patterns. Play the haptic by calling the player’s start(atTime:) method.
Create a haptic pattern player from the dictionary
Objective-C
Objective-C
Start the engine and play the haptic pattern
Objective-C
Swift
Swift
Swift


## Page 8

If the engine is in a running state when you call start(), the system plays the haptic at the
scheduled time. Playback follows a “fire and forget” model, so your app doesn’t need to keep the
player and pattern in memory once you’ve called start(). You need to retain your engine so it
doesn’t exit scope during your program.
Unless you’re playing several haptic patterns in succession, bookend haptic playback with startin
and stopping the engine. Starting the engine ensures that the haptic engine is in a running state
when you schedule a haptic to play. Stopping the engine after you finish playing the haptic
conserves power and allows it to prepare for the next time your app needs haptic playback. Be
aware that your engine may stop on its own in auto-shutdown mode.
Preparing your app to play haptics
Set up your app to play haptics.
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
See Also
Essentials


## Page 9

Playing a single-tap haptic pattern
Preparing your app to play haptics
If you want your app to play custom haptics, you need to create a haptic engine. The haptic engin
establishes the connection between your app and the underlying device hardware. Even though
you can define a haptic pattern without an engine, you need the engine to play that pattern.
Even though your app makes a request through the haptic engine, the operating system could sti
override the request with system services, like haptics from system notifications.
Mentioned in
Overview
Core Haptics / CHHapticEngine
Class
CHHapticEngine
An object that represents the connection to the haptic server.
iOS 13.0+
iPadOS 13.0+
Mac Catalyst 13.0+
macOS 10.15+
tvOS 14.0+
visionOS 1.0+


## Page 10

To prepare your app to play haptics, follow these steps, as demonstrated in the code below:
1. Create a haptic engine instance. Maintain a strong reference to it so it doesn’t go out of scope
while the haptic is playing.
2. Call the haptic engine’s start(completionHandler:) for an asynchronous start, or
start() to start the engine synchronously (immediately).
3. Stop the engine by calling stop(completionHandler:) when your app finishes haptic
playback.
Although it’s possible to create content—CHHapticPattern instances—independent of a
CHHapticEngine, your app must use an engine to play that content.
init() throws
Creates an instance of the haptic engine.
init(audioSession: AVAudioSession?) throws
Creates a haptic engine from an audio session.
Prepare Your App To Play Haptics
Objective-C
Topics
Initializing a Haptic Engine
Swift


## Page 11

func start() throws
Synchronously starts the haptic engine.
func start(completionHandler: (((any Error)?) -> Void)?)
Asynchronously starts the haptic engine.
func stop(completionHandler: (((any Error)?) -> Void)?)
Asynchronously stops the haptic engine and executes the completion handler once the engi
has stopped.
typealias CompletionHandler
A typealias for a completion handler that the engine calls after starting or stopping.
Factory methods for creating player objects for haptic playback.
func makePlayer(with: CHHapticPattern) throws -> any CHHapticPattern
Player
Creates a standard haptic pattern player from a haptic pattern.
func makeAdvancedPlayer(with: CHHapticPattern) throws -> any CHHaptic
AdvancedPatternPlayer
Creates an advanced haptic pattern player from a haptic pattern.
var playsAudioOnly: Bool
A Boolean value that indicates whether the engine ignores haptic events and plays audio
events only.
var playsHapticsOnly: Bool
A Boolean value that indicates whether the engine ignores audio events.
var isMutedForAudio: Bool
A Boolean value that indicates whether the engine mutes audio.
var isMutedForHaptics: Bool
A Boolean value that indicates whether the engine mutes haptics.
Starting and Stopping the Haptic Engine
Creating Haptic Pattern Players
Modifying Playback Properties


## Page 12

func playPattern(from: URL) throws
Plays a pattern that’s defined in a file at the specified URL.
func playPattern(from: Data) throws
Plays a pattern from the specified data.
func registerAudioResource(URL, options: [AnyHashable : Any]) throws ->
CHHapticAudioResourceID
Registers an external audio to use as a custom waveform.
func unregisterAudioResource(CHHapticAudioResourceID) throws
Unregisters an external audio file that you previously registered with the engine.
typealias CHHapticAudioResourceID
A type that identifies a custom audio resource.
func notifyWhenPlayersFinished(finishedHandler: CHHapticEngine.Finished
Handler)
Notifies you when all haptic pattern players have finished playing their haptic patterns.
typealias FinishedHandler
A type alias for a completion handler to execute after finishing haptic playback.
enum FinishedAction
Possible actions to take after the haptic engine finishes execution.
var resetHandler: CHHapticEngine.ResetHandler
A block that the haptic engine calls after recovering from a haptic server error.
typealias ResetHandler
A typealias for the block that the haptic engine calls after being reset.
Playing a Pattern
Registering Audio Resources
Monitoring Finished Playback
Handling Haptic Engine Resets


## Page 13

var stoppedHandler: CHHapticEngine.StoppedHandler
A closure the haptic engine calls when it stops due to external causes.
typealias StoppedHandler
A typealias for the block that the haptic engine calls after it stops due to an external cause.
enum StoppedReason
The enumeration of reasons the haptic engine stopped running.
var currentTime: TimeInterval
The absolute time, in seconds, to use for scheduling haptic and audio events.
var CHHapticTimeImmediate: TimeInterval
A time constant used to schedule a command immediately.
class func capabilitiesForHardware() -> any CHHapticDeviceCapability
Returns a device capability object that describes the device’s haptic support and limitations
protocol CHHapticDeviceCapability
A protocol that defines haptics and audio capabilities of a device.
protocol CHHapticParameterAttributes
A protocol for providing default, mininum, and maximum values of a parameter.
func attributes(forDynamicParameter: CHHapticDynamicParameter.ID) throw
-> any CHHapticParameterAttributes
Requests the haptic device’s attributes for a dynamic parameter.
Required
var isAutoShutdownEnabled: Bool
A Boolean value that indicates whether the haptic engine starts and stops automatically on
request from one of its pattern players, or when idle.
Handling Haptic Engine Stoppages
Getting the Current Media Time
Querying System Capabilities
Managing Power


## Page 14

var intendedSpatialExperience: any SpatialAudioExperience
The CHHapticEngine’s intended SpatialAudioExperience.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Preparing your app to play haptics
Set up your app to play haptics.
Playing a single-tap haptic pattern
Create and play a transient haptic pattern from a dictionary literal inline.
class CHHapticPattern
An object representing a haptic waveform.
protocol CHHapticPatternPlayer
Instance Properties
Relationships
Inherits From
Conforms To
See Also
Essentials


## Page 15

A protocol that defines a standard pattern player capable of playing haptic patterns with fixe
parameters.
protocol CHHapticAdvancedPatternPlayer
A protocol that defines an advanced pattern player capable of looping, seeking, pausing, and
resuming haptic playback.


## Page 16

Playing a single-tap haptic pattern
A haptic pattern represents the waveform of a haptic through a hierarchical set of key-value pairs
starting at the topmost level with a CHHapticPattern.Key. This key marks the beginning of an
array of events and parameterID definitions. Each event has an associated time that indicates
when the system delivers the event to the haptic engine.
Mentioned in
Overview
Core Haptics / CHHapticPattern
Class
CHHapticPattern
An object representing a haptic waveform.
iOS 13.0+
iPadOS 13.0+
Mac Catalyst 13.0+
macOS 10.15+
tvOS 14.0+
visionOS 1.0+


## Page 17

These key-value pairs represent not only events constituting the pattern, but also individual
parameters of each event, which are characteristics of the haptic, such as sharpness and intensit
More complicated patterns also contain key-value pairs for parameter curves, which you can use 
modulate parameters over time.
To add haptics to your app, you create an instance of CHHapticEngine, load a pattern, and use
the engine to create a player to play that pattern. You create a pattern in one of three ways:
Dictionaries. Each entry in the dictionary defines a single characteristic of the haptic, like its
intensity, start time, or duration. See Playing a single-tap haptic pattern to learn more about
creating a dictionary inline.
Arrays of events and parameters. The CHHapticEvent class represents a haptic event as an
object in code. The key-value pairs in a dictionary correspond to the properties and parameter
associated with a CHHapticEvent. Haptic event objects are just another representation of th
haptics dictionary.
Haptic Patterns


## Page 18

AHAP files. This JSON-compliant file format specifies a haptic pattern through key-value pairs
analogous to a dictionary literal, except in a text file. Add this file to your Xcode project bundle.
You can produce the same kind of content with all forms of pattern creation.
Regardless of the building block you choose to generate a custom haptic, you can control its
intensity and sharpness. Intensity varies the haptic’s amplitude or strength. Sharpness lets you
determine the character of the haptic experience. For example, you can use sharpness values to
convey an experience that’s crisp, precise, and mechanical, or one that’s soft, rounded, and
organic.
init(contentsOf: URL) throws
Creates a haptic pattern with the contents of an AHAP file.
init(events: [CHHapticEvent], parameterCurves: [CHHapticParameterCurve]
throws
Constructs a haptic pattern from a series of events and parameter curves.
init(events: [CHHapticEvent], parameters: [CHHapticDynamicParameter])
throws
Constructs a haptic pattern from a series of events and parameters.
init(dictionary: [CHHapticPattern.Key : Any]) throws
Creates a haptic pattern from a property list dictionary.
struct Key
Constants that define the keys you use to create a haptic pattern dictionary.
var duration: TimeInterval
The duration of the haptic pattern, in seconds.
Haptic Intensity and Sharpness
Topics
Creating a Haptic Pattern
Retrieving Haptic Pattern Duration
Exporting a Haptic Pattern


## Page 19

func exportDictionary() throws -> [CHHapticPattern.Key : Any]
Returns the dictionary representation of the haptic pattern.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Preparing your app to play haptics
Set up your app to play haptics.
Playing a single-tap haptic pattern
Create and play a transient haptic pattern from a dictionary literal inline.
class CHHapticEngine
An object that represents the connection to the haptic server.
protocol CHHapticPatternPlayer
A protocol that defines a standard pattern player capable of playing haptic patterns with fixe
parameters.
protocol CHHapticAdvancedPatternPlayer
Relationships
Inherits From
Conforms To
See Also
Essentials


## Page 20

A protocol that defines an advanced pattern player capable of looping, seeking, pausing, and
resuming haptic playback.


## Page 21

Playing a single-tap haptic pattern
Create instances of a pattern player through a CHHapticEngine object by calling a factory
method such as makePlayer(with:). When you ask a pattern player to play a haptic pattern,
the player submits those commands to the haptic engine on your behalf.
Use the advanced pattern player, CHHapticAdvancedPatternPlayer, when your haptic
pattern needs to change during playback, or when you’d like to sync your haptic with a custom
audio track. The advanced player allows your app to dynamically change haptic characteristics
such as intensity and sharpness through dynamic parameters and parameter curves, capabilities
not found in the standard player.
func start(atTime: TimeInterval) throws
Mentioned in
Overview
Topics
Starting and Stopping Playback
Core Haptics / CHHapticPatternPlayer
Protocol
CHHapticPatternPlayer
A protocol that defines a standard pattern player capable of playing haptic
patterns with fixed parameters.
iOS 13.0+
iPadOS 13.0+
Mac Catalyst 13.0+
macOS 10.15+
tvOS 14.0+
visionOS 1.0+


## Page 22

Starts playing the pattern at the specified time.
Required
func stop(atTime: TimeInterval) throws
Stops playing the pattern at the specified time.
Required
func cancel() throws
Stops the pattern player immediately and returns the specified error.
Required
func sendParameters([CHHapticDynamicParameter], atTime: TimeInterval)
throws
Sends an array of haptic parameters, starting at the specified time.
Required
func scheduleParameterCurve(CHHapticParameterCurve, atTime: TimeInterva
) throws
Schedules a parameter curve to begin transitioning a parameter at a certain time.
Required
var isMuted: Bool
A Boolean value that indicates whether to silences all haptic and audio output from the playe
Required
NSObjectProtocol
CHHapticAdvancedPatternPlayer
Sending Parameters to a Haptic
Silencing Haptic Playback
Relationships
Inherits From
Inherited By


## Page 23

Preparing your app to play haptics
Set up your app to play haptics.
Playing a single-tap haptic pattern
Create and play a transient haptic pattern from a dictionary literal inline.
class CHHapticEngine
An object that represents the connection to the haptic server.
class CHHapticPattern
An object representing a haptic waveform.
protocol CHHapticAdvancedPatternPlayer
A protocol that defines an advanced pattern player capable of looping, seeking, pausing, and
resuming haptic playback.
See Also
Essentials


## Page 24

Playing a single-tap haptic pattern
Create instances of this pattern player through a CHHapticEngine object by calling a factory
method such as makeAdvancedPlayer(with:). When you ask an advanced pattern player to
play, pause, or resume a haptic pattern, the player submits those commands to the haptic engine
on your behalf.
Unlike CHHapticPatternPlayer, the advanced pattern player supports looping of haptic and
audio patterns, by setting loopEnabled. The advanced pattern player can also call a block when
the player finishes, through its completionHandler property.
var loopEnabled: Bool
A Boolean that determines whether the haptic repeats itself on completion.
Mentioned in
Overview
Topics
Setting Playback Properties
Core Haptics / CHHapticAdvancedPatternPlayer
Protocol
CHHapticAdvancedPatternPlayer
A protocol that defines an advanced pattern player capable of looping, seeking,
pausing, and resuming haptic playback.
iOS 13.0+
iPadOS 13.0+
Mac Catalyst 13.0+
macOS 10.15+
tvOS 14.0+
visionOS 1.0+


## Page 25

Required
var loopEnd: TimeInterval
The time at which to end looping haptic playback.
Required
var playbackRate: Float
The playback rate of the haptic player.
Required
var completionHandler: CHHapticAdvancedPatternPlayerCompletionHandler
A completion block that runs after the haptic finishes playing.
Required
typealias CHHapticAdvancedPatternPlayerCompletionHandler
A typealias for the completion handler to run after a haptic finishes playback.
func pause(atTime: TimeInterval) throws
Pauses the haptic player during playback.
Required
func resume(atTime: TimeInterval) throws
Resumes playing a paused haptic.
Required
func seek(toOffset: TimeInterval) throws
Jumps to the specified offset time in playing the haptic.
Required
var isMuted: Bool
A Boolean value that indicates whether to silences all haptic and audio output from the playe
Required
Controlling Playback
Silencing Haptic Playback
Relationships


## Page 26

CHHapticPatternPlayer, NSObjectProtocol
Preparing your app to play haptics
Set up your app to play haptics.
Playing a single-tap haptic pattern
Create and play a transient haptic pattern from a dictionary literal inline.
class CHHapticEngine
An object that represents the connection to the haptic server.
class CHHapticPattern
An object representing a haptic waveform.
protocol CHHapticPatternPlayer
A protocol that defines a standard pattern player capable of playing haptic patterns with fixe
parameters.
Inherits From
See Also
Essentials


