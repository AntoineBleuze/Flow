# Model tensor.pdf

## Page 1

init(_:)
Creates a one-dimensional tensor from scalars.
init(some Collection<MLTensor>, alongAxis: Int)
Creates a tensor by stacking the given tensors along the specified axis.
init(_:scalarType:)
Creates a one-dimensional tensor from scalars.
init(bytesNoCopy: UnsafeRawBufferPointer, shape: [Int], scalarType: any
MLTensorScalar.Type, deallocator: Data.Deallocator)
Creates a tensor with memory content without copying the bytes.
init(concatenating: some Collection<MLTensor>, alongAxis: Int)
Concatenates tensors along the axis dimension.
init(linearSpaceFrom: Float, through: Float, count: Int)
Topics
Creating a tensor
Core ML / MLTensor
Structure
MLTensor
A multi-dimensional array of numerical or Boolean scalars tailored to ML use
cases, containing methods to perform transformations and mathematical
operations efficiently using a ML compute device.
iOS 18.0+
iPadOS 18.0+
Mac Catalyst 18.0+
macOS 15.0+
tvOS 18.0+
visionOS 2.0+
watchOS 11.0+


## Page 2

Creates a one-dimensional tensor representing a sequence from a starting value, up to and
including an end value, spaced evenly to generate the number of values specified.
init<Scalar>(linearSpaceFrom: Scalar, through: Scalar, count: Int,
scalarType: Scalar.Type)
Creates a one-dimensional tensor representing a sequence from a starting value, up to and
including an end value, spaced evenly to generate the number of values specified.
init(ones:scalarType:)
Creates a tensor with all scalars set to ones.
init<Scalar>(randomNormal: [Int], mean: Scalar, standardDeviation:
Scalar, seed: UInt64?, scalarType: Scalar.Type)
Creates a tensor with the specified shape, randomly sampling scalar values from a normal
distribution.
init(randomUniform:in:seed:scalarType:)
Creates a tensor with the specified shape, randomly sampling scalar values from a uniform
distribution in bounds.
init(rangeFrom: Float, to: Float, by: Float.Stride)
Creates a one-dimensional tensor representing a sequence from a starting value to, but not
including, an end value, stepping by the specified amount.
init<Scalar>(rangeFrom: Scalar, to: Scalar, by: Scalar.Stride, scalar
Type: Scalar.Type)
Creates a one-dimensional tensor representing a sequence from a starting value to, but not
including, an end value, stepping by the specified amount.
init(repeating: Float, shape: [Int])
Creates a tensor with the specified shape and a single, repeated scalar value.
init<Scalar>(repeating: Scalar, shape: [Int], scalarType: Scalar.Type)
Creates a tensor with the specified shape and a single, repeated scalar value.
init(shape: [Int], data: Data, scalarType: any MLTensorScalar.Type)
Creates a tensor by copying the given block of data.
init(shape: [Int], scalars: some Collection<Float>)
Creates a tensor with the specified shape and contiguous scalars in first-major order.
init<Scalar>(shape: [Int], scalars: some Collection, scalarType: Scalar
.Type)
Creates a tensor with the specified shape and contiguous scalars in row-major order.


## Page 3

init(stacking: some Collection<MLTensor>, alongAxis: Int)
Stacks the given tensors along the axis dimension into a new tensor with rank one higher
than the current tensor and each tensor.
init(unsafeUninitializedShape: [Int], scalarType: any MLTensorScalar
.Type, initializingWith: (UnsafeMutableRawBufferPointer) throws -> Void
rethrows
Creates a tensor with the specified shape, then calls the given closure with a buffer covering
the tensor’s uninitialized memory.
init(zeros:scalarType:)
Creates a tensor with all scalars set to zero.
var isScalar: Bool
A Boolean value indicating whether the tensor is a scalar (when the rank is equal to 0) or no
var rank: Int
The number of dimensions of the tensor.
var scalarCount: Int
The number of scalar elements in the tensor.
var scalarType: any MLTensorScalar.Type
The type of scalars in the tensor.
var shape: [Int]
The shape of the tensor.
func sum(alongAxes:keepRank:)
Returns the sum along the specified axes.
func sum(keepRank: Bool) -> MLTensor
Returns the sum along all axes.
func all(alongAxes:keepRank:)
Accessing tensor properties
Getting the sum
Performing a logical AND operation


## Page 4

Computes logical AND on elements across the specified axes of a tensor where the scalar
type of the tensor is expected to be Boolean.
func all(keepRank: Bool) -> MLTensor
Computes logical AND on elements across all axes of a tensor where the scalar type of the
tensor is expected to be Boolean.
func any(alongAxes:keepRank:)
Computes logical OR on elements across the specified axes of a tensor where the scalar typ
of the tensor is expected to be Boolean.
func any(keepRank: Bool) -> MLTensor
Computes logical OR on elements across all dimensions of a tensor where the scalar type of
the tensor is expected to be Boolean.
func argmax() -> MLTensor
Returns the index of the maximum value of the flattened scalars.
func argmax(alongAxis: Int, keepRank: Bool) -> MLTensor
Returns the indices of the maximum values along the specified axis.
func argmin() -> MLTensor
Returns the index of the minimum value of the flattened scalars.
func argmin(alongAxis: Int, keepRank: Bool) -> MLTensor
Returns the indices of the minimum values along the specified axis.
func argsort(alongAxis: Int, descendingOrder: Bool) -> MLTensor
Returns the indices (or arguments) of a tensor that give its sorted order along the specified
axis.
func cast(like: MLTensor) -> MLTensor
Casts the elements of the tensor to the scalar type of the given array.
func cast<Scalar>(to: Scalar.Type) -> MLTensor
Casts the elements of the tensor to the given scalar type.
Performing a logical OR operation
Accessing the indicies
Casting the elements


## Page 5

func abs() -> MLTensor
Computes the absolute of the tensor’s elements.
func ceil() -> MLTensor
Computes the ceiling of the tensor’s elements.
func floor() -> MLTensor
Computes the floor of the tensor’s elements.
static *(_:_:)
Computes element-wise multiplication.
static func *= (inout MLTensor, MLTensor)
Computes element-wise multiplication.
static +(_:_:)
Computes element-wise addition.
static func += (inout MLTensor, MLTensor)
Computes element-wise addition.
static func - (MLTensor) -> MLTensor
Returns the negation of the tensor.
static -(_:_:)
Computes element-wise subtraction.
static func -= (inout MLTensor, MLTensor)
Computes element-wise subtraction.
static func .! (MLTensor) -> MLTensor
Computes logical not on the tensor’s elements.
static .!=(_:_:)
Computes element-wise inequality between two tensors.
static func .& (MLTensor, MLTensor) -> MLTensor
Computing the absolute, ceiling and floor
Performing arithmetic operations


## Page 6

Computes element-wise logical AND where both operands are expected contain Boolean
scalar elements.
static .==(_:_:)
Computes element-wise equality between two tensors.
static .>(_:_:)
Computes element-wise greater comparison between two tensors.
static .<(_:_:)
Computes element-wise less comparison between two tensors.
static func .| (MLTensor, MLTensor) -> MLTensor
Computes element-wise logical OR where both operands are expected contain Boolean scal
elements.
static func .^ (MLTensor, MLTensor) -> MLTensor
Computes element-wise logical XOR where both operands are expected contain Boolean
scalar elements.
static .>=(_:_:)
Computes element-wise greater than or equal to comparison between two tensors.
static .<=(_:_:)
Computes element-wise less than or equal to comparison between two tensors.
static /(_:_:)
Computes element-wise division.
static %(_:_:)
Computes element-wise remainder of division.
static func %= (inout MLTensor, MLTensor)
Computes element-wise remainder of division.
static func /= (inout MLTensor, MLTensor)
Computes element-wise multiplication.
func cos() -> MLTensor
Computes the cosine of the tensor’s elements.
Applying trigonometric functions


## Page 7

func cosh() -> MLTensor
Computes the hyperbolic cosine of the tensor’s elements.
func acos() -> MLTensor
Computes the inverse cosine of the tensor’s elements.
func acosh() -> MLTensor
Computes the inverse hyperbolic cosine of the tensor’s elements.
func sin() -> MLTensor
Computes sine of the tensor’s elements.
func sinh() -> MLTensor
Computes hyperbolic sine of the tensor’s elements.
func asin() -> MLTensor
Computes the inverse sine of the tensor’s elements.
func asinh() -> MLTensor
Computes the inverse hyperbolic sine of the tensor’s elements.
func tan() -> MLTensor
Computes tangent of the tensor’s elements.
func tanh() -> MLTensor
Computes hyperbolic tangent of the tensor’s elements.
func atan() -> MLTensor
Computes the inverse tangent of the tensor’s elements.
func atanh() -> MLTensor
Computes the inverse hyperbolic tangent of the tensor’s elements.
func min(alongAxes:keepRank:)
Returns the minimum values along the specified axes.
func min(keepRank: Bool) -> MLTensor
Returns the minimum value in the array.
func max(alongAxes:keepRank:)
Returns the maximum values along the specified axes.
Accessing the minimum, maximum and mean


## Page 8

func max(keepRank: Bool) -> MLTensor
Returns the maximum value in the array.
func mean(alongAxes:keepRank:)
Returns the mean along the specified axes.
func mean(keepRank: Bool) -> MLTensor
Returns the mean along all axes.
func split(count: Int, alongAxis: Int) -> [MLTensor]
Splits a tensor into multiple tensors. The tensor is split along dimension axis into count
smaller tensors.
func split(sizes: [Int], alongAxis: Int) -> [MLTensor]
Splits a tensor into multiple tensors. The tensor is split into sizes.shape[0] parts.
func resized(to: (newHeight: Int, newWidth: Int), method: MLTensor.
ResizeMethod) -> MLTensor
Resize the tensor’s spatial dimensions to size using the specified method.
enum ResizeMethod
A resize algorithm.
func padded(forSizes: [(before: Int, after: Int)], mode: MLTensor.
PaddingMode) -> MLTensor
Returns a padded tensor according to the specified padding sizes and mode.
func padded(forSizes: [(before: Int, after: Int)], with: Float) ->
MLTensor
Returns a tensor padded with the given constant according to the specified padding sizes.
enum PaddingMode
A mode that dictates how a tensor is padded.
Splitting the tensor
Resizing the tensor
Padding the tensor
Replacing the tensor values


## Page 9

func replacing(atIndices: MLTensor, with: some MLTensorScalar, alongAxi
: Int) -> MLTensor
Replaces slices along the specified indices with the given replacement values.
func replacing(with: MLTensor, atIndices: MLTensor, alongAxis: Int) ->
MLTensor
Replaces slices along the specified indices with the given replacement values.
func replacing(with:where:)
Returns a new tensor replacing values from other with the corresponding element in self
where the associated element in mask is true.
func gathering(atIndices: MLTensor) -> MLTensor
Returns a tensor by gathering slices at the specified indices.
func gathering(atIndices: MLTensor, alongAxis: Int) -> MLTensor
Returns a tensor by gathering slices along the given axis at the specified indices.
func transposed() -> MLTensor
Permutes the tensor with dimensions permuted in reverse order.
func transposed(permutation:)
Permutes the dimensions of the tensor in the specified order.
func unstacked(alongAxis: Int) -> [MLTensor]
Unpacks the given dimension of a rank-R tensor into multiple rank-(R-1) tensors.
func shapedArray<Scalar>(of: Scalar.Type) async -> MLShapedArray<Scalar
Returns a materialized representation of the tensor.
Gathering slices
Transposing the tensor
Unpacking the tensor
Getting the shaped representation of the tensor
Removing dimensions from the shape of the tensor


## Page 10

func squeezingShape() -> MLTensor
Removes all dimensions of size 1 from the shape of the tensor.
func squeezingShape(at:)
Removes the specified dimensions of size 1 from the shape of the tensor.
func product(alongAxes:keepRank:)
Returns the product along the specified axes.
func product(keepRank: Bool) -> MLTensor
Returns the product along all axes.
func topK(Int) -> (values: MLTensor, indices: MLTensor)
Returns the k largest values along the last axis of the tensor.
func clamped(to:)
Clamps all elements to the given lower and upper bounds, inclusively.
func concatenated(with: MLTensor, alongAxis: Int) -> MLTensor
Returns a concatenated tensor along the specified axis.
func cumulativeProduct(alongAxis: Int) -> MLTensor
Computes the cumulative product along the specified axis.
func cumulativeSum(alongAxis: Int) -> MLTensor
Computes the cumulative sum along the specified axis.
func exp() -> MLTensor
Computes the natural exponent of the tensor’s elements.
Accessing the product along an axes
Getting the largest values
Clamping and concatenating
Computing the cumulative value
Computing the exponent, pow and square root


## Page 11

func exp2() -> MLTensor
Computes the exponent with base two of the tensor’s elements.
func pow(_:)
Computes element-wise power of each element with exponent.
func rsqrt() -> MLTensor
Computes reverse square root of the tensor’s elements.
func squared() -> MLTensor
Computes square of the tensor’s elements.
func squareRoot() -> MLTensor
Computes square root of the tensor’s elements.
func log() -> MLTensor
Computes the natural logarithm of the tensor’s elements.
func round() -> MLTensor
Rounds the tensor’s elements.
func matmul(MLTensor) -> MLTensor
Multiplies two tensors together using matrix multiplication.
func expandingShape(at:)
Returns a shape-expanded tensor with a dimension of 1 inserted at the specified shape
indices.
func bandPart(lowerBandCount: Int, upperBandCount: Int) -> MLTensor
Returns a new tensor with the same shape where everything outside a central band in each
innermost matrix is set to zero.
func tiled(multiples: [Int]) -> MLTensor
Returns a tensor by replicating its elements multiple times.
func sign() -> MLTensor
Returns the sign of the tensor’s elements.
func reciprocal() -> MLTensor
Computes the reciprocal of the tensor’s elements.
Accessing the extended tensor, sign and reciprocal


## Page 12

func flattened() -> MLTensor
Reshape to a one-dimensional tensor.
func reshaped(to: [Int]) -> MLTensor
Reshape to the specified shape.
func softmax(alongAxis: Int) -> MLTensor
Computes the softmax of the specified tensor along the specified axis.
func reversed(alongAxes:)
Returns a new tensor with the specified dimensions reversed.
subscript((any MLTensorRangeExpression)?...) -> MLTensor
subscript((UnboundedRange_) -> (), (any MLTensorRangeExpression)?...) -
MLTensor
subscript((any MLTensorRangeExpression)?, (UnboundedRange_) -> (), (any
MLTensorRangeExpression)?...) -> MLTensor
subscript((any MLTensorRangeExpression)?, (any MLTensorRangeExpression
)?, (UnboundedRange_) -> (), (any MLTensorRangeExpression)?...) ->
MLTensor
subscript((any MLTensorRangeExpression)?, (any MLTensorRangeExpression
)?, (any MLTensorRangeExpression)?, (UnboundedRange_) -> (), (any
MLTensorRangeExpression)?...) -> MLTensor
CustomReflectable Implementations
Reshaping the tensor
Computing the softmax
Reversing the tensor
Accessing a multiarray’s elements
Default Implementations


## Page 13

Copyable
CustomReflectable
CustomStringConvertible
ExpressibleByArrayLiteral
ExpressibleByBooleanLiteral
ExpressibleByFloatLiteral
ExpressibleByIntegerLiteral
Sendable
SendableMetatype
protocol MLTensorScalar
A type that represents the tensor scalar types supported by the framework. Don’t use this
type directly.
protocol MLTensorRangeExpression
A type that can be used to slice a dimension of a tensor. Don’t use this type directly.
func pointwiseMin(_:_:)
Computes the element-wise minimum of two tensors.
func pointwiseMax(_:_:)
Computes the element-wise minimum between two tensors.
func withMLTensorComputePolicy(_:_:)
Calls the given closure within a task-local context using the specified compute policy to
influence what compute device tensor operations are executed on.
Relationships
Conforms To
See Also
Model tensor


## Page 14

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


## Page 15

func pointwiseMax(_:_:)
Computes the element-wise minimum between two tensors.
func withMLTensorComputePolicy(_:_:)
Calls the given closure within a task-local context using the specified compute policy to
influence what compute device tensor operations are executed on.


## Page 16

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


## Page 17

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


## Page 18

Calls the given closure within a task-local context using the specified compute policy to
influence what compute device tensor operations are executed on.


## Page 19

For example:
Shapes must be broadcastable, where the broadcasted shape becomes the shape of the output.
struct MLTensor
A multi-dimensional array of numerical or Boolean scalars tailored to ML use cases, containi
methods to perform transformations and mathematical operations efficiently using a ML
Discussion
See Also
Model tensor
Core ML / pointwiseMin(_:_:)
Function
pointwiseMin(_:_:)
Computes the element-wise minimum of two tensors.
iOS 18.0+
iPadOS 18.0+
Mac Catalyst 18.0+
macOS 15.0+
tvOS 18.0+
visionOS 2.0+
watchOS 11.0+
Show all declarations


## Page 20

compute device.
protocol MLTensorScalar
A type that represents the tensor scalar types supported by the framework. Don’t use this
type directly.
protocol MLTensorRangeExpression
A type that can be used to slice a dimension of a tensor. Don’t use this type directly.
func pointwiseMax(_:_:)
Computes the element-wise minimum between two tensors.
func withMLTensorComputePolicy(_:_:)
Calls the given closure within a task-local context using the specified compute policy to
influence what compute device tensor operations are executed on.


## Page 21

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


## Page 22

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


## Page 23

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


## Page 24

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


