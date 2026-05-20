# 001_DevicePicker.pdf

## Page 1

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


## Page 2

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


## Page 3

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


