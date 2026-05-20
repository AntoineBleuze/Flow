# 005_GCRacingWheel.pdf

## Page 1

Handling input events
class var connectedRacingWheels: Set<GCRacingWheel>
The racing wheels connected to the device.
static let GCRacingWheelDidConnect: NSNotification.Name
A notification that posts after a racing wheel controller connects to the device.
static let GCRacingWheelDidDisconnect: NSNotification.Name
A notification that posts after a racing wheel controller disconnects from the device.
func acquireDevice() throws
Starts receiving events from the racing wheel.
Mentioned in
Topics
Discovering racing wheels
Getting events
Game Controller / GCRacingWheel
Class
GCRacingWheel
An object that represents a physical racing wheel controller connected to a devic
Mac Catalyst 16.0+
macOS 13.0+


## Page 2

func relinquishDevice()
Stops receiving events from the racing wheel.
var isAcquired: Bool
A Boolean value that indicates whether the racing wheel sends events to the app.
var wheelInput: GCRacingWheelInput
The physical input profile for the racing wheel.
func capture() -> GCRacingWheel
Returns a snapshot of the racing wheel with its current element values.
var isSnapshot: Bool
A Boolean value that indicates whether the object is a snapshot of a racing wheel.
struct DidConnectMessage
A message that posts after a racing wheel accessory connects to the device.
struct DidDisconnectMessage
A message that posts after a racing wheel accessory disconnects from the device.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Accessing the controller profile
Creating snapshots
Structures
Relationships
Inherits From
Conforms To


## Page 3

Equatable
GCDevice
Hashable
NSObjectProtocol
Supporting Game Controllers
Support a physical controller or add a virtual controller to enhance how people interact with
your game through haptics, lighting, and motion sensing.
Letting players use their second-generation Siri Remote as a game controller
Support the second-generation Siri Remote as a game controller in your Apple TV game.
Discovering and tracking spatial game controllers and styli
Receive controller and stylus input to interact with content in your augmented reality app.
protocol GCDevice
A protocol that defines a common interface for game input devices.
class GCController
A representation of a real game controller, a virtual controller, or a snapshot of a controller.
class GCKeyboard
An object that represents a physical keyboard connected to a device.
class GCMouse
An object that represents a physical mouse connected to a device.
class GCStylus
An object that represents a physical stylus connected to the device.
See Also
Game controllers


