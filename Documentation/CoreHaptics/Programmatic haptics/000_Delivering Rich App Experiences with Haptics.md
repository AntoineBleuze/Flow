# 000_Delivering Rich App Experiences with Haptics.pdf

## Page 1

Note
This sample code project is associated with WWDC21 session 10278: Practice Audio Haptic
Design.
You must run the sample on iPhone 8 or later.
Playing Collision-Based Haptic Patterns
Play a custom haptic pattern whose strength depends on an object’s collision speed.
Overview
Configure the Sample Code Project
See Also
Programmatic haptics
Core Haptics / Delivering Rich App Experiences with Haptics
Sample Code
Delivering Rich App Experiences with
Haptics
Enhance your app’s experience by incorporating haptic and sound feedback into
key interactive moments.
Download
iOS 13.0+
iPadOS 13.0+
Xcode 12.5+


## Page 2

Updating Continuous and Transient Haptic Parameters in Real Time
Generate continuous and transient haptic patterns in response to user touch.
class CHHapticEvent
An object that describes a single haptic or audio event.
class CHHapticEventParameter
A static parameter value that represents a single property of the haptic pattern.
class CHHapticDynamicParameter
A value that you send to a haptic pattern player to alter a property value during playback.
class CHHapticParameterCurve
A curve that you send to a haptic pattern player to alter a property value gradually during
playback.


