# 000_MLState.pdf

## Page 1

A stateful model maintains a state from one prediction to another by storing the information in the
state buffers. To use such a model, the client must request the model to create state buffers and
get MLState object, which is the handle to those buffers. Then, at the prediction time, pass the
MLState object in one of the stateful prediction functions.
Overview
Core ML / MLState
Class
MLState
Handle to the state buffers.
iOS 18.0+
iPadOS 18.0+
Mac Catalyst 18.0+
macOS 15.0+
tvOS 18.0+
visionOS 2.0+
watchOS 11.0+


## Page 2

The object is a handle to the state buffers. The client shall not read or write the buffers while a
prediction is in-flight.
Each stateful prediction that uses the same MLState must be serialized. Otherwise, if two such
predictions run concurrently, the behavior is undefined.
func withMultiArray<R>(for: String, (MLMultiArray) throws -> R) rethrow
-> R
func withMultiArray<R>((MLMultiArray) -> R) throws -> R
Deprecated
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Sendable
SendableMetatype
class MLStateConstraint
Topics
Getting a state buffer
Relationships
Inherits From
Conforms To
See Also
Model state


## Page 3

Constraint of a state feature value.


