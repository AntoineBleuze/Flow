# 001_CIFeature.pdf

## Page 1

Note
In macOS 10.13, iOS 11, and tvOS 11 or later, the Vision framework replaces these classes for
identifying and analyzing image features. See VNObservation)
A CIFeature object represents a portion of an image that a detector believes matches its criteri
Subclasses of CIFeature holds additional information specific to the detector that discovered the
feature.
var bounds: CGRect
The rectangle that holds discovered feature.
var type: String
Overview
Topics
Feature Properties
Core Image / CIFeature
Class
CIFeature
The abstract superclass for objects representing notable features detected in an
image.
iOS 5.0+
iPadOS 5.0+
Mac Catalyst 13.1+
macOS 10.7+
tvOS
visionOS 1.0+


## Page 2

The type of feature that was discovered.
let CIFeatureTypeFace: String
A Core Image feature type for person’s face.
let CIFeatureTypeRectangle: String
A Core Image feature type for rectangular object.
let CIFeatureTypeQRCode: String
A Core Image feature type for QR code object.
let CIFeatureTypeText: String
A Core Image feature type for text.
NSObject
CIFaceFeature
CIQRCodeFeature
CIRectangleFeature
CITextFeature
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Feature Types
Relationships
Inherits From
Inherited By
Conforms To


## Page 3

class CIDetector
An image processor that identifies notable features, such as faces and barcodes, in a still
image or video.
class CIFaceFeature
Information about a face detected in a still or video image.
class CIRectangleFeature
Information about a rectangular region detected in a still or video image.
class CITextFeature
Information about a text that was detected in a still or video image.
class CIQRCodeFeature
Information about a Quick Response code detected in a still or video image.
See Also
Image Feature Detection


