# 000_Supporting Game Controllers.pdf

## Page 1

Note
This sample code project is associated with WWDC21 session 10081: Tap Into Virtual and
Physical Game Controllers. This sample code project was previously associated with WWDC20
session 10614: Advancements in Game Controllers and originally associated with WWDC17
session 604: SceneKit: What’s New.
Letting players use their second-generation Siri Remote as a game controller
Support the second-generation Siri Remote as a game controller in your Apple TV game.
Discovering and tracking spatial game controllers and styli
Receive controller and stylus input to interact with content in your augmented reality app.
protocol GCDevice
A protocol that defines a common interface for game input devices.
Overview
See Also
Game controllers
Game Controller / Supporting Game Controllers
Sample Code
Supporting Game Controllers
Support a physical controller or add a virtual controller to enhance how people
interact with your game through haptics, lighting, and motion sensing.
Download
iOS 14.0+
iPadOS 14.0+
macOS 11.0+
tvOS 14.0+
Xcode 12.5+


## Page 2

class GCController
A representation of a real game controller, a virtual controller, or a snapshot of a controller.
class GCRacingWheel
An object that represents a physical racing wheel controller connected to a device.
class GCKeyboard
An object that represents a physical keyboard connected to a device.
class GCMouse
An object that represents a physical mouse connected to a device.
class GCStylus
An object that represents a physical stylus connected to the device.


