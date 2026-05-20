# 002_CPTemplateApplicationDashboardSceneDelegate.pdf

## Page 1

This protocol defines methods that CarPlay calls when the scene connects and disconnects, and
your implementation provides the appropriate behavior when these events occur. For example,
setting the window’s root view controller when CarPlay connects your navigation app’s dashboard
scene.
You don’t create instances of your dashboard scene delegate directly. Instead, you specify the
name of the class as part of the CarPlay scene configuration you add to your Info.plist file—
see the example below—or that you return from your app delegate’s application(_:
configurationForConnecting:options:) method.
Overview
CarPlay / CPTemplateApplicationDashboardSceneDelegate
Protocol
CPTemplateApplicationDashboardScene
Delegate
The methods for responding to the life-cycle events of your navigation app’s
dashboard scene.
iOS 13.4+
iPadOS 13.4+
Mac Catalyst 13.4+


## Page 2

func templateApplicationDashboardScene(CPTemplateApplicationDashboard
Scene, didConnect: CPDashboardController, to: UIWindow)
Tells the delegate about the addition of a CarPlay Dashboard scene to your navigation app.
func templateApplicationDashboardScene(CPTemplateApplicationDashboard
Scene, didDisconnect: CPDashboardController, from: UIWindow)
Tells the delegate when CarPlay removes the dashboard scene from your navigation app.
NSObjectProtocol, UISceneDelegate
Integrating CarPlay with Your Navigation App
Configure your navigation app to work with CarPlay by displaying your custom map and
directions.
class CPTemplateApplicationDashboardScene
A CarPlay scene that controls your app’s dashboard navigation window.
class CPMapTemplate
A template that displays a navigation overlay that your app draws on the map.
class CPSearchTemplate
Topics
Responding to the Scene Life Cycle
Relationships
Inherits From
See Also
Navigation


## Page 3

A template that provides the ability to search for a destination and see a list of search results
class CPVoiceControlTemplate
A template that displays a voice control indicator during audio input.


