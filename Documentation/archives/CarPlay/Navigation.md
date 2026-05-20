# Navigation.pdf

## Page 1

Coastal Roads is a sample navigation app that demonstrates how to display a custom map and
navigation instructions in a CarPlay–enabled vehicle. Coastal Roads integrates with the CarPlay
framework by implementing the map and additional CPTemplate subclasses, such as CPGrid
Template and CPListTemplate. This sample’s iOS app component provides a logging interfac
to help you understand the life cycle of a CarPlay app.
After the app connects to CarPlay, it immediately sets a root template to display content onscreen
The sample sets the root template on the CPInterfaceController when the app connects to
CarPlay. In all navigation apps, the root template must be an instance of CPMapTemplate and
contain no additional graphics or UI elements.
The following code shows an example implementation of setting a root template:
Overview
Handle Communication with CarPlay
CarPlay / Integrating CarPlay with Your Navigation App
Sample Code
Integrating CarPlay with Your Navigation
App
Configure your navigation app to work with CarPlay by displaying your custom
map and directions.
Download
iOS 15.4+
Xcode 15.0+


## Page 2

Coastal Roads demonstrates various templates in CarPlay. The sample includes an image to serve
as the map. All overlays must be a type of template that CarPlay provides. The map must cover th
entire screen, which the sample accomplishes using constraints. The CPMapTemplate also
provides native support for zooming and panning. Additional functionality, such as customizing
default button behavior, is available.
The following code shows an example implementation of customizing the default behavior of the
panning, preview, and trip start actions on CPMapTemplate:
Render a Map as the Base Template


## Page 3

See CPMapTemplateDelegate for more information.
class CPTemplateApplicationDashboardScene
A CarPlay scene that controls your app’s dashboard navigation window.
protocol CPTemplateApplicationDashboardSceneDelegate
The methods for responding to the life-cycle events of your navigation app’s dashboard
scene.
class CPMapTemplate
A template that displays a navigation overlay that your app draws on the map.
class CPSearchTemplate
A template that provides the ability to search for a destination and see a list of search results
class CPVoiceControlTemplate
A template that displays a voice control indicator during audio input.
See Also
Navigation


## Page 4

A dashboard scene manages the display of your navigation app’s dashboard window on the
CarPlay Dashboard, and notifies its delegate—an object that conforms to CPTemplate
ApplicationDashboardSceneDelegate—about scene life-cycle events. Use the dashboard
controller the scene provides to supply shortcut buttons to display when there’s no active
navigation session, further customizing you app’s presence on the CarPlay Dashboard.
You don’t create an instance of the dashboard scene directly. Instead, you specify the name of th
class as part of the CarPlay Dashboard scene configuration that you add to your Info.plist file
—see the example below—or that you return from your app delegate’s application(_:
configurationForConnecting:options:) method.
Overview
CarPlay / CPTemplateApplicationDashboardScene
Class
CPTemplateApplicationDashboardScene
A CarPlay scene that controls your app’s dashboard navigation window.
iOS 13.4+
iPadOS 13.4+
Mac Catalyst 13.4+


## Page 5

var delegate: (any CPTemplateApplicationDashboardSceneDelegate)?
The object that receives the dashboard scene’s life-cycle events.
protocol CPTemplateApplicationDashboardSceneDelegate
The methods for responding to the life-cycle events of your navigation app’s dashboard
scene.
var dashboardController: CPDashboardController
The controller that manages the dashboard scene’s shortcut buttons.
class CPDashboardController
A controller that provides shortcut buttons for the CarPlay Dashboard.
var dashboardWindow: UIWindow
The window that belongs to the dashboard scene.
UIScene
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Topics
Responding to the Dashboard Scene Life Cycle
Accessing the Dashboard Controller
Accessing the Dashboard Window
Relationships
Inherits From
Conforms To


## Page 6

Hashable
NSObjectProtocol
NSTouchBarProvider
Sendable
SendableMetatype
UIActivityItemsConfigurationProviding
UIPasteConfigurationSupporting
UIResponderStandardEditActions
UIUserActivityRestoring
Integrating CarPlay with Your Navigation App
Configure your navigation app to work with CarPlay by displaying your custom map and
directions.
protocol CPTemplateApplicationDashboardSceneDelegate
The methods for responding to the life-cycle events of your navigation app’s dashboard
scene.
class CPMapTemplate
A template that displays a navigation overlay that your app draws on the map.
class CPSearchTemplate
A template that provides the ability to search for a destination and see a list of search results
class CPVoiceControlTemplate
A template that displays a voice control indicator during audio input.
See Also
Navigation


## Page 7

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


## Page 8

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


## Page 9

A template that provides the ability to search for a destination and see a list of search results
class CPVoiceControlTemplate
A template that displays a voice control indicator during audio input.


## Page 10

After CarPlay calls your scene delegate’s templateApplicationScene(_:didConnect:to
method, create a map template and set it as the root template by calling setRootTemplate(_:
animated:completion:) on the interface controller the method provides.
The map template appears as an overlay on top of the base view. The template is the control laye
providing a navigation bar and map buttons that users interact with through the CarPlay screen.
Note
The base view is where your app draws its map. CarPlay doesn’t support direct user
interactions in this view. Instead, your app uses templates, which overlay the base view, to
allow users to interact with your app through the CarPlay screen.
When the user begins to interact with your app through the CarPlay screen, the system displays
the navigation bar, hiding it after a brief period of inactivity. You can change this behavior by setti
the automaticallyHidesNavigationBar and hidesButtonsWithNavigationBar
properties.
The navigation bar includes up to two leading and two trailing buttons. You can change the button
including their titles and icon images, by setting the leadingNavigationBarButtons and
trailingNavigationBarButtons properties on your template.
Overview
CarPlay / CPMapTemplate
Class
CPMapTemplate
A template that displays a navigation overlay that your app draws on the map.
iOS 12.0+
iPadOS 12.0+
Mac Catalyst 13.1+


## Page 11

You can display additional map buttons by providing an array of CPMapButton objects to map
Buttons. Use these buttons to provide users access to actions, such as entering panning mode 
zooming in and out on the map.
var automaticallyHidesNavigationBar: Bool
A Boolean value that indicates whether the template should automatically hide the navigatio
bar.
var hidesButtonsWithNavigationBar: Bool
A Boolean value that tells the system to hide the map buttons when hiding the navigation ba
var guidanceBackgroundColor: UIColor
The background color the map template uses when displaying guidance.
var mapDelegate: (any CPMapTemplateDelegate)?
The object that serves as the delegate of the map template.
protocol CPMapTemplateDelegate
The protocol an object implements to handle events from a map template.
var mapButtons: [CPMapButton]
An array of map buttons on the trailing bottom corner of the map template.
class CPMapButton
A button that represents an action that a map template displays on the CarPlay screen.
func showTripPreviews([CPTrip], textConfiguration: CPTripPreviewText
Configuration?)
Displays the preview for one or more trips, and allows route selection.
Topics
Configuring Map Templates
Handling Map Template Events
Managing Map Buttons
Displaying Trip Previews


## Page 12

func showTripPreviews([CPTrip], selectedTrip: CPTrip?, textConfiguratio
: CPTripPreviewTextConfiguration?)
Displays the previews for a collection of trips, with a single selected trip.
func hideTripPreviews()
Hides the display of trip previews.
func showRouteChoicesPreview(for: CPTrip, textConfiguration: CPTrip
PreviewTextConfiguration?)
Displays the route choices for a single trip.
class CPTripPreviewTextConfiguration
A configuration object for changing the button titles on a trip preview.
func startNavigationSession(for: CPTrip) -> CPNavigationSession
Begins navigational guidance for a trip.
class CPNavigationSession
An object that represents an active route guidance session.
func updateEstimates(CPTravelEstimates, for: CPTrip)
Updates travel estimates, such as arrival time and the remaining time and distance for a trip.
func update(CPTravelEstimates, for: CPTrip, with: CPTimeRemainingColor)
Updates travel estimates, such as arrival time and the remaining time and distance for a trip,
with the specified time-remaining color.
enum CPTimeRemainingColor
The color the system uses when displaying the time remaining for a trip.
var tripEstimateStyle: CPTripEstimateStyle
The style that the map template uses when displaying trip estimates during active nagivation
enum CPTripEstimateStyle
The set of display styles for trip estimates.
Navigating a Trip
Providing Trip Estimates
Displaying a Navigation Alert


## Page 13

func present(navigationAlert: CPNavigationAlert, animated: Bool)
Displays a navigation alert on the map template.
func dismissNavigationAlert(animated: Bool, completion: (Bool) -> Void)
Tells the map template to dismiss the visable navigation alert.
var currentNavigationAlert: CPNavigationAlert?
The visible navigation alert.
class CPNavigationAlert
An alert that displays map- or navigation-related information to the user.
func showPanningInterface(animated: Bool)
Shows the panning interface on the map.
func dismissPanningInterface(animated: Bool)
Dismisses the panning interface.
var isPanningInterfaceVisible: Bool
A Boolean value that indicates whether the map template is displaying the panning interface
CPTemplate
CPBarButtonProviding
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCoding
NSObjectProtocol
Panning the Map
Relationships
Inherits From
Conforms To


## Page 14

NSSecureCoding
Sendable
SendableMetatype
Integrating CarPlay with Your Navigation App
Configure your navigation app to work with CarPlay by displaying your custom map and
directions.
class CPTemplateApplicationDashboardScene
A CarPlay scene that controls your app’s dashboard navigation window.
protocol CPTemplateApplicationDashboardSceneDelegate
The methods for responding to the life-cycle events of your navigation app’s dashboard
scene.
class CPSearchTemplate
A template that provides the ability to search for a destination and see a list of search results
class CPVoiceControlTemplate
A template that displays a voice control indicator during audio input.
See Also
Navigation


## Page 15

Use this template to provide the ability to search for a destination. When CarPlay displays the
template, the user sees a search field, a Cancel button, and a localized keyboard. The template
also shows the list of search results after your app completes the search request.
Note
Some vehicles may limit the display of the keyboard. Check the limitedUserInterfaces
property to determine whether there are limits.
To use a search template, create an instance of CPSearchTemplate and set its delegate to an
object that conforms to the CPSearchTemplateDelegate protocol. Push the template onto th
navigation hierarchy by calling pushTemplate(_:animated:completion:) on the interface
controller. This presents the search template to the user.
As the user enters text into the search field, the system calls the delegate method search
Template(_:updatedSearchText:completionHandler:), indicating that your app shoul
retrieve the search result. After retrieving the results, call completionHandler to return an arra
of CPListItem objects—one list item for each search result item.
When the user selects an item from the search result, the system calls the searchTemplate(_
selectedResult:completionHandler:) method on the delegate object. The delegate
Overview
CarPlay / CPSearchTemplate
Class
CPSearchTemplate
A template that provides the ability to search for a destination and see a list of
search results.
iOS 12.0+
iPadOS 12.0+
Mac Catalyst 13.1+


## Page 16

performs any necessary operations to process the selected item, then calls the completion handl
to let the system know it can continue.
var delegate: (any CPSearchTemplateDelegate)?
The object that serves as the search template’s delegate.
protocol CPSearchTemplateDelegate
The interface for an object that serves as the search template’s delegate.
CPTemplate
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCoding
NSObjectProtocol
NSSecureCoding
Sendable
SendableMetatype
Topics
Providing a Search Template Delegate
Relationships
Inherits From
Conforms To
See Also
Navigation


## Page 17

Integrating CarPlay with Your Navigation App
Configure your navigation app to work with CarPlay by displaying your custom map and
directions.
class CPTemplateApplicationDashboardScene
A CarPlay scene that controls your app’s dashboard navigation window.
protocol CPTemplateApplicationDashboardSceneDelegate
The methods for responding to the life-cycle events of your navigation app’s dashboard
scene.
class CPMapTemplate
A template that displays a navigation overlay that your app draws on the map.
class CPVoiceControlTemplate
A template that displays a voice control indicator during audio input.


## Page 18

CarPlay navigation apps must show a voice control indicator during audio input by presenting a
voice control template. When creating the template, provide one or more CPVoiceControlStat
objects. To switch between states, call the activateVoiceControlState(with
Identifier:) method.
init(voiceControlStates: [CPVoiceControlState])
Creates a voice control template with a list of voice control states.
class CPVoiceControlState
A voice control state containing title variants and images for use by a voice control template
func activateVoiceControlState(withIdentifier: String)
Overview
Topics
Creating a Voice Control Template
Activating a State
CarPlay / CPVoiceControlTemplate
Class
CPVoiceControlTemplate
A template that displays a voice control indicator during audio input.
iOS 12.0+
iPadOS 12.0+
Mac Catalyst 13.1+


## Page 19

Changes the template’s state to the one matching the specified identifier.
var activeStateIdentifier: String?
The identifier of the template’s current voice control state.
var voiceControlStates: [CPVoiceControlState]
The array of voice control states available to the template.
CPTemplate
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCoding
NSObjectProtocol
NSSecureCoding
Sendable
SendableMetatype
Integrating CarPlay with Your Navigation App
Configure your navigation app to work with CarPlay by displaying your custom map and
directions.
Getting Available States
Relationships
Inherits From
Conforms To
See Also
Navigation


## Page 20

class CPTemplateApplicationDashboardScene
A CarPlay scene that controls your app’s dashboard navigation window.
protocol CPTemplateApplicationDashboardSceneDelegate
The methods for responding to the life-cycle events of your navigation app’s dashboard
scene.
class CPMapTemplate
A template that displays a navigation overlay that your app draws on the map.
class CPSearchTemplate
A template that provides the ability to search for a destination and see a list of search results


