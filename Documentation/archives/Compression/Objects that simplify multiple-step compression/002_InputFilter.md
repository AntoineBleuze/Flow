# 002_InputFilter.pdf

## Page 1

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


## Page 2

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


