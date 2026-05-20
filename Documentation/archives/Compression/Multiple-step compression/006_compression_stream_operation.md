# 006_compression_stream_operation.pdf

## Page 1

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


## Page 2

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


## Page 3

struct compression_algorithm
A structure for values that represent compression algorithms.


