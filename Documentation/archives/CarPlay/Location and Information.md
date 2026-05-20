# Location and Information.pdf

## Page 1

The Point of Interest template displays selectable instances of CPPointOfInterest as
annotations on the template’s map, and as items in a scrollable picker that the template overlays o
the map. When the user selects a point of interest, the template displays a detail card that contain
secondary information and optional actions the user can perform. The template manages
clustering points of interest, selecting a point of interest, and zooming and panning the map.
To create a Point of Interest template, you call the init(title:pointsOfInterest:
selectedIndex:) method and provide an array of CPPointOfInterest objects to display in
the template’s map. Then call your interface controller’s pushTemplate(_:animated:
completion:) method to push it onto the navigation hierarchy, or add the template as a tab in
your CPTabBarTemplate.
You must create an object that implements the CPPointOfInterestTemplateDelegate
protocol and set it as the template’s delegate using the pointOfInterestDelegate property.
The template informs its delegate about changes to the map’s visible region so you can update th
points of interest the map displays.
Overview
Topics
Creating a Point of Interest Template
CarPlay / CPPointOfInterestTemplate
Class
CPPointOfInterestTemplate
A template that displays a map with selectable points of interest.
iOS 14.0+
iPadOS 14.0+
Mac Catalyst 14.0+


## Page 2

init(title: String, pointsOfInterest: [CPPointOfInterest], selectedInde
: Int)
Creates a Point of Interest template with a title, the points of interest to display, and the initia
selection’s index.
class CPPointOfInterest
An object that describes a point of interest on the template’s map and in its scrollable picker
var pointOfInterestDelegate: (any CPPointOfInterestTemplateDelegate)?
The object that serves as the template’s delegate.
protocol CPPointOfInterestTemplateDelegate
The methods to handle a Point of Interest template’s events.
var title: String
The scrollable picker’s title.
var pointsOfInterest: [CPPointOfInterest]
The points of interest the template displays on the map and in the scrollable picker.
func setPointsOfInterest([CPPointOfInterest], selectedIndex: Int)
Updates the points of interest and the current selection.
var selectedIndex: Int
The current selection’s index.
CPTemplate
Handling Template Events
Managing the Picker’s Title
Managing the Points of Interest
Relationships
Inherits From


## Page 3

CPBarButtonProviding
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
class CPInformationTemplate
A template that provides information for a point of interest, food order, parking location, or
charging location.
class CPTextButton
A button that displays a stylized title.
Integrating CarPlay with your quick-ordering app
Configure your food-ordering app to work with CarPlay.
Conforms To
See Also
Location and Information


## Page 4

An information template displays a list of items, and up to three actions the user can perform.
You use an information template to display informative, actionable content to the user. For examp
you might display a summary of the user’s food order, and provide actions to place or cancel the
order.
When creating an information template, you populate the list with an array of CPInformation
Item objects, and provide any contextual actions as an array of CPTextButton objects. The
template then arranges the list’s items using your choice of layout — see CPInformation
TemplateLayout for more information.
To display an information template, call your interface controller’s pushTemplate(_:animated
completion:) method to push it onto the navigation hierarchy, or presentTemplate(_:
animated:completion:) to present it modally.
Note
You can’t use CPInformationTemplate in apps with the audio entitlement.
Overview
CarPlay / CPInformationTemplate
Class
CPInformationTemplate
A template that provides information for a point of interest, food order, parking
location, or charging location.
iOS 14.0+
iPadOS 14.0+
Mac Catalyst 14.0+


## Page 5

init(title: String, layout: CPInformationTemplateLayout, items: [
CPInformationItem], actions: [CPTextButton])
Creates an information template that displays the provided items using the chosen layout.
var layout: CPInformationTemplateLayout
The layout that the template uses to arrange its items.
enum CPInformationTemplateLayout
The layout that an information template uses to arrange its items.
var title: String
The template’s title.
var items: [CPInformationItem]
The items that the template displays.
class CPInformationItem
A data object that provides content for an information template.
class CPInformationRatingItem
A data object that provides rated content for an information template.
var actions: [CPTextButton]
The actions that the template displays.
Topics
Creating an Information Template
Accessing the Layout
Managing the Title
Managing the Items
Managing the Actions


## Page 6

CPTemplate
CPBarButtonProviding
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
class CPPointOfInterestTemplate
A template that displays a map with selectable points of interest.
class CPTextButton
A button that displays a stylized title.
Integrating CarPlay with your quick-ordering app
Configure your food-ordering app to work with CarPlay.
Relationships
Inherits From
Conforms To
See Also
Location and Information


## Page 7

You use a text button to attach custom actions to an instance of CPPointOfInterest or
CPInformationTemplate. When creating a button, you provide a closure that CarPlay invokes
when the user taps the button. You communicate the button’s purpose using a title and a text sty
that the button applies to the title.
init(title: String, textStyle: CPTextButtonStyle, handler: ((CPText
Button) -> Void)?)
Creates a button that displays a title in a specific style.
var title: String
The text the button displays.
Overview
Topics
Creating a Text Button
Managing the Title
CarPlay / CPTextButton
Class
CPTextButton
A button that displays a stylized title.
iOS 14.0+
iPadOS 14.0+
Mac Catalyst 14.0+


## Page 8

var textStyle: CPTextButtonStyle
The text style the button applies to its title.
enum CPTextButtonStyle
The styles a button can apply to its title to communicate its action.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
class CPPointOfInterestTemplate
A template that displays a map with selectable points of interest.
class CPInformationTemplate
A template that provides information for a point of interest, food order, parking location, or
charging location.
Integrating CarPlay with your quick-ordering app
Managing the Button Style
Relationships
Inherits From
Conforms To
See Also
Location and Information


## Page 9

Configure your food-ordering app to work with CarPlay.


## Page 10

This sample code project demonstrates how to display custom ordering options in a vehicle using
CarPlay. The sample app integrates with the CarPlay framework by implementing CPTemplate
subclasses, such as CPPointOfInterestTemplate and CPListTemplate. This sample’s iOS
app component provides a logging interface to help you understand the life cycle of a CarPlay ap
CarPlay quick-ordering apps require a CarPlay quick-ordering entitlement, which you can request
here. After Apple grants the entitlement, follow these steps:
1. Log in to your account on the Apple Developer website and create a new provisioning profile th
includes the CarPlay quick ordering-app entitlement.
2. Import the newly created provisioning profile into Xcode.
3. Create an Entitlements.plist file in the project, if you don’t have one already.
4. Create a key for the CarPlay quick-ordering app entitlement as a Boolean. Make sure that the
target project setting CODE_SIGN_ENTITLEMENTS has the path of the Entitlements.plis
file.
Overview
Configure the sample code project
Handle communication with CarPlay
CarPlay / Integrating CarPlay with your quick-ordering app
Sample Code
Integrating CarPlay with your quick-
ordering app
Configure your food-ordering app to work with CarPlay.
Download
iOS 17.2+
macOS 14.0+
Xcode 15.4+


## Page 11

After a device connects to CarPlay and the sample app launches, it sets a root template to display
content onscreen. The system sets the root template on the CPInterfaceController when th
app connects to CarPlay. In this sample, the root template is an instance of CPTabBarTemplate
with a CPPointOfInterestTemplate as the template that initially displays.
The sample uses func pointOfInterestTemplate(_ aTemplate: CPPointOfInteres
Template, didChangeMapRegion region: MKCoordinateRegion) to keep the map in
focus. The data that CLLocationManager provides for a given location can change as a person
moving. This means the results need to update as the map region changes.
Keep the map in focus


## Page 12

After someone selects an item, options to place an order and open Maps for directions, or to call
the point of interest, appear onscreen, depending on metadata availability.
Because the sample relies on a person’s location to provide relevant results, handle permission
issues gracefully. The sample removes any presented view controllers and presents a message th
the location isn’t available.


## Page 13

After a person places an order, the system starts a Live Activity to show the order’s status. Live
Activities don’t display in CarPlay, but do provide a glanceable view on the person’s Lock Screen t
inform them about updates to their order.
Provide updates


## Page 14

After the Live Activity is running, you need to create a listener for updates to the state of the
activity and token changes. Your app can update Live Activities, but only in the foreground. If you
app spends significant amounts of time in the background, such as in a quick-ordering app, you
need to use notifications to provide updates to people using the app. The code example below
shows one way to listen for updates to the Live Activity token. Your app doesn’t need to support
background updates, or use any UIApplication cycle methods. The system wakes the proces
that contains your Live Activity when the token changes and calls the attached block of code on
the listener.


## Page 15

The sample includes a macOS target that provides a mock order status app. This is similar to wha
a service provider uses to convey updates to an order. The service app needs a JSON Web Token
(JWT) to create push notifications for use with Live Activities. The following code example shows
how the sample creates the JWT for use with the payload to send to Apple, which in turn sends a
push notification to the associated device:


## Page 16

class CPPointOfInterestTemplate
A template that displays a map with selectable points of interest.
class CPInformationTemplate
A template that provides information for a point of interest, food order, parking location, or
charging location.
class CPTextButton
A button that displays a stylized title.
See Also
Location and Information


