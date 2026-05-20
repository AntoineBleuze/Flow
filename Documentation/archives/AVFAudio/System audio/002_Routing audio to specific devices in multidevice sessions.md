# 002_Routing audio to specific devices in multidevice sessions.pdf

## Page 1

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


## Page 2

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


## Page 3



## Page 4

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


## Page 5

Configure the input channel map to select specific hardware channels for recording. This example
records a two-channel file from hardware channels 0 and 2:


## Page 6

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


## Page 7

AVAudioPlayer and AVAudioRecorder provide a high-level approach using the audio player’
channelAssignments, or the audio recorder’s channelAssignments property with AVAudi
SessionChannelDescription objects directly from the audio session.
Note
For AVAudioPlayer, the channelAssignments array count should match the audio
format’s channel count.
For output AVAudioPlayer:
For input with AVAudioRecorder:
Route high-level audio an audio player or recorder


## Page 8

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


