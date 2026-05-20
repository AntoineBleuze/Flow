# 007_ICReturnThumbnailError.pdf

## Page 1

let ICErrorDomain: String
An error returned by the ImageCaptureCore framework.
static var alreadyFetching: ICReturnThumbnailError.Code
Item thumbnail request is being serviced.
static var canceled: ICReturnThumbnailError.Code
Item thumbnail request has been canceled.
static var invalid: ICReturnThumbnailError.Code
Item thumbnail request completed with invalid result.
static var notAvailable: ICReturnThumbnailError.Code
Item does not have thumbnail available.
enum Code
Topics
Error Domain
Error Codes
ImageCaptureCore / ICReturnThumbnailError
Structure
ICReturnThumbnailError
A thumbnail error returned from ImageCaptureCore.
iOS
iPadOS
Mac Catalyst
macOS
visionOS


## Page 2

static var errorDomain: String
CustomNSError
Equatable
Error
Hashable
Sendable
SendableMetatype
struct ICReturn
struct ICLegacyReturn
struct ICReturnConnectionError
A connection error returned from ImageCaptureCore.
struct ICReturnDownloadError
A download error returned from ImageCaptureCore.
struct ICReturnMetadataError
A metadata error returned from ImageCaptureCore.
struct ICReturnObjectError
An object error returned from ImageCaptureCore.
struct ICReturnPTPDeviceError
Type Properties
Relationships
Conforms To
See Also
Errors


## Page 3

A PTP device error returned from ImageCaptureCore.


