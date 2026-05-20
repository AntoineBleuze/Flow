# 001_BNNS.pdf

## Page 1

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


## Page 2

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


## Page 3

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


## Page 4

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


## Page 5

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


## Page 6

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


## Page 7

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


## Page 8

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


## Page 9

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


