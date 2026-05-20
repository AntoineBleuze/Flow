# 001_Letting players use their second-generation Siri Remote as a game controller.pdf

## Page 1

To add support for the second-generation Siri Remote in your Apple TV game, you make a few
changes to your Xcode project and code.
First configure your Xcode project to handle directional gamepads and multiple micro gamepads.
On the Signing & Capabilities tab in the project editor, add the Game Controllers capability to you
project and check Directional Gamepad under Game Controllers. For more information, see
Configuring game controllers.
On the Info tab, add the GCSupportsMultipleMicroGamepads key and set the value to YES.
For more information, see Managing your app’s information property list values.
In your code, handle multiple micro gamepad connections. When a game controller connects,
check if the controller is a directional gamepad using the isKind(of:) method:
Overview
Configure your project
Handle multiple micro gamepads
Game Controller / Letting players use their second-generation Siri Remote as a game controller
Article
Letting players use their second-
generation Siri Remote as a game
controller
Support the second-generation Siri Remote as a game controller in your Apple TV
game.


## Page 2

Check if the device category is second-generation Siri Remote using the productCategory
property:
If these conditions are true, you can use the connected second-generation Siri Remote as a game
controller.
To access the center button of the second-generation Siri Remote, use the buttons property:
Then to access the directional pad, use the dpads property:
If your game requires an analog touch surface, check whether the directional pad is digital using
the isAnalog property:
For example, the Universal Electronic remote that works with Apple TV is a directional gamepad b
with physical non-analog buttons.
Supporting Game Controllers
Support a physical controller or add a virtual controller to enhance how people interact with
your game through haptics, lighting, and motion sensing.
Discovering and tracking spatial game controllers and styli
Receive controller and stylus input to interact with content in your augmented reality app.
Access the remote buttons and directional pad
See Also
Game controllers


## Page 3

protocol GCDevice
A protocol that defines a common interface for game input devices.
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


