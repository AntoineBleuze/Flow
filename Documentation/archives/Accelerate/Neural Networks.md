# Neural Networks.pdf

## Page 1

This sample code project uses the Basic Neural Network Subroutines (BNNS) library to create a
simple neural network that’s capable of recognizing digits.
The sample iterates over randomly generated digits in the training phase, incrementally improving
its ability to recognize numbers. After the code completes the training phase, it evaluates its
accuracy at recognizing numbers, and returns a score.
A 6 x 6 matrix represents each digit. For example, the code below represents the number 3:
The network consists of the three layers below:
Fused convolution-batch normalization layer
Pooling layer
Fully connected layer
Overview
Accelerate / Training a neural network to recognize digits
Sample Code
Training a neural network to recognize
digits
Build a simple neural network and train it to recognize randomly generated
numbers.
Download
macOS 12.0+
Xcode 14.3+


## Page 2

After the code completes a forward pass, it calculates its loss, which is a score that indicates how
the predicted values deviate from the labels. The sample code project uses the gradients that the
loss generates as the basis for the backward pass, where it backward-applies the three layers in
reverse order.
The backward passes generate gradient values that an optimizer uses to update the parameters
below:
Convolution weights that the app initializes with random values, and bias
Normalization beta (offset) and gamma (scale)
Fully connected weights
The optimizer’s gradual changes to the weights, bias, beta, and gamma increases the network’s
efficacy in recognizing digits with each iteration.
The image below shows the relationships between the layers:
The sample creates a BNNSFilterParameters structure with useClientPointer. This flag
instructs the layers to keep the provided pointers at creation time, and to work directly from that
data rather than use internal copies of the data.
Define the filter parameters


## Page 3

The convolution-batch normalization layer consists of two sublayers.
Convolution layers that generate their output by multiplying each input value and its neighbors
by corresponding values in an array of weights, and then adding a corresponding bias. Each
output value is the sum of each of those operations. Convolution layers are fundamental to
convolutional neural networks and, with the correct weights and bias values, can identify
features, such as horizontal and vertical lines.
Normalization layers that rescale their data so that all of the batches of data have the same
standard deviation.
The app initializes the convolution weights array with random values.
The app initializes the convolution bias and the batch normalization beta and gamma arrays with a
repeated scalar value.
Create the fused convolution-batch normalization layer


## Page 4

The code below creates the fused layer that applies convolution and normalization to the input:


## Page 5

Pooling layers downscale their input while preserving the most important information and produce
an output that, in the case of this sample code project, consists of the maximum value in each inp
pixel’s local neighborhood.
The following code creates the pooling layer:
Fully connected layers compute the matrix-vector product of a weights matrix and its input, and
flatten the data to predict the correct label.
The app initializes the fully connected weights array with random values.
Create the pooling layer
Create the fully connected layer


## Page 6

The code below creates the fully connected layer:
The loss layer is responsible for quantifying a score that indicates how the predicted values devia
from the labels.
The code below creates the loss layer:
Create the loss layer


## Page 7

For each iteration of the training phase, the sample creates a matrix that represents a random dig
and a one-hot encoded tensor of the same digit. The sample places digits randomly in a 20 x 20
matrix, so a 3 might appear in the matrix as the image below. This example renders 0 as ⚪️, and 1
as ⚫️.
The one-hot encoded tensor contains a 1 at the zero-based index of 3.
The sample code project uses a batch size of 32, so each iteration generates 32 random digits in
random positions in the 20 x 20 grid.
To perform the forward pass, the sample code calls apply on the fused, pooling, and fully
connected layers.
Create the candidate input
Perform the forward pass


## Page 8

Calculating the loss evaluates the efficacy of the neural network. The loss layer generates its
output, lossOutput, which contains a score that indicates how the predicted values deviate fro
the labels, and lossInputGradient, which is the output gradient parameter to the backward
application of the fully connected layer.
The optimizer is responsible for updating the weights, biases, beta, and gamma. In the code below
the sample code project creates an optimizer using the Adam algorithm:
Calculate the loss and loss gradient
Create the optimizer


## Page 9

The sample code project performs the backward pass in reverse order to the forward pass.
Therefore, the sample’s first step is to call applyBackward on the fully connected layer, and
perform an optimization step on its weights.
The applyBackward call on the fully connected layer generates an input gradient that acts as th
output gradient for the pooling layer’s backward apply, and a weights gradient that passes to the
fully connected optimizer step.
The backward pass on the pooling layer generates an input gradient that’s the output gradient to
the backward apply of the fused layer.
The sample calls applyBackward on the fused layer. This performs an optimization step on the
convolution layer’s weights and bias, and the normalization layer’s beta and gamma.
Perform a backward pass and optimization step on the fully
connected layer
Perform a backward pass on the pooling layer
Perform a backward pass and optimization step on the
fused layer


## Page 10

The code below performs the optimization step:
After the app completes all the optimization steps for this iteration, it increments the optimizer tim
step.
The sample iterates over the forward, loss, backward, and optimization steps, and with each
iteration, the trend of the loss is to reduce. The following graph shows the loss, as a solid stroke,
decreasing during training:
The code in the sample defines a maximum number of iterations. Additionally, it calculates a
moving average of recent loss values, which appear as a dashed stroke in the graph above. At eac
Evaluate the neural network


## Page 11

iteration, the sample checks whether the recent average loss is below that threshold, and, if it is, 
breaks from the training phase early.


## Page 12

After the training phase completes, the sample calculates the accuracy of the network over a new
dataset. It then creates a new batch of random digits and runs a forward pass of the network.
Finally, the app evaluates the accuracy of the network by comparing the values in the fully
connected layer’s output to the one-hot labels. For example, when the recognized digit is 3, one-
hot labels contain the values [0, 0, 0, 1, 0, 0, 0, 0, 0, 0], and values in the fully
connected layer’s output might be as follows:
Note that in each case, the highest value in the fully connected layer’s output is at index 3.
The following code performs that evaluation for each digit in the batch:


## Page 13

The evaluation function prints out something like the following:
In this case, the neural network accurately predicts each ground truth digit.
See Also
Neural Networks


## Page 14

BNNS
Implement and run neural networks for training and inference.


## Page 15

The Accelerate framework’s BNNS library is a collection of functions that you use to construct
neural networks for training and inference. BNNS provides routines optimized for high performanc
and low energy consumption across all Apple platforms.
The BNNSGraph API provides the means to build CPU based neural networks from the mlmodelc
file that Xcode compiles from an ML package.
BNNSGraph allows the BNNS library to execute entire networks rather than individual layers. By
considering the full model, BNNS can apply graph-level optimizations such as omitting
unnecessary copy operations, fusing computational kernels, and avoiding computing redundant
information. Furthermore, BNNS can optimize data layouts for constant data — such as convolutio
weights — and this allows the fastest execution on specific hardware. These optimizations can
represent significant performance and energy-efficiency improvements.
static func makeContext(options: BNNSGraph.CompileOptions, (inout 
BNNSGraph.Builder) -> [any BNNSGraph.TensorDescriptor]) throws ->
BNNSGraph.Context
Returns a new context that wraps a graph object that the given closure defines.
struct Builder
Overview
Topics
Building graphs in Swift
Accelerate / BNNS
API Collection
BNNS
Implement and run neural networks for training and inference.


## Page 16

A structure thats provides a closure you can use to define the arguments and operations of a
BNNS Graph.
struct Tensor
A structure that represents an abstract handle to a tensor that you use within a BNNSGraph
.makeContext closure.
Supporting real-time ML inference on the CPU
Add real-time digital signal processing to apps like Logic Pro X and GarageBand with the
BNNS Graph API.
class Context
A wrapper around a compiled graph object that adds a required modifiable context to suppo
dynamically sized models and set execute-time options.
struct bnns_graph_t
The compiled graph object.
func BNNSGraphCompileFromFile(UnsafePointer<CChar>, UnsafePointer<CChar
>?, bnns_graph_compile_options_t) -> bnns_graph_t
Compiles a source mlmodelc file to a graph object.
struct bnns_graph_compile_options_t
The compilation options that BNNS uses when compiling a source mlmodelc file to a graph
object.
func BNNSGraphCompileOptionsMakeDefault() -> bnns_graph_compile_options
_t
Returns an allocated compilation options object with default values.
func BNNSGraphCompileOptionsDestroy(bnns_graph_compile_options_t)
Destroys the specified compilation options object.
func BNNSGraphCompileOptionsSetOutputPath(bnns_graph_compile_options_t,
UnsafePointer<CChar>?)
Creating and executing graphs in Swift
Compiling a graph object
Specifying and querying compilation options


## Page 17

Sets the option for graph compilation to generate the graph object directly to the specified
file.
func BNNSGraphCompileOptionsGetOutputPath(bnns_graph_compile_options_t)
-> UnsafePointer<CChar>?
Returns the option for the compiled graph’s output path.
func BNNSGraphCompileOptionsSetOutputFD(bnns_graph_compile_options_t,
Int32)
Sets the option for graph compilation to generate the graph object directly to the specified f
descriptor.
func BNNSGraphCompileOptionsGetOutputFD(bnns_graph_compile_options_t) -
Int32
Returns the option for the compiled graph’s output file descriptor.
func BNNSGraphCompileOptionsSetTargetSingleThread(bnns_graph_compile
_options_t, Bool)
Sets the option for the compiled graph to execute on a single thread.
func BNNSGraphCompileOptionsGetTargetSingleThread(bnns_graph_compile
_options_t) -> Bool
Returns the option for the compiled graph to execute on a single thread.
func BNNSGraphCompileOptionsSetOptimizationPreference(bnns_graph_compil
_options_t, BNNSGraphOptimizationPreference)
Sets the option for the compiled graph to optimize for either size or performance.
func BNNSGraphCompileOptionsGetOptimizationPreference(bnns_graph_compil
_options_t) -> BNNSGraphOptimizationPreference
Returns the option for the compiled graph to optimize for either size or performance.
struct BNNSGraphOptimizationPreference
Constants that describe the compilation optimization preference.
func BNNSGraphCompileOptionsSetGenerateDebugInfo(bnns_graph_compile
_options_t, Bool)
Sets the option for the compiled graph to include debugging information.
func BNNSGraphCompileOptionsGetGenerateDebugInfo(bnns_graph_compile
_options_t) -> Bool
Returns the option for the compiled graph to include debugging information.
var BNNSTargetSystemGeneric: BNNSTargetSystem


## Page 18

func BNNSGraphCompileOptionsSetMessageLogMask(bnns_graph_compile_option
_t, UInt32)
Sets the mask for compile-time messages.
func BNNSGraphContextSetMessageLogMask(bnns_graph_context_t, UInt32) ->
Int32
Sets mask for log messages that are logged (either via os_log or the user specified callbac
struct BNNSGraphMessageLevel
Constants that specify the mask for compile-time messages.
func BNNSGraphCompileOptionsSetMessageLogCallback(bnns_graph_compile
_options_t, bnns_graph_compile_message_fn_t, UnsafeMutablePointer<bnns
_user_message_data_t>?)
Specifies a customized callback function that reports compile-time messages.
typealias bnns_graph_compile_message_fn_t
The graph compile-message logging callback function.
struct bnns_user_message_data_t
Additional user-defined logging argument for message-logging callbacks.
func BNNSGraphGetArgumentIntents(bnns_graph_t, UnsafePointer<CChar>?,
Int, UnsafeMutablePointer<BNNSGraphArgumentIntent>) -> Int32
Extracts the intents of arguments for the given function argument.
struct BNNSGraphArgumentIntent
Constants that describe argument intents.
func BNNSGraphGetArgumentCount(bnns_graph_t, UnsafePointer<CChar>?) ->
Int
Returns the number of arguments for the given function argument.
func BNNSGraphGetArgumentNames(bnns_graph_t, UnsafePointer<CChar>?, Int
UnsafeMutablePointer<UnsafePointer<CChar>?>) -> Int32
Extracts the names of arguments for the given function argument.
Specifying a graph’s compile-time message callback
Querying a graph’s properties


## Page 19

func BNNSGraphGetFunctionCount(bnns_graph_t) -> Int
Returns the number of callable functions in the specified graph.
func BNNSGraphGetFunctionNames(bnns_graph_t, Int, UnsafeMutablePointer<
UnsafePointer<CChar>?>) -> Int32
Extracts the names of callable functions in the graph.
func BNNSGraphGetInputCount(bnns_graph_t, UnsafePointer<CChar>?) -> Int
Returns the number of input arguments for the given function argument.
func BNNSGraphGetInputNames(bnns_graph_t, UnsafePointer<CChar>?, Int,
UnsafeMutablePointer<UnsafePointer<CChar>?>) -> Int32
Extracts the names of input arguments for the given function argument.
func BNNSGraphGetOutputCount(bnns_graph_t, UnsafePointer<CChar>?) -> In
Returns the number of output arguments for the given function argument.
func BNNSGraphGetOutputNames(bnns_graph_t, UnsafePointer<CChar>?, Int,
UnsafeMutablePointer<UnsafePointer<CChar>?>) -> Int32
Extracts the names of output arguments for the given function argument.
func BNNSGraphGetArgumentPosition(bnns_graph_t, UnsafePointer<CChar>?,
UnsafePointer<CChar>) -> Int
Returns the index into the arguments array for the given function argument.
func BNNSGraphGetArgumentInterleaveFactors(bnns_graph_t, UnsafePointer<
CChar>?, Int, UnsafeMutablePointer<UnsafePointer<UInt16>?>, Unsafe
MutablePointer<Int>) -> Int32
Returns the interleave factors for arguments, if present
struct bnns_graph_context_t
An object that wraps a compiled graph object.
func BNNSGraphContextMake(bnns_graph_t) -> bnns_graph_context_t
Returns an allocated and initialized graph context from the specified graph.
func BNNSGraphContextMakeStreaming(bnns_graph_t, UnsafePointer<CChar>?,
Int, UnsafePointer<BNNSTensor>?) -> bnns_graph_context_t
Returns an allocated and initialized graph context with streaming support from the specified
graph.
Creating and destroying a context


## Page 20

func BNNSGraphContextDestroy(bnns_graph_context_t)
Destroys the specified graph context.
func BNNSGraphContextSetStreamingAdvanceCount(bnns_graph_context_t, Int
-> Int32
Sets the streaming advancement amount for cases with dynamically shaped inputs.
func BNNSGraphContextSetArgumentType(bnns_graph_context_t, BNNSGraph
ArgumentType) -> Int32
Specifies the argument type for a graph context.
struct BNNSGraphArgumentType
Constants that specify the argument type for a graph context.
func BNNSGraphContextSetDynamicShapes(bnns_graph_context_t, Unsafe
Pointer<CChar>?, Int, UnsafeMutablePointer<bnns_graph_shape_t>) -> Int3
Specifies the dynamic shapes for a graph and, if possible, infers, the output shapes.
struct bnns_graph_shape_t
The specification of the shape of an argument.
func BNNSGraphContextSetBatchSize(bnns_graph_context_t, UnsafePointer<
CChar>?, UInt64) -> Int32
Sets the batch size for a graph.
func BNNSGraphContextEnableNanAndInfChecks(bnns_graph_context_t, Bool)
Specifies that the context checks intermediate tensors for NaNs and infinities.
func BNNSGraphContextGetWorkspaceSize(bnns_graph_context_t, Unsafe
Pointer<CChar>?) -> Int
Returns the minimum size, in bytes, of the workspace that graph context execution requires.
func BNNSGraphContextSetStreamingAdvanceCount(bnns_graph_context_t, Int
-> Int32
Sets the streaming advancement amount for cases with dynamically shaped inputs.
Specifying and querying a context’s properties
Specifying a context’s execute-time message callback


## Page 21

func BNNSGraphContextSetMessageLogCallback(bnns_graph_context_t, bnns
_graph_execute_message_fn_t, UnsafeMutablePointer<bnns_user_message_dat
_t>?) -> Int32
Specifies a customized callback function that reports execution-time messages.
typealias bnns_graph_execute_message_fn_t
The graph execute-message logging callback function.
struct BNNSGraphMessageLevel
Constants that specify the mask for compile-time messages.
struct bnns_user_message_data_t
Additional user-defined logging argument for message-logging callbacks.
func BNNSGraphContextSetWorkspaceAllocationCallback(bnns_graph_context_
, bnns_graph_realloc_fn_t?, bnns_graph_free_all_fn_t?, Int, Unsafe
MutableRawPointer?) -> Int32
Sets the allocation and deallocation callbacks for internal workspace.
func BNNSGraphContextSetOutputAllocationCallback(bnns_graph_context_t,
bnns_graph_realloc_fn_t?, bnns_graph_free_all_fn_t?, Int, UnsafeMutable
RawPointer?) -> Int32
Sets the allocation and deallocation callbacks for function outputs.
typealias bnns_graph_realloc_fn_t
The workspace and output allocation function.
typealias bnns_graph_free_all_fn_t
The workspace and output deallocation function.
struct BNNSTensor
A structure that describes the shape, stride, data type, and, optionally, the memory location 
an n-dimensional array.
func BNNSTensorGetAllocationSize(UnsafePointer<BNNSTensor>) -> Int
Returns the minimum allocation size, in bytes, of the specified tensor.
Specifying a context’s allocation callbacks
Specifying and querying a tensor’s properties


## Page 22

func BNNSGraphContextGetTensor(bnns_graph_context_t, UnsafePointer<CCha
>?, UnsafePointer<CChar>, Bool, UnsafeMutablePointer<BNNSTensor>) ->
Int32
Sets the properties of a tensor for the specified function argument.
func BNNSGraphTensorFillStrides(bnns_graph_t, UnsafePointer<CChar>?,
UnsafePointer<CChar>, UnsafeMutablePointer<BNNSTensor>) -> Int32
Sets the stride of the specifed tensor for compatibility with the given model’s input or output
argument based on its current shape.
func BNNSGraphContextExecute(bnns_graph_context_t, UnsafePointer<CChar
>?, Int, UnsafeMutablePointer<bnns_graph_argument_t>, Int, UnsafeMutabl
Pointer<CChar>?) -> Int32
Executes the specified function with the given context.
struct BNNSGraphArgumentType
Constants that specify the argument type for a graph context.
enum BNNS
An enumeration that acts as a namespace for Swift overlays to BNNS.
enum BNNSGraph
An enumeration that acts as a namespace for the Swift overlays to BNNS Graph.
struct BNNSDataType
BNNS Data Types.
struct BNNSSparsityParameters
struct BNNSSparsityType
struct BNNSTargetSystem
struct bnns_graph_argument_t
Describes data associated with an input or output argument
struct BNNSImageStackDescriptor
Deprecated
Executing a graph
Enumerations
Structures


## Page 23

struct BNNSVectorDescriptor
Deprecated
protocol BNNSScalar
var BNNS_MAX_TENSOR_DIMENSION: Int32
Classic BNNS API
Training a neural network to recognize digits
Build a simple neural network and train it to recognize randomly generated numbers.
Protocols
Macros
Deprecated symbols
See Also
Neural Networks


