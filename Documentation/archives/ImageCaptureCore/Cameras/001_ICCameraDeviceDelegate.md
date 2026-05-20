# 001_ICCameraDeviceDelegate.pdf

## Page 1

func deviceDidBecomeReady(withCompleteContentCatalog: ICCameraDevice)
Tells the client that the camera device is done enumerating its content and is ready to receiv
requests.
Required
func cameraDevice(ICCameraDevice, didAdd: [ICCameraItem])
Tells the client when objects are added to the device.
Required
func cameraDevice(ICCameraDevice, didAdd: ICCameraItem)
Tells the client when an object is added to the device.
Topics
Determining Device Readiness
Adding Objects
Removing Objects
ImageCaptureCore / ICCameraDeviceDelegate
Protocol
ICCameraDeviceDelegate
Methods for detecting cameras, getting metadata and thumbnails, handling
access and capability changes, and performing other actions on connected
cameras.
iOS
iPadOS
Mac Catalyst
macOS
visionOS


## Page 2

func cameraDevice(ICCameraDevice, didRemove: [ICCameraItem])
Tells the client when objects are removed from the device.
Required
func cameraDevice(ICCameraDevice, didCompleteDeleteFilesWithError: (any
Error)?)
Tells the client when the camera completes a delete operation.
func cameraDevice(ICCameraDevice, didRemove: ICCameraItem)
Tells the client when an object is removed from the device.
func cameraDevice(ICCameraDevice, didRenameItems: [ICCameraItem])
Tells the client when one or more objects are renamed on the device.
Required
func cameraDevice(ICCameraDevice, didReceiveMetadata: [AnyHashable : An
]?, for: ICCameraItem, error: (any Error)?)
Tells the client when the metadata requested for an item on a camera is available.
Required
func cameraDevice(ICCameraDevice, shouldGetMetadataOf: ICCameraItem) ->
Bool
Tells the client when the camera is about to execute queued requests for the metadata of a
specific item.
func cameraDevice(ICCameraDevice, didReceiveMetadataFor: ICCameraItem)
Tells the client when the metadata requested for an item on a camera is available.
func cameraDevice(ICCameraDevice, didReceiveThumbnail: CGImage?, for:
ICCameraItem, error: (any Error)?)
Tells the client when the requested thumbnail is available.
Required
func cameraDevice(ICCameraDevice, didReceiveThumbnailFor: ICCameraItem)
Tells the client when the requested thumbnail is available.
Renaming Objects
Receiving Metadata
Receiving Thumbnails


## Page 3

func cameraDevice(ICCameraDevice, shouldGetThumbnailOf: ICCameraItem) -
Bool
Tells the client when the camera is about to execute queued requests for the thumbnail of a
specific item.
func cameraDeviceDidChangeCapability(ICCameraDevice)
Tells the client when a capability of a camera changes.
Required
func cameraDeviceDidEnableAccessRestriction(ICDevice)
Tells the client when an Apple device has been locked, and media is unavailable until the
restriction has been removed.
Required
func cameraDeviceDidRemoveAccessRestriction(ICDevice)
Tells the client when an Apple device has been unlocked, paired to the host, and media is
available.
Required
func cameraDevice(ICCameraDevice, didReceivePTPEvent: Data)
Tells the client about a PTP event.
Required
ICDeviceDelegate, NSObjectProtocol
Responding to Capability Changes
Responding to Access Restrictions
Responding to PTP Events
Relationships
Inherits From
See Also


## Page 4

class ICCameraDevice
An object that represents a camera.
class ICCameraItem
An abstract class that represents a camera item.
class ICCameraFile
An object that represents a file on a camera.
class ICCameraFolder
An object that represents a folder on a camera.
Cameras


