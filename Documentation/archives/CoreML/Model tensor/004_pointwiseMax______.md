# 004_pointwiseMax______.pdf

## Page 1

For example:
Shapes must be broadcastable, where the broadcasted shape becomes the shape of the output.
struct MLTensor
A multi-dimensional array of numerical or Boolean scalars tailored to ML use cases, containi
methods to perform transformations and mathematical operations efficiently using a ML
Discussion
See Also
Model tensor
Core ML / pointwiseMax(_:_:)
Function
pointwiseMax(_:_:)
Computes the element-wise minimum between two tensors.
iOS 18.0+
iPadOS 18.0+
Mac Catalyst 18.0+
macOS 15.0+
tvOS 18.0+
visionOS 2.0+
watchOS 11.0+
Show all declarations


## Page 2

compute device.
protocol MLTensorScalar
A type that represents the tensor scalar types supported by the framework. Don’t use this
type directly.
protocol MLTensorRangeExpression
A type that can be used to slice a dimension of a tensor. Don’t use this type directly.
func pointwiseMin(_:_:)
Computes the element-wise minimum of two tensors.
func withMLTensorComputePolicy(_:_:)
Calls the given closure within a task-local context using the specified compute policy to
influence what compute device tensor operations are executed on.


