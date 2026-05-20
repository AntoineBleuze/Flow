# 005_FilterError.pdf

## Page 1

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


## Page 2

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


