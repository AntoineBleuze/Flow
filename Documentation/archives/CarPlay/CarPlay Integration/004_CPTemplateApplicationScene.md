# 004_CPTemplateApplicationScene.pdf

## Page 1

A scene manages your app’s user interface, including the window that CarPlay displays from that
scene. Only navigation apps have access to that window, and use it for drawing map content. All
other categories of apps use the scene’s interface controller exclusively for constructing their use
interfaces.
The scene manages the display of the window on the vehicle’s CarPlay screen, and the life cycle o
that scene as CarPlay and the user interact with it. The scene notifies its delegate—an object that
conforms to CPTemplateApplicationSceneDelegate—about various state changes and us
actions.
You don’t create scenes directly. Instead, you specify the name of the appropriate scene class as
part of the CarPlay scene configuration you add to your Info.plist file—see the example below
—or that you return from your app delegate’s application(_:configurationFor
Connecting:options:) method.
Overview
CarPlay / CPTemplateApplicationScene
Class
CPTemplateApplicationScene
A CarPlay scene that controls your app’s user interface.
iOS 13.0+
iPadOS 13.0+
Mac Catalyst 13.1+


## Page 2

var delegate: (any CPTemplateApplicationSceneDelegate)?
The object that receives the scene’s life-cycle events.
protocol CPTemplateApplicationSceneDelegate
The methods for responding to the life cycle events of your app’s scene.
var interfaceController: CPInterfaceController
The controller that manages the scene’s user interface.
class CPInterfaceController
A controller that manages the templates for constructing a scene’s user interface.
var carWindow: CPWindow
The window that belongs to the scene.
class CPWindow
A window that displays its content on the CarPlay screen.
var contentStyle: UIUserInterfaceStyle
Topics
Responding to the Scene Life Cycle
Accessing the Interface Controller
Accessing the Window
Instance Properties
Relationships


## Page 3

UIScene
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
NSTouchBarProvider
Sendable
SendableMetatype
UIActivityItemsConfigurationProviding
UIPasteConfigurationSupporting
UIResponderStandardEditActions
UIUserActivityRestoring
Requesting CarPlay Entitlements
Configure your CarPlay-enabled app with the entitlements it requires.
Displaying Content in CarPlay
Use scenes to present your app’s content on the vehicle’s built-in screen.
Supporting Previous Versions of iOS
Make your CarPlay-enabled apps compatible with older system versions, such as iOS 13 and
earlier.
Using the CarPlay Simulator
Configure Simulator to run and debug your CarPlay-enabled app.
protocol CPTemplateApplicationSceneDelegate
The methods for responding to the life cycle events of your app’s scene.
Inherits From
Conforms To
See Also
CarPlay Integration


## Page 4

class CPSessionConfiguration
An object that provides vehicle properties and configuration for the CarPlay environment.


