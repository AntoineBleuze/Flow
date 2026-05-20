# 001_Overriding the default USB video class extension.pdf

## Page 1

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


## Page 2

In the dialog that follows, give the driver an appropriate Product Name and click the Finish button
create it.
The default IOKit interface generator (.iig) and C++ implementation files that the template
creates provide the sufficient implementation for your driver. The driver is effectively codeless, bu
the system requires a minimal binary for entitlement purposes.
Specify your matching parameters as one or more entries in the IOKitPersonalities dictiona
inside the DriverKit extension’s Info.plist file. The following example shows the standard
configuration to provide within this file.
Configure the Info.plist file


## Page 3

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


## Page 4

class CMIOExtensionProvider
An object that manages device connections for a provider.
protocol CMIOExtensionProviderSource
A protocol for objects that act as provider sources.
class CMIOExtensionProviderProperties
An object that manages the properties of an extension provider.


