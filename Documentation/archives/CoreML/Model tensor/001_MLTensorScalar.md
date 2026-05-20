# 001_MLTensorScalar.pdf

## Page 1

Sendable, SendableMetatype
struct MLTensor
A multi-dimensional array of numerical or Boolean scalars tailored to ML use cases, containi
methods to perform transformations and mathematical operations efficiently using a ML
compute device.
protocol MLTensorRangeExpression
A type that can be used to slice a dimension of a tensor. Don’t use this type directly.
func pointwiseMin(_:_:)
Computes the element-wise minimum of two tensors.
Relationships
Inherits From
See Also
Model tensor
Core ML / MLTensorScalar
Protocol
MLTensorScalar
A type that represents the tensor scalar types supported by the framework. Don’t
use this type directly.
iOS 18.0+
iPadOS 18.0+
Mac Catalyst 18.0+
macOS 15.0+
tvOS 18.0+
visionOS 2.0+
watchOS 11.0+


## Page 2

func pointwiseMax(_:_:)
Computes the element-wise minimum between two tensors.
func withMLTensorComputePolicy(_:_:)
Calls the given closure within a task-local context using the specified compute policy to
influence what compute device tensor operations are executed on.


