# 004_compression_status.pdf

## Page 1

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


## Page 2

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


## Page 3

A set of values used to represent stream compression flags.
struct compression_stream_operation
A set of values used to represent a stream compression operation.
struct compression_algorithm
A structure for values that represent compression algorithms.


