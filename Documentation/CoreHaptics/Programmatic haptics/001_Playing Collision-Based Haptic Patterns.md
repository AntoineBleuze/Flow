# 001_Playing Collision-Based Haptic Patterns.pdf

## Page 1

The sample code project, HapticBounce, demonstrates how to play a haptic with audio when a
bouncing sphere collides with the edges of the screen. The sample app shows how to vary the
volume of the synthesized audio signal and the intensity of the transient haptic pattern based on
the sphere’s velocity during impact.
Although the sample app uses UIKit Dynamics and UIKit for simplicity and familiarity with UIKit
classes, but your app can also use a 2D engine like SpriteKit to represent interactive object
collisions.
Note
HapticBounce requires Xcode 11 or later. Simulator doesn’t support a haptic interface, so build
and run this sample on an iPhone 8, 8 Plus, X, XR, XS, or XS Max running iOS 13 or later.
Check for device compatibility and set up an instance of CHHapticEngine, as the sample
demonstrates when you launch the app.
Overview
Configure the App to Play Haptics
Core Haptics / Playing Collision-Based Haptic Patterns
Sample Code
Playing Collision-Based Haptic Patterns
Play a custom haptic pattern whose strength depends on an object’s collision
speed.
Download
iOS 13.0+
iPadOS 13.0+
Xcode 12.0+


## Page 2

See Preparing your app to play haptics for more information about setting up the engine.
Express the walls as boundaries in a UICollisionBehavior with the sphere.
Define the Objects in UIKit Dynamics


## Page 3

Each bounce against the wall is a dynamic item behavior, which lets you tweak the elasticity to
match the haptic effect. An animator of class UIDynamicAnimator ties together all of these
dynamic objects with gravity.
HapticBounce uses the device’s accelerometer to move the sphere. It adjusts the accelerometer b
responding to motion updates in a completion handler.
When the sphere collides with a wall, the dynamics framework sends a callback to its delegate.
ViewController implements this delegate, UICollisionBehaviorDelegate, to respond to
collisions.
To vary the haptic at the point of collision, check the sphere’s velocity and map it to a normalized 
to 1) intensity and sharpness value, as follows:
Play Variable Haptic Patterns on Collision


## Page 4

The sample sets kMaxVelocity based on experimentation dropping the sphere from a maximum
possible height, but you can adjust the value to create a stronger or weaker intensity pattern.
On each impact, you can create a haptic player, an inexpensive operation, on the spot, using the
desired haptic parameters.
Starting the player plays the haptic.
In addition to playing haptic patterns, the haptic engine also synthesizes audio. The engine in
HapticBounce plays this audio by adding an audio event to the same haptic player as the haptic
event, as follows:
Synthesize Audio to Play With the Haptic


## Page 5

Instead of adjusting haptic intensity and sharpness based on the sphere’s velocity, you vary audio
volume and pitch.
Delivering Rich App Experiences with Haptics
Enhance your app’s experience by incorporating haptic and sound feedback into key
interactive moments.
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
See Also
Programmatic haptics


