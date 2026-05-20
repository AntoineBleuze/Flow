# Single-step compression.pdf

## Page 1

The code in this article uses the Compression framework to encode (compress) and decode
(decompress) a string. The code writes the encoded result to the temporary directory that the
NSTemporaryDirectory() function returns.
The code in this sample is useful in applications that store or transmit text files where saving or
sending smaller files can improve performance and reduce storage overhead. This sample app
implements buffer compression, where it reads the contents of a source buffer in a single step to
compress or decompress data.
Typically, your app would dynamically generate the source data that it compresses, but for this
example, the source data is a hard-coded string.
Overview
Create the source data
Accelerate / Compressing and decompressing data with buffer compression
Article
Compressing and decompressing data
with buffer compression
Compress a string, write it to the file system, and decompress the same file using
buffer compression.


## Page 2

On return, sourceBuffer is an array of UInt8 values that contains the UTF-8 representation of
the source string.
Create an UnsafeMutablePointer structure and allocate it with a capacity of the source string
count to receive the encoded data.
The code in this example uses the COMPRESSION_LZFSE algorithm, which provides the
compression ratio of zlib level 5, but with much higher energy efficiency and speed (between 2x
and 3x) for both encode and decode operations.
For apps that require interoperability with non-Apple devices, use COMPRESSION_ZLIB instead.
For more information on other compression algorithms, see compression_algorithm.
The compression_encode_buffer(_:_:_:_:_:_:) function compresses the data, writes
the result to the destination buffer, and returns the size of the encoded data.
Create the destination buffer
Select a compression algorithm
Compress the data


## Page 3

When working with small files, the compression may fail and compression_encode_buffer(_
_:_:_:_:_:) returns 0.
You may elect to handle this situation differently, for example, by displaying a warning to the user
that the compression failed.
The code below writes the encoded data to a file in the the app’s temporary directory on macOS:
Write the encoded data to a file
Read the encoded data from a file


## Page 4

To read the encoded file, create a file handle for reading from the encoded file’s URL.
Use the file handle to read the entire encoded file and populate encodedSourceData.
Allocate memory to contain the decoded data. Typically, the encoded payload would be part of a
larger structure containing additional metadata such as the uncompressed size, and you’d use tha
to define the buffer capacity. However, for this example, allocate 8 MB:
Use compression_decode_buffer(_:_:_:_:_:_:) to decode the raw bytes of the encode
source data and write the result to decodedDestinationBuffer. You can create a string from
the destination buffer using the init(cString:) initializer.
The compression_decode_buffer(_:_:_:_:_:_:) function returns the size of the decode
data. If the decompression fails, the size returned is zero. This may indicate that the memory
Decompress the data


## Page 5

allocated to the destination buffer is insufficient and you should switch to the stream API or retry
with a larger buffer.
Compressing and decompressing files with stream compression
Perform compression for all files and decompression for files with supported extension type
Compressing and decompressing data with input and output filters
Compress and decompress streamed or from-memory data, using input and output filters.
See Also
Compression


## Page 6

algorithm
Set to the desired algorithm: COMPRESSION_LZ4, COMPRESSION_ZLIB, COMPRESSION
_LZMA, or COMPRESSION_LZFSE.
Size in bytes.
This function returns the number of bytes to provide in an optional scratch buffer when calling
compression_encode_buffer(_:_:_:_:_:_:).
Parameters
Return Value
Discussion
See Also
Single-step compression
Compression / compression_encode_scratch_buffer_size(_:)
Function
compression_encode_scratch_buffer
_size(_:)
Returns the required compression scratch buffer size for the selected algorithm.
iOS 9.0+
iPadOS 9.0+
Mac Catalyst 13.1+
macOS 10.11+
tvOS 9.0+
visionOS 1.0+
watchOS 2.0+


## Page 7

Compressing and decompressing data with buffer compression
Compress a string, write it to the file system, and decompress the same file using buffer
compression.
func compression_encode_buffer(UnsafeMutablePointer<UInt8>, Int, Unsafe
Pointer<UInt8>, Int, UnsafeMutableRawPointer?, compression_algorithm) -
Int
Compresses the contents of a source buffer into a destination buffer.
func compression_decode_scratch_buffer_size(compression_algorithm) ->
Int
Returns the required decompression scratch buffer size for the selected algorithm.
func compression_decode_buffer(UnsafeMutablePointer<UInt8>, Int, Unsafe
Pointer<UInt8>, Int, UnsafeMutableRawPointer?, compression_algorithm) -
Int
Decompresses the contents of a source buffer into a destination buffer.
struct compression_algorithm
A structure for values that represent compression algorithms.


## Page 8

dst_buffer
Pointer to the buffer that receives the compressed data.
dst_size
Size of the destination buffer in bytes.
src_buffer
Pointer to a buffer containing all of the source data.
src_size
Size of the data in the source buffer in bytes.
scratch_buffer
If scratch_buffer is not nil, this parameter is a pointer to a buffer that the function uses
for scratch purposes. The size of this buffer must be at least the size returned by a previous
call to compression_encode_scratch_buffer_size(_:).
Parameters
Compression / compression_encode_buffer(_:_:_:_:_:_:)
Function
compression_encode_buffer(_:_:_:_:_:_:)
Compresses the contents of a source buffer into a destination buffer.
iOS 9.0+
iPadOS 9.0+
Mac Catalyst 13.1+
macOS 10.11+
tvOS 9.0+
visionOS 1.0+
watchOS 2.0+


## Page 9

If scratch_buffer is nil, the function creates and manages its own scratch space, but with
possible performance hit.
algorithm
Set to the desired algorithm: COMPRESSION_LZ4, COMPRESSION_ZLIB, COMPRESSION
_LZMA, or COMPRESSION_LZFSE.
The number of bytes written to the destination buffer after compressing the input. If the funtion
can’t compress the entire input to fit into the provided destination buffer, or an error occurs, 0 is
returned.
If the input is successfully compressed, the function writes the compressed data to dst_buffer.
Compressing and decompressing data with buffer compression
Compress a string, write it to the file system, and decompress the same file using buffer
compression.
func compression_encode_scratch_buffer_size(compression_algorithm) ->
Int
Returns the required compression scratch buffer size for the selected algorithm.
func compression_decode_scratch_buffer_size(compression_algorithm) ->
Int
Returns the required decompression scratch buffer size for the selected algorithm.
func compression_decode_buffer(UnsafeMutablePointer<UInt8>, Int, Unsafe
Pointer<UInt8>, Int, UnsafeMutableRawPointer?, compression_algorithm) -
Int
Decompresses the contents of a source buffer into a destination buffer.
struct compression_algorithm
Return Value
Discussion
See Also
Single-step compression


## Page 10

A structure for values that represent compression algorithms.


## Page 11

algorithm
Set to the desired algorithm: COMPRESSION_LZ4, COMPRESSION_ZLIB, COMPRESSION
_LZMA, or COMPRESSION_LZFSE.
Size in bytes.
This function returns the number of bytes to provide in an optional scratch buffer when calling
compression_decode_buffer(_:_:_:_:_:_:).
Parameters
Return Value
Discussion
See Also
Single-step compression
Compression / compression_decode_scratch_buffer_size(_:)
Function
compression_decode_scratch_buffer
_size(_:)
Returns the required decompression scratch buffer size for the selected algorithm
iOS 9.0+
iPadOS 9.0+
Mac Catalyst 13.1+
macOS 10.11+
tvOS 9.0+
visionOS 1.0+
watchOS 2.0+


## Page 12

Compressing and decompressing data with buffer compression
Compress a string, write it to the file system, and decompress the same file using buffer
compression.
func compression_encode_scratch_buffer_size(compression_algorithm) ->
Int
Returns the required compression scratch buffer size for the selected algorithm.
func compression_encode_buffer(UnsafeMutablePointer<UInt8>, Int, Unsafe
Pointer<UInt8>, Int, UnsafeMutableRawPointer?, compression_algorithm) -
Int
Compresses the contents of a source buffer into a destination buffer.
func compression_decode_buffer(UnsafeMutablePointer<UInt8>, Int, Unsafe
Pointer<UInt8>, Int, UnsafeMutableRawPointer?, compression_algorithm) -
Int
Decompresses the contents of a source buffer into a destination buffer.
struct compression_algorithm
A structure for values that represent compression algorithms.


## Page 13

dst_buffer
Pointer to the buffer that receives the decompressed data.
dst_size
Size of the destination buffer in bytes.
src_buffer
Pointer to a buffer containing all of the compressed source data.
src_size
Size of the data in the source buffer in bytes.
scratch_buffer
If scratch_buffer is not nil, this parameter is a pointer to a buffer that the function uses
for scratch purposes. The size of this buffer must be at least the size returned by a previous
call to compression_decode_scratch_buffer_size(_:).
Parameters
Compression / compression_decode_buffer(_:_:_:_:_:_:)
Function
compression_decode_buffer(_:_:_:_:_:_:)
Decompresses the contents of a source buffer into a destination buffer.
iOS 9.0+
iPadOS 9.0+
Mac Catalyst 13.1+
macOS 10.11+
tvOS 9.0+
visionOS 1.0+
watchOS 2.0+


## Page 14

If scratch_buffer is nil, the function creates and manages its own scratch space, but w
a possible performance hit.
algorithm
Set to the desired algorithm: COMPRESSION_LZ4, COMPRESSION_ZLIB, COMPRESSION
_LZMA, or COMPRESSION_LZFSE.
The number of bytes written to the destination buffer after decompressing the input. If there is no
enough space in the destination buffer to hold the entire decompressed output, the function write
the first dst_size bytes to the buffer and returns dst_size. Note that this behavior differs from
that of compression_encode_buffer(_:_:_:_:_:_:).
The function writes the decompressed data to dst_buffer.
Compressing and decompressing data with buffer compression
Compress a string, write it to the file system, and decompress the same file using buffer
compression.
func compression_encode_scratch_buffer_size(compression_algorithm) ->
Int
Returns the required compression scratch buffer size for the selected algorithm.
func compression_encode_buffer(UnsafeMutablePointer<UInt8>, Int, Unsafe
Pointer<UInt8>, Int, UnsafeMutableRawPointer?, compression_algorithm) -
Int
Compresses the contents of a source buffer into a destination buffer.
func compression_decode_scratch_buffer_size(compression_algorithm) ->
Int
Returns the required decompression scratch buffer size for the selected algorithm.
struct compression_algorithm
Return Value
Discussion
See Also
Single-step compression


## Page 15

A structure for values that represent compression algorithms.


## Page 16

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


## Page 17

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


## Page 18

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


