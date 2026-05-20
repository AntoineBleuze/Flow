# Selecting nearby devices.pdf

## Page 1

The DeviceDiscoveryUI framework provides a view that shows all the available iOS, iPadOS, and
watchOS devices on your local network. Present this view in your tvOS app, to let the user select 
device. The framework then creates an encrypted connection between your tvOS app and the
selected device. This lets user’s enhance the tvOS experience. For example, they could control a
tvOS game from their iPad, or send heart rate data from their watchOS app to the tvOS workout
app. It also lets your app connect to devices across the local network, without giving your app
access to the entire network.
To create a network connection, start by defining which devices your app can connect with. Your
app defines one or more application services. Each application service represents a different type
of connection that can support a different subset of devices. Next display the list of available
devices in a device picker view in your tvOS app using one of the application services. If the user
selects a device, the device picker view returns an NWEndpoint for the selected device. Use this
endpoint to create a connection, and then use the connection to communicate with the device.
In your iOS, iPadOS, or watchOS app, declare that your app listens for DeviceDiscoveryUI
connections. Then, as soon as your app launches, create an NWListener. When the tvOS app
connects to the listener, the listener returns a connection that your app can use to communicate
with the tvOS app.
You use DeviceDiscoveryUI to present the device picker view, and then use the Network framewo
to create the listeners, create the connections, and send and receive messages.
Overview
Define the supported devices in tvOS
DeviceDiscoveryUI / Connecting a tvOS app to other devices over the local network
Article
Connecting a tvOS app to other devices
over the local network
Display a view in your tvOS app that lists available iOS, iPadOS, and watchOS
devices that the user can connect to over their local network.


## Page 2

Start by defining the application service identifiers that your apps use to establish their
connections. Use the NSApplicationServices key to define the application services for your
app. You provide a service identifier, a usage description, and a list of supported devices for each
service. You can define more than one application service for your apps. Each service has it’s own
identifier, and can connect to a different subset of devices.
Declare the application services in your app target’s Info tab, or in its Info.plist file.
You can use the human-readable key names in Xcode’s property list editor.


## Page 3

Next, create and display the device picker view in your tvOS app. The following code creates and
displays a DevicePicker view using SwiftUI.
Display the list of available devices


## Page 4

Display the DevicePicker as a modal view that covers the full screen. This example uses full
ScreenCover(isPresented:onDismiss:content:) to display the device picker view whe
the user clicks the Connect button.
To create the device picker view, pass an NWBrowser.Descriptor that you created using the
NWBrowser.Descriptor.applicationService(name:options:) method. Use the
identifier that you defined in your app’s Info.plist file for the descriptor’s name.
Next, provide an onSelect closure that takes a single NWEndpoint value. The system calls this
closure after the user selects a device to connect to. Use the closure to set up a connection to th
endpoint.
Then include a Label view to represent your app in the device picker view, and pass the default
application service parameters using the applicationService property. The default
parameters create an encrypted, optimized connection between two devices on your local netwo
You can also add protocols defined with an NWProtocolFramer to these defaults to support
application-level messaging in your app.
When presented, the view shows all the supported devices on the local network.
These devices:
Are logged into your local network.
Are logged into the iCloud account (or another account in the iCloud family) of the default user
on Apple TV.
Match the device type specified in your NSApplicationServicePlatformSupport key.
If the user selects a device, the system calls your onSelect closure. If they dismiss the device
picker view, control returns to the view that displayed the device picker view.
Note
While you can display the DevicePicker view in Simulator, it won’t show any devices on the
local network. To test connections, run your code on a test device instead.
If you’re using UIKit, use a DDDevicePickerViewController to present the device picker vie


## Page 5

This view controller works similarly to the DevicePicker view. The biggest difference is how yo
app receives the selected endpoint. In this sample, your app awaits a read on the controller’s
endpoint property. This causes execution to pause at that point. When the user selects a device
the system returns an endpoint for that device, and execution continues. If the user dismisses the
view, the controller throws an error.
Alternatively, you can pass a block to the DDDevicePickerViewController object’s set
DevicePickerCompletionHandler: method, and the system calls this block when the user
selects a device from the device picker view.
As soon as the user selects a device, the system passes you an NWEndpoint. Use this endpoint 
connect to the selected device. Create an NWConnection, passing it both the endpoint and the
parameters that you used to create the device picker view.
You can then use this connection to send or receive messages to the connected device.
Connect to the provided endpoint


## Page 6

Before a device can appear in the picker view, declare that the iOS, iPadOS, or watchOS version o
your app listens for connections.
Start by defining the application service in your app target’s Info tab, or in its Info.plist file.
Make sure the NSApplicationServiceIdentifier matches the value specified in your tvOS
app. The following example shows setting up the MyApp-Workout identifier on a watchOS app.
You can use the human-readable key names in Xcode’s property list editor.
Next, to connect to your tvOS app, other versions of your app must set up a listener as soon as th
app launches. The network picker can then connect to this listener.
To create a listener, use the init(applicationService:) initializer, and pass the same
application service name that you used in your tvOS app.
Declare that other devices listen for connections
Set up the listeners on iOS, iPadOS, or watchOS


## Page 7

Then, create a connection handler for the listener. The system calls this closure when it creates th
connection to your tvOS app. You can use this connection to read and write messages.
You can also define a state change update handler to track changes to the listener’s state.
Finally, start the listener.


## Page 8

Start the listener as quickly as possible after your app launches. This ensures that the listener is
ready and waiting when the tvOS app attempts to connect.
struct DevicePicker
A SwiftUI view that displays other devices on the network, and creates an encrypted
connection to a copy of your app running on that device.
class DDDevicePickerViewController
A UIKit view that displays other devices on the network, and creates an encrypted connectio
to a copy of your app running on that device.
struct DevicePickerSupportedAction
An environment value that indicates whether the current device supports device discovery.
NSApplicationServices
A list of service providers and the devices that they support.
See Also
Selecting nearby devices


## Page 9

Connecting a tvOS app to other devices over the local network
Always display the picker as a full-screen, modal view. If the user selects a device, the system cal
the closure you passed as the onSelect parameter. If the user cancels the picker, it silently
closes.
Mentioned in
Overview
DeviceDiscoveryUI / DevicePicker
Structure
DevicePicker
A SwiftUI view that displays other devices on the network, and creates an
encrypted connection to a copy of your app running on that device.
DeviceDiscoveryUI
SwiftUI
iOS 26.0+
iPadOS 26.0+
Mac Catalyst 26.0+
tvOS 16.0+


## Page 10

If the current device doesn’t support device discovery, the system displays the fallback view
instead of the device picker. Use the DevicePickerSupportedAction environment value to check
whether the current device supports device discovery.
init(NWBrowser.Descriptor, onSelect: (NWEndpoint) -> Void, label: () ->
Label, fallback: () -> Fallback, parameters: (() -> NWParameters)?)
Creates a view that displays the other, available devices on your local network.
init<Provider>(Provider, access: DDDevicePairingAccess, onSelect: (
Provider.Endpoint) -> Void, label: () -> Label, fallback: () -> Fallbac
, parameters: (() -> NWParameters)?)
Topics
Creating a device picker
Initializers
Relationships


## Page 11

Sendable, SendableMetatype, View
Connecting a tvOS app to other devices over the local network
Display a view in your tvOS app that lists available iOS, iPadOS, and watchOS devices that th
user can connect to over their local network.
class DDDevicePickerViewController
A UIKit view that displays other devices on the network, and creates an encrypted connectio
to a copy of your app running on that device.
struct DevicePickerSupportedAction
An environment value that indicates whether the current device supports device discovery.
NSApplicationServices
A list of service providers and the devices that they support.
Conforms To
See Also
Selecting nearby devices


## Page 12

Connecting a tvOS app to other devices over the local network
Always display the device picker as a full-screen, modal view. If the user selects a device, the
system sets the endpoint property and calls the endpointPickedHandler.
Mentioned in
Overview
DeviceDiscoveryUI / DDDevicePickerViewController
Class
DDDevicePickerViewController
A UIKit view that displays other devices on the network, and creates an encrypted
connection to a copy of your app running on that device.
iOS 26.0+
iPadOS 26.0+
Mac Catalyst 26.0+
tvOS 16.0+


## Page 13

static func isSupported(NWBrowser.Descriptor, using: NWParameters?) ->
Bool
Returns a Boolean value that indicates whether the current device supports device discovery
convenience init?(browseDescriptor: NWBrowser.Descriptor, parameters:
NWParameters?)
Creates a view controller that displays the other, available devices on your local network.
var endpoint: NWEndpoint
A network connection endpoint for the device selected by the user.
convenience init?(browseDescriptor: NWBrowser.Descriptor, parameters:
NWParameters?, access: DDDevicePairingAccess)
Topics
Creating device picker view controllers
Accessing the selected endpoint
Initializers
Relationships
Inherits From


## Page 14

UIViewController
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCoding
NSExtensionRequestHandling
NSObjectProtocol
Sendable
SendableMetatype
UIActivityItemsConfigurationProviding
UIAppearanceContainer
UIContentContainer
UIFocusEnvironment
UIPasteConfigurationSupporting
UIResponderStandardEditActions
UIStateRestoring
UITraitChangeObservable
UITraitEnvironment
UIUserActivityRestoring
Connecting a tvOS app to other devices over the local network
Display a view in your tvOS app that lists available iOS, iPadOS, and watchOS devices that th
user can connect to over their local network.
struct DevicePicker
A SwiftUI view that displays other devices on the network, and creates an encrypted
connection to a copy of your app running on that device.
struct DevicePickerSupportedAction
An environment value that indicates whether the current device supports device discovery.
Conforms To
See Also
Selecting nearby devices


## Page 15

NSApplicationServices
A list of service providers and the devices that they support.


## Page 16

Access the action using the .devicePickerSupports key. Then call it as a function, passing t
same browse descriptor and parameters you use to search for devices.
Overview
DeviceDiscoveryUI / DevicePickerSupportedAction
Structure
DevicePickerSupportedAction
An environment value that indicates whether the current device supports device
discovery.
DeviceDiscoveryUI
SwiftUI
tvOS 16.0+


## Page 17

func callAsFunction(NWBrowser.Descriptor, parameters: (() ->
NWParameters)?) -> Bool
Returns a Boolean value that indicates whether the current device supports device discovery
Connecting a tvOS app to other devices over the local network
Display a view in your tvOS app that lists available iOS, iPadOS, and watchOS devices that th
user can connect to over their local network.
struct DevicePicker
A SwiftUI view that displays other devices on the network, and creates an encrypted
connection to a copy of your app running on that device.
class DDDevicePickerViewController
A UIKit view that displays other devices on the network, and creates an encrypted connectio
to a copy of your app running on that device.
NSApplicationServices
A list of service providers and the devices that they support.
Topics
Checking for support
See Also
Selecting nearby devices


## Page 18

Type
Object
Use this key to define which devices DeviceDiscoveryUI can connect with. The application
services’s Browses key takes an array of dictionaries, where each dictionary contains a unique
identifier, a usage description string, and a list of supported operating systems. You can define
more than one application service for your apps. Each service has its own identifier, and can
connect to a different subset of devices.
Set these in your tvOS app target’s Info tab, or in its Info.plist file.
Details
Discussion
Bundle Resources / Information Property List / NSApplicationServices
Property List Key
NSApplicationServices
A list of service providers and the devices that they support.
iOS 16.0+
iPadOS 16.0+
tvOS 16.0+
watchOS 9.0+


## Page 19

NSApplicationServiceIdentifier
A string that identifies your application service. You can use any string for your service, but y
must use the same string for both your tvOS app and the iOS, iPadOS, and watchOS apps.
NSApplicationServiceUsageDescription
A string that describes why you want to access the other devices. This is displayed to the use
in the picker view.
NSApplicationServicePlatformSupport
This is an array that contains strings representing the types of devices your application servic
can connect to. The valid values are “iOS”, “iPadOS”, and “watchOS”.
You can use the human-readable key names in Xcode’s property list editor.
In the iOS, iPadOS, or watchOS app, use the Advertises key, and give it an array of dictionaries
where each dictionary lists the application service identifier for the connection types supported o
this platform.


## Page 20

You can use the human-readable key names in Xcode’s property list editor.
Advertises
An array of dictionaries, where each dictionary contains a unique identifier.
Browses
An array of dictionaries, where each dictionary contains a unique identifier, a usage
description string, and a list of supported OSs.
Topics
Property List Keys


