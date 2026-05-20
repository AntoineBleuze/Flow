# 002_Capturing system audio with Core Audio taps.pdf

## Page 1

This sample code project shows you how to use a tap as an input in a HAL aggregate device, just
like a microphone. An audio tap object can specify which outputs it captures from a process or
group of processes, as well as different mixdown options (mono, stereo, and so on). Taps can be
public (visible to all users), or private (only visible inside the process that created the tap). Taps c
also mute the process output so that the process will no longer play to the speaker or selected
audio device, and all process output will go to the tap.
You create a tap by passing a CATapDescription to AudioHardwareCreateProcessTap(_
_:). This returns an AudioObjectID for the new tap object. You can destroy a tap using Audio
HardwareDestroyProcessTap(_:):
Overview
Create a tap and an aggregate device
Core Audio / Capturing system audio with Core Audio taps
Sample Code
Capturing system audio with Core Audio
taps
Use a Core Audio tap to capture outgoing audio from a process or group of
processes.
Download
macOS 26.0+
Xcode 26.0+


## Page 2

You similarly create an aggregate device by passing a CFDictionary to AudioHardware
CreateAggregateDevice(_:_:), and destroy it using AudioHardwareDestroyAggregat
Device(_:).
To use a tap as an input source, add it to an aggregate device that you configure for playback. Fir
get the tap’s unique identifier by passing the kAudioTapPropertyUID selector and the tap’s
audio object ID to AudioObjectGetPropertyData(_:_:_:_:_:_:):
Then use the kAudioAggregateDevicePropertyTapList selector to get and set the list of
taps in an aggregate device. To add a tap, pass the tap’s audio object ID and a CFArray of
CFString objects containing the tap’s unique identifier to AudioObjectSetPropertyData(_
_:_:_:_:_:):
Add a tap to an aggregate device


## Page 3

Before you run the sample code project in Xcode, ensure that you’re using macOS 14.2 or later.
Important
To capture audio with a tap, you need to include the NSAudioCaptureUsageDescription
key in your Info.plist file, along with a message that tells the user why the app is requesting
access to capture audio.
The first time you start recording from an aggregate device that contains a tap, the system promp
you to grant the app system audio recording permission.
Creating an Audio Server Driver Plug-in
Build a virtual audio device by creating a custom driver plug-in.
Building an Audio Server Plug-in and Driver Extension
Configure the sample code project
See Also
Drivers


## Page 4

Create a plug-in and driver extension to support an audio device in macOS.


