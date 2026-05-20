# 004_MLDictionaryFeatureProvider.pdf

## Page 1

If your input data is stored in a dictionary, consider this type of MLFeatureProvider that is
backed by a dictionary. It is a convenience interface, saving you the trouble of iterating through th
dictionary to assign all of its values.
init(dictionary: [String : Any]) throws
Creates the feature provider based on a dictionary.
subscript(String) -> MLFeatureValue?
Subscript interface for the feature provider to pass through to the dictionary.
var dictionary: [String : MLFeatureValue]
Overview
Topics
Creating the provider
Accessing the features
Core ML / MLDictionaryFeatureProvider
Class
MLDictionaryFeatureProvider
A convenience wrapper for the given dictionary of data.
iOS 11.0+
iPadOS 11.0+
Mac Catalyst 13.1+
macOS 10.13+
tvOS 11.0+
visionOS 1.0+
watchOS 4.0+


## Page 2

The backing dictionary.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
MLFeatureProvider
NSCoding
NSFastEnumeration
NSObjectProtocol
NSSecureCoding
Making Predictions with a Sequence of Inputs
Integrate a recurrent neural network model to process sequences of inputs.
class MLFeatureValue
A generic wrapper around an underlying value and the value’s type.
struct MLSendableFeatureValue
A sendable feature value.
protocol MLFeatureProvider
An interface that represents a collection of values for either a model’s input or its output.
Relationships
Inherits From
Conforms To
See Also
Model inputs and outputs


## Page 3

protocol MLBatchProvider
An interface that represents a collection of feature providers.
class MLArrayBatchProvider
A convenience wrapper for batches of feature providers.
class MLModelAsset
An abstraction of a compiled Core ML model asset.


