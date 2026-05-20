# Cameras.pdf

## Page 1

var contents: [ICCameraItem]?
All image, movie, and audio files stored on the camera, in an order that reflects the camera’s
storage folder structure.
var mediaFiles: [ICCameraItem]?
All image, movie and audio files stored on the camera, without regard to the camera’s storag
folder structure.
var contentCatalogPercentCompleted: Int
The percentage of the camera’s content that has been catalogued.
func files(ofType: String) -> [String]?
Returns an array of files of the selected type on the camera.
func requestReadData(from: ICCameraFile, atOffset: off_t, length: off_t
readDelegate: Any, didReadDataSelector: Selector, contextInfo: Unsafe
MutableRawPointer?)
Asynchronously reads data of a specified length from a specified offset.
Topics
Reading Files
ImageCaptureCore / ICCameraDevice
Class
ICCameraDevice
An object that represents a camera.
iOS 13.0+
iPadOS 13.0+
Mac Catalyst 13.1+
macOS 10.4+
visionOS 1.0+


## Page 2

struct ICUploadOption
An option for uploading a file to the camera.
func requestUploadFile(URL, options: [ICUploadOption : Any], upload
Delegate: Any, didUploadSelector: Selector, contextInfo: UnsafeMutable
RawPointer?)
Uploads a file to the camera.
Deprecated
struct ICDownloadOption
An option for downloading a file from the camera.
func cancelDownload()
Cancels a download from the camera.
func requestDownloadFile(ICCameraFile, options: [ICDownloadOption : Any
], downloadDelegate: any ICCameraDeviceDownloadDelegate, didDownload
Selector: Selector, contextInfo: UnsafeMutableRawPointer?)
Downloads a file from the camera.
protocol ICCameraDeviceDownloadDelegate
Methods for managing camera file downloads.
var isLocked: Bool
A Boolean value indicating whether the device is locked, preventing deletion of any asset.
struct ICDeleteResult
The result of a deletion request.
struct ICDeleteError
An error resulting from a deletion request.
func requestDeleteFiles([ICCameraItem])
Deletes files from the camera.
Uploading Files
Downloading Files
Deleting Files


## Page 3

func requestDeleteFiles([ICCameraItem], deleteFailed: ([ICDeleteError :
ICCameraItem]) -> Void, completion: ([ICDeleteResult : [ICCameraItem]],
(any Error)?) -> Void) -> Progress?
Deletes files from the camera, with the ability to catch failures and execute a completion
block.
func cancelDelete()
Cancels the current delete operation.
var tetheredCaptureEnabled: Bool
A Boolean value indicating whether tethered capture is enabled on the camera.
var ptpEventHandler: (Data) -> Void
A closure for handling PTP event packets.
func requestEnableTethering()
Enables tethered capture if the camera has the capability to take pictures while connected.
Deprecated
func requestTakePicture()
Captures a new image using the camera.
func requestSendPTPCommand(Data, outData: Data?, sendCommandDelegate:
Any, didSendCommand: Selector, contextInfo: UnsafeMutableRawPointer?)
Sends a Picture Transfer Protocol (PTP) command to a camera asynchronously.
func requestSendPTPCommand(Data, outData: Data?, completion: (Data, Dat
, (any Error)?) -> Void)
Sends a Picture Transfer Protocol (PTP) command to a camera asynchronously.
func requestDisableTethering()
Disables tethered capture on the camera.
Deprecated
var batteryLevelAvailable: Bool
A Boolean value that indicates whether the battery charge level is available.
var batteryLevel: Int
Taking Pictures
Inspecting the Battery Charge Level


## Page 4

The battery charge level.
var timeOffset: TimeInterval
The time offset, in seconds, between the camera’s clock and the computer’s clock.
func requestSyncClock()
Synchronizes the camera’s clock with the computer’s clock.
var isAccessRestrictedAppleDevice: Bool
A Boolean value indicating whether the device is an Apple device, passcode-locked, and
connected to an untrusted host.
var iCloudPhotosEnabled: Bool
A Boolean value indicating whether the iCloud Photo Library is enabled on the device.
var mountPoint: String?
The file system mount point for a camera using the mass storage transport type.
var isEjectable: Bool
A Boolean value indicating whether the device can be ‘soft’ removed or disconnected.
var mediaPresentation: ICMediaPresentation
ICDevice
Synchronizing the Clock
Detecting Apple Devices
Detecting Mass Storage Devices
Removing a Device
Instance Properties
Relationships
Inherits From


## Page 5

CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
protocol ICCameraDeviceDelegate
Methods for detecting cameras, getting metadata and thumbnails, handling access and
capability changes, and performing other actions on connected cameras.
class ICCameraItem
An abstract class that represents a camera item.
class ICCameraFile
An object that represents a file on a camera.
class ICCameraFolder
An object that represents a folder on a camera.
Conforms To
See Also
Cameras


## Page 6

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


## Page 7

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


## Page 8

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


## Page 9

class ICCameraDevice
An object that represents a camera.
class ICCameraItem
An abstract class that represents a camera item.
class ICCameraFile
An object that represents a file on a camera.
class ICCameraFolder
An object that represents a folder on a camera.
Cameras


## Page 10

The ImageCaptureCore framework defines two concrete subclasses of camera items: ICCamera
Folder and ICCameraFile.
var uti: String?
The item’s uniform type identifier (UTI) string.
var name: String?
The item’s name.
var ptpObjectHandle: UInt32
The item’s PTP object handle value, if the camera uses the PTP protocol.
var isRaw: Bool
A Boolean value indicating whether the item is a raw image file.
Overview
Topics
Inspecting an Item’s Name and Type
ImageCaptureCore / ICCameraItem
Class
ICCameraItem
An abstract class that represents a camera item.
iOS 13.0+
iPadOS 13.0+
Mac Catalyst 13.1+
macOS 10.4+
visionOS 1.0+


## Page 11

var creationDate: Date?
The item’s creation date, usually the same as its EXIF creation date.
var modificationDate: Date?
The item’s modification date, usually the same as its EXIF modification date.
var wasAddedAfterContentCatalogCompleted: Bool
A Boolean value indicating whether the item was captured on the camera after the camera’s
content had been fully enumerated.
var device: ICCameraDevice?
The item’s parent device.
var fileSystemPath: String?
The item’s file system path on a camera using the mass storage transport type.
var parentFolder: ICCameraFolder?
This item’s parent folder.
var isInTemporaryStore: Bool
A Boolean value that indicates whether this item is in a temporary store.
func requestMetadata()
Requests metadata for the item.
var metadata: [AnyHashable : Any]?
The item’s metadata.
var metadataIfAvailable: [String : Any]?
The item’s metadata if it is readily available.
func flushMetadataCache()
Deletes the item’s cached metadata.
struct ICCameraItemMetadataOption
Determining an Item’s Change Dates
Locating an Item
Requesting Metadata


## Page 12

An option for the item’s metadata.
func requestThumbnail()
Requests a thumbnail for the item.
var thumbnail: CGImage?
The item’s thumbnail.
var thumbnailIfAvailable: CGImage?
The item’s thumbnail if it is readily available.
var largeThumbnailIfAvailable: CGImage?
A large thumbnail for the item if one is readily available.
func flushThumbnailCache()
Deletes the item’s cached thumbnail.
struct ICCameraItemThumbnailOption
An option for the item’s thumbnail.
var isLocked: Bool
A Boolean value that indicates whether the storage card in the camera is locked.
var userData: NSMutableDictionary?
A mutable dictionary to store arbitrary key-value pairs associated with a camera item.
NSObject
Requesting Thumbnails
Accessing a Protected Item
Storing Information
Relationships
Inherits From


## Page 13

ICCameraFile, ICCameraFolder
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
class ICCameraDevice
An object that represents a camera.
protocol ICCameraDeviceDelegate
Methods for detecting cameras, getting metadata and thumbnails, handling access and
capability changes, and performing other actions on connected cameras.
class ICCameraFile
An object that represents a file on a camera.
class ICCameraFolder
An object that represents a folder on a camera.
Inherited By
Conforms To
See Also
Cameras


## Page 14

func requestMetadataDictionary(options: [ICCameraItemMetadataOption :
Any]?, completion: ([AnyHashable : Any]?, (any Error)?) -> Void)
Requests metadata and executes the completion block in place of the delegate.
func requestThumbnailData(options: [ICCameraItemThumbnailOption : Any]?
completion: (Data?, (any Error)?) -> Void)
Requests a thumbnail and executes the completion block in place of the delegate.
func requestDownload(options: [ICDownloadOption : Any]?, completion: (
String?, (any Error)?) -> Void) -> Progress?
Requests a download and executes the completion block in place of the delegate.
Topics
Requesting Metadata
Requesting Thumbnails
Requesting Downloads
Requesting Data
ImageCaptureCore / ICCameraFile
Class
ICCameraFile
An object that represents a file on a camera.
iOS 13.0+
iPadOS 13.0+
Mac Catalyst 13.1+
macOS 10.4+
visionOS 1.0+


## Page 15

func requestReadData(atOffset: off_t, length: off_t, completion: (Data?
(any Error)?) -> Void)
Requests to asynchronously read data of a specified length from a specified offset, then
executes the completion block.
var originalFilename: String?
The original name of the file on disk.
var createdFilename: String?
The created name of the file.
var groupUUID: String?
The group UUID of the file.
var relatedUUID: String?
A related UUID correlating several images from an Apple device.
var originatingAssetID: String?
The originating asset ID of an HEIF or HVEC file.
var fileCreationDate: Date?
The creation date of the file.
var fileModificationDate: Date?
The modification date of the file.
var fileSize: off_t
The size of the file, in bytes.
var width: Int
Inspecting a File’s Name
Inspecting a File’s Identity
Determining When a File Was Created or Modified
Inspecting a File’s Size
Inspecting a File’s Dimensions


## Page 16

The width of an image or movie frame.
var height: Int
The height of an image or movie frame.
var orientation: ICEXIFOrientationType
The orientation to use when downloading the image.
enum ICEXIFOrientationType
The file’s orientation type.
var exifCreationDate: Date?
The EXIF creation date of the file.
var exifModificationDate: Date?
The EXIF modification date of the file.
var gpsString: String?
The GPS String of the file in standard format.
var firstPicked: Bool
A Boolean value that indicates whether a file is autopicked by Photos to represent the burst.
var burstUUID: String?
The burst UUID of the file if it is in a burst.
var burstFavorite: Bool
A Boolean value that indicates this file is the burst favorite in a burst.
var burstPicked: Bool
A Boolean value that indicates whether this file is user picked in a burst.
var duration: Double
Inspecting a File’s EXIF Data
Identifying a File’s Location
Inspecting a File in a Burst
Inspecting Video Properties


## Page 17

The duration, in seconds, of an audio or video file.
var highFramerate: Bool
A Boolean value that indicates whether the file is a slow motion or high-frame-rate video file
var timeLapse: Bool
A Boolean value that indicates whether the file is a time-lapse video file.
var sidecarFiles: [ICCameraItem]?
An array of two camera files associated with this file.
var pairedRawImage: ICCameraFile?
A sidecar file containing the logical RAW compliment of a JPG or other two-format image.
var fingerprint: String?
func requestFingerprint(completion: (String?, (any Error)?) -> Void)
func requestSecurityScopedURL(completion: (URL?, (any Error)?) -> Void)
class func fingerprintForFile(at: URL) -> String?
ICCameraItem
CVarArg
Identifying Related Files
Instance Properties
Instance Methods
Type Methods
Relationships
Inherits From
Conforms To


## Page 18

CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
class ICCameraDevice
An object that represents a camera.
protocol ICCameraDeviceDelegate
Methods for detecting cameras, getting metadata and thumbnails, handling access and
capability changes, and performing other actions on connected cameras.
class ICCameraItem
An abstract class that represents a camera item.
class ICCameraFolder
An object that represents a folder on a camera.
See Also
Cameras


## Page 19

var contents: [ICCameraItem]?
A list of items that this folder contains.
ICCameraItem
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
Topics
Inspecting a Folder’s Contents
Relationships
Inherits From
Conforms To
ImageCaptureCore / ICCameraFolder
Class
ICCameraFolder
An object that represents a folder on a camera.
iOS 13.0+
iPadOS 13.0+
Mac Catalyst 13.1+
macOS 10.4+
visionOS 1.0+


## Page 20

NSObjectProtocol
class ICCameraDevice
An object that represents a camera.
protocol ICCameraDeviceDelegate
Methods for detecting cameras, getting metadata and thumbnails, handling access and
capability changes, and performing other actions on connected cameras.
class ICCameraItem
An abstract class that represents a camera item.
class ICCameraFile
An object that represents a file on a camera.
See Also
Cameras


