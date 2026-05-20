# 000_CVError.pdf

## Page 1

init?(rawValue: CVReturn)
Creates CVError with the given error code. Returns nil if rawValue is kCVReturnSucces
var errorDescription: String?
Localized messages describing the error.
static let allocationFailed: CVError
The allocation for a buffer or buffer pool failed. Most likely because of lack of resources.
static let internalError: CVError
Error with an undetermined cause.
Topics
Initializers
Instance Properties
Type Properties
Core Video / CVError
Structure
CVError
CVError wraps CVReturn values to present them as Swift Error values. This typ
is used for all errors thrown in the CoreVideo framework. All CVReturn values are
provided as static constants.
iOS 26.0+
iPadOS 26.0+
Mac Catalyst 26.0+
macOS 26.0+
tvOS 26.0+
visionOS 26.0+
watchOS 26.0


## Page 2

static let invalidArgument: CVError
At least one of the arguments passed in is not valid. Either out of range or the wrong type.
static let invalidPixelBufferAttributes: CVError
A CVBuffer cannot be created with the given attributes.
static let invalidPixelFormat: CVError
The requested pixel format is not supported for the CVBuffer type.
static let invalidPoolAttributes: CVError
A CVBufferPool cannot be created with the given attributes.
static let invalidSize: CVError
The requested size (most likely too big) is not supported for the CVBuffer type.
static let pixelBufferNotMetalCompatible: CVError
The Buffer cannot be used with Metal as either its size, pixel format or attributes are not
supported by Metal.
static let poolAllocationFailed: CVError
The allocation for the buffer pool failed. Most likely because of lack of resources. Check if
your parameters are in range.
static let retry: CVError
A scan hasn’t completely traversed the CVBufferPool due to a concurrent operation. The
client can retry the scan.
static let unsupported: CVError
This operation is unsupported on this data type.
static let wouldExceedAllocationThreshold: CVError
The allocation request failed because it would have exceeded a specified allocation threshol
(see kCVPixelBufferPoolAllocationThresholdKey).
static func check(CVReturn) throws(CVError)
Throws an instance of CVError if status is not kCVReturnSuccess
Type Methods
Relationships


## Page 3

BitwiseCopyable
Copyable
CustomStringConvertible
Equatable
Error
Hashable
RawRepresentable
Sendable
SendableMetatype
Conforms To


