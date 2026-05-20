# 000_ICDeviceBrowser.pdf

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


