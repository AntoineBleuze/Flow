# CarPlay Integration.pdf

## Page 1

To integrate with CarPlay, you must request the appropriate entitlement for your app’s category a
CarPlay Contact Us and agree to the CarPlay Entitlement Addendum. Apple reviews each
application using predefined criteria. If your request meets the criteria, Apple adds the entitlemen
to your developer account using managed capabilities. For more information, see Provisioning wit
managed capabilities.
After you receive the entitlement, you need to configure your Xcode project to use it, which
involves several steps. You create or update an App ID, generate a provisioning profile, and add a
Entitlements.plist file to your target. Your project’s code signing settings also require mino
changes.
Note
CarPlay-enabled apps are subject to an additional set of App Store Review guidelines. For
more information, see the CarPlay App Programming Guide.
Update the App ID of your CarPlay-enabled app to include the necessary CarPlay capabilities by
following these steps:
1. Complete the actions in Register an App ID to create an App ID if you don’t already have one.
2. Sign in to your Apple Developer account and select Certificates, Identifiers & Profiles.
3. Select Identifiers in the menu on the left.
4. Select your app’s App ID.
Overview
Add CarPlay Capabilities to Your App ID
CarPlay / Requesting CarPlay Entitlements
Article
Requesting CarPlay Entitlements
Configure your CarPlay-enabled app with the entitlements it requires.


## Page 2

5. Choose the Additional Capabilities tab.
6. Enable the CarPlay capabilities that your app requires.
7. Click the Save button.
8. Create a new provisioning profile for the updated App ID. For more information, see Create a
development provisioning profile.
Configure your Xcode project to use the new provisioning profile when it code signs your CarPlay
enabled app by following these steps:
1. In Xcode, select your project in the Project navigator.
2. In the project editor, choose Signing & Capabilities.
3. Click All in the scope bar, and then deselect “Automatically manage signing”.
4. Click the Provisioning Profile pop-up menu and choose Download Profile.
5. Select your CarPlay provisioning profile from the left column and click Select Profile.
Use an Entitlements.plist file to specify the entitlements that your CarPlay-enabled app
requires. They must match the capabilities you add to your App ID. CarPlay uses this file to
determine the framework functionality to allow.
Import the CarPlay Provisioning Profile
Add an Entitlements File


## Page 3

To create the entitlements file:
1. In Xcode, select your project in the Project navigator.
2. Choose File > New > File, select Property List from the Resource section, and click Next.
3. Enter Entitlements as the filename and click Create.
4. In the project editor, choose Build Settings.
5. Click All and Combined in the scope bar.
6. Use the search box to find the Code Signing Entitlements setting.
7. Enter the full path of the Entitlements.plist file as the setting’s value.
8. Open the file in Xcode and add the applicable entitlement from the table below as a Boolean.
Entitlement
Category
com.apple.developer.carplay-audio
Audio
com.apple.developer.carplay-communication
Communication
com.apple.developer.carplay-charging
EV Charging``
com.apple.developer.carplay-maps
Navigation
com.apple.developer.carplay-parking
Parking``
com.apple.developer.carplay-quick-ordering
Quick Food Ordering
The following example shows the contents of a CarPlay-enabled app’s Entitlements.plist f
with the audio entitlement:
In Xcode, use a simulator to build and run your project. After Simulator launches, choose I/O >
External Displays > CarPlay. Your app appears on the CarPlay Home screen.
Test Your Configuration
See Also


## Page 4

Displaying Content in CarPlay
Use scenes to present your app’s content on the vehicle’s built-in screen.
Supporting Previous Versions of iOS
Make your CarPlay-enabled apps compatible with older system versions, such as iOS 13 and
earlier.
Using the CarPlay Simulator
Configure Simulator to run and debug your CarPlay-enabled app.
class CPTemplateApplicationScene
A CarPlay scene that controls your app’s user interface.
protocol CPTemplateApplicationSceneDelegate
The methods for responding to the life cycle events of your app’s scene.
class CPSessionConfiguration
An object that provides vehicle properties and configuration for the CarPlay environment.
CarPlay Integration


## Page 5

A scene manages your CarPlay-enabled app’s user interface, including the window that CarPlay
displays on the vehicle’s screen. Navigation apps are the only app category that have access to th
window, and use it to draw their map content. All other categories of apps use only the scene’s
interface controller to manage their user interface.
As CarPlay manages your app’s scene, you provide a scene delegate — an object that conforms t
the CPTemplateApplicationSceneDelegate protocol — that the system notifies about scen
life cycle events. CarPlay creates your app’s scene and scene delegate when the user launches
your app.
To add a CarPlay scene, provide its configuration in the scene manifest of your Xcode project’s
Info.plist file. Specify your scene delegate’s class name as the value of the UIScene
DelegateClassName key.
Overview
Add a CarPlay Scene
CarPlay / Displaying Content in CarPlay
Article
Displaying Content in CarPlay
Use scenes to present your app’s content on the vehicle’s built-in screen.


## Page 6

In your scene delegate, implement the templateApplicationScene(_:didConnect:)
method and use the interface controller that it provides to set your root template.
If your app specifies the navigation entitlement, implement the templateApplication
Scene(_:didConnect:to:) method instead because it provides a reference to your app’s
window that CarPlay manages. Create an instance of your map-drawing view controller and set it
as the window’s root view controller. Make sure that you set your interface controller’s root
template.
Obj-C
Obj-C
Swift
Swift


## Page 7

Important
Use the window’s root view controller to draw only map content. Don’t render alerts, overlays,
or any other user interface elements. Use only the templates that the framework provides to
create your app’s CarPlay user interface.
Navigation apps can add an additional scene entry to their scene manifest to enable their maps,
upcoming maneuvers, and shortcut buttons to appear in the CarPlay Dashboard.
Add the following key to the UIApplicationSceneManifest dictionary in your Xcode project’
Info.plist file to specify that your app supports the CarPlay Dashboard:
In the same file, add the CarPlay Dashboard scene configuration to the UIScene
Configurations dictionary. Provide your dashboard scene delegate’s class name as the value 
the UISceneDelegateClassName key.
Add a CarPlay Dashboard Scene


## Page 8

Tip
The names of the dashboard scene’s session role and scene class are different from the
standard CarPlay scene. If the CarPlay Dashboard doesn’t display your navigation app, make
sure that you’re using the correct names.
In your dashboard scene delegate, implement templateApplicationDashboardScene(_:
didConnect:to:). Use the window that the method provides to render your map content. Set
the dashboard controller’s shortcutButtons property to an array of buttons — up to a maximu
of two — that the CarPlay Dashboard displays when your app isn’t actively navigating.
Requesting CarPlay Entitlements
Obj-C
See Also
CarPlay Integration
Swift


## Page 9

Configure your CarPlay-enabled app with the entitlements it requires.
Supporting Previous Versions of iOS
Make your CarPlay-enabled apps compatible with older system versions, such as iOS 13 and
earlier.
Using the CarPlay Simulator
Configure Simulator to run and debug your CarPlay-enabled app.
class CPTemplateApplicationScene
A CarPlay scene that controls your app’s user interface.
protocol CPTemplateApplicationSceneDelegate
The methods for responding to the life cycle events of your app’s scene.
class CPSessionConfiguration
An object that provides vehicle properties and configuration for the CarPlay environment.


## Page 10

In iOS 14 and later, CarPlay adds more app categories and further entitlements to support them.
The framework also provides new templates that you can use to build your app’s user interface.
Some of the new app categories supersede existing ones, such as audio and communication. Usi
the proper combination of frameworks and entitlements, you can ensure that your app is
compatible with iOS 13 and earlier, and iOS 14 and later. To learn about requesting entitlements fo
your CarPlay-enabled app, see Requesting CarPlay Entitlements.
In iOS 14 and later, the CarPlay framework includes templates that you can use to build your audio
app’s user interface. To use these templates, include the com.apple.developer.carplay-
audio entitlement.
Before iOS 14, you built CarPlay-enabled audio apps using the Media Player framework, and
included the com.apple.developer.playable-content entitlement. To support iOS 13 and
earlier, use the Media Player framework and this entitlement. Your app will also work in iOS 14 and
later.
Audio apps can use the CarPlay framework, the Media Player framework, or both. Include the
applicable entitlements that match the frameworks you’re using. To be compatible with iOS 13 an
earlier, as well as iOS 14 and later, specify keys for both entitlements in the entitlements file.
Overview
Add Backward Compatibility to Audio Apps
CarPlay / Supporting Previous Versions of iOS
Article
Supporting Previous Versions of iOS
Make your CarPlay-enabled apps compatible with older system versions, such as
iOS 13 and earlier.


## Page 11

In iOS 14 and later, the CarPlay framework includes templates that you can use to build your
communication app’s user interface. To use these templates, include the com.apple.develope
.carplay-communication entitlement.
Your communication app can use the CarPlay, SiriKit, or CallKit framework, or a combination of th
three. Include the entitlements that match the frameworks you’re using. If you use the CarPlay
framework, your app can’t present a custom user interface in iOS 13 or earlier. However, users ca
still interact with your app as they have in previous versions.
The following example shows what you might add to a messaging app’s entitlements file, providin
compatibility with iOS 13 and earlier, as well as iOS 14 and later:
If your CarPlay-enabled communication app includes VoIP features, provide support for
doc://com.apple.documentation/documentation/sirikit/instartcallintent. If the VoIP app targets iOS
14 or earlier, provide support for
doc://com.apple.documentation/documentation/sirikit/instartaudiocallintent and
doc://com.apple.documentation/documentation/sirikit/insearchcallhistoryintent in addition to
doc://com.apple.documentation/documentation/sirikit/instartcallintent.
Requesting CarPlay Entitlements
Configure your CarPlay-enabled app with the entitlements it requires.
Displaying Content in CarPlay
Use scenes to present your app’s content on the vehicle’s built-in screen.
Using the CarPlay Simulator
Configure Simulator to run and debug your CarPlay-enabled app.
class CPTemplateApplicationScene
A CarPlay scene that controls your app’s user interface.
Add Backward Compatibility to Communication Apps
See Also
CarPlay Integration


## Page 12

protocol CPTemplateApplicationSceneDelegate
The methods for responding to the life cycle events of your app’s scene.
class CPSessionConfiguration
An object that provides vehicle properties and configuration for the CarPlay environment.


## Page 13

Simulator provides the ability to run your CarPlay-enabled app in a second window. The window
behaves as the vehicle’s primary CarPlay display, and you can interact with it like you would a real
CarPlay system. Simulator provides additional options for navigation apps that you can enable to
check your map content at various screen sizes and resolutions.
Don’t use Simulator as your sole method of testing. Apple recommends that you also test in a
vehicle or aftermarket system. If possible, use a device that supports wireless CarPlay. This allows
you to use Xcode to debug your app while it’s running in a physical CarPlay environment.
Simulator doesn’t open the CarPlay window by default, but does keep it open for the rest of the
session after you activate it. Simulator can’t display your CarPlay-enabled app unless it has the
necessary entitlements. See Requesting CarPlay Entitlements for more information.
To open the CarPlay window:
1. In Xcode, build and run your project using the iOS simulator.
2. From the Simulator menu bar, choose I/O > External Displays > CarPlay.
The CarPlay window is 800 x 480 pixels and uses a display scale of @2x, which represents the
common configuration of many CarPlay systems.
If you’re developing a CarPlay-enabled navigation app, enable CarPlay’s additional options in
Simulator, which allows you to change the window’s width, height, and scale. Use this flexibility to
ensure your map content renders in all recommended configurations.
Overview
Open the CarPlay Simulator
Enable Additional Options for Navigation Apps
CarPlay / Using the CarPlay Simulator
Article
Using the CarPlay Simulator
Configure Simulator to run and debug your CarPlay-enabled app.


## Page 14

Before launching Simulator, open Terminal and enter the following command:
Apple recommends that you test your CarPlay-enabled app using the following configurations, at 
minimum:
Configuration
Width x height (pixels)
Scale
Minimum
748 x 456
@2x
Portrait
768 x 1024
@2x
Standard
800 x 480
@2x
High-resolution
1920 x 720
@3x
Simulator is useful during development, but it doesn’t provide certain CarPlay features that Apple
recommends you include when testing your CarPlay-enabled app.
For example, you can’t use Simulator to test:
When iOS locks the iPhone. A user often interacts with CarPlay without first unlocking their
iPhone. Your CarPlay-enabled app must perform its primary functions when the iPhone is in a
locked state.
Siri. Users interact with certain CarPlay features using Siri exclusively. Ensure that your CarPlay
enabled app works as you expect throughout these interactions.
Audio behavior. You CarPlay app must be a good audio citizen. Be mindful that audio may com
from other sources when CarPlay is active. If your CarPlay-enabled app isn’t playing audio,
deactivate its audio session. For example, an audio navigation prompt should cause the vehicle
radio volume to lower and then rise again after the prompt finishes.
Requesting CarPlay Entitlements
Configure your CarPlay-enabled app with the entitlements it requires.
Go Beyond Simulator
See Also
CarPlay Integration


## Page 15

Displaying Content in CarPlay
Use scenes to present your app’s content on the vehicle’s built-in screen.
Supporting Previous Versions of iOS
Make your CarPlay-enabled apps compatible with older system versions, such as iOS 13 and
earlier.
class CPTemplateApplicationScene
A CarPlay scene that controls your app’s user interface.
protocol CPTemplateApplicationSceneDelegate
The methods for responding to the life cycle events of your app’s scene.
class CPSessionConfiguration
An object that provides vehicle properties and configuration for the CarPlay environment.


## Page 16

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


## Page 17

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


## Page 18

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


## Page 19

class CPSessionConfiguration
An object that provides vehicle properties and configuration for the CarPlay environment.


## Page 20

Displaying Content in CarPlay
This protocol defines methods that CarPlay calls when the scene connects and disconnects, as
well as methods for responding to certain user actions. Use your implementation to provide the
appropriate behavior for when these events occur. For example, creating and setting your root
template when CarPlay launches your app and connects its scene.
You don’t create instances of your scene delegate directly. Instead, you specify the name of the
class as part of the CarPlay scene configuration you add to your Info.plist file—see the
example below—or that you return from your app delegate’s application(_:configuration
ForConnecting:options:) method.
Mentioned in
Overview
CarPlay / CPTemplateApplicationSceneDelegate
Protocol
CPTemplateApplicationSceneDelegate
The methods for responding to the life cycle events of your app’s scene.
iOS 13.0+
iPadOS 13.0+
Mac Catalyst 13.1+


## Page 21

func templateApplicationScene(CPTemplateApplicationScene, didConnect:
CPInterfaceController)
Tells the delegate about the addition of a CarPlay scene to the app.
func templateApplicationScene(CPTemplateApplicationScene, didConnect:
CPInterfaceController, to: CPWindow)
Tells the delegate about the addition of a CarPlay scene to your navigation app.
func templateApplicationScene(CPTemplateApplicationScene, didDisconnect
InterfaceController: CPInterfaceController)
Tells the delegate when CarPlay removes a scene from the app.
func templateApplicationScene(CPTemplateApplicationScene, didDisconnect
CPInterfaceController, from: CPWindow)
Tells the delegate when CarPlay removes a scene from your navigation app.
func templateApplicationScene(CPTemplateApplicationScene, didSelect:
CPManeuver)
Tells the delegate when the user selects a maneuver while the app is in the background.
func templateApplicationScene(CPTemplateApplicationScene, didSelect:
CPNavigationAlert)
Tells the delegate when the user selects a navigation alert while the app is in the background
func contentStyleDidChange(UIUserInterfaceStyle)
Topics
Responding to the Scene Life Cycle
Responding to User Actions
Instance Methods


## Page 22

NSObjectProtocol, UISceneDelegate
Requesting CarPlay Entitlements
Configure your CarPlay-enabled app with the entitlements it requires.
Displaying Content in CarPlay
Use scenes to present your app’s content on the vehicle’s built-in screen.
Supporting Previous Versions of iOS
Make your CarPlay-enabled apps compatible with older system versions, such as iOS 13 and
earlier.
Using the CarPlay Simulator
Configure Simulator to run and debug your CarPlay-enabled app.
class CPTemplateApplicationScene
A CarPlay scene that controls your app’s user interface.
class CPSessionConfiguration
An object that provides vehicle properties and configuration for the CarPlay environment.
Relationships
Inherits From
See Also
CarPlay Integration


## Page 23

You use a session configuration to determine any user interface limits the vehicle imposes, such a
keyboard display and list length, and the content style the vehicle selects according to the ambie
light level.
init(delegate: any CPSessionConfigurationDelegate)
Creates a session configuration with a delegate.
protocol CPSessionConfigurationDelegate
A protocol for receiving notifications about changes to vehicle properties and configuration.
var delegate: (any CPSessionConfigurationDelegate)?
An object that serves as the delegate to the session configuration.
Overview
Topics
Creating a Session Configuration
Managing the Delegate
CarPlay / CPSessionConfiguration
Class
CPSessionConfiguration
An object that provides vehicle properties and configuration for the CarPlay
environment.
iOS 12.0+
iPadOS 12.0+
Mac Catalyst 13.1+


## Page 24

var contentStyle: CPContentStyle
The content style that the vehicle selects.
struct CPContentStyle
The types of content style that the vehicle allows.
var limitedUserInterfaces: CPLimitableUserInterface
A bit mask value that indicates the user interface limits.
struct CPLimitableUserInterface
The types of limitable user interface elements.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Getting the Content Style
Getting the Limits
Relationships
Inherits From
Conforms To
See Also
CarPlay Integration


## Page 25

Requesting CarPlay Entitlements
Configure your CarPlay-enabled app with the entitlements it requires.
Displaying Content in CarPlay
Use scenes to present your app’s content on the vehicle’s built-in screen.
Supporting Previous Versions of iOS
Make your CarPlay-enabled apps compatible with older system versions, such as iOS 13 and
earlier.
Using the CarPlay Simulator
Configure Simulator to run and debug your CarPlay-enabled app.
class CPTemplateApplicationScene
A CarPlay scene that controls your app’s user interface.
protocol CPTemplateApplicationSceneDelegate
The methods for responding to the life cycle events of your app’s scene.


