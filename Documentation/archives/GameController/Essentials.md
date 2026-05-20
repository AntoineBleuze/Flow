# Essentials.pdf

## Page 1

Browse notable changes in Game Controller.
Add support for spatial game controllers. To determine if a controller is a spatial game controlle
check whether the product category is GCProductCategorySpatialController.
Add support for a physical stylus with a GCStylus object.
Add NSAccessoryTrackingUsageDescription to your information property list if your ap
requires access to accessory-tracking data for a spatial game controller or stylus.
Add GCSupportedGameControllers to your information property list — with a value of
SpatialGamepad — if your app supports spatial game controllers.
For UIKit apps, add a user interaction that determines whether the system delivers game
controller events through the Game Controller framework instead of the UIResponder chain. 
receive events through the Game Controller framework, add a GCEventInteraction object 
one or more views and set the handledEventTypes property to the types of events you wan
to handle.
Overview
June 2025
June 2024
visionOS
June 2023
Updates / Game Controller updates
Article
Game Controller updates
Learn about important changes to Game Controller.


## Page 2

Use the classes that conform to the GCDevicePhysicalInput protocol to poll for game
controller input in your game loop. For more information, see Handling input events.
Add support for arcade sticks. To determine if a controller is an arcade stick, check whether th
product category is GCProductCategoryArcadeStick.
Add GCRequiresControllerUserInteraction to your information property list if your ap
requires a game controller on visionOS or to recommend a game controller on iOS.
Accelerate updates
Learn about important changes to Accelerate.
Accessibility updates
Learn about important changes to Accessibility.
ActivityKit updates
Learn about important changes in ActivityKit.
AdAttributionKit Updates
Learn about important changes to AdAttributionKit.
App Clips updates
Learn about important changes in App Clips.
App Intents updates
Learn about important changes in App Intents.
AppKit updates
Learn about important changes to AppKit.
Apple Intelligence updates
Learn about important changes to Apple Intelligence.
AppleMapsServerAPI Updates
Learn about important changes to AppleMapsServerAPI.
Apple Pencil updates
Learn about important changes to Apple Pencil.
See Also
Technology updates


## Page 3

ARKit updates
Learn about important changes to ARKit.
Audio Toolbox updates
Learn about important changes to Audio Toolbox.
AuthenticationServices updates
Learn about important changes to AuthenticationServices.
AVFAudio updates
Learn about important changes to AVFAudio.
AVFoundation updates
Learn about important changes to AVFoundation.


## Page 4

Name
Supports Controller User Interaction
Type
Boolean
To add this key to the information property list, enable the Game Controllers capability in Xcode. I
you set this key to YES and check ExtendedGamepad under the Game Controllers capability in yo
project, App Store adds a game controller support badge to your app. Then users can customize
their game controller mappings in Settings and Preferences.
Important
To recommend the use of a game controller on iOS or if your app requires a game controller on
visionOS, add an entry into the GCRequiresControllerUserInteraction dictionary for
that platform and set the value to YES.
Details
Discussion
See Also
Games
Bundle Resources / Information Property List / GCSupportsControllerUserInteraction
Property List Key
GCSupportsControllerUserInteraction
A Boolean value indicating whether the app supports a game controller.
iOS 2.0+
iPadOS 2.0+
macOS 10.0+
tvOS 9.0+
visionOS 1.0+


## Page 5

AVGameBypassSystemSpatialAudio
A key that ignores the system spatial-audio toggle in Control Center.
GKGameCenterBadgingDisabled
A Boolean value indicating whether GameKit can add badges to a turn-based game icon.
GCSupportedGameControllers
The types of game controller profiles that the app supports or requires.
Name: Supported game controller types
GCRequiresControllerUserInteraction
The platforms for which your app requires or you recommend a game controller.
GCSupportsMultipleMicroGamepads
A Boolean value indicating whether the physical Apple TV Remote and the Apple TV Remote
app operate as separate game controllers.
LSSupportsGameMode
A Boolean value indicating whether the app supports Game Mode.
GCSupportsGameMode
A Boolean value indicating whether the app supports game mode.
Name: Supports Game Mode
Deprecated
GKShowChallengeBanners
A Boolean value that indicates whether GameKit can display challenge banners in a game.
Deprecated


## Page 6

Name
Supported game controller types
Type
Array of dictionaries
ProfileName
string
Possible Values: DirectionalGamepad, SpatialGamepad,
ExtendedGamepad, MicroGamepad
The dictionary keys are ProfileName and the possible game controller values are:
ExtendedGamepad
The extended set of gamepad controls. See GCExtendedGamepad.
SpatialGamepad
The set of spatial gamepad controls.
MicroGamepad
The 1st Generation Siri Remote. See GCMicroGamepad.
DirectionalGamepad
Details
Properties
Discussion
Bundle Resources / Information Property List / GCSupportedGameControllers
Property List Key
GCSupportedGameControllers
The types of game controller profiles that the app supports or requires.
iOS 7.0+
iPadOS 7.0+
macOS 10.9+
tvOS 9.0+
visionOS 1.0+


## Page 7

The 2nd Generation Siri Remote. A directional pad without motion or rotation. See
GCDirectionalGamepad. Available in iOS 14.3+, macOS 11.1+, Mac Catalyst 14.3+, and tvO
14.3+.
AVGameBypassSystemSpatialAudio
A key that ignores the system spatial-audio toggle in Control Center.
GKGameCenterBadgingDisabled
A Boolean value indicating whether GameKit can add badges to a turn-based game icon.
GCSupportsControllerUserInteraction
A Boolean value indicating whether the app supports a game controller.
Name: Supports Controller User Interaction
GCRequiresControllerUserInteraction
The platforms for which your app requires or you recommend a game controller.
GCSupportsMultipleMicroGamepads
A Boolean value indicating whether the physical Apple TV Remote and the Apple TV Remote
app operate as separate game controllers.
LSSupportsGameMode
A Boolean value indicating whether the app supports Game Mode.
GCSupportsGameMode
A Boolean value indicating whether the app supports game mode.
Name: Supports Game Mode
Deprecated
GKShowChallengeBanners
A Boolean value that indicates whether GameKit can display challenge banners in a game.
Deprecated
See Also
Games


## Page 8

Type
Boolean
If set to YES, your app supports multiple remotes with gamepads; otherwise, it doesn’t. If you
support the 2nd Generation Siri Remote, set this key to YES. If you don’t set this key to YES, the
combined micro gamepads won’t have the extra inputs of the 2nd Generation Siri Remote.
AVGameBypassSystemSpatialAudio
A key that ignores the system spatial-audio toggle in Control Center.
GKGameCenterBadgingDisabled
A Boolean value indicating whether GameKit can add badges to a turn-based game icon.
GCSupportedGameControllers
The types of game controller profiles that the app supports or requires.
Details
Discussion
See Also
Games
Bundle Resources / Information Property List / GCSupportsMultipleMicroGamepads
Property List Key
GCSupportsMultipleMicroGamepads
A Boolean value indicating whether the physical Apple TV Remote and the Apple
TV Remote app operate as separate game controllers.
tvOS 9.0+


## Page 9

Name: Supported game controller types
GCSupportsControllerUserInteraction
A Boolean value indicating whether the app supports a game controller.
Name: Supports Controller User Interaction
GCRequiresControllerUserInteraction
The platforms for which your app requires or you recommend a game controller.
LSSupportsGameMode
A Boolean value indicating whether the app supports Game Mode.
GCSupportsGameMode
A Boolean value indicating whether the app supports game mode.
Name: Supports Game Mode
Deprecated
GKShowChallengeBanners
A Boolean value that indicates whether GameKit can display challenge banners in a game.
Deprecated


## Page 10

The Game Controller framework provides your game with low-level and fast access to input from
connected gamepads, arcade sticks, and racing wheels. Not all games receive and process input
the same way. The Game Controller framework input APIs support several ways for your game to
receive controller input:
Use polling when input handling occurs at a fixed interval as part of your game’s loop. You
request the latest input state from the Game Controller framework each time you handle input.
This can occur once per frame, or at a lower frequency than the frame rate.
Use callbacks when the input handling in your game is event-driven. You provide one or more
blocks that the Game Controller framework invokes when any or certain elements’ input values
change.
You get game controller input from the device’s input profile. The GCDevicePhysicalInput
protocol declares the common properties for the input profile. The GCControllerLiveInput
and GCRacingWheelInput classes provide the concrete implementations for gamepads and
arcade sticks, and racing wheels, respectively.
For gamepads and arcade sticks, first get the GCControllerLiveInput object from the
GCController object using the input property.
Overview
Get the input profile
Game Controller / Handling input events
Article
Handling input events
Receive controller input using either polling or callbacks.


## Page 11

For racing wheels, first get the GCRacingWheelInput object from the GCRacingWheel object
using the wheelInput property.
The Game Controller framework processes input events, and invokes any configured callbacks, o
the GCController or GCRacingWheel handlerQueue property of the device. The handler
Queue property is the main queue by default. To configure a dedicated queue for input processin
set the queue property of the GCControllerLiveInput or GCRacingWheelInput object.
Game controllers organize their input states by elements. These elements correspond to the
individual buttons, directional pads, thumbsticks, and other kinds of controls on the gamepad,
arcade stick, or racing wheel. Game controllers identify elements by their semantic name, and
group them into one or more collections, such as the elements, buttons, dpads, axes, and
switches properties.
To get objects representing specific elements of a controller, use the subscript notation with the
collection properties from an object conforming to the GCDevicePhysicalInputState
protocol. This includes the GCControllerLiveInput and GCRacingWheelInput objects.
For example, to get the A button of a controller, use .a with the buttons property, as in the
following example:
To get the left thumbstick of a directional pad, use .leftThumbstick with the dpads property.
Configure the input dispatch queue
Access input elements
Get the current input state


## Page 12

Both the GCControllerLiveInput and GCRacingWheelInput objects track the last receive
input state from the game controller. If you poll for input, but just need the current input values, g
the elements from the GCControllerLiveInput and GCRacingWheelInput objects and rea
their input values.
Reading a single input value is an atomic operation. However, the current input state can change
between reading distinct input values. To avoid these inconsistencies, use the GCDevice
PhysicalInput. capture() method to obtain a snapshot of the input state at the current
moment. Then read the input values from the snapshot. Snapshots carry very little performance
overhead as long as your game doesn’t hold onto the snapshot for long periods of time.
Sometimes an input device generates input more frequently than your game can process it. For
example, a racing wheel with a high refresh rate generates hundreds of inputs per second. If you
read the current input values every frame (at 60 frames per second), you miss input events. In thi
case, configure the Game Controller framework to maintain a queue of input states that you
retrieve and process later.
First, change the input queue depth to a value that’s appropriate for the frequency at which your
game polls for input. The input queue depth specifies the maximum number of input states that th
Game Controller framework buffers before it purges older input states from the queue. The defau
value of 1 indicates no buffering.
Poll for input changes


## Page 13

In your game loop, handle all the inputs that occur after the last iteration of your game loop using
the nextInputState() method. Call the nextInputState() method until the queue is empt
Optionally, assign a callback to the inputStateAvailableHandler property of the
GCControllerLiveInput or GCRacingWheelInput objects. The Game Controller framewor
calls this block when a new input state becomes available, and not again until your game process
all input states in the queue.
Each call to the nextInputState() method returns a snapshot of the oldest input state in the
queue. Use the snapshot to access individual elements and read their input values.
To determine whether an element’s input changed compared to the previous input state, use the
change(for:) method. To get a collection of all the elements with changed inputs compared to
the previous input state, use the changedElements() method.


## Page 14

Handle when the queue overflows. If the queue is empty, the nextInputState() method retur
nil. If the queue overflows, the changedElements() method returns nil and the
change(for:) method returns GCDevicePhysicalInputElementChange.unknown
Change.
To receive callbacks from specific elements when their inputs change, assign a callback to one or
more of the element’s inputs. Then implement the handlers to take the appropriate action for you
game.
For example, a button element has a pressed input representing its pressed state. Assign a block 
the pressedDidChangeHandler property of the button’s pressedInput property to take an
action when the user presses it.
To receive a callback when the inputs of any element change, assign a callback to the element
ValueDidChangeHandler property of the GCControllerLiveInput or GCRacingWheel
Input objects. When input occurs, the Game Controller framework calls the block once for each
element that changes. Your code reads the latest values from the element that Game Controller
passes to the handler.
Receive callbacks for input changes


## Page 15

Game Controller updates
Learn about important changes to Game Controller.
GCSupportsControllerUserInteraction
A Boolean value indicating whether the app supports a game controller.
GCSupportedGameControllers
The types of game controller profiles that the app supports or requires.
GCSupportsMultipleMicroGamepads
A Boolean value indicating whether the physical Apple TV Remote and the Apple TV Remote
app operate as separate game controllers.
See Also
Essentials


