# 005_compression_stream_flags.pdf

## Page 1

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


## Page 2

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


## Page 3

A structure for values that represent compression algorithms.


