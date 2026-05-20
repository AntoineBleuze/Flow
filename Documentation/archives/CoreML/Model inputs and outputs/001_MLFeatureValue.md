# 001_MLFeatureValue.pdf

## Page 1

A Core ML feature value wraps an underlying value and bundles it with that value’s type, which is
one of the types that MLFeatureType defines. Apps typically access feature values indirectly by
using the methods in the wrapper class Xcode automatically generates for Core ML model files.
If your app accesses an MLModel directly, it must create and consume MLFeatureProvider
instances. For each prediction, Core ML accepts a feature provider for its inputs, and generates a
separate feature provider for its outputs. The input feature provider contains one MLFeature
Value instance per input, and the output feature provider contains one per output. See
MLFeatureDescription for more information about the model input and output features.
convenience init(MLSendableFeatureValue)
Creates a feature value from a sendable feature value.
convenience init(int64: Int64)
Overview
Topics
Creating a feature value
Creating numeric feature values
Core ML / MLFeatureValue
Class
MLFeatureValue
A generic wrapper around an underlying value and the value’s type.
iOS 11.0+
iPadOS 11.0+
Mac Catalyst 13.1+
macOS 10.13+
tvOS 11.0+
visionOS 1.0+
watchOS 4.0+


## Page 2

Creates a feature value that contains an integer.
convenience init(double: Double)
Creates a feature value that contains a double.
convenience init(string: String)
Creates a feature value that contains a string.
convenience init(multiArray: MLMultiArray)
Creates a feature value that contains a multidimensional array.
convenience init<Scalar>(shapedArray: MLShapedArray<Scalar>)
Creates a feature value that contains a shaped array.
convenience init(dictionary: [AnyHashable : NSNumber]) throws
Creates a feature value that contains a dictionary of numbers.
convenience init(sequence: MLSequence)
Creates a feature value that contains a sequence.
convenience init(pixelBuffer: CVPixelBuffer)
Creates a feature value that contains an image from a pixel buffer.
convenience init(CGImage: CGImage, pixelsWide: Int, pixelsHigh: Int,
pixelFormatType: OSType, options: [MLFeatureValue.ImageOption : Any]?)
throws
Creates a feature value that contains an image defined by a core graphics image and its size
and pixel format.
convenience init(CGImage: CGImage, orientation: CGImageProperty
Orientation, pixelsWide: Int, pixelsHigh: Int, pixelFormatType: OSType,
options: [MLFeatureValue.ImageOption : Any]?) throws
Creating string feature values
Creating multidimensional feature values
Creating collection feature values
Creating image feature values


## Page 3

Creates a feature value that contains an image defined by a core graphics image and its
orientation, size, and pixel format.
convenience init(CGImage: CGImage, constraint: MLImageConstraint,
options: [MLFeatureValue.ImageOption : Any]?) throws
Creates a feature value that contains an image defined by a core graphics image and a
constraint.
convenience init(CGImage: CGImage, orientation: CGImageProperty
Orientation, constraint: MLImageConstraint, options: [MLFeatureValue.
ImageOption : Any]?) throws
Creates a feature value that contains an image defined by a core graphics image, an
orientation, and a constraint.
convenience init(imageAtURL: URL, pixelsWide: Int, pixelsHigh: Int,
pixelFormatType: OSType, options: [MLFeatureValue.ImageOption : Any]?)
throws
Creates a feature value that contains an image defined by an image URL and the image’s siz
and pixel format.
convenience init(imageAtURL: URL, orientation: CGImageProperty
Orientation, pixelsWide: Int, pixelsHigh: Int, pixelFormatType: OSType,
options: [MLFeatureValue.ImageOption : Any]?) throws
Creates a feature value that contains an image defined by an image URL and the image’s
orientation, size, and pixel format.
convenience init(imageAtURL: URL, constraint: MLImageConstraint, option
: [MLFeatureValue.ImageOption : Any]?) throws
Creates a feature value that contains an image defined by an image URL and a constraint.
convenience init(imageAtURL: URL, orientation: CGImageProperty
Orientation, constraint: MLImageConstraint, options: [MLFeatureValue.
ImageOption : Any]?) throws
Creates a feature value that contains an image defined by an image URL, an orientation, and
constraint.
class MLImageConstraint
The width, height, and pixel format constraints of an image feature.
struct ImageOption
The initializer options you use to crop and scale an image when creating an image feature
value.


## Page 4

convenience init(undefined: MLFeatureType)
Creates a feature value with a type that represents an undefined or missing value.
var type: MLFeatureType
The type of the feature value.
var isUndefined: Bool
A Boolean value that indicates whether the feature value is undefined or missing.
var int64Value: Int64
The underlying integer of the feature value.
var doubleValue: Double
The underlying double of the feature value.
var stringValue: String
The underlying string of the feature value.
var imageBufferValue: CVPixelBuffer?
The underlying image of the feature value as a pixel buffer.
func shapedArrayValue<Scalar>(of: Scalar.Type) -> MLShapedArray<Scalar>
Returns the underlying shaped array of the feature value.
var multiArrayValue: MLMultiArray?
The underlying multiarray of the feature value.
var sequenceValue: MLSequence?
The underlying sequence of the feature value.
var dictionaryValue: [AnyHashable : NSNumber]
The underlying dictionary of the feature value.
Creating undefined feature values
Accessing the feature’s type
Accessing the feature’s value
Comparing feature values


## Page 5

func isEqual(to: MLFeatureValue) -> Bool
Returns a Boolean value that indicates whether a feature value is equal to another.
enum MLFeatureType
The possible types for feature values, input features, and output features.
struct MLShapedArray
A machine learning collection type that stores scalar values in a multidimensional array.
protocol MLShapedArrayProtocol
An interface that defines a shaped array type.
class MLMultiArray
A machine learning collection type that stores numeric values in an array with multiple
dimensions.
class MLSequence
A machine learning collection type that stores a series of strings or integers.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCoding
NSCopying
NSObjectProtocol
NSSecureCoding
Supporting types
Relationships
Inherits From
Conforms To


## Page 6

Making Predictions with a Sequence of Inputs
Integrate a recurrent neural network model to process sequences of inputs.
struct MLSendableFeatureValue
A sendable feature value.
protocol MLFeatureProvider
An interface that represents a collection of values for either a model’s input or its output.
class MLDictionaryFeatureProvider
A convenience wrapper for the given dictionary of data.
protocol MLBatchProvider
An interface that represents a collection of feature providers.
class MLArrayBatchProvider
A convenience wrapper for batches of feature providers.
class MLModelAsset
An abstraction of a compiled Core ML model asset.
See Also
Model inputs and outputs


