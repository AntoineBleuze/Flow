# 002_MLTensorRangeExpression.pdf

## Page 1

static var newAxis: any MLTensorRangeExpression
Expand the tensor at the specified dimension.
static var squeezeAxis: any MLTensorRangeExpression
Squeeze the tensor at the specified dimension.
static var fillAll: any MLTensorRangeExpression
The same as the ellipsis literal ... used to indicate unspecified dimensions of the tensor.
static func closedRange(ClosedRange<Int>, stride: Int) -> any MLTensor
RangeExpression
Slice the tensor at the specified dimension.
static func index(Int) -> any MLTensorRangeExpression
Slice the tensor at the specified dimension.
Topics
Expanding and squeezing the tensor
Slicing the tensor
Core ML / MLTensorRangeExpression
Protocol
MLTensorRangeExpression
A type that can be used to slice a dimension of a tensor. Don’t use this type
directly.
iOS 18.0+
iPadOS 18.0+
Mac Catalyst 18.0+
macOS 15.0+
tvOS 18.0+
visionOS 2.0+
watchOS 11.0+


## Page 2

static func partialRangeFrom(PartialRangeFrom<Int>, stride: Int) -> any
MLTensorRangeExpression
Slice the tensor at the specified dimension.
static partialRangeUpTo(_:stride:)
Slice the tensor at the specified dimension.
static func range(Range<Int>, stride: Int) -> any MLTensorRange
Expression
Slice the tensor at the specified dimension.
Sendable, SendableMetatype
struct MLTensor
A multi-dimensional array of numerical or Boolean scalars tailored to ML use cases, containi
methods to perform transformations and mathematical operations efficiently using a ML
compute device.
protocol MLTensorScalar
A type that represents the tensor scalar types supported by the framework. Don’t use this
type directly.
func pointwiseMin(_:_:)
Computes the element-wise minimum of two tensors.
func pointwiseMax(_:_:)
Computes the element-wise minimum between two tensors.
func withMLTensorComputePolicy(_:_:)
Relationships
Inherits From
See Also
Model tensor


## Page 3

Calls the given closure within a task-local context using the specified compute policy to
influence what compute device tensor operations are executed on.


