# Essentials.pdf

## Page 1

init()
Creates an ImageCaptureCore device browser.
var delegate: (any ICDeviceBrowserDelegate)?
The object that acts as the delegate of the device browser.
protocol ICDeviceBrowserDelegate
Methods for managing the addition and removal of devices and responding to device
changes.
var isBrowsing: Bool
A Boolean value indicating whether the device browser is browsing for devices.
var devices: [ICDevice]?
All devices found by the browser.
Topics
Creating a Device Browser
Managing Device Browsing
Browsing Devices
ImageCaptureCore / ICDeviceBrowser
Class
ICDeviceBrowser
An object for finding digital cameras and scanners.
iOS 13.0+
iPadOS 13.0+
Mac Catalyst 13.1+
macOS 10.4+
visionOS 1.0+


## Page 2

class ICDevice
An abstract object that represents a device.
var browsedDeviceTypeMask: ICDeviceTypeMask
A mask whose set bits indicate the type of devices being browsed after the delegate receive
the start message.
func start()
Tells the delegate to start looking for devices.
func stop()
Tells the delegate to stop looking for devices.
var preferredDevice: ICDevice?
Returns a device object that the client application should select when it launches.
var contentsAuthorizationStatus: ICAuthorizationStatus
var controlAuthorizationStatus: ICAuthorizationStatus
var isSuspended: Bool
func requestContentsAuthorization(completion: (ICAuthorizationStatus) -
Void)
func requestControlAuthorization(completion: (ICAuthorizationStatus) ->
Void)
func resetContentsAuthorization(completion: (ICAuthorizationStatus) ->
Void)
func resetControlAuthorization(completion: (ICAuthorizationStatus) ->
Void)
Setting a Preferred Device
Instance Properties
Instance Methods
Relationships


## Page 3

NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Photos Library Entitlement
A Boolean value that indicates whether the app has read-write access to the user’s Photos
library.
NSCameraUsageDescription
A message that tells people why the app is requesting access to the device’s camera.
Inherits From
Conforms To
See Also
Essentials


## Page 4

Key
com.apple.security.personal-information.photos-library
Type
Boolean
To add this entitlement to your app, first enable the Hardened Runtime capability in Xcode. Then,
under Resource Access, select Photos Library.
Address book entitlement
A Boolean value that indicates whether the app may have read-write access to contacts in th
user’s address book.
Key: com.apple.security.personal-information.addressbook
Location entitlement
Details
Discussion
See Also
Personal information
Bundle Resources / Entitlements / Photos Library Entitlement
Property List Key
Photos Library Entitlement
A Boolean value that indicates whether the app has read-write access to the user
Photos library.
macOS 10.7+


## Page 5

A Boolean value that indicates whether the app may access location information from Locati
Services.
Key: com.apple.security.personal-information.location
Calendars entitlement
A Boolean value that indicates whether the app may have read-write access to the user’s
calendar.
Key: com.apple.security.personal-information.calendars


## Page 6

Name
Privacy - Camera Usage Description
Type
String
Requesting Authorization for Media Capture on macOS
Important
This key is required if your app uses APIs that access the device’s camera.
Details
Mentioned in
Discussion
See Also
Camera and sound
Bundle Resources / Information Property List / NSCameraUsageDescription
Property List Key
NSCameraUsageDescription
A message that tells people why the app is requesting access to the device’s
camera.
iOS 7.0+
iPadOS 7.0+
macOS 10.14+
tvOS 17.0+
visionOS 1.0+


## Page 7

Requesting authorization to capture and save media
Prompt the user to authorize access to the camera, microphone, and photo library.
Requesting Authorization for Media Capture on macOS
Prompt the user to authorize access to the camera and microphone.
NSAudioCaptureUsageDescription
A message that tells people why your app is requesting access to capture system audio on
macOS.
NSMainCameraUsageDescription
A message that tells people why the app is requesting access to the device’s main camera.
Name: Main Camera Usage Description
NSMicrophoneUsageDescription
A message that tells people why the app is requesting access to the device’s microphone.
Name: Privacy - Microphone Usage Description


