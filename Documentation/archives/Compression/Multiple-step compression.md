# Multiple-step compression.pdf

## Page 1

The basic workflow for using the stream interface is as follows:
1. Initialize the state of your compression_stream structure by calling compression_strea
_init(_:_:_:) with the operation parameter set to specify whether you are encoding or
decoding, and the chosen algorithm specified by the algorithm parameter. This allocates
storage for the state that allows you to resume encoding or decoding across calls.
2. Set the dst_buffer, dst_size, src_buffer, and src_size fields of the compression
_stream object to point to the next blocks that your code processes.
3. Call compression_stream_process(_:_:). If no further input will be added to the stream
via subsequent calls, flags should be COMPRESSION_STREAM_FINALIZE (otherwise 0). If
compression_stream_process(_:_:) returns COMPRESSION_STATUS_END, there is no
further output from the stream.
4. Repeat steps 2 and 3 as necessary to process the entire stream.
5. Call compression_stream_destroy(_:) to free the state object in the stream structure.
Overview
Topics
Initializers
Compression / compression_stream
Structure
compression_stream
A structure representing a compression stream.
iOS
iPadOS
Mac Catalyst
macOS
tvOS
visionOS
watchOS


## Page 2

init(dst_ptr: UnsafeMutablePointer<UInt8>, dst_size: Int, src_ptr:
UnsafePointer<UInt8>, src_size: Int, state: UnsafeMutableRawPointer?)
Returns a new compression stream structure.
var dst_ptr: UnsafeMutablePointer<UInt8>
A pointer to the first byte of the destination buffer.
var dst_size: Int
The size, in bytes, of the destination buffer.
var src_ptr: UnsafePointer<UInt8>
A pointer to the first byte of the source buffer.
var src_size: Int
The size, in bytes, of the source buffer.
var state: UnsafeMutableRawPointer?
The stream state object of the compression stream.
BitwiseCopyable
func compression_stream_init(UnsafeMutablePointer<compression_stream>,
compression_stream_operation, compression_algorithm) -> compression
_status
Initializes a compression stream for either compression or decompression.
Compression Stream Properties
Relationships
Conforms To
See Also
Multiple-step compression


## Page 3

func compression_stream_process(UnsafeMutablePointer<compression_stream
>, Int32) -> compression_status
Performs compression or decompression using an initialized compression stream structure.
func compression_stream_destroy(UnsafeMutablePointer<compression_stream
>) -> compression_status
Frees any memory allocated by stream initialization function.
struct compression_status
A set of values used to represent the status of stream compression.
struct compression_stream_flags
A set of values used to represent stream compression flags.
struct compression_stream_operation
A set of values used to represent a stream compression operation.
struct compression_algorithm
A structure for values that represent compression algorithms.


## Page 4

stream
Pointer to an allocated compression_stream structure.
operation
A constant of type compression_stream_operation used to indicate the stream
operation.
algorithm
A constant of type compression_algorithm to select the algorithm: COMPRESSION_LZ4
COMPRESSION_ZLIB, COMPRESSION_LZMA, or COMPRESSION_LZFSE.
A value of type compression_status, interpreted as follows:
COMPRESSION_STATUS_OK means the stream object was successfully initialized.
COMPRESSION_STATUS_ERROR means an error occurred.
Parameters
Return Value
Compression / compression_stream_init(_:_:_:)
Function
compression_stream_init(_:_:_:)
Initializes a compression stream for either compression or decompression.
iOS 9.0+
iPadOS 9.0+
Mac Catalyst 13.1+
macOS 10.11+
tvOS 9.0+
visionOS 1.0+
watchOS 2.0+


## Page 5

After success of this function, set the dst_ptr, dst_size, src_ptr, and src_size fields of
the stream structure to their respective values. You can then pass stream structure to the
compression_stream_process(_:_:) function.
struct compression_stream
A structure representing a compression stream.
func compression_stream_process(UnsafeMutablePointer<compression_stream
>, Int32) -> compression_status
Performs compression or decompression using an initialized compression stream structure.
func compression_stream_destroy(UnsafeMutablePointer<compression_stream
>) -> compression_status
Frees any memory allocated by stream initialization function.
struct compression_status
A set of values used to represent the status of stream compression.
struct compression_stream_flags
A set of values used to represent stream compression flags.
struct compression_stream_operation
A set of values used to represent a stream compression operation.
struct compression_algorithm
A structure for values that represent compression algorithms.
Discussion
See Also
Multiple-step compression


## Page 6

stream
A pointer to an allocated and fully initialized compression_stream structure.
flags
A constant of type compression_stream_flags; this should be COMPRESSION_STREAM
_FINALIZE if there is no further input data, or 0 otherwise.
A value of type compression_status, interpreted as follows:
COMPRESSION_STATUS_OK means that processing was successful, but the stream may
produce more output. Call the function again with updated parameters.
COMPRESSION_STATUS_END means that processing was successful, and the stream will
produce no more output (this only occurs if flags is set to COMPRESSION_STREAM
_FINALIZE).
COMPRESSION_STATUS_ERROR means an error occurred.
Parameters
Return Value
Compression / compression_stream_process(_:_:)
Function
compression_stream_process(_:_:)
Performs compression or decompression using an initialized compression stream
structure.
iOS 9.0+
iPadOS 9.0+
Mac Catalyst 13.1+
macOS 10.11+
tvOS 9.0+
visionOS 1.0+
watchOS 2.0+


## Page 7

Each time compression_stream_process(_:_:) is called successfully, the function
consumes data from the source buffer and writes data into the destination buffer, until it reaches
the end of one of the buffers and returns either COMPRESSION_STATUS_OK or COMPRESSION
_STATUS_END.
After a successful call, the function updates the buffer parameters in the stream object: the
function increments src_ptr (and decrements src_size) by the number of input bytes
consumed. Likewise, the function incremets dst_ptr (and decrements dst_size) by the numb
of output bytes produced. The sum (src_ptr + src_size) remains unchanged, and so does
(dst_ptr + dst_size). At this point, either src_size or dst_size will be 0, indicating that
the source buffer is empty or the destination buffer is full.
If the source buffer is empty, you can refill it with more data and adjust the parameters, or point to
different buffer for the next call. If you don’t provide any more input data, set flags to
COMPRESSION_STREAM_FINALIZE and call again.
If the destination buffer is full and the return value is not COMPRESSION_STATUS_END, there ma
still be input available for processing. To let this happen, you might grow the buffer, move the
pointer back to reuse the buffer, or point to a new destination buffer, and then call again.
struct compression_stream
A structure representing a compression stream.
func compression_stream_init(UnsafeMutablePointer<compression_stream>,
compression_stream_operation, compression_algorithm) -> compression
_status
Initializes a compression stream for either compression or decompression.
func compression_stream_destroy(UnsafeMutablePointer<compression_stream
>) -> compression_status
Frees any memory allocated by stream initialization function.
struct compression_status
A set of values used to represent the status of stream compression.
struct compression_stream_flags
A set of values used to represent stream compression flags.
Discussion
See Also
Multiple-step compression


## Page 8

struct compression_stream_operation
A set of values used to represent a stream compression operation.
struct compression_algorithm
A structure for values that represent compression algorithms.


## Page 9

stream
A pointer to an allocated and initialized compression_stream structure.
A value of type compression_status, interpreted as follows:
COMPRESSION_STATUS_OK means that the function successfully destroyed the stream.
COMPRESSION_STATUS_ERROR means an error occurred.
Note that compression_stream_destroy(_:) doesn’t free the stream object or the buffers
allocated by the caller.
Parameters
Return Value
Discussion
See Also
Compression / compression_stream_destroy(_:)
Function
compression_stream_destroy(_:)
Frees any memory allocated by stream initialization function.
iOS 9.0+
iPadOS 9.0+
Mac Catalyst 13.1+
macOS 10.11+
tvOS 9.0+
visionOS 1.0+
watchOS 2.0+


## Page 10

struct compression_stream
A structure representing a compression stream.
func compression_stream_init(UnsafeMutablePointer<compression_stream>,
compression_stream_operation, compression_algorithm) -> compression
_status
Initializes a compression stream for either compression or decompression.
func compression_stream_process(UnsafeMutablePointer<compression_stream
>, Int32) -> compression_status
Performs compression or decompression using an initialized compression stream structure.
struct compression_status
A set of values used to represent the status of stream compression.
struct compression_stream_flags
A set of values used to represent stream compression flags.
struct compression_stream_operation
A set of values used to represent a stream compression operation.
struct compression_algorithm
A structure for values that represent compression algorithms.
Multiple-step compression


## Page 11

var COMPRESSION_STATUS_OK: compression_status
Indicates the stream has consumed all data in the source buffer, or used all space in the
destination buffer.
var COMPRESSION_STATUS_END: compression_status
Indicates the stream has read all input from the source, and written all output to the
destination.
var COMPRESSION_STATUS_ERROR: compression_status
Indicates an error with stream compression.
init(Int32)
Creates a new constant from the given raw value.
init(rawValue: Int32)
Creates a new constant from the given raw value.
Topics
Status Constants
Initializers
Compression / compression_status
Structure
compression_status
A set of values used to represent the status of stream compression.
iOS
iPadOS
Mac Catalyst
macOS
tvOS
visionOS
watchOS


## Page 12

var rawValue: Int32
The raw value of the constant.
BitwiseCopyable
Equatable
Hashable
RawRepresentable
Sendable
struct compression_stream
A structure representing a compression stream.
func compression_stream_init(UnsafeMutablePointer<compression_stream>,
compression_stream_operation, compression_algorithm) -> compression
_status
Initializes a compression stream for either compression or decompression.
func compression_stream_process(UnsafeMutablePointer<compression_stream
>, Int32) -> compression_status
Performs compression or decompression using an initialized compression stream structure.
func compression_stream_destroy(UnsafeMutablePointer<compression_stream
>) -> compression_status
Frees any memory allocated by stream initialization function.
struct compression_stream_flags
Instance Properties
Relationships
Conforms To
See Also
Multiple-step compression


## Page 13

A set of values used to represent stream compression flags.
struct compression_stream_operation
A set of values used to represent a stream compression operation.
struct compression_algorithm
A structure for values that represent compression algorithms.


## Page 14

var COMPRESSION_STREAM_FINALIZE: compression_stream_flags
Indicates that the operation will add no further input blocks to the stream.
init(UInt32)
Creates a new constant from the given raw value.
init(rawValue: UInt32)
Creates a new constant from the given raw value.
var rawValue: UInt32
The raw value of the constant.
Topics
Flag Constants
Initializers
Instance Properties
Compression / compression_stream_flags
Structure
compression_stream_flags
A set of values used to represent stream compression flags.
iOS
iPadOS
Mac Catalyst
macOS
tvOS
visionOS
watchOS


## Page 15

BitwiseCopyable
Equatable
Hashable
RawRepresentable
Sendable
struct compression_stream
A structure representing a compression stream.
func compression_stream_init(UnsafeMutablePointer<compression_stream>,
compression_stream_operation, compression_algorithm) -> compression
_status
Initializes a compression stream for either compression or decompression.
func compression_stream_process(UnsafeMutablePointer<compression_stream
>, Int32) -> compression_status
Performs compression or decompression using an initialized compression stream structure.
func compression_stream_destroy(UnsafeMutablePointer<compression_stream
>) -> compression_status
Frees any memory allocated by stream initialization function.
struct compression_status
A set of values used to represent the status of stream compression.
struct compression_stream_operation
A set of values used to represent a stream compression operation.
struct compression_algorithm
Relationships
Conforms To
See Also
Multiple-step compression


## Page 16

A structure for values that represent compression algorithms.


## Page 17

var COMPRESSION_STREAM_ENCODE: compression_stream_operation
A constant indicating a compression operation.
var COMPRESSION_STREAM_DECODE: compression_stream_operation
A constant indicating a decompression operation.
init(UInt32)
Creates a new constant from the given raw value.
init(rawValue: UInt32)
Creates a new constant from the given raw value.
var rawValue: UInt32
Topics
Operation Constants
Initializers
Instance Properties
Compression / compression_stream_operation
Structure
compression_stream_operation
A set of values used to represent a stream compression operation.
iOS
iPadOS
Mac Catalyst
macOS
tvOS
visionOS
watchOS


## Page 18

The raw value of the constant.
BitwiseCopyable
Equatable
Hashable
RawRepresentable
Sendable
struct compression_stream
A structure representing a compression stream.
func compression_stream_init(UnsafeMutablePointer<compression_stream>,
compression_stream_operation, compression_algorithm) -> compression
_status
Initializes a compression stream for either compression or decompression.
func compression_stream_process(UnsafeMutablePointer<compression_stream
>, Int32) -> compression_status
Performs compression or decompression using an initialized compression stream structure.
func compression_stream_destroy(UnsafeMutablePointer<compression_stream
>) -> compression_status
Frees any memory allocated by stream initialization function.
struct compression_status
A set of values used to represent the status of stream compression.
struct compression_stream_flags
A set of values used to represent stream compression flags.
Relationships
Conforms To
See Also
Multiple-step compression


## Page 19

struct compression_algorithm
A structure for values that represent compression algorithms.


## Page 20

Choose an algorithm according to the following guidelines:
If speed and compression ratio are important, use COMPRESSION_LZFSE.
If you require interoperability with non-Apple devices, use COMPRESSION_ZLIB.
If speed is critical, and you’re willing to sacrifice compression ratio to achieve it, use
COMPRESSION_LZ4.
If compression ratio is critical, and you’re willing to sacrifice speed to achieve it, use
COMPRESSION_LZMA. Note that COMPRESSION_LZMA is an order of magnitude slower for bot
compression and decompression than other choices.
COMPRESSION_LZFSE is faster than COMPRESSION_ZLIB and generally achieves a better
compression ratio. However, it’s slower than COMPRESSION_LZ4 and doesn’t compress as well a
COMPRESSION_LZMA.
COMPRESSION_LZBITMAP provides a compression-ratio and performance that’s between
COMPRESSION_LZ4 and COMPRESSION_LZFSE. When compression ratio and performance are
equally important, use COMPRESSION_LZFSE to favor compression ratio and COMPRESSION
_LZBITMAP to favor performance.
Overview
Topics
Compression / compression_algorithm
Structure
compression_algorithm
A structure for values that represent compression algorithms.
iOS
iPadOS
Mac Catalyst
macOS
tvOS
visionOS
watchOS


## Page 21

var COMPRESSION_LZFSE: compression_algorithm
The LZFSE compression algorithm, which is recommended for use on Apple platforms.
var COMPRESSION_LZ4: compression_algorithm
The LZ4 compression algorithm for fast compression.
var COMPRESSION_LZ4_RAW: compression_algorithm
The LZ4 compression algorithm, without frame headers.
var COMPRESSION_LZMA: compression_algorithm
The LZMA compression algorithm, which is recommended for high-compression ratio.
var COMPRESSION_ZLIB: compression_algorithm
The zlib compression algorithm, which is recommended for cross-platform compression.
var COMPRESSION_BROTLI: compression_algorithm
The Brotli compression algorithm, which is recommended for text compression.
var COMPRESSION_LZBITMAP: compression_algorithm
The LZBITMAP compression algorithm, which is designed to exploit the vector instruction se
of current CPUs.
init(UInt32)
Creates a new constant from the given raw value.
init(rawValue: UInt32)
Creates a new constant from the given raw value.
var rawValue: UInt32
The raw value of the constant.
Algorithm Constants
Initializers
Instance Properties
Relationships


## Page 22

BitwiseCopyable
Equatable
Hashable
RawRepresentable
Sendable
struct compression_stream
A structure representing a compression stream.
func compression_stream_init(UnsafeMutablePointer<compression_stream>,
compression_stream_operation, compression_algorithm) -> compression
_status
Initializes a compression stream for either compression or decompression.
func compression_stream_process(UnsafeMutablePointer<compression_stream
>, Int32) -> compression_status
Performs compression or decompression using an initialized compression stream structure.
func compression_stream_destroy(UnsafeMutablePointer<compression_stream
>) -> compression_status
Frees any memory allocated by stream initialization function.
struct compression_status
A set of values used to represent the status of stream compression.
struct compression_stream_flags
A set of values used to represent stream compression flags.
struct compression_stream_operation
A set of values used to represent a stream compression operation.
Conforms To
See Also
Multiple-step compression


