# Entitlements.pdf

## Page 1

DriverKit services communicate with sensitive parts of the system, including kernel objects and
attached hardware peripherals. To ensure that these interactions don’t compromise the security o
integrity of the system, the system loads only drivers that have a valid set of entitlements. The
DriverKit entitlements give your driver permission to run as a driver, define the type of hardware
your driver supports, and sometimes define the family to which your driver belongs.
When you develop a DriverKit extension, you deliver that extension inside in a specific directory o
your app bundle. The app handles the activation of your extension, which registers it with the
system and makes its services available for use. To perform this installation, your app must have
the System Extension entitlement.
Before you request entitlements, gather information about the hardware devices for which you’ll
need drivers. Specifically, you’ll need the following information:
The transport mechanism for your hardware. DriverKit supports USB, PCI, HID, networking, and
serial devices.
Your company’s hardware vendor ID for the type of devices.
Brief descriptions of the devices.
A brief description of the app you’ll use to install the driver.
Overview
Gather Information About Your Hardware Devices
Request the DriverKit Entitlements You Need
DriverKit / Requesting Entitlements for DriverKit Development
Article
Requesting Entitlements for DriverKit
Development
Request the entitlement for DriverKit development, and request other entitlement
your driver needs to interact with specific devices and interfaces.


## Page 2

Before you begin developing drivers for your hardware, request the entitlements you need from
Apple:
1. Go to https://developer.apple.com/system-extensions/ and click the link to request an
entitlement.
2. Apply for the DriverKit entitlement and specify the entitlements you need.
3. Provide a description of the apps you’ll use to support your hardware.
Apple ties any requested entitlements to your development team’s profile. When making the
request, specify the complete set of entitlements you use to support one product. For example,
when developing HID devices, you might ask Apple to create a single group that contains the com
.apple.developer.driverkit, com.apple.developer.driverkit.transport.hid,
and com.apple.developer.driverkit.family.hid.eventservice entitlements. All of
the requested entitlements must belong to the same group.
Note
While waiting for Apple to grant your entitlement requests, you can continue to develop and
test your drivers on your local systems. For information about how to disable the necessary
security checks, see Debugging and testing system extensions.
Xcode provides a default entitlements file for every new DriverKit driver you create. This file is
separate from your app’s entitlements file, and contains only the entitlements that your driver
needs to run.
Edit your driver’s entitlements file and add the entitlements that match the services your driver
offers. The default driver entitlements file contains only the DriverKit and App Sandbox
entitlements. Most drivers require a transport-specific entitlement to tell the system what type of
hardware they support. For example, a driver that implements an event service to communicate
with a HID device must include the following entitlements in its entitlements file:
com.apple.developer.driverkit.transport.hid
com.apple.developer.driverkit.family.hid.eventservice
When activating your driver, the system validates the entitlements in your driver’s entitlements file
with the information you used to codesign your driver. If the entitlements don’t match, the system
aborts the activation process.
For infomation about specific entitlements, see the reference documentation.
Update Your Driver’s Entitlements File


## Page 3

To distribute a driver using the entitlements that Apple provides, go to the Certificates, Identifiers
Profiles section of the Apple developer portal (https://developer.apple.com) and do the following:
Configure an App ID for your driver, in the Identifiers section.
Configure a provisioning profile for your App ID, in the Profiles section.
When you create the provisioning profile for your driver, the portal prompts you to select any
additional entitlements to include with your profile. Select the DriverKit-related entitlements group
that Apple added to your development team. You can select only one group, so that group must
contain all of the entitlements your driver needs to operate. Download the resulting provisioning
profile and configure it as the provisioning profile for your driver.
Note
During development, you can temporarily disable the normal security checks to simplify the
debugging process for your drivers. For more information, see Debugging and testing system
extensions.
The app you use to deliver your driver to users must also have specific entitlements to support th
activation process. To add these entitlements to your app, enable the System Extension capability
for your app target.
1. Open your app project in Xcode.
2. Select your app target.
3. Navigate to the Signing & Capabilities tab.
4. Add the System Extension capability.
For more information about how to install drivers, see Installing System Extensions and
Drivers.
com.apple.developer.driverkit
Configure Your Driver’s Provisioning Profile
Add the System Extension Capability to Your App
See Also
Entitlements


## Page 4

A Boolean value that indicates whether your extension has permission to run as a user-space
driver.
com.apple.developer.driverkit.userclient-access
An array of strings that represent macOS driver extensions that may communicate with othe
DriverKit services.
com.apple.developer.driverkit.allow-any-userclient-access
A Boolean value that determines whether a macOS driver accepts user client connections
from any application.
Communicates with Drivers
A Boolean value that indicates whether an iPadOS app can communicate with drivers.
DriverKit Allow Third Party User Clients
A Boolean value that indicates whether an iPadOS driver accepts calls from third-party user
clients.


## Page 5

Type
Boolean
Add this entitlement to every DriverKit driver you create. You must request this entitlement from
Apple. For information about how to request the entitlement, see System Extensions and DriverKi
Details
Discussion
Bundle Resources / Entitlements / com.apple.developer.driverkit
Property List Key
com.apple.developer.driverkit
A Boolean value that indicates whether your extension has permission to run as a
user-space driver.
iOS 16.0+
iPadOS 16.0+
macOS 10.15+


## Page 6

Type
Array of strings
Add this entitlement to your app that opens the IOUserClient. Set its value to an array of bund
IDs of driver extensions that you want to use with DriverKit. If you have only one bundle ID, you ca
use either a single string or a one-element array.
On iPadOS, use the Communicates with Drivers entitlement instead.
com.apple.developer.driverkit.allow-any-userclient-access
A Boolean value that determines whether a macOS driver accepts user client connections
from any application.
Communicates with Drivers
Details
Discussion
See Also
User client entitlements
Bundle Resources / Entitlements / com.apple.developer.driverkit.userclient-access
Property List Key
com.apple.developer.driverkit.userclient-
access
An array of strings that represent macOS driver extensions that may communicat
with other DriverKit services.
macOS 10.15+


## Page 7

A Boolean value that indicates whether an iPadOS app can communicate with drivers.
Key: com.apple.developer.driverkit.communicates-with-drivers
DriverKit Allow Third Party User Clients
A Boolean value that indicates whether an iPadOS driver accepts calls from third-party user
clients.
Key: com.apple.developer.driverkit.allow-third-party-userclients


## Page 8

Type
Boolean
Add this entitlement to your dext that contains an IOUserClient implementation. This
entitlement allows any application to connect to the dext without having to specify bundle IDs, as
com.apple.developer.driverkit.userclient-access requires.
com.apple.developer.driverkit.userclient-access
An array of strings that represent macOS driver extensions that may communicate with othe
DriverKit services.
Communicates with Drivers
A Boolean value that indicates whether an iPadOS app can communicate with drivers.
Key: com.apple.developer.driverkit.communicates-with-drivers
Details
Discussion
See Also
User client entitlements
Bundle Resources / Entitlements / com.apple.developer.driverkit.allow-any-userclient-access
Property List Key
com.apple.developer.driverkit.allow-any-
userclient-access
A Boolean value that determines whether a macOS driver accepts user client
connections from any application.
macOS 10.15+


## Page 9

DriverKit Allow Third Party User Clients
A Boolean value that indicates whether an iPadOS driver accepts calls from third-party user
clients.
Key: com.apple.developer.driverkit.allow-third-party-userclients


## Page 10

Key
com.apple.developer.driverkit.communicates-with-drivers
Type
Boolean
When true, this entitlement allows your app to open user clients to one or more drivers.
On macOS, use the com.apple.developer.driverkit.userclient-access entitlement
instead.
com.apple.developer.driverkit.userclient-access
An array of strings that represent macOS driver extensions that may communicate with othe
DriverKit services.
com.apple.developer.driverkit.allow-any-userclient-access
Details
Discussion
See Also
User client entitlements
Bundle Resources / Entitlements / Communicates with Drivers
Property List Key
Communicates with Drivers
A Boolean value that indicates whether an iPadOS app can communicate with
drivers.
iOS 16.0+
iPadOS 16.0+


## Page 11

A Boolean value that determines whether a macOS driver accepts user client connections
from any application.
DriverKit Allow Third Party User Clients
A Boolean value that indicates whether an iPadOS driver accepts calls from third-party user
clients.
Key: com.apple.developer.driverkit.allow-third-party-userclients


## Page 12

Key
com.apple.developer.driverkit.allow-third-party-userclients
Type
Boolean
By default, an iPadOS driver accepts user-client connections from apps signed with the same tea
ID and the Communicates with Drivers entitlement. Set this entitlement to true on a driver to allo
connections apps with other team IDs. The connecting apps must still have the Communicates w
Drivers entitlement.
com.apple.developer.driverkit.userclient-access
An array of strings that represent macOS driver extensions that may communicate with othe
DriverKit services.
Details
Discussion
See Also
User client entitlements
Bundle Resources / Entitlements / DriverKit Allow Third Party User Clients
Property List Key
DriverKit Allow Third Party User Clients
A Boolean value that indicates whether an iPadOS driver accepts calls from third-
party user clients.
iOS 16.0+
iPadOS 16.0+


## Page 13

com.apple.developer.driverkit.allow-any-userclient-access
A Boolean value that determines whether a macOS driver accepts user client connections
from any application.
Communicates with Drivers
A Boolean value that indicates whether an iPadOS app can communicate with drivers.
Key: com.apple.developer.driverkit.communicates-with-drivers


