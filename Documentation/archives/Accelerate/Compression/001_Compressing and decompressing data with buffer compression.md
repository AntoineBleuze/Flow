# 001_Compressing and decompressing data with buffer compression.pdf

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


