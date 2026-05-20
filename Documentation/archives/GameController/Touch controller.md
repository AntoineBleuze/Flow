# Touch controller.pdf

## Page 1

Many people play games on iOS devices without using a physical controller. You can make your
game available to them by adding touch controls, even if you designed your game for a physical
controller. The GCVirtualController class leverages the Game Controller framework and
optionally provides a default user interface. GCVirtualController can also render custom
controls.
A Metal-based game typically presents content in a UIView. An instance of UIViewControlle
known as the root view controller, manages the UIView. Your root view controller is responsible f
the GCVirtualController instance. To take responsibility, subclass from GCEventView
Controller rather than UIViewController.
Note
If your game supports tvOS, you need to subclass from GCEventViewController.
To create a custom subclass of UIViewController, create a new file in your project using the
Cocoa Touch Class template. In the “Subclass of” combination box, enter “GCEventViewControlle
In the Language menu, choose Objective-C. Then, open the newly created header file and import
the Game Controller framework.
If the game uses a storyboard, update your main scene to use a new view controller class derived
from GCEventViewController. Alternatively, if the game creates a root view controller
Overview
Create a custom view controller subclass
Game Controller / Adding touch controls to games that support game controllers in iOS
Article
Adding touch controls to games that
support game controllers in iOS
Use touch input and virtual controllers to make your game available to players
without controllers.


## Page 2

programmatically, then update the code to create an instance of a new subclass derived from
GCEventViewController.
When you connect a GCVirtualController, a new GCController appears in the controllers
array. The elements that this controller supports are controlled by the configuration created for
GCVirtualController. To configure a virtual controller, follow these steps:
1. In your subclass of UIViewController, add a GCVirtualController instance variable.
2. Add an override to the viewDidLoad() method that creates the virtual controller and stores i
in an instance variable.
If there are no physical controllers connected, the game shows the virtual controller by default. If
the player connects a physical controller, the game hides the virtual controller.
To show a virtual controller when there are no physical controllers connected, call
connect(replyHandler:) on it in the GCControllerDidDisconnect (Swift) or
GCControllerDidDisconnectNotification (Objective-C) handler.
Configure the virtual controller
Show and hide the virtual controller


## Page 3

When your game starts and there are no controllers connected, call connect(replyHandler:
on the virtual controller to show it.
To hide the virtual controller when a player connects a physical controller, call disconnect on the
virtual controller in the GCControllerDidConnect (Swift) or GCControllerDidConnect
Notification (Objective-C) handler. The game might receive a connection notification for a
physical controller before receiving a notification for the virtual controller because controller
connections are asynchronous.
When the player can’t perform certain actions in the game, hide the corresponding control
elements using the updateConfiguration(forElement:configuration:) method. For
example, during cutscene playback, the player can only press a button to skip playback.
Show and hide controls


## Page 4

For better immersion and performance, the game can render a custom virtual controller instead o
the default. Custom controls render symbols that represent their mapped actions rather than
generic symbols.
Note
When rendering custom touch controls, UIKit handles touch events and draws the results as
part of the game’s user interface render pass. If your game is multithreaded, you need to pass
data to your render thread in a thread-safe way because UIKit is only available on the main
thread.
Set the hidden property to true when you create the GCVirtualController.Configuration
Continue to set the elements property because this affects the elements of the corresponding
GCController.
Render custom touch controls


## Page 5

Add code to the implementation of viewDidLoad() to install one or more UIGesture
Recognizer objects on the game’s view. For example, use a UIPanGestureRecognizer to
implement a direction pad or a UILongPressGestureRecognizer to implement a button. Set
the view controller as the delegate and the target of each gesture recognizer, and store them in
instance variables.


## Page 6

Then, declare an extension of the root view controller subclass that conforms to UIGesture
RecognizerDelegate. In the extension, declare the action methods that the configured gestur
recognizers invoke.
Implement the action methods to interpret the location of the touch, update the virtual controller,
and inform the render thread.
Note
Update your user interface from the main thread, instead of game controller code, to avoid
unnecessary input latency.


## Page 7

Next, implement the gestureRecognizer(_:shouldReceive:) delegate method to define
the bounds of the gesture recognizer. Calculate the bounding boxes of the controls based on the
view’s current size, and place it within the view’s current safe area.


## Page 8

Update GCControllerDidConnect (Swift) and GCControllerDidDisconnect (Swift)
handlers to show or hide the custom user interface when the virtual controller is connected. For
Objective-C, update the GCControllerDidConnectNotification and GCControllerDid
DisconnectNotification handlers.
See Also
Touch controller


## Page 9

class GCVirtualController
A software emulation of a real controller that you configure specifically for your game.


## Page 10

Adding touch controls to games that support game controllers in iOS
Use a virtual controller to display software controls that you can customize over your game. You
create a virtual controller from a configuration where you choose the input elements to display. Yo
can even customize the images for the elements. When you connect the controller to the device,
users interact with it similarly to a real controller.
Mentioned in
Overview
Game Controller / GCVirtualController
Class
GCVirtualController
A software emulation of a real controller that you configure specifically for your
game.
iOS 15.0+
iPadOS 15.0+
Mac Catalyst 15.0+


## Page 11

To add a virtual controller to your game, create a GCVirtualController.Configuration
object containing the elements you want to appear in the controller. Then create the virtual
controller by passing the configuration to the init(configuration:) method. Use the
connect(replyHandler:) method to display the virtual controller on the screen.
To customize an element in the virtual controller, pass a new GCVirtualController.Element
Configuration object for the element to the updateConfiguration(forElement:
configuration:) method.
You process input from a virtual controller similarly to a real controller. Use the controller
property to get the underlying GCController object. You can either poll the elements of the
controller object or set the element’s handlers to get callbacks when their input values change.
init(configuration: GCVirtualController.Configuration)
Creates a new virtual controller using the configuration you specify.
class Configuration
The configuration of a virtual controller.
func updateConfiguration(forElement: String, configuration: (GCVirtual
Controller.ElementConfiguration) -> GCVirtualController.Element
Configuration)
Topics
Creating virtual controllers
Customizing the elements


## Page 12

Changes the configuration for one of the virtual controller’s input elements.
class ElementConfiguration
The properties of a virtual controller’s element that you can customize.
var controller: GCController?
The underlying controller object that you use to access input elements.
func connect(replyHandler: (((any Error)?) -> Void)?)
Connects the virtual controller to the device and displays it on the screen.
func disconnect()
Disconnects the virtual controller from the device and removes it from the screen.
func setPosition(CGPoint, forDirectionPadElement: String)
Changes the value of a directional pad element in the virtual controller.
func setValue(CGFloat, forButtonElement: String)
Changes the value of a button element in the virtual controller.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Accessing the elements
Connecting and displaying virtual controllers
Presenting a custom interface
Relationships
Inherits From
Conforms To


## Page 13

Hashable
NSObjectProtocol
Adding touch controls to games that support game controllers in iOS
Use touch input and virtual controllers to make your game available to players without
controllers.
See Also
Touch controller


