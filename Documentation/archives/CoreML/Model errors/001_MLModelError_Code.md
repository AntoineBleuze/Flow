# 001_MLModelError_Code.pdf

## Page 1

case featureType
An error code for problems related to model features.
case parameters
An error code for problems related to model parameters.
case modelCollection
An error code for problems related to retrieving a model collection from the deployment
system.
case modelDecryptionKeyFetch
An error code for problems related to retrieving a model’s decryption key.
case modelDecryption
An error code for problems related to decrypting models.
case update
An error code for problems related to on-device model updates.
case customLayer
Topics
Error codes
Core ML / MLModelError / MLModelError.Code
Enumeration
MLModelError.Code
Information about a Core ML model error.
iOS 11.0+
iPadOS 11.0+
Mac Catalyst 13.1+
macOS 10.13+
tvOS 11.0+
visionOS 1.0+
watchOS 4.0+


## Page 2

An error code for problems related to custom layers.
case customModel
An error code for problems related to custom models.
case io
An error code for problems related to the system’s input or output.
case predictionCancelled
An error code for problems related to canceling the prediction before it completes.
case generic
An error code for runtime issues that don’t apply to the other error codes.
let MLModelErrorDomain: String
The domain for Core ML errors.
static var errorDomain: String
init?(rawValue: Int)
BitwiseCopyable
Equatable
Hashable
RawRepresentable
Sendable
SendableMetatype
Error domain
Creating a model error
Relationships
Conforms To
See Also


## Page 3

struct MLModelError
Information about a Core ML model error.
let MLModelErrorDomain: String
The domain for Core ML errors.
Model errors


