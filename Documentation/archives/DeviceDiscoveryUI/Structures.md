# Structures.pdf

## Page 1

static var `default`: DDDevicePairingAccess
Use the system’s default access for the device selected by the user.
static var permanent: DDDevicePairingAccess
Grant the app permanent access to the device selected by the user for future use.
Topics
Type Properties
DeviceDiscoveryUI / DDDevicePairingAccess
Structure
DDDevicePairingAccess
Specifies the access level requested for device discovery.
iOS 26.0+
iPadOS 26.0+
Mac Catalyst 26.0+


## Page 2

A DevicePairingView should be used to become discoverable to local devices from the user
through a button interface.
init(any ListenerProvider, access: DDDevicePairingAccess, label: () ->
Label, fallback: () -> Fallback)
Creates a DevicePairingView which, when pressed, will display a local device advertiser
interface.
Overview
Topics
Initializers
Relationships
Conforms To
DeviceDiscoveryUI / DevicePairingView
Structure
DevicePairingView
A control that allows a user to become discoverable and advertise to local devices
DeviceDiscoveryUI
SwiftUI
iOS 26.0+
iPadOS 26.0+
Mac Catalyst 26.0+


## Page 3

Sendable, SendableMetatype, View


