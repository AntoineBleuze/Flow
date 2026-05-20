# Errors.pdf

## Page 1

static var communicationTimedOut: ICReturn.Code
Communication between different components of Image Capture timed out.
static var deleteFilesCanceled: ICReturn.Code
A request to delete files was canceled.
static var deleteFilesFailed: ICReturn.Code
A request to delete files failed.
static var deviceCommandGeneralFailure: ICReturn.Code
The device has experienced a general failure.
static var deviceCouldNotPair: ICReturn.Code
A pairing request for an Apple Device failed.
static var deviceCouldNotUnpair: ICReturn.Code
An unpairing request for an Apple Device failed.
static var deviceFailedToCloseSession: ICReturn.Code
Failed to close a session on a specified device.
static var deviceFailedToCompleteTransfer: ICReturn.Code
Topics
Type Properties
ImageCaptureCore / ICReturn
Structure
ICReturn
iOS
iPadOS
Mac Catalyst
macOS
visionOS


## Page 2

Failed to complete a data transaction.
static var deviceFailedToOpenSession: ICReturn.Code
Failed to open a session on a specified device.
static var deviceFailedToSendData: ICReturn.Code
Failed to send data.
static var deviceFailedToTakePicture: ICReturn.Code
Failed to take a tethered-capture picture on a camera device.
static var deviceIsBusyEnumerating: ICReturn.Code
The device is currently enumerating assets.
static var deviceIsPasscodeLocked: ICReturn.Code
The device is locked with a passcode. Its contents cannot be seen unless it is unlocked.
static var deviceNeedsCredentials: ICReturn.Code
The device reports credentials are required to open the device.
static var deviceSoftwareInstallationCanceled: ICReturn.Code
Software installation for the device has been canceled.
static var deviceSoftwareInstallationCompleted: ICReturn.Code
Software installation for the device has completed successfully.
static var deviceSoftwareInstallationFailed: ICReturn.Code
Software installation for the device failed.
static var deviceSoftwareIsBeingInstalled: ICReturn.Code
Failed to open session because software to communicate with the device is being installed.
static var deviceSoftwareNotAvailable: ICReturn.Code
Software for the device is not available from Apple.
static var deviceSoftwareNotInstalled: ICReturn.Code
Failed to open session because software to communicate with the device is not installed.
static var downloadCanceled: ICReturn.Code
A download operation was canceled.
static var downloadFailed: ICReturn.Code
A non-specific error occurred while downloading a file.


## Page 3

static var errorDomain: String
static var exFATVolumeInvalid: ICReturn.Code
EXFAT volume is invalid, and cannot be enumerated.
static var failedToCompletePassThroughCommand: ICReturn.Code
Failed to complete a pass-through (e.g., PTP pass-through) command.
static var failedToCompleteSendMessageRequest: ICReturn.Code
A request to send a message to a device failed.
static var failedToDisabeTethering: ICReturn.Code
A request to send a message to a device failed.
static var failedToEnabeTethering: ICReturn.Code
Failed to enable tethered-capture on a camera device.
static var invalidParam: ICReturn.Code
An invalid parameter was found.
static var multiErrorDictionary: ICReturn.Code
Multierror
static var receivedUnsolicitedScannerErrorInfo: ICReturn.Code
An unsolicited error information was received from a scanner.
static var receivedUnsolicitedScannerStatusInfo: ICReturn.Code
An unsolicited status information was received from a scanner.
static var scanOperationCanceled: ICReturn.Code
The scan operation is canceled.
static var scannerFailedToCompleteOverviewScan: ICReturn.Code
Overview scan operation failed to complete on the specified scanner.
static var scannerFailedToCompleteScan: ICReturn.Code
Scan operation failed to complete on the specified scanner.
static var scannerFailedToSelectFunctionalUnit: ICReturn.Code
Failed to select a functional unit on the specified scanner.
static var scannerInUseByLocalUser: ICReturn.Code
Scanner is being used by a local user.


## Page 4

static var scannerInUseByRemoteUser: ICReturn.Code
Scanner is being used by a remote user.
static var sessionNotOpened: ICReturn.Code
Session is not open.
static var success: ICReturn.Code
Operation successful.
static var uploadFailed: ICReturn.Code
A non-specific error occurred while updownloading a file.
CustomNSError
Equatable
Error
Hashable
Sendable
SendableMetatype
struct ICLegacyReturn
struct ICReturnConnectionError
A connection error returned from ImageCaptureCore.
struct ICReturnDownloadError
A download error returned from ImageCaptureCore.
struct ICReturnMetadataError
A metadata error returned from ImageCaptureCore.
Relationships
Conforms To
See Also
Errors


## Page 5

struct ICReturnObjectError
An object error returned from ImageCaptureCore.
struct ICReturnPTPDeviceError
A PTP device error returned from ImageCaptureCore.
struct ICReturnThumbnailError
A thumbnail error returned from ImageCaptureCore.


## Page 6

static var cannotYieldDevice: ICLegacyReturn.Code
static var communicationErr: ICLegacyReturn.Code
static var dataTypeNotFoundErr: ICLegacyReturn.Code
static var deviceAlreadyOpenErr: ICLegacyReturn.Code
static var deviceGUIDNotFoundErr: ICLegacyReturn.Code
static var deviceIOServicePathNotFoundErr: ICLegacyReturn.Code
static var deviceInternalErr: ICLegacyReturn.Code
static var deviceInvalidParamErr: ICLegacyReturn.Code
static var deviceLocationIDNotFoundErr: ICLegacyReturn.Code
static var deviceMemoryAllocationErr: ICLegacyReturn.Code
static var deviceNotFoundErr: ICLegacyReturn.Code
static var deviceNotOpenErr: ICLegacyReturn.Code
static var deviceUnsupportedErr: ICLegacyReturn.Code
static var errorDomain: String
Topics
Type Properties
ImageCaptureCore / ICLegacyReturn
Structure
ICLegacyReturn
iOS
iPadOS
Mac Catalyst
macOS
visionOS


## Page 7

static var extensionInternalErr: ICLegacyReturn.Code
static var fileCorruptedErr: ICLegacyReturn.Code
static var frameworkInternalErr: ICLegacyReturn.Code
static var indexOutOfRangeErr: ICLegacyReturn.Code
static var invalidObjectErr: ICLegacyReturn.Code
static var invalidPropertyErr: ICLegacyReturn.Code
static var invalidSessionErr: ICLegacyReturn.Code
static var ioPendingErr: ICLegacyReturn.Code
static var propertyTypeNotFoundErr: ICLegacyReturn.Code
CustomNSError
Equatable
Error
Hashable
Sendable
SendableMetatype
struct ICReturn
struct ICReturnConnectionError
A connection error returned from ImageCaptureCore.
struct ICReturnDownloadError
A download error returned from ImageCaptureCore.
Relationships
Conforms To
See Also
Errors


## Page 8

struct ICReturnMetadataError
A metadata error returned from ImageCaptureCore.
struct ICReturnObjectError
An object error returned from ImageCaptureCore.
struct ICReturnPTPDeviceError
A PTP device error returned from ImageCaptureCore.
struct ICReturnThumbnailError
A thumbnail error returned from ImageCaptureCore.


## Page 9

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


## Page 10

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


## Page 11

struct ICReturnObjectError
An object error returned from ImageCaptureCore.
struct ICReturnPTPDeviceError
A PTP device error returned from ImageCaptureCore.
struct ICReturnThumbnailError
A thumbnail error returned from ImageCaptureCore.


## Page 12

let ICErrorDomain: String
An error returned by the ImageCaptureCore framework.
static var fileWritable: ICReturnDownloadError.Code
The destination file is not writable.
static var pathInvalid: ICReturnDownloadError.Code
The destination path is invalid.
enum Code
static var errorDomain: String
Topics
Error Domain
Error Codes
Type Properties
ImageCaptureCore / ICReturnDownloadError
Structure
ICReturnDownloadError
A download error returned from ImageCaptureCore.
iOS
iPadOS
Mac Catalyst
macOS
visionOS


## Page 13

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
struct ICReturnMetadataError
A metadata error returned from ImageCaptureCore.
struct ICReturnObjectError
An object error returned from ImageCaptureCore.
struct ICReturnPTPDeviceError
A PTP device error returned from ImageCaptureCore.
struct ICReturnThumbnailError
A thumbnail error returned from ImageCaptureCore.
Relationships
Conforms To
See Also
Errors


## Page 14

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


## Page 15

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


## Page 16

A thumbnail error returned from ImageCaptureCore.


## Page 17

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


## Page 18

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


## Page 19

struct ICReturnThumbnailError
A thumbnail error returned from ImageCaptureCore.


## Page 20

let ICErrorDomain: String
An error returned by the ImageCaptureCore framework.
static var failedToSendCommand: ICReturnPTPDeviceError.Code
Sending a PTP command failed.
enum Code
static var errorDomain: String
static var notAuthorizedToSendCommand: ICReturnPTPDeviceError.Code
Topics
Error Domain
Error Codes
Type Properties
Relationships
ImageCaptureCore / ICReturnPTPDeviceError
Structure
ICReturnPTPDeviceError
A PTP device error returned from ImageCaptureCore.
iOS
iPadOS
Mac Catalyst
macOS
visionOS


## Page 21

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
struct ICReturnThumbnailError
A thumbnail error returned from ImageCaptureCore.
Conforms To
See Also
Errors


## Page 22

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


## Page 23

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


## Page 24

A PTP device error returned from ImageCaptureCore.


