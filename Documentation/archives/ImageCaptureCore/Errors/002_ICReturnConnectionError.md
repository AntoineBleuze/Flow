# 002_ICReturnConnectionError.pdf

## Page 1

let ICErrorDomain: String
An error returned by the ImageCaptureCore framework.
static var closedSessionSuddenly: ICReturnConnectionError.Code
Device closed session without request.
static var driverExited: ICReturnConnectionError.Code
Device driver exited without request.
static var ejectFailed: ICReturnConnectionError.Code
Device reports eject has failed.
static var ejectedSuddenly: ICReturnConnectionError.Code
Device ejected without request.
static var failedToOpen: ICReturnConnectionError.Code
Failed to open a connection to the device.
Topics
Error Domain
Error Codes
ImageCaptureCore / ICReturnConnectionError
Structure
ICReturnConnectionError
A connection error returned from ImageCaptureCore.
iOS
iPadOS
Mac Catalyst
macOS
visionOS


## Page 2

static var failedToOpenDevice: ICReturnConnectionError.Code
Failed to open the device.
static var sessionAlreadyOpen: ICReturnConnectionError.Code
Device reports session is already open.
enum Code
static var errorDomain: String
static var notAuthorizedToOpenDevice: ICReturnConnectionError.Code
CustomNSError
Equatable
Error
Hashable
Sendable
SendableMetatype
struct ICReturn
struct ICLegacyReturn
struct ICReturnDownloadError
A download error returned from ImageCaptureCore.
struct ICReturnMetadataError
A metadata error returned from ImageCaptureCore.
Type Properties
Relationships
Conforms To
See Also
Errors


## Page 3

struct ICReturnObjectError
An object error returned from ImageCaptureCore.
struct ICReturnPTPDeviceError
A PTP device error returned from ImageCaptureCore.
struct ICReturnThumbnailError
A thumbnail error returned from ImageCaptureCore.


