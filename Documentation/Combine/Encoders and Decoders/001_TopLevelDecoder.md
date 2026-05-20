# 001_TopLevelDecoder.pdf

## Page 1

associatedtype Input
The type this decoder accepts.
Required
func decode<T>(T.Type, from: Self.Input) throws -> T
Decodes an instance of the indicated type.
Required
protocol TopLevelEncoder
Topics
Declaring supporting types
Decoding
See Also
Encoders and Decoders
Combine / TopLevelDecoder
Protocol
TopLevelDecoder
A type that defines methods for decoding.
iOS 13.0+
iPadOS 13.0+
Mac Catalyst 13.0+
macOS 10.15+
tvOS 13.0+
visionOS 1.0+
watchOS 6.0+


## Page 2

A type that defines methods for encoding.


