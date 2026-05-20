# 002_DDDevicePickerViewController.pdf

## Page 1

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


## Page 2

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


## Page 3

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


## Page 4

NSApplicationServices
A list of service providers and the devices that they support.


