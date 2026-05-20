# 005_ICReturnObjectError.pdf

## Page 1

let ICErrorDomain: String
An error returned by the ImageCaptureCore framework.
static var codeObjectDoesNotExist: ICReturnObjectError.Code
The object does not exist.
static var codeObjectDataOffsetInvalid: ICReturnObjectError.Code
The object data offset is invalid.
static var codeObjectCouldNotBeRead: ICReturnObjectError.Code
The object could not be read.
static var codeObjectDataEmpty: ICReturnObjectError.Code
The object data is empty.
enum Code
Topics
Error Domain
Error Codes
ImageCaptureCore / ICReturnObjectError
Structure
ICReturnObjectError
An object error returned from ImageCaptureCore.
iOS
iPadOS
Mac Catalyst
macOS
visionOS


## Page 2

static var codeObjectDataRequestTooLarge: ICReturnObjectError.Code
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
struct ICReturnPTPDeviceError
A PTP device error returned from ImageCaptureCore.
Type Properties
Relationships
Conforms To
See Also
Errors


## Page 3

struct ICReturnThumbnailError
A thumbnail error returned from ImageCaptureCore.


