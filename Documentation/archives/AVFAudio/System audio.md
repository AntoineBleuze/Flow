# System audio.pdf

## Page 1

Interruptions are a common part of the iOS and watchOS user experiences. For example, conside
the scenario of receiving a phone call while you’re watching a movie in the TV app on your iPhone
In this case, the movie’s audio fades out, playback pauses, and the sound of the call’s ringtone
fades in. If you decline the call, control returns to the TV app, and playback begins again as the
movie’s audio fades in.
At the center of this behavior is your app’s audio session. As interruptions begin and end, the aud
session notifies any registered observers so they can take appropriate action. For example,
AVPlayer monitors your app’s audio session and automatically pauses playback in response to
interruption events. You can monitor these changes by key-value observing the player’s time
ControlStatus property, and update your user interface as necessary when the player pauses
and resumes playback.
Most apps rely on the system’s default interruption behavior. However, AVAudioSession provid
ways to customize the default behavior to better accommodate your app’s needs:
Recent iPad models provide a feature that mutes the built-in microphone at the hardware level
when the user closes the device’s Smart Folio cover. If your app plays and records audio, you
may want to continue playback even if the system mutes the microphone. You can disable the
default interruption behavior by setting the overrideMutedMicrophoneInterruption
option when configuring your audio session.
System alerts, such as receiving an incoming phone call, interrupt the active audio session. If
you prefer that the system not interrupt your app’s audio session in these cases, you can
Overview
Customize the interruption behavior
AVFAudio / Handling audio interruptions
Article
Handling audio interruptions
Observe audio session notifications to ensure that your app responds
appropriately to interruptions.


## Page 2

indicate this preference by setting a value for the setPrefersNoInterruptionsFrom
SystemAlerts(_:) method.
You can directly observe interruption notifications that AVAudioSession posts. This might be
useful if you want to know when the system pauses playback due to an interruption or another
reason, such as a route change. To respond to audio interruptions, observe notifications of type
interruptionNotification.
The posted Notification object contains a populated user-information dictionary that provide
the details of the interruption. You determine the type of interruption by retrieving the AVAudio
Session.InterruptionType value from the userInfo dictionary. The interruption type
indicates whether the interruption is beginning or ending.
Observe audio session interruptions
Handle audio session interruptions


## Page 3

If the interruption type is AVAudioSession.InterruptionType.ended, the userInfo
dictionary contains an AVAudioSession.InterruptionOptions value, which you use to
determine whether playback automatically resumes.
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
class AVAudioSession
An object that communicates to the system how you intend to use audio in your app.
See Also
System audio


## Page 4

class AVAudioApplication
An object that manages one or more audio sessions that belong to an app.
class AVAudioRoutingArbiter
An object for configuring macOS apps to participate in AirPods Automatic Switching.


## Page 5

An important responsibility of AVAudioSession is managing audio route changes. A route chan
occurs when the system adds or removes an audio input or output. Route changes occur for
several reasons, including a user plugging in a pair of headphones, connecting a Bluetooth LE
headset, or unplugging a USB audio interface. When these changes occur, the audio session
reroutes audio signals accordingly and broadcasts a notification containing the details of the
change to any registered observers.
An important behavior related to route changes occurs when a user plugs in or removes a pair of
headphones (see Playing audio in Human Interface Guidelines). When users connect a pair of wir
or wireless headphones, they’re implicitly indicating that audio playback should continue, but
privately. They expect an app that’s currently playing media to continue playing without pause.
However, when users disconnect their headphones, they don’t want to automatically share what
they’re listening to with others. Applications should respect this implicit privacy request and
automatically pause playback when users disconnect their headphones.
Note
AVPlayer monitors your app’s audio session and responds appropriately to route changes.
When users connect headphones, playback continues as expected. When they disconnect
their headphones, playback is automatically paused. To observe this player behavior, key-value
observe the player’s rate property so that you can update your user interface as the player
pauses playback.
Overview
Observe route changes
AVFAudio / Responding to audio route changes
Article
Responding to audio route changes
Observe audio session notifications to ensure that your app responds
appropriately to route changes.


## Page 6

You can directly observe route change notifications posted by the audio session. This might be
useful if you want the system to notify you when a user connects headphones so you can present
an icon or message in the player interface.
To respond to audio route changes, observe notifications of type routeChangeNotification
The posted Notification object contains a populated user-information dictionary providing th
details of the route change. Determine the reason for this change by retrieving the AVAudio
Session.RouteChangeReason value from the dictionary. When a user connects a new device
the reason is AVAudioSession.RouteChangeReason.newDeviceAvailable, and when a
user removes a device, the reason is AVAudioSession.RouteChangeReason.oldDevice
Unavailable.
When a new device becomes available, you ask the audio session for its currentRoute to
determine where the audio output is currently routed. This query returns an AVAudioSession
RouteDescription object that lists all of the audio session’s inputs and outputs. When the use
removes a device, you retrieve the route description for the previous route from the user-
information dictionary. In both cases, you query the route description for its outputs, which return
an array of port description objects providing the details of the audio output routes.
Respond to route changes


## Page 7

Handling audio interruptions
Observe audio session notifications to ensure that your app responds appropriately to
interruptions.
Routing audio to specific devices in multidevice sessions
Map audio channels to specific devices in multiroute sessions for recording and playback.
Adding synthesized speech to calls
Provide a more accessible experience by adding your app’s audio to a call.
Capturing stereo audio from built-In microphones
Configure an iOS device’s built-in microphones to add stereo recording capabilities to your
app.
class AVAudioSession
An object that communicates to the system how you intend to use audio in your app.
See Also
System audio


## Page 8

class AVAudioApplication
An object that manages one or more audio sessions that belong to an app.
class AVAudioRoutingArbiter
An object for configuring macOS apps to participate in AirPods Automatic Switching.


## Page 9

When working with multiple audio devices simultaneously, such as recording from multiple
microphones or routing playback to different speakers, you need precise control over which audio
reaches which device.
Core Audio provides channel mapping to bind specific audio channels to targeted devices. Use th
input and output nodes from AVAudioEngine for position-based routing with global channel
indices, Audio Queue Services for device-based routing using device identifiers, or AVAudio
Player and AVAudioRecorder for high-level routing with audio session channel descriptions.
Use Audio Unit channel maps to route playback audio to specific devices by mapping to global
channel positions. A channel map is an array where the index represents the destination channel
and the value specifies which source channel to route to that destination. Use -1 to specify silenc
for unused channels.
In multidevice configurations, Core Audio flattens all device channels into a sequential global
channel space. When multiple audio devices are active, Core Audio assigns channels sequentially
based on port order. For example, with AirPods (2 channels) and built-in speaker (2 channels)
connected:
Overview
Route audio outputs using audio engine’s output
node
AVFAudio / Routing audio to specific devices in multidevice sessions
Article
Routing audio to specific devices in
multidevice sessions
Map audio channels to specific devices in multiroute sessions for recording and
playback.


## Page 10

To route a stereo audio file to the built-in speaker at channels 2 and 3, create a channel map sized
to match the total output channels:
Because port order can vary and channel counts differ between devices, first discover the actual
port-to-channel mapping via currentRoute. Calculate channel indices dynamically based on th
current audio route configuration:
This iterates through output ports, calculating their position in the global flattened channel array.
Use these calculated indices to target specific devices in your channel mapping.
After discovering channel positions, configure the Audio Unit with a channel map. This example
routes a stereo audio file to the built-in speaker, assuming it occupies channels 2 and 3 in the
global channel space:


## Page 11



## Page 12

Note
The channel map array size must match the total number of output channels available. Each
element specifies the source stream channel for that output position, or -1 for silence.
When recording from multiple input devices, channel map semantics differ from playback. The
channel map array size must match your desired recording channel count (not the total hardware
channel count), and each array element specifies which hardware channel to pull from.
In multidevice input configurations, similar to output, hardware channels are available sequentially
For example, with a device’s stereo built-in microphone (2 channels: front and back) and AirPods
microphone (1 channel):
To record a two-channel file capturing audio from the device’s built-in front mic (channel 0) and
AirPods (channel 2), set the input client format to 2 channels, then create a channel map sized to
match the desired recording channel count:
Discover the available input channels:
Route audio inputs using audio engine’s input node


## Page 13

Configure the input channel map to select specific hardware channels for recording. This example
records a two-channel file from hardware channels 0 and 2:


## Page 14

Note
When using AVAudioEngine, set the client format by passing your desired format to install
TapOnBus. The format’s channel count should match your channel map size, and the sample
rate should match the hardware input format to avoid runtime errors.
Use Audio Queue Services channel assignments to route audio to specific device channels by
device UID rather than global channel position. This approach provides direct device targeting
without needing to calculate global channel indices.
Set the kAudioQueueProperty_ChannelAssignments property with an AudioQueue
ChannelAssignment structure specifying the target device UID and channel number:
Route audio with audio queue channel assignments


## Page 15

AVAudioPlayer and AVAudioRecorder provide a high-level approach using the audio player’
channelAssignments, or the audio recorder’s channelAssignments property with AVAudi
SessionChannelDescription objects directly from the audio session.
Note
For AVAudioPlayer, the channelAssignments array count should match the audio
format’s channel count.
For output AVAudioPlayer:
For input with AVAudioRecorder:
Route high-level audio an audio player or recorder


## Page 16

Handling audio interruptions
Observe audio session notifications to ensure that your app responds appropriately to
interruptions.
Responding to audio route changes
Observe audio session notifications to ensure that your app responds appropriately to route
changes.
Adding synthesized speech to calls
Provide a more accessible experience by adding your app’s audio to a call.
Capturing stereo audio from built-In microphones
Configure an iOS device’s built-in microphones to add stereo recording capabilities to your
app.
class AVAudioSession
An object that communicates to the system how you intend to use audio in your app.
class AVAudioApplication
An object that manages one or more audio sessions that belong to an app.
class AVAudioRoutingArbiter
An object for configuring macOS apps to participate in AirPods Automatic Switching.
See Also
System audio


## Page 17

This sample shows how to create an accessibility app that supports augmentative and alternative
communication (AAC) by adding synthesized speech to a call. This feature is available in iOS 18.2
and visionOS 2.2 and later, and is available to use with calling apps that capture microphone input
using Apple’s voice processing like Phone, FaceTime, and most VoIP apps.
The sample app provides a basic user interface with a button to toggle the feature state and a tex
field. When you enter text into the field and press enter, the app speaks the phrase. If you have an
active call in progress and you enable adding the app’s audio to it, you’ll hear the synthesized
speech on the originating and receiving ends of the call.
The sample requires running on an iOS device with iOS 18.2 or later. To test the sample, establish
phone or FaceTime call with another device.
Before an app can add its audio to calls, a person must turn on a system-level service in the
Settings app by choosing Accessibility > Audio & Visual > Add Audio in Calls. This setting is globa
to the device and influences the availability of the service for all apps.
Overview
Configure the sample code project
Enable the accessibility service
AVFAudio / Adding synthesized speech to calls
Sample Code
Adding synthesized speech to calls
Provide a more accessible experience by adding your app’s audio to a call.
Download
iOS 18.2+
iPadOS 18.2+
Mac Catalyst 18.2+
Xcode 16.1+


## Page 18

The sample determines the state of this setting by querying the shared AVAudioApplication
object for its microphone injection permission:
A permission value of AVAudioApplication.MicrophoneInjectionPermission.servic
Disabled indicates the person hasn’t turned on the service, which means apps can’t add audio 
calls. When the app retrieves this value, it presents an alert dialog that indicates the current state
and provides the person an opportunity to update their setting. When you press the dialog’s Open
Settings button, the app uses the Accessibility framework to directly open the Add Audio in Calls
screen in the Settings app like shown below.


## Page 19

Turning on Add Audio in Calls makes the feature available to apps on the system, but apps must
explicitly request and be granted permission to use the feature. The sample determines its
permission by querying for the current microphone injection permission. A value of AVAudio
Application.MicrophoneInjectionPermission.undetermined indicates the app hasn
yet requested permission and needs to before it can use the feature.
For an app to request a person’s permission, it needs to provide an NSMicrophoneInjection
UsageDescription key in its Info.plist file with a description of why the app requests
microphone access. The system displays this string when an app requests user permission. The
sample app defines this entry as follows.
Attempting to request permission without this usage string present results in the system quitting
the app.
The app requests permission by calling the requestRecordPermission(completion
Handler:) method and awaiting a response:
Calling this method causes the system to present a dialog that requests user permission. If a
person grants the app permission, the call returns a value of AVAudioApplication
.MicrophoneInjectionPermission.granted and the app updates its state accordingly.
If a person denies the app permission, the system sets the microphone injection permission state
to AVAudioApplication.MicrophoneInjectionPermission.denied, and the app is
unable to use the feature. The app remains in this state until a person explicitly changes the
permission from the Add Audio in Calls screen in the Settings app. If you attempt to turn on the
feature in the app while in this state, the app presents an alert similar to the one shown in the
previous section to update the app’s permission.
When the app has permission to add audio and a person toggles the feature state in the user
interface, the app responds by calling the shared AVAudioSession object’s setPreferred
MicrophoneInjectionMode(_:) method. To turn on the feature, the app passes the method 
Request permission
Enable adding audio to calls


## Page 20

value of AVAudioSession.MicrophoneInjectionMode.spokenAudio; to turn off the
feature, it passes a value of AVAudioSession.MicrophoneInjectionMode.none.
When turned on during an active call, the system plays the app’s audio locally and adds it to the
microphone’s input stream.
Note
The AVAudioSession/setPreferredMicrophoneInjectionMode(_:) method uses
the word preferred to indicate that an app can set its preference, but a person ultimately
determines whether they allow the feature’s use.
To determine whether a call can use this feature, the sample awaits notification of changes to the
state of the audio session’s microphone injection capabilities:
When a call begins or ends, the system posts a notification of the change. The app queries the
notification’s user information dictionary for its AVAudioSessionMicrophoneInjectionIs
AvailableKey value to determine whether there’s an active call. When the value is true, the ap
updates its UI to show a pulsing phone icon in the toolbar to indicate the call is active.
Handling audio interruptions
Monitor the availability of calls
See Also
System audio


## Page 21

Observe audio session notifications to ensure that your app responds appropriately to
interruptions.
Responding to audio route changes
Observe audio session notifications to ensure that your app responds appropriately to route
changes.
Routing audio to specific devices in multidevice sessions
Map audio channels to specific devices in multiroute sessions for recording and playback.
Capturing stereo audio from built-In microphones
Configure an iOS device’s built-in microphones to add stereo recording capabilities to your
app.
class AVAudioSession
An object that communicates to the system how you intend to use audio in your app.
class AVAudioApplication
An object that manages one or more audio sessions that belong to an app.
class AVAudioRoutingArbiter
An object for configuring macOS apps to participate in AirPods Automatic Switching.


## Page 22

Stereo audio uses two channels to create the illusion of multidirectional sound, adding greater
depth and dimension to your audio and resulting in an immersive listening experience. iOS provide
a number of ways to record audio from the built-in microphones, but until now it’s been limited to
mono audio only. Starting in iOS 14 and iPadOS 14, you can now capture stereo audio using the
built-in microphones on supported devices.
Because a user can hold an iOS device in a variety of ways, you need to specify the orientation of
the right and left channels in the stereo field. Set the built-in microphone’s directionality by
configuring:
Polar pattern. The system represents the individual device microphones, and beamformers tha
use multiple microphones, as data sources. Select the front or back data source and set its pol
pattern to stereo.
Input orientation. When recording video, set the input orientation to match the video orientatio
When recording audio only, set the input orientation to match the user interface orientation. In
both cases, don’t change the orientation during recording.
This sample app shows how to configure your app to record stereo audio, and helps you visualize
changes to the input orientation and data-source selection.
Overview
AVFAudio / Capturing stereo audio from built-In microphones
Sample Code
Capturing stereo audio from built-In
microphones
Configure an iOS device’s built-in microphones to add stereo recording capabilitie
to your app.
Download
iOS 17.0+
iPadOS 17.0+
Mac Catalyst 17.0+
Xcode 15.4+


## Page 23

Note
You must run the sample on a supported physical device running iOS 14, or later. To determine
whether a device supports stereo recording, query the audio session’s selected data source to
see if its supportedPolarPatterns array contains the stereo polar pattern.
Recording stereo audio requires the app’s audio session to use either the record or playAndRecor
category. The sample uses the playAndRecord category so it can do both. It also passes the
defaultToSpeaker and allowBluetooth options to route the audio to the speaker instead o
the receiver, and to Bluetooth headphones.
An iOS device’s built-in microphone input consists of an array of physical microphones and
beamformers, each represented as an instance of AVAudioSessionDataSourceDescriptio
The sample app finds the built-in microphone input by querying the available inputs for the one
where the port type equals the built-in microphone, and sets it as the preferred input.
Configure the Audio Session Category
Select and Configure a Built-In Microphone


## Page 24

To configure the microphone input’s directionality, the sample sets its data source’s preferred pol
pattern and the session’s input orientation. It performs this configuration in its selectRecordin
Option(_:orientation) method, which it calls whenever the user rotates the device or
changes the recording option selection.
Configure the Microphone Input’s Directionality


## Page 25

This method finds the data source with the selected name, sets its preferred polar pattern to
stereo, and then sets it as the input’s preferred data source. Finally, it sets the preferred input
orientation to match the device’s user interface orientation.
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
class AVAudioSession
An object that communicates to the system how you intend to use audio in your app.
class AVAudioApplication
An object that manages one or more audio sessions that belong to an app.
class AVAudioRoutingArbiter
An object for configuring macOS apps to participate in AirPods Automatic Switching.
See Also
System audio


## Page 26



## Page 27

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


## Page 28

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


## Page 29

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


## Page 30

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


## Page 31

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


## Page 32

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


## Page 33

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


## Page 34

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


## Page 35

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


## Page 36

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


## Page 37

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


## Page 38

Access the shared audio application instance to control app-level audio operations, such as
requesting microphone permission and controlling audio input muting.
class var shared: AVAudioApplication
Accesses the shared audio application instance.
class func requestRecordPermission(completionHandler: (Bool) -> Void)
Determines whether the app has permission to record audio.
var recordPermission: AVAudioApplication.recordPermission
The app’s permission to record audio.
enum recordPermission
Overview
Topics
Accessing the shared instance
Requesting audio recording permission
AVFAudio / AVAudioApplication
Class
AVAudioApplication
An object that manages one or more audio sessions that belong to an app.
iOS 17.0+
iPadOS 17.0+
Mac Catalyst 17.0+
macOS 14.0+
tvOS 17.0+
visionOS 1.0+
watchOS 10.0+


## Page 39

Constants that indicate the app’s permission to record audio.
class func requestMicrophoneInjectionPermission(completionHandler: (
AVAudioApplication.MicrophoneInjectionPermission) -> Void)
Requests the app’s permission to add audio to calls.
var microphoneInjectionPermission: AVAudioApplication.Microphone
InjectionPermission
A value that indicates an app’s permission to add audio to calls.
enum MicrophoneInjectionPermission
Constants that indicate an app’s permission to add audio to calls.
var isInputMuted: Bool
A Boolean value that indicates whether the app’s audio input is in a muted state.
func setInputMuted(Bool) throws
Sets a Boolean value that indicates whether the app’s audio input is in a muted state.
class let inputMuteStateChangeNotification: NSNotification.Name
A notification the system posts when the app’s audio input mute state changes.
func setInputMuteStateChangeHandler(((Bool) -> Bool)?) throws
Sets a callback to handle changes to application-level audio muting states.
NSObject
CVarArg
CustomDebugStringConvertible
Requesting microphone injection permission
Managing audio input mute state
Relationships
Inherits From
Conforms To


## Page 40

CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Sendable
SendableMetatype
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
class AVAudioSession
An object that communicates to the system how you intend to use audio in your app.
class AVAudioRoutingArbiter
An object for configuring macOS apps to participate in AirPods Automatic Switching.
See Also
System audio


## Page 41

AirPods Automatic Switching is a feature of Apple operating systems that intelligently connects
wireless headphones to the most appropriate audio device in a multidevice environment. For
example, if a user plays a movie on iPad, and then locks the device and starts playing music on
iPhone, the system automatically switches the source audio device from iPad to iPhone.
iOS apps automatically participate in AirPods Automatic Switching. To enable your macOS app to
participate in this behavior, use AVAudioRoutingArbiter to indicate when your app starts and
finishes playing or recording audio. For example, a Voice over IP (VoIP) app might request
arbitration before starting a call, and when the arbitration completes, begin the VoIP session.
Likewise, when the call ends, the app would end the VoIP session and leave arbitration.
Overview
AVFAudio / AVAudioRoutingArbiter
Class
AVAudioRoutingArbiter
An object for configuring macOS apps to participate in AirPods Automatic
Switching.
macOS 11.0+


## Page 42

Important
Only certain Apple and Beats wireless headsets support this feature.
class var shared: AVAudioRoutingArbiter
The shared routing arbiter object.
func begin(category: AVAudioRoutingArbiter.Category, completionHandler:
(Bool, (any Error)?) -> Void)
Begins routing arbitration to take ownership of a nearby Bluetooth audio route.
enum Category
Categories that describe the general nature of your app’s audio use.
func leave()
Stops an app’s participation in audio routing arbitration.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Topics
Creating a Routing Arbiter
Participating in AirPods Automatic Switching
Relationships
Inherits From
Conforms To


## Page 43

Sendable
SendableMetatype
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
class AVAudioSession
An object that communicates to the system how you intend to use audio in your app.
class AVAudioApplication
An object that manages one or more audio sessions that belong to an app.
See Also
System audio


