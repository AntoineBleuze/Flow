# Essentials.pdf

## Page 1

Note
This sample code project is associated with WWDC22 session 10096: What’s new in privacy.
Run either the macOS or iOS server target to emulate a third-party media-streaming receiver. Set
the client scheme’s run destination to an iOS 16 device. Run the client and select the emulated
device from the system device-picker UI.
Media Device Discovery Extension
Overview
Configure the sample code project
See Also
Essentials
DeviceDiscoveryExtension / Discovering a third-party media-streaming device
Sample Code
Discovering a third-party media-streaming
device
Build an extension that streams media to a server app in iOS or macOS.
Download
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 12.0+
Xcode 16.0+


## Page 2

An entitlement for an app extension that adds a specific third-party media receiver to a
system device-picker UI.


## Page 3

Key
com.apple.developer.media-device-discovery-extension
Type
Boolean
To add this entitlement to your app extension, enable the Media Device Discovery capability in
Xcode. For more information, see Configuring media device discovery.
com.apple.developer.coremotion.head-pose
An entitlement that enables someone’s head movement to determine the orientation of
spatialized sound output.
com.apple.developer.spatial-audio.profile-access
An entitlement that enables your app to use the personalized spatial audio profile.
Details
Discussion
See Also
Media
Bundle Resources / Entitlements / Media Device Discovery Extension
Property List Key
Media Device Discovery Extension
An entitlement for an app extension that adds a specific third-party media receive
to a system device-picker UI.
iOS 16.0+
iPadOS 16.0+
visionOS 1.0+


## Page 4

com.apple.developer.avfoundation.multitasking-camera-access
A Boolean value that indicates whether an app may continue using the camera at the same
time as another foreground app.
Deprecated


