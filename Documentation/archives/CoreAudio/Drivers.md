# Drivers.pdf

## Page 1

This sample shows how to create a minimal Audio Server plug-in. Written in standard C, the samp
provides the minimal implementation you need to publish a single, functioning audio device to the
system. The audio device provides the following features:
Configurable device primary volume, muting, and data sources
44.1 kHz and 48 kHz sample rates
Two channels of audio I/O in 32-bit, floating point, linear PCM format
Install the sample’s .driver bundle to /Library/Audio/Plug-Ins/HAL and reboot your
computer. Use Audio MIDI Setup to inspect the newly installed device.
Building an Audio Server Plug-in and Driver Extension
Create a plug-in and driver extension to support an audio device in macOS.
Capturing system audio with Core Audio taps
Overview
See Also
Drivers
Core Audio / Creating an Audio Server Driver Plug-in
Sample Code
Creating an Audio Server Driver Plug-in
Build a virtual audio device by creating a custom driver plug-in.
Download
macOS 12.0+
Xcode 13.0+


## Page 2

Use a Core Audio tap to capture outgoing audio from a process or group of processes.


## Page 3

This sample shows how to create an Audio Server plug-in built on top of a DriverKit Driver
Extension. The sample provides C++ implementations of the plug-in and the Driver Extension, and
shows how to implement the communication between the two, including discovering, connecting
to, and calling into the Driver Extension from the plug-in.
The sample implements a dynamic environment that supports multiple audio devices. The plug-in
audio devices provide the following features:
Configurable device master volume.
Support for 44.1 kHz and 48 kHz sample rates
Support for two channels of audio I/O in 32-bit, floating point, linear PCM format
To deploy the sample driver, you need to create an explicit App ID and provisioning profile with th
following entitlements:
com.apple.developer.driverkit
com.apple.developer.driverkit.transport.usb
To learn how to perform this configuration, see Requesting Entitlements for DriverKit Developmen
Overview
Configure the Sample Code Project
Core Audio / Building an Audio Server Plug-in and Driver Extension
Sample Code
Building an Audio Server Plug-in and
Driver Extension
Create a plug-in and driver extension to support an audio device in macOS.
Download
DriverKit 20.0+
macOS 11.0+
Xcode 12.2+


## Page 4

To bypass this configuration and use ad hoc signing to test the driver in your local development
environment, perform the following steps:
1. Disable System Integrity Protection (SIP) on your system so it recognizes ad hoc-signed
DriverKit extensions. For more information, see Disabling and Enabling System Integrity
Protection.
2. Configure the SimpleAudioDriver target to use local signing. Select the target, and then
select its Build Settings tab. Find the Code Signing Identity build setting and select Sign to Run
Locally.
Use the included installer script to install the driver on your system. Navigate to the root of the
sample project and run the following command:
./Scripts/install.sh
Reboot your computer so that the system recognizes the driver. After your computer restarts, ope
Audio MIDI Setup to inspect the newly installed device.
To uninstall the driver, run the uninstall.sh script and reboot your computer.
Creating an Audio Server Driver Plug-in
Build a virtual audio device by creating a custom driver plug-in.
Capturing system audio with Core Audio taps
Use a Core Audio tap to capture outgoing audio from a process or group of processes.
See Also
Drivers


## Page 5

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


## Page 6

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


## Page 7

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


## Page 8

Create a plug-in and driver extension to support an audio device in macOS.


