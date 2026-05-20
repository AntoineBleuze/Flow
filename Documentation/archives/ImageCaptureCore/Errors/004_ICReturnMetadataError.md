# 004_ICReturnMetadataError.pdf

## Page 1

let ICErrorDomain: String
An error returned by the ImageCaptureCore framework.
static var alreadyFetching: ICReturnMetadataError.Code
Item metadata request is being serviced.
static var canceled: ICReturnMetadataError.Code
Item metadata request has been canceled.
static var invalid: ICReturnMetadataError.Code
Item metadata request completed with invalid result.
static var notAvailable: ICReturnMetadataError.Code
Item does not have metadata available.
enum Code
Topics
Error Domain
Error Codes
ImageCaptureCore / ICReturnMetadataError
Structure
ICReturnMetadataError
A metadata error returned from ImageCaptureCore.
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
struct ICReturnObjectError
An object error returned from ImageCaptureCore.
struct ICReturnPTPDeviceError
A PTP device error returned from ImageCaptureCore.
struct ICReturnThumbnailError
Type Properties
Relationships
Conforms To
See Also
Errors


## Page 3

A thumbnail error returned from ImageCaptureCore.


