# 003_Integrating CarPlay with your quick-ordering app.pdf

## Page 1

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


## Page 2

After a device connects to CarPlay and the sample app launches, it sets a root template to display
content onscreen. The system sets the root template on the CPInterfaceController when th
app connects to CarPlay. In this sample, the root template is an instance of CPTabBarTemplate
with a CPPointOfInterestTemplate as the template that initially displays.
The sample uses func pointOfInterestTemplate(_ aTemplate: CPPointOfInteres
Template, didChangeMapRegion region: MKCoordinateRegion) to keep the map in
focus. The data that CLLocationManager provides for a given location can change as a person
moving. This means the results need to update as the map region changes.
Keep the map in focus


## Page 3

After someone selects an item, options to place an order and open Maps for directions, or to call
the point of interest, appear onscreen, depending on metadata availability.
Because the sample relies on a person’s location to provide relevant results, handle permission
issues gracefully. The sample removes any presented view controllers and presents a message th
the location isn’t available.


## Page 4

After a person places an order, the system starts a Live Activity to show the order’s status. Live
Activities don’t display in CarPlay, but do provide a glanceable view on the person’s Lock Screen t
inform them about updates to their order.
Provide updates


## Page 5

After the Live Activity is running, you need to create a listener for updates to the state of the
activity and token changes. Your app can update Live Activities, but only in the foreground. If you
app spends significant amounts of time in the background, such as in a quick-ordering app, you
need to use notifications to provide updates to people using the app. The code example below
shows one way to listen for updates to the Live Activity token. Your app doesn’t need to support
background updates, or use any UIApplication cycle methods. The system wakes the proces
that contains your Live Activity when the token changes and calls the attached block of code on
the listener.


## Page 6

The sample includes a macOS target that provides a mock order status app. This is similar to wha
a service provider uses to convey updates to an order. The service app needs a JSON Web Token
(JWT) to create push notifications for use with Live Activities. The following code example shows
how the sample creates the JWT for use with the payload to send to Apple, which in turn sends a
push notification to the associated device:


## Page 7

class CPPointOfInterestTemplate
A template that displays a map with selectable points of interest.
class CPInformationTemplate
A template that provides information for a point of interest, food order, parking location, or
charging location.
class CPTextButton
A button that displays a stylized title.
See Also
Location and Information


