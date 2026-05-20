# 003_ICCameraFile.pdf

## Page 1

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


## Page 2

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


## Page 3

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


## Page 4

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


## Page 5

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


