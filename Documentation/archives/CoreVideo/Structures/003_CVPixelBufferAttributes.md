# 003_CVPixelBufferAttributes.pdf

## Page 1

init(CVPixelBufferCreationAttributes)
Convert CreationAttributes to Attributes
init?(merging: [CVPixelBufferAttributes])
Resolve multiple attribute specifications into a single instance.
init(pixelFormatTypes: [CVPixelFormatType]?, size: CVImageSize?,
compatibility: CVPixelFormatDescription.Compatibility, bytesPerRow
Alignment: Int?, planeAlignment: Int?, extendedPixels: CVPixelBuffer
Padding?)
init(rawAttributes: [String : any Sendable])
Create an instance using a freeform attribute dictionary
Topics
Initializers
Instance Properties
Core Video / CVPixelBufferAttributes
Structure
CVPixelBufferAttributes
A partial set of pixel buffer creation attributes. This struct is useful for conveying
partial requirements for pixel buffers to clients. This struct makes all properties of
CVPixelBuffer/CreationAttributes optional.
iOS 26.0+
iPadOS 26.0+
Mac Catalyst 26.0+
macOS 26.0+
tvOS 26.0+
visionOS 26.0+
watchOS 26.0


## Page 2

var pixelFormatTypes: [CVPixelFormatType]?
Allow multiple pixel formats to be specified in attributes
var rawAttributes: [String : any Sendable]
subscript(dynamicMember _: WritableKeyPath<CVPixelBufferCreation
Attributes, Int?>) -> Int?
subscript(dynamicMember _: WritableKeyPath<CVPixelBufferCreation
Attributes, CVPixelFormatDescription?>) -> CVPixelFormatDescription?
subscript(dynamicMember _: WritableKeyPath<CVPixelBufferCreation
Attributes, CVPixelBufferPadding?>) -> CVPixelBufferPadding?
subscript(dynamicMember _: WritableKeyPath<CVPixelBufferCreation
Attributes, CVPixelFormatDescription.Compatibility>) -> CVPixelFormat
Description.Compatibility
subscript(dynamicMember _: WritableKeyPath<CVPixelBufferCreation
Attributes, CVPixelFormatType>) -> CVPixelFormatType?
subscript(dynamicMember _: WritableKeyPath<CVPixelBufferCreation
Attributes, Bool>) -> Bool?
subscript(dynamicMember _: WritableKeyPath<CVPixelBufferCreation
Attributes, CVImageSize>) -> CVImageSize?
subscript(dynamicMember _: WritableKeyPath<CVPixelBufferCreation
Attributes, CVPixelBufferCreationAttributes.Backing>) -> CVPixelBuffer
CreationAttributes.Backing
Sendable, SendableMetatype
Subscripts
Relationships
Conforms To


