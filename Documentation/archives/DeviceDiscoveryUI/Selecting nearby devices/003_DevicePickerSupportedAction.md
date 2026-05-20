# 003_DevicePickerSupportedAction.pdf

## Page 1

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


## Page 2

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


