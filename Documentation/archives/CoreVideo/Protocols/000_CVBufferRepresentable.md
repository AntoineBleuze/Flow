# 000_CVBufferRepresentable.pdf

## Page 1

associatedtype Buffer : CVBuffer
Required
func withUnsafeBuffer<R>((Self.Buffer) throws -> sending R) rethrows ->
sending R
Access the underlying Buffer object. This function should be used to bridge existing code
that uses the Buffer type.
Required
Topics
Associated Types
Instance Methods
Relationships
Inherited By
Core Video / CVBufferRepresentable
Protocol
CVBufferRepresentable
CVBufferRepresentable protocol is a sealed protocol intended to be implemented
by the types in CoreVideo framework. This protocol facilitates Swift types that
wrap a value of CVBuffer type.
iOS 26.0+
iPadOS 26.0+
Mac Catalyst 26.0+
macOS 26.0+
tvOS 26.0+
visionOS 26.0+
watchOS 26.0


## Page 2

CVImageBufferRepresentable, CVPixelBufferRepresentable
CVMutablePixelBuffer, CVReadOnlyPixelBuffer
Conforming Types


