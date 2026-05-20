# 001_Compressing and decompressing files with stream compression.pdf

## Page 1

This sample code project uses the Compression framework to encode (compress) and decode
(decompress) files when the user drags and drops them onto the app window. The app
decompresses files with extensions that match one of four supported compression algorithms:
.lz4, .zlib, lzma, or .lzfse, and compresses all other files, regardless of their extension. Th
app writes the encoded or decoded result to the temporary directory that the NSTemporary
Directory function returns.
The code in this sample is useful in applications that store or transmit files, such as PDF or text,
where saving or sending smaller files can improve performance and reduce storage overhead. Th
sample apps implements stream compression, where it reads chunks of data from a source buffe
repeatedly to compress or decompress data, and appends each chunk to a destination buffer.
Overview
Accelerate / Compressing and decompressing files with stream compression
Sample Code
Compressing and decompressing files
with stream compression
Perform compression for all files and decompression for files with supported
extension types.
Download
macOS 13.0+
Xcode 14.3+


## Page 2

Because the sample app performs the encoding and decoding in a background thread, it’s able to
remain interactive and update the user interface with progress of the operation with a Progress
View. Stream compression also enables tasks such as:
Decoding a compressed stream into a buffer, with the ability to grow that buffer and resume
decoding if the expanded stream is too large to fit, without repeating any work.
Encoding a stream as pieces of it become available, without ever needing to create a buffer lar
enough to hold all the uncompressed data at one time.
This sample code project includes implementations that use the Compression Swift API and C AP
The Compression C API is suitable for use with Swift and Objective-C and for older operating
systems that’s don’t support the Swift API.
Select a compression algorithm


## Page 3

The app uses the Algorithm.lzfse algorithm, which provides the compression ratio of zlib lev
5, but with much higher energy efficiency and speed (between 2x and 3x) for both encode and
decode operations.
For apps that require interoperability with non-Apple devices, use Algorithm.zlib instead. Fo
more information about other compression algorithms, see compression_algorithm.
The sample code uses a file’s path extension to infer whether a file is already compressed, or if th
file needs to be compressed. To simplify this process, the project includes a failable initializer in a
extension to the Compression framework’s Algorithm enumeration.
The following code uses the new initializer to define the algorithm and operation constants:
Distinguish between compressed and uncompressed files


## Page 4

The sample uses FileHandle instances to read from the source file and write to the destination
file. Use optional binding to define the required file handles.
If the optional binding succeeded, the destination file handle points to the source filename by
appending the respective compression algorithm extension, or removing the extension in the case
of decompression.
For example, the compressed source file MyCompressedFile.PDF.lzfse would have a
decompressed destination of MyCompressedFile.PDF; and the uncompressed source file, My
RawFile.PDF, would have a compressed destination of MyRawFile.PDF.lzfse.
The streamingCompression(operation:sourceFileHandle:destinationFile
Handle:algorithm:progressUpdateFunction:) functions iterate over the source data an
encodes or decodes data in blocks based on the length that bufferSize defines. The methods
write the result into the destination buffer, and write the destination buffer data to the destination
file handle. The Swift and C API functions have slightly different signatures.
The following is the function declaration for the Swift version of the streaming compression
function:
Define the source and destination file handles
Perform streaming compression


## Page 5

The following is the function declaration for the C API version of the streaming compression
function:
The sample code passes the source and destination file handles, with the operation and algorithm
values to either streamingCompression function based on the value of the Boolean constant,
useSwiftAPI:
The OutputFilter instance specifies the operation and the compression algorithm. The final
initializer parameter is a closure the instance calls as it writes each encoded or decoded block of
Create the output filter using the Swift API


## Page 6

data to the destination file handler.
The Swift streaming compression function iterates over the source data and calls the read
Data(ofLength:) method to copy bufferSize chunks to subdata.
The C API streaming compression function allocates the destination buffer based on the buffer
Size constant.
Compress or decompress the dropped file using the Swift
API
Create a destination buffer using the C API
Create a compression stream using the C API


## Page 7

The compression_stream structure defines the source and destination pointers and sizes. The
following code declares and initializes the compression stream:
To prevent memory leaks, the following code calls compression_stream_destroy(_:) to fre
the memory that the stream initialization function allocated. A defer block frees the memory even
the streamingCompression method exits early:
The sample code sets up the initialized stream by defining its source and destination sizes and
destination pointer:
A repeat-while loop manages the read-encode/decode-write process. If the stream’s source
size is zero, the code reads a block of data from the source file handle and points the stream’s
source pointer to that data. If the read data is shorter than the buffer size, the code infers that it’s
reading the last block of the source file and sets the stream’s status to COMPRESSION_STREAM
_FINALIZE:
Read the source file data iteratively using the C API


## Page 8

The compression_stream_process(_:_:) function encodes or decodes the current block.
On return, destinationBufferPointer points to the encoded or decoded data.
The following code checks the status that compression_stream_process returns. If the statu
is either COMPRESSION_STATUS_OK or COMPRESSION_STATUS_END, the code writes the
destination data to the destination file handler:
Compress or decompress the dropped file using the C API
Write encoded or decoded data to a destination file


## Page 9

This read-encode/decode-write loop continues while status equals COMPRESSION_STATUS_O
After the app has finished working with the source and destination file handles, it calls the close
File() method to close them.
Compressing and decompressing data with buffer compression
Compress a string, write it to the file system, and decompress the same file using buffer
compression.
Compressing and decompressing data with input and output filters
Compress and decompress streamed or from-memory data, using input and output filters.
Close the source and destination files
See Also
Compression


