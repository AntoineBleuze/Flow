# 002_MLSendableFeatureValue.pdf

## Page 1

This version of feature value is similar to MLFeatureValue but it can be passed across
concurrency domains. Once in the target concurrency domain, you can then convert it to a
MLFeatureValue.
init(_:)
Creates a feature value containing a double-precision floating-point value.
init(undefined: MLFeatureType)
Creates an undefined feature value of a specific type.
var doubleValue: Double?
The double-precision floating-point value, if the contained value is a double.
Overview
Topics
Creating a sendable feature value
Accessing the values
Core ML / MLSendableFeatureValue
Structure
MLSendableFeatureValue
A sendable feature value.
iOS 18.0+
iPadOS 18.0+
Mac Catalyst 18.0+
macOS 15.0+
tvOS 18.0+
visionOS 2.0+
watchOS 11.0+


## Page 2

var float16Value: Float16?
The 16-bit floating-point value, if the contained value is a 16-bit float.
var floatValue: Float?
The single-precision floating-point value, if the contained value is a float.
var integerDictionaryValue: [Int : Double]?
The integer dictionary value, if the contained value is a dictionary of integers to numbers.
var integerValue: Int?
The integer value, if the contained value is an integer.
var isScalar: Bool
A Boolean value indicating whether the value is a single number.
var isShapedArray: Bool
A Boolean value indicating whether the value is a shaped array.
var isUndefined: Bool
A Boolean value indicating whether the value is missing or undefined.
var stringArrayValue: [String]?
The string array value, if the contained value is an array of string.
var stringDictionaryValue: [String : Double]?
The string dictionary value, if the contained value is a dictionary of strings to numbers.
var stringValue: String?
The string value, if the contained value is a string.
var type: MLFeatureType
The type of value.
func shapedArrayValue<Scalar>(of: Scalar.Type) -> MLShapedArray<Scalar>
Returns the shaped array value, if the contained value is a shaped array of the specified type
Getting the shaped array value
Relationships


## Page 3

Copyable
CustomDebugStringConvertible
Equatable
Sendable
SendableMetatype
Making Predictions with a Sequence of Inputs
Integrate a recurrent neural network model to process sequences of inputs.
class MLFeatureValue
A generic wrapper around an underlying value and the value’s type.
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
Conforms To
See Also
Model inputs and outputs


