# 005_withMLTensorComputePolicy______.pdf

## Page 1

computePolicy
A compute policy that will be set before the closure gets called and restored after the closure
returns.
body
A nullary closure. If the closure has a return value, that value is also used as the return value 
the withMLTensorComputePolicy(_:_:) function.
The return value, if any, of the body closure.
Parameters
Return Value
See Also
Model tensor
Core ML / withMLTensorComputePolicy(_:_:)
Function
withMLTensorComputePolicy(_:_:)
Calls the given closure within a task-local context using the specified compute
policy to influence what compute device tensor operations are executed on.
iOS 18.0+
iPadOS 18.0+
Mac Catalyst 18.0+
macOS 15.0+
tvOS 18.0+
visionOS 2.0+
watchOS 11.0+
Show all declarations


## Page 2

struct MLTensor
A multi-dimensional array of numerical or Boolean scalars tailored to ML use cases, containi
methods to perform transformations and mathematical operations efficiently using a ML
compute device.
protocol MLTensorScalar
A type that represents the tensor scalar types supported by the framework. Don’t use this
type directly.
protocol MLTensorRangeExpression
A type that can be used to slice a dimension of a tensor. Don’t use this type directly.
func pointwiseMin(_:_:)
Computes the element-wise minimum of two tensors.
func pointwiseMax(_:_:)
Computes the element-wise minimum between two tensors.


