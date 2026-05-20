# 001_Displaying Content in CarPlay.pdf

## Page 1

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


## Page 2

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


## Page 3

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


## Page 4

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


## Page 5

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


