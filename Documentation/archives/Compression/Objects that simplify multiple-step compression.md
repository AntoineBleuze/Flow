# Objects that simplify multiple-step compression.pdf

## Page 1

The code in this article uses the Compression framework’s InputFilter and OutputFilter
classes to encode (compress) and decode (decompress) a string. The code writes the encoded
result to a Data structure.
The code in this sample is useful in applications that store or transmit files, such as PDF or text,
where saving or sending smaller files can improve performance and reduce storage overhead. Th
sample app implements stream compression, where it reads chunks of data from a source buffer
repeatedly to compress or decompress data, and appends each chunk to a destination buffer.
Use the input and output filters API when working with data that’s streamed to or from memory —
for example, when reading from or writing to a file. If you’re compressing and decompressing data
that’s held entirely in memory, consider using compressed(using:) and
decompressed(using:). These functions provide a simple API to compress and decompress
data in a single step.
Typically, your app dynamically generates the source data that it compresses, but for this exampl
the source data is a hard-coded string.
Overview
Create the source data
Accelerate / Compressing and decompressing data with input and output filters
Article
Compressing and decompressing data
with input and output filters
Compress and decompress streamed or from-memory data, using input and
output filters.


## Page 2

On return, sourceData contains the UTF-8 representation of the source string.
InputFilter and OutputFilter instances compress and decompress pages of data. Specify
the number of bytes in each page to read from or write to a stream. Smaller values allow your app
to report progress or perform other tasks at higher frequencies than larger values. However, large
values allow your app to compress or decompress using fewer steps, possibly in less time.
For this example, use a page size of 128 bytes:
Create an empty mutable Data structure to receive the compressed data.
Create an OutputFilter instance, and specify the operation as FilterOperation.compres
and the compression algorithm as Algorithm.lzfse. For more information on other
compression algorithms, see compression_algorithm.
The final initializer parameter is a closure that the instance calls as it writes each compressed bloc
of data to compressedData.
Specify the page size
Create the compression destination buffer
Create the output filter


## Page 3

Iterate over the source data and call the subdata(in:) method to copy pageSize chunks to
subdata. The write(_:) method compresses each chunk and uses the closure specified in th
OutputFilter initializer to write the result to compressedData.
On return, compressedData contains a compressed version of the original source data.
Create a mutable, empty Data structure to receive the decompressed data.
Compress the data
Create the decompression destination buffer


## Page 4

Create an InputFilter instance, and specify the operation as FilterOperation
.decompress and the compression algorithm as Algorithm.lzfse.
The final initializer parameter is a closure the instance calls as it reads each compressed block of
data.
You iterate over the compressed data by repeatedly calling readData(ofLength:), until the
function returns nil. With each iteration, append the data returned by the input filter to
decompressedData.
Use init(data:encoding:) to recreate a string from the decompressed data.
Create the input filter
Decompress the data
Create a string from the decompressed data


## Page 5

On return, decompressedString contains the original text shown in Compressing and
decompressing data with input and output filters.
You’re not tied to using output filters for compression and input filters for decompression. You ca
select the appropriate compressor-decompressor based on your app’s requirements.
For example, the code below shows an InputFilter instance as the compressor:
The code below shows an OutputFilter instance as the decompressor:
Select input and output filters based on requirements


## Page 6

Compressing and decompressing files with stream compression
Perform compression for all files and decompression for files with supported extension type
Compressing and decompressing data with buffer compression
Compress a string, write it to the file system, and decompress the same file using buffer
compression.
See Also
Compression


## Page 7

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


## Page 8

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


## Page 9

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


## Page 10

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


## Page 11

The following is the function declaration for the C API version of the streaming compression
function:
The sample code passes the source and destination file handles, with the operation and algorithm
values to either streamingCompression function based on the value of the Boolean constant,
useSwiftAPI:
The OutputFilter instance specifies the operation and the compression algorithm. The final
initializer parameter is a closure the instance calls as it writes each encoded or decoded block of
Create the output filter using the Swift API


## Page 12

data to the destination file handler.
The Swift streaming compression function iterates over the source data and calls the read
Data(ofLength:) method to copy bufferSize chunks to subdata.
The C API streaming compression function allocates the destination buffer based on the buffer
Size constant.
Compress or decompress the dropped file using the Swift
API
Create a destination buffer using the C API
Create a compression stream using the C API


## Page 13

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


## Page 14

The compression_stream_process(_:_:) function encodes or decodes the current block.
On return, destinationBufferPointer points to the encoded or decoded data.
The following code checks the status that compression_stream_process returns. If the statu
is either COMPRESSION_STATUS_OK or COMPRESSION_STATUS_END, the code writes the
destination data to the destination file handler:
Compress or decompress the dropped file using the C API
Write encoded or decoded data to a destination file


## Page 15

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


## Page 16

init(FilterOperation, using: Algorithm, bufferCapacity: Int, readingFro
: (Int) throws -> D?) throws
Creates an input filter that can be used to compress or decompress data.
func readData(ofLength: Int) throws -> Data?
Reads processed data from the input filter.
Compressing and decompressing data with input and output filters
Compress and decompress streamed or from-memory data, using input and output filters.
Topics
Initializers
Instance Methods
See Also
Objects that simplify multiple-step compression
Compression / InputFilter
Class
InputFilter
An encoder-decoder that reads input data from a stream.
iOS 13.0+
iPadOS 13.0+
Mac Catalyst
macOS 10.15+
tvOS 13.0+
visionOS
watchOS 6.0+


## Page 17

Compressing and decompressing files with stream compression
Perform compression for all files and decompression for files with supported extension type
class OutputFilter
An encoder-decoder that writes output data to a stream.
enum Algorithm
Algorithms used for compression or decompression.
enum FilterError
Errors that occur during compression.
enum FilterOperation
Operations that define whether input and output filters compress or decompress data.


## Page 18

Creates an output filter for compressing or decompressing data.
init(FilterOperation, using: Algorithm, bufferCapacity: Int, writingTo:
(Data?) throws -> Void) throws
Creates an output filter that can be used to compress or decompress data.
func write<D>(D?) throws
Writes data to the output filter.
func finalize() throws
Finalizes the stream by flushing all the remaining data in the stream.
Topics
Initializers
Instance Methods
See Also
Compression / OutputFilter
Class
OutputFilter
An encoder-decoder that writes output data to a stream.
iOS 13.0+
iPadOS 13.0+
Mac Catalyst
macOS 10.15+
tvOS 13.0+
visionOS
watchOS 6.0+


## Page 19

Compressing and decompressing data with input and output filters
Compress and decompress streamed or from-memory data, using input and output filters.
Compressing and decompressing files with stream compression
Perform compression for all files and decompression for files with supported extension type
class InputFilter
An encoder-decoder that reads input data from a stream.
enum Algorithm
Algorithms used for compression or decompression.
enum FilterError
Errors that occur during compression.
enum FilterOperation
Operations that define whether input and output filters compress or decompress data.
Objects that simplify multiple-step compression


## Page 20

case brotli
The Brotli compression algorithm, which is recommended for text compression.
case lz4
The LZ4 compression algorithm, which is recommended for fast compression.
case lzbitmap
The LZBITMAP compression algorithm, which is designed to exploit the vector instruction se
of current CPUs.
case lzfse
The LZFSE compression algorithm, which is recommended for use on Apple platforms.
case lzma
The LZMA compression algorithm, which is recommended for high-compression ratio.
case zlib
The zlib compression algorithm, which is recommended for cross-platform compression.
Topics
Enumeration Cases
Compression / Algorithm
Enumeration
Algorithm
Algorithms used for compression or decompression.
iOS 13.0+
iPadOS 13.0+
Mac Catalyst
macOS 10.15+
tvOS 13.0+
visionOS
watchOS 6.0+


## Page 21

CaseIterable
Copyable
Equatable
Hashable
RawRepresentable
Compressing and decompressing data with input and output filters
Compress and decompress streamed or from-memory data, using input and output filters.
Compressing and decompressing files with stream compression
Perform compression for all files and decompression for files with supported extension type
class InputFilter
An encoder-decoder that reads input data from a stream.
class OutputFilter
An encoder-decoder that writes output data to a stream.
enum FilterError
Errors that occur during compression.
enum FilterOperation
Operations that define whether input and output filters compress or decompress data.
Relationships
Conforms To
See Also
Objects that simplify multiple-step compression


## Page 22

case invalidData
An error that indicates invalid data passed to the encoder-decoder.
case invalidState
An error that indicates a filter failed to initialize, or that it has an invalid internal stare or
parameters.
Copyable
Equatable
Error
Hashable
Sendable
Topics
Enumeration Cases
Relationships
Conforms To
Compression / FilterError
Enumeration
FilterError
Errors that occur during compression.
iOS 13.0+
iPadOS 13.0+
Mac Catalyst
macOS 10.15+
tvOS 13.0+
visionOS
watchOS 6.0+


## Page 23

SendableMetatype
Compressing and decompressing data with input and output filters
Compress and decompress streamed or from-memory data, using input and output filters.
Compressing and decompressing files with stream compression
Perform compression for all files and decompression for files with supported extension type
class InputFilter
An encoder-decoder that reads input data from a stream.
class OutputFilter
An encoder-decoder that writes output data to a stream.
enum Algorithm
Algorithms used for compression or decompression.
enum FilterOperation
Operations that define whether input and output filters compress or decompress data.
See Also
Objects that simplify multiple-step compression


## Page 24

case compress
An operation that compresses data.
case decompress
An operation that decompresses data.
Copyable
Equatable
Hashable
RawRepresentable
Topics
Enumeration Cases
Relationships
Conforms To
Compression / FilterOperation
Enumeration
FilterOperation
Operations that define whether input and output filters compress or decompress
data.
iOS 13.0+
iPadOS 13.0+
Mac Catalyst
macOS 10.15+
tvOS 13.0+
visionOS
watchOS 6.0+


## Page 25

Compressing and decompressing data with input and output filters
Compress and decompress streamed or from-memory data, using input and output filters.
Compressing and decompressing files with stream compression
Perform compression for all files and decompression for files with supported extension type
class InputFilter
An encoder-decoder that reads input data from a stream.
class OutputFilter
An encoder-decoder that writes output data to a stream.
enum Algorithm
Algorithms used for compression or decompression.
enum FilterError
Errors that occur during compression.
See Also
Objects that simplify multiple-step compression


