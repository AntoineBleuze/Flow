# 001_Responding to audio route changes.pdf

## Page 1

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


## Page 2

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


## Page 3

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


## Page 4

class AVAudioApplication
An object that manages one or more audio sessions that belong to an app.
class AVAudioRoutingArbiter
An object for configuring macOS apps to participate in AirPods Automatic Switching.


