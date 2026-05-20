# 000_Compressing and decompressing data with input and output filters.pdf

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


