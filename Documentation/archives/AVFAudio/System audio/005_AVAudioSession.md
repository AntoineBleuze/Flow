# 005_AVAudioSession.pdf

## Page 1

Handling audio interruptions
Responding to audio route changes
An audio session acts as an intermediary between your app and the operating system — and, in
turn, the underlying audio hardware. You use an audio session to communicate to the operating
system the general nature of your app’s audio without detailing the specific behavior or required
interactions with the audio hardware. You delegate the management of those details to the audio
session, which ensures that the operating system can best manage the user’s audio experience.
All iOS, tvOS, and watchOS apps have a default audio session that comes preconfigured with the
following behavior:
It supports audio playback, but disallows audio recording.
When the app plays audio, it silences any other background audio.
In iOS, setting the Ring/Silent switch to silent mode silences any audio the app is playing.
In iOS, locking a device silences the app’s audio.
Although the default audio session provides useful behavior, it generally doesn’t provide the audio
behavior a media app needs. To change the default behavior, you configure your app’s audio
Mentioned in
Overview
AVFAudio / AVAudioSession
Class
AVAudioSession
An object that communicates to the system how you intend to use audio in your
app.
iOS 3.0+
iPadOS 3.0+
Mac Catalyst 13.1+
tvOS 9.0+
visionOS 1.0+
watchOS 2.0+


## Page 2

session category.
There are six possible categories you can use, but playback is the one that playback apps most
commonly use. This category indicates that audio playback is a central feature of your app. When
you specify this category, your app’s audio continues with the Ring/Silent switch set to silent mod
(iOS only). Using this category, you can also play background audio if you’re using the Audio,
AirPlay, and Picture in Picture background mode. For more information, see Enabling
Background Audio.
You use an AVAudioSession object to configure your app’s audio session. This class is a
singleton object used to set the audio session’s category, mode, and other configurations. You ca
interact with the audio session throughout your app’s life cycle, but it’s often useful to perform th
configuration at app launch, as shown in the following example.
The audio session uses this configuration when you activate the session using the setActive:
error: or setActive(_:options:) method.
Note
You can activate the audio session at any time after setting its category, but it’s generally
preferable to defer this call until your app begins audio playback. Deferring the call ensures
that you won’t prematurely interrupt any other background audio that may be in progress.
class func sharedInstance() -> AVAudioSession
Returns the shared audio session instance.
Topics
Accessing the shared audio session


## Page 3

func setCategory(AVAudioSession.Category, mode: AVAudioSession.Mode,
policy: AVAudioSession.RouteSharingPolicy, options: AVAudioSession.
CategoryOptions) throws
Sets the session category, mode, route-sharing policy, and options.
func setCategory(AVAudioSession.Category, mode: AVAudioSession.Mode,
options: AVAudioSession.CategoryOptions) throws
Sets the audio session’s category, mode, and options.
func setCategory(AVAudioSession.Category, options: AVAudioSession.
CategoryOptions) throws
Sets the audio session’s category with the specified options.
func setCategory(AVAudioSession.Category) throws
Sets the audio session’s category.
func setMode(AVAudioSession.Mode) throws
Sets the audio session’s mode.
var intendedSpatialExperience: any AVAudioSessionSpatialExperience
The spatial audio experience your app intends to provide the user.
func setIntendedSpatialExperience(any AVAudioSessionSpatialExperience)
throws
Sets the spatial audio experience your app intends to provide the user.
protocol AVAudioSessionSpatialExperience
var isNowPlayingCandidate: Bool
A Boolean value that indicates whether the audio session is a candidate to be the Now Playin
session.
func setIsNowPlayingCandidate(Bool) throws
Sets a Boolean value that indicates whether the audio session is a candidate to be the Now
Playing session.
Configuring standard audio behaviors
Configuring the spatial experience in visionOS
Activating the audio configuration


## Page 4

func setActive(Bool, options: AVAudioSession.SetActiveOptions) throws
Activates or deactivates your app’s audio session using the specified options.
func activate(options: AVAudioSessionActivationOptions, completion
Handler: (Bool, (any Error)?) -> Void)
Activates an audio session asynchronously on watchOS.
struct AVAudioSessionActivationOptions
Constants that describe the options to pass when activating the audio session.
var category: AVAudioSession.Category
The current audio session category.
var availableCategories: [AVAudioSession.Category]
The audio session categories available on the current device.
struct Category
Audio session category identifiers.
var categoryOptions: AVAudioSession.CategoryOptions
The set of options associated with the current audio session category.
struct CategoryOptions
Constants that specify optional audio behaviors.
var mode: AVAudioSession.Mode
The current audio session’s mode.
var availableModes: [AVAudioSession.Mode]
The audio session modes available on the device.
struct Mode
Audio session mode identifiers.
var renderingMode: AVAudioSession.RenderingMode
Inspecting the category configuration
Inspecting mode configuration
Inspecting rendering mode and capabilities


## Page 5

The current audio session’s rendering mode.
enum RenderingMode
Audio session rendering mode identifiers.
class let renderingModeChangeNotification: NSNotification.Name
A notification the system posts when the rendering mode changes.
var supportedOutputChannelLayouts: [AVAudioChannelLayout]
The array of channel layouts that the current route supports.
class let renderingCapabilitiesChangeNotification: NSNotification.Name
A notification the system posts when the rendering capabilities change.
var routeSharingPolicy: AVAudioSession.RouteSharingPolicy
The active route-sharing policy.
enum RouteSharingPolicy
Cases that indicate the possible route-sharing policies for an audio session.
var isOtherAudioPlaying: Bool
A Boolean value that indicates whether another app is playing audio.
var secondaryAudioShouldBeSilencedHint: Bool
A Boolean value that indicates whether another app, with a nonmixable audio session, is
playing audio.
class let silenceSecondaryAudioHintNotification: NSNotification.Name
A notification the system posts when the primary audio from other apps starts and stops.
var allowHapticsAndSystemSoundsDuringRecording: Bool
A Boolean value that indicates whether system sounds and haptics play while recording from
audio input.
func setAllowHapticsAndSystemSoundsDuringRecording(Bool) throws
Sets a Boolean value that indicates whether system sounds and haptics play while recording
from audio input.
Inspecting the route sharing policy
Mixing with other audio


## Page 6

Audio routing
Inspect and configure audio routes, ports, and data sources.
func prepareRouteSelectionForPlayback(completionHandler: (Bool, AVAudio
Session.RouteSelection) -> Void)
Prepares the route selection for long-form video playback.
enum RouteSelection
Constants used to define the active route selection.
var prefersNoInterruptionsFromSystemAlerts: Bool
A Boolean value that indicates a preference for not interrupting the session with system alert
func setPrefersNoInterruptionsFromSystemAlerts(Bool) throws
Sets the preference for not interrupting the audio session with system alerts.
var prefersInterruptionOnRouteDisconnect: Bool
A Boolean value that indicates whether the system interrupts the audio session when the
active route disconnects.
func setPrefersInterruptionOnRouteDisconnect(Bool) throws
Sets a preference to interrupt the audio session when the active route disconnects.
class let interruptionNotification: NSNotification.Name
A notification the system posts when an audio interruption occurs.
class let spatialPlaybackCapabilitiesChangedNotification: NSNotificatio
.Name
A notification the system posts when its spatial playback capabilities change.
Managing audio routing
Preparing for long-form video playback
Handling interruptions
Monitoring spatial capabilities
Inspecting the audio prompt style


## Page 7

var promptStyle: AVAudioSession.PromptStyle
A hint to audio sessions that use voice prompt mode to alter the type of prompts they issue 
response to other system audio, such as Siri and phone calls.
enum PromptStyle
Constants that indicate the prompt style to use.
var inputOrientation: AVAudioSession.StereoOrientation
An orientation value that dictates which directions represent left and right when capturing
audio from a built-in microphone configured for stereo recording.
var preferredInputOrientation: AVAudioSession.StereoOrientation
The audio session’s preferred stereo input orientation.
func setPreferredInputOrientation(AVAudioSession.StereoOrientation)
throws
Sets the audio session’s preferred stereo input orientation.
enum StereoOrientation
Constants that define the supported stereo orientations.
var isMicrophoneInjectionAvailable: Bool
A Boolean value that indicates whether microphone injection is available.
var preferredMicrophoneInjectionMode: AVAudioSession.MicrophoneInjectio
Mode
The preferred mode of injecting audio into another app’s input stream.
func setPreferredMicrophoneInjectionMode(AVAudioSession.Microphone
InjectionMode) throws
Sets the preferred mode of injecting audio into another app’s input stream.
enum MicrophoneInjectionMode
The modes of injecting audio into another app’s input stream.
class let microphoneInjectionCapabilitiesChangeNotification:
NSNotification.Name
Enabling stereo recording
Enabling adding audio to calls


## Page 8

A notification the system posts when its capability to inject audio into an input stream
changes.
var isEchoCancelledInputAvailable: Bool
A Boolean value that indicates whether the built-in microphone and speaker route supports
echo cancellation.
var isEchoCancelledInputEnabled: Bool
A Boolean value that indicates whether an echo-canceled input is in an enabled state.
func setPrefersEchoCancelledInput(Bool) throws
Sets a preference to enable echo-canceled input on supported hardware.
var prefersEchoCancelledInput: Bool
A Boolean value that indicates the audio session’s preference for using an echo-canceled
input.
var isOutputMuted: Bool
A Boolean value that indicates whether audio output is in a muted state.
func setOutputMuted(Bool) throws
Sets a Boolean value to inform the system to mute the session’s output audio. The default
value is false (unmuted).
class let outputMuteStateChangeNotification: NSNotification.Name
Notification sent to registered listeners when session’s output mute state changes.
class let muteStateKey: String
Keys for outputMuteStateChangeNotification Value is NSNumber type with boolean
value 0 for unmuted or value 1 for muted (samples zeroed out)
class let userIntentToUnmuteOutputNotification: NSNotification.Name
Notification sent to registered listeners when the application’s output is muted and user hint
to unmute.
class let userIntentToUnmuteOutputNotification: NSNotification.Name
Notification sent to registered listeners when the application’s output is muted and user hint
to unmute.
Configuring echo cancellation
Configuring audio muting


## Page 9

class let muteStateKey: String
Keys for outputMuteStateChangeNotification Value is NSNumber type with boolean
value 0 for unmuted or value 1 for muted (samples zeroed out)
Audio hardware
Inspect and configure audio device settings including input gain, sample rate, and channel
counts.
func setAggregatedIOPreference(AVAudioSession.IOType) throws
Sets the audio session’s aggregated I/O configuration preference.
enum IOType
Constant values used to specify the audio session’s aggregated I/O behavior.
class let mediaServicesWereResetNotification: NSNotification.Name
A notification the system posts when the media server restarts.
class let mediaServicesWereLostNotification: NSNotification.Name
A notification the system posts when it terminates the media server.
enum ErrorCode
Codes that describe error conditions that may occur when performing audio session
operations.
Deprecated Symbols
Review unsupported symbols and their replacements.
Configuring device settings
Setting the aggregated I/O preference
Handling a change of media services
Errors
Deprecated
Structures


## Page 10

struct BypassedSpatialExperience
An experience that bypasses system-provided audio spatialization.
struct FixedSpatialExperience
An experience where the sound has a size dictated by its sound stage and is head-locked
relative to the user.
struct HeadTrackedSpatialExperience
An experience where the sound a size dictated by its sound stage and location dictated by it
anchoring strategy.
enum AnchoringStrategy
Constants that specify how to set the origin of audio in a head-tracked spatial experience.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Sendable
SendableMetatype
Enumerations
Relationships
Inherits From
Conforms To
See Also
System audio


## Page 11

Handling audio interruptions
Observe audio session notifications to ensure that your app responds appropriately to
interruptions.
Responding to audio route changes
Observe audio session notifications to ensure that your app responds appropriately to route
changes.
Routing audio to specific devices in multidevice sessions
Map audio channels to specific devices in multiroute sessions for recording and playback.
Adding synthesized speech to calls
Provide a more accessible experience by adding your app’s audio to a call.
Capturing stereo audio from built-In microphones
Configure an iOS device’s built-in microphones to add stereo recording capabilities to your
app.
class AVAudioApplication
An object that manages one or more audio sessions that belong to an app.
class AVAudioRoutingArbiter
An object for configuring macOS apps to participate in AirPods Automatic Switching.


