# Providers.pdf

## Page 1

Camera extensions are a new type of system extension available in macOS 12.3 and later. They
provide a simple, secure model for building high-performance camera drivers for macOS. You
package and install them with your app, which makes them simple to deploy, including through th
App Store.
Related Sessions from WWDC22
Session 10022: Create camera extensions with Core Media I/O
The following illustration shows a high-level view of a camera extension.
A camera extension consists of three primary components:
A CMIOExtensionProvider represents the primary interface to the extension. The provider
and its source manage the extension’s device and client connections, and also define propertie
Overview
Core Media I/O / Creating a camera extension with Core Media I/O
Article
Creating a camera extension with Core
Media I/O
Build high-performance camera drivers that are secure and simple to deploy.


## Page 2

common to the extension such as its name and manufacturer.
A CMIOExtensionDevice represents a hardware or software device that the extension
publishes as a selectable camera in apps like FaceTime. A device and its source configure
supporting resources like buffer pools that it uses when streaming data. A device also defines
properties for values such as its model name and transport type.
A CMIOExtensionStream represents a stream of data to send to clients. A stream and its
source specify the stream’s format, minimum and maximum frame rates, and direction. A
stream’s source object is responsible for starting and stopping the stream’s flow of data.
To simplify creating your own extensions, Xcode provides a Camera Extension template that
provides a fully functional extension implementation. It creates a virtual camera device that rende
a horizontal white line that moves up and down the display. This article shows how to configure th
template’s output to build your own camera extension.
Note
See the System Extensions framework for additional information on building, installing, and
debugging system extensions.
You package your camera extension as part of your app bundle. To allow your app to install and
communicate with the extension, your app target requires two additional capabilities. Select the
target in Xcode, and click the Signing & Capabilities pane. Add the following capabilities to the
target:
System Extension. This capability enables the app to install system extensions.
App Groups. This capability enables the app to define a common group container for the app
and the extension to share, which allows them to communicate.
Adding the capabilities to the target writes the values to an entitlements file. For example, an app
with a bundle identifier of com.example.CustomCamera would have an entitlements file simila
to the following:
Add entitlements to your host app


## Page 3

Add a new target to your app using the Camera Extension template. In Xcode, go to the File menu
and choose File > New and select the Target menu item. In the dialog that appears, select the
macOS pane and find the Camera Extension template as shown below.
Click the Next button. On the screen that follows, give the extension an appropriate name and lea
the other values set to their defaults, and then click the Finish button.
The template creates a new target and folder with the name you specified. The folder contains th
following files:
A [CameraExtensionName]Provider.swift file that provides the complete extension
implementation.
A main.swift file that provides the minimal code for the system to initialize the extension.
Create a camera extension target


## Page 4

An Info.plist that defines the CMIOExtensionMachServiceName for the extension and 
NSSystemExtensionUsageDescriptionKey that describes the extension’s purpose to the
user.
A [CameraExtensionName].entitlements file that defines a default app group.
So that your app and extension can communicate, open the [CameraExtension
Name].entitlements file and update it to use the same app group name that you defined in
your app, as in the example below.
Next, open the [CameraExtensionName]Provider.swift file. This file provides a complete
implementation for all components of a camera extension. Look through the file and familiarize
yourself with the code.
You can quickly find essential user-customizable strings by searching the file for the string,
SampleCapture, and replacing the values as appropriate. A particularly important string to
customize is the localizedName that you specify for the CMIOExtensionDevice, because it
the string that apps display in their camera selection UI.
The system automatically installs a camera extension when a user installs your app. However,
before your extension is available for the system to use, your app needs to activate it by performin
an activation request like shown below.
Configure the extension
Activate the extension


## Page 5

Only apps that reside in the /Applications directory can activate an extension. To test your
extension, move your app from Xcode’s build results to the /Applications folder. Launch your
app from its new location to test its activation request. When it attempts to activate the extension
the system prompts the user with a dialog like shown below.
Before the extension is available to the system, a person with Admin privileges for the Mac must
explicitly allow access to it in the Systems & Privacy screen of System Settings.
Tip
During development of your extension, it’s often useful to temporarily disable some security
restrictions imposed by the system. See Debugging and testing system extensions for more
information.
After you’ve allowed the system to use your custom extension, it’s automatically available as a
selectable camera in system apps like FaceTime and PhotoBooth. Camera extensions are also full
compatible with AVFoundation capture APIs, which means you can access your extension as an
AVCaptureDevice object and use it like any other device. For example, to retrieve your custom
camera extension (as well as any others on the system), retrieve it as an externalUnknown
device type as shown below.
Access the custom camera


## Page 6

Overriding the default USB video class extension
Create a simple DriverKit extension to override the default driver-matching behavior for USB
devices.
class CMIOExtensionProvider
An object that manages device connections for a provider.
protocol CMIOExtensionProviderSource
A protocol for objects that act as provider sources.
class CMIOExtensionProviderProperties
An object that manages the properties of an extension provider.
See Also
Providers


## Page 7

Starting in macOS 12.3, the operating system provides a class-compliant Core Media I/O (CMIO)
extension that enables the use of USB cameras and other video capture devices. When you
connect a USB camera, the system finds its default driver and connects it with the camera. To
override the system’s default matching behavior so that you can load a custom CMIO extension
instead, create a simple DriverKit extension.
In a standalone Xcode project, or as a target within an existing project, create a new DriverKit
extension. In Xcode’s menu, select File > New and choose either the Project or Target menu items
as appropriate. In the dialog that appears, select the DriverKit tab and the Driver template, and cli
the Next button.
Overview
Create a DriverKit extension
Core Media I/O / Overriding the default USB video class extension
Article
Overriding the default USB video class
extension
Create a simple DriverKit extension to override the default driver-matching
behavior for USB devices.


## Page 8

In the dialog that follows, give the driver an appropriate Product Name and click the Finish button
create it.
The default IOKit interface generator (.iig) and C++ implementation files that the template
creates provide the sufficient implementation for your driver. The driver is effectively codeless, bu
the system requires a minimal binary for entitlement purposes.
Specify your matching parameters as one or more entries in the IOKitPersonalities dictiona
inside the DriverKit extension’s Info.plist file. The following example shows the standard
configuration to provide within this file.
Configure the Info.plist file


## Page 9

Set IOUserClass and IOUserServerName values as appropriate for your newly created
extension. Set a high IOProbeScore value to give priority to your driver, and set the identifiers o
the vendor and product to match. In the IOProviderMergeProperties, specify the identifier 
your custom CMIO extension to load in place of the default driver.
With the configuration of your DriverKit extension complete, refer to Installing System Extensions
and Drivers for information on how to package and install your extension.
Creating a camera extension with Core Media I/O
Build high-performance camera drivers that are secure and simple to deploy.
See Also
Providers


## Page 10

class CMIOExtensionProvider
An object that manages device connections for a provider.
protocol CMIOExtensionProviderSource
A protocol for objects that act as provider sources.
class CMIOExtensionProviderProperties
An object that manages the properties of an extension provider.


## Page 11

Creating a camera extension with Core Media I/O
An extension provider manages device connections and provides the start
Service(provider:) class method that you call to bootstrap the service.
init(source: any CMIOExtensionProviderSource, clientQueue: dispatch
_queue_t?)
Creates an extension provider with the specified source and dispatch queue.
var clientQueue: dispatch_queue_t
Mentioned in
Overview
Topics
Creating a Provider
Inspecting a Provider
Core Media I/O / CMIOExtensionProvider
Class
CMIOExtensionProvider
An object that manages device connections for a provider.
Mac Catalyst 15.4+
macOS 12.3+


## Page 12

The dispatch queue on which the system performs client operations.
var source: (any CMIOExtensionProviderSource)?
The source for the provider.
class func startService(provider: CMIOExtensionProvider)
Starts the system extension.
var devices: [CMIOExtensionDevice]
An array of connected devices.
func addDevice(CMIOExtensionDevice) throws
Adds a device to a provider.
func removeDevice(CMIOExtensionDevice) throws
Removes a device from a provider.
var connectedClients: [CMIOExtensionClient]
An array of connected clients.
func notifyPropertiesChanged([CMIOExtensionProperty : CMIOExtension
PropertyState<AnyObject>])
Notifies connected clients of device property changes.
class func ignoreSIGTERM()
class func stopService(provider: CMIOExtensionProvider)
Starting a Provider
Managing Devices
Managing Clients
Type Methods
Relationships


## Page 13

NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Creating a camera extension with Core Media I/O
Build high-performance camera drivers that are secure and simple to deploy.
Overriding the default USB video class extension
Create a simple DriverKit extension to override the default driver-matching behavior for USB
devices.
protocol CMIOExtensionProviderSource
A protocol for objects that act as provider sources.
class CMIOExtensionProviderProperties
An object that manages the properties of an extension provider.
Inherits From
Conforms To
See Also
Providers


## Page 14

Create a class that adopts this protocol to configure provider properties and manage its client
connections.
func connect(to: CMIOExtensionClient) throws
Connects a client to a source’s provider.
Required
func disconnect(from: CMIOExtensionClient)
Disconnects a client from a source’s provider.
Required
var availableProperties: Set<CMIOExtensionProperty>
A set of available properties for a provider.
Overview
Topics
Managing Connections
Configuring Properties
Core Media I/O / CMIOExtensionProviderSource
Protocol
CMIOExtensionProviderSource
A protocol for objects that act as provider sources.
Mac Catalyst 15.4+
macOS 12.3+


## Page 15

Required
func providerProperties(forProperties: Set<CMIOExtensionProperty>)
throws -> CMIOExtensionProviderProperties
Gets the state of provider properties.
Required
func setProviderProperties(CMIOExtensionProviderProperties) throws
Set the state of provider properties.
Required
NSObjectProtocol
Creating a camera extension with Core Media I/O
Build high-performance camera drivers that are secure and simple to deploy.
Overriding the default USB video class extension
Create a simple DriverKit extension to override the default driver-matching behavior for USB
devices.
class CMIOExtensionProvider
An object that manages device connections for a provider.
class CMIOExtensionProviderProperties
An object that manages the properties of an extension provider.
Relationships
Inherits From
See Also
Providers


## Page 16

Create an instance of this object to manage the provider’s property state.
init(dictionary: [CMIOExtensionProperty : CMIOExtensionPropertyState<An
Object>])
Creates a provider properties object with the specified properties.
var name: String?
The provider name.
var manufacturer: String?
The provider manufacturer.
Overview
Topics
Creating Provider Properties
Managing Properties
Core Media I/O / CMIOExtensionProviderProperties
Class
CMIOExtensionProviderProperties
An object that manages the properties of an extension provider.
Mac Catalyst 15.4+
macOS 12.3+


## Page 17

func setPropertyState(CMIOExtensionPropertyState<AnyObject>?, for
Property: CMIOExtensionProperty)
Sets a state value for the specified property.
var propertiesDictionary: [CMIOExtensionProperty : CMIOExtensionPropert
State<AnyObject>]
A dictionary of properties for a provider.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Creating a camera extension with Core Media I/O
Build high-performance camera drivers that are secure and simple to deploy.
Overriding the default USB video class extension
Create a simple DriverKit extension to override the default driver-matching behavior for USB
devices.
class CMIOExtensionProvider
An object that manages device connections for a provider.
Relationships
Inherits From
Conforms To
See Also
Providers


## Page 18

protocol CMIOExtensionProviderSource
A protocol for objects that act as provider sources.


