# 003_compression_decode_scratch_buffer_size____.pdf

## Page 1

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


## Page 2

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


