# 003_compression_stream_destroy____.pdf

## Page 1

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


## Page 2

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


