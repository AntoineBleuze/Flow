# 001_CVImageSize.pdf

## Page 1

This should be used when the sizes must be specified as exact integer width & height. Otherwise
prefer CGSize as it is more widely used.
init(CGSize, rounded: FloatingPointRoundingRule)
Convert CGSize to CVImageSize using the given rounding rule.
init(width: Int, height: Int)
Create an instance with given width and height
var height: Int
Image height in pixels
var width: Int
Overview
Topics
Initializers
Instance Properties
Core Video / CVImageSize
Structure
CVImageSize
Size of image buffer expressed as pixel count.
iOS 26.0+
iPadOS 26.0+
Mac Catalyst 26.0+
macOS 26.0+
tvOS 26.0+
visionOS 26.0+
watchOS 26.0


## Page 2

Image width in pixels
static let zero: CVImageSize
Size with zero width and height
Equatable
Hashable
Sendable
SendableMetatype
Type Properties
Relationships
Conforms To


