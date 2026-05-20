# 004_Handling input events.pdf

## Page 1

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


## Page 2

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


## Page 3

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


## Page 4

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


## Page 5

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


## Page 6

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


