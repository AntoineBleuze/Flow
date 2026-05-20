# 002_Updating Continuous and Transient Haptic Parameters in Real Time.pdf

## Page 1

This sample, HapticPalette, defines a two-dimensional touch area, where the x-axis varies the
haptic pattern’s sharpness, and the y-axis maps to haptic intensity. Use this interface to explore
the range of haptic patterns that you can create with Core Haptics. By sliding your finger inside th
bounded area, you can vary the parameters of the generated haptic pattern.
Overview
Core Haptics / Updating Continuous and Transient Haptic Parameters in Real Time
Sample Code
Updating Continuous and Transient Haptic
Parameters in Real Time
Generate continuous and transient haptic patterns in response to user touch.
Download
iOS 13.0+
iPadOS 13.0+
Xcode 12.0+


## Page 2

Note
HapticPalette requires Xcode 11 or later. Simulator doesn’t support a haptic interface, so build
and run this sample on an iPhone 8, 8 Plus, X, XR, XS, or XS Max running iOS 13 or later.
This sample checks for device compatibility and sets up an instance of CHHapticEngine on
launch. Before proceeding, start the engine, so it can begin accepting haptics requests.
See Preparing your app to play haptics for more information about setting up the engine.
As the app demonstrates, you can create a sustained vibration by generating a continuous haptic
pattern of nonzero duration. When you first create the pattern, on app launch, set the intensity an
sharpness through an event parameter.
Configure the App to Play Haptics
Create a Continuous Haptic Pattern


## Page 3

The sample app allows you to change the continuous pattern’s intensity and sharpness by draggi
your finger inside the region labeled Continuous. This region is a view that translates the touch
coordinates into normalized intensity and sharpness values. To enable this behavior, the code
attaches a UILongPressGestureRecognizer to each palette view. When the user begins to
drag a finger in the view, the gesture handler maps the touch coordinates to intensity and
sharpness values.
The normalized mapping converts the user’s finger location to the available spectrum. Using thes
normalized values, you can create intensity and sharpness events that determine how the haptic
pattern feels to the user. In this example, touching the palette area in the upper-right corner
generates a crisp haptic vibration at full strength.
The app retains the original pattern player instead of creating a new one with each change. To tel
the continuous haptic pattern player to change or modulate its haptic as it’s playing, send dynami
parameters to the player.


## Page 4

To vary a continuous haptic pattern, send dynamic parameters of class CHHapticDynamic
Parameter to the original pattern. This modifies the haptic pattern as it’s playing. In this example
the dynamic parameters for intensity and sharpness immediately change the haptic pattern’s
strength and character to follow the user’s finger.
Note
Sending a dynamic parameter for intensity multiplies the original pattern’s event intensity by
the dynamic parameter value. Sending a dynamic parameter for sharpness adds the dynamic
parameter value to the original pattern’s event sharpness.
Only when the gesture ends does the app stop the pattern player.
Alter the Continuous Haptic Pattern by Sending Dynamic
Parameters


## Page 5

When the app sends the continuous pattern player a dynamic parameter, the value of that
parameter changes immediately, resulting in a viscerally different haptic pattern on the device. If
your app needs to change the parameter value gradually, consider scheduling a CHHaptic
ParameterCurve.
The bottom half of the screen generates transient haptic experiences. A transient haptic event is
momentary. This sample generates a transient haptic pattern when the gesture begins. It’s also
helpful to generate subsequent transient haptic patterns if the user continues to interact with the
interface. As long as the user’s finger remains inside the transient zone, the app continues to
create a new transient haptic pattern based on the latest sharpness and intensity values. To
accomplish this spacing, you use a dispatch timer to separate the transient haptic patterns by a
time interval of 600 milliseconds, so they feel distinct.
Ask the engine to create a player from the transient pattern when the timer fires, and then play it.
Create a Transient Haptic Pattern


## Page 6

Creating haptic pattern players is inexpensive, so you don’t need to keep them around. Even if the
user slides rapidly across the touch zone, the engine creates players, plays them, and discards
them without lag.
Note
While haptic pattern players are lightweight and inexpensive to create and start, starting the
haptic engine is expensive, as is stopping it, so start and stop the engine sparingly. This
sample starts the engine only once, on app launch.
Delivering Rich App Experiences with Haptics
Enhance your app’s experience by incorporating haptic and sound feedback into key
interactive moments.
Playing Collision-Based Haptic Patterns
Play a custom haptic pattern whose strength depends on an object’s collision speed.
class CHHapticEvent
An object that describes a single haptic or audio event.
class CHHapticEventParameter
A static parameter value that represents a single property of the haptic pattern.
class CHHapticDynamicParameter
A value that you send to a haptic pattern player to alter a property value during playback.
See Also
Programmatic haptics


## Page 7

class CHHapticParameterCurve
A curve that you send to a haptic pattern player to alter a property value gradually during
playback.


