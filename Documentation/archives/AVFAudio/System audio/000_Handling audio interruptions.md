# 000_Handling audio interruptions.pdf

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


