# 004_CIBlurredRoundedRectangleGenerator.pdf

## Page 1

Generates a blurred rounded rectangle image with the specified extent, corner radius, blur sigma
and color.
var color: CIColor
A color.
Required
var extent: CGRect
A rectangle that defines the extent of the effect.
Required
var radius: Float
The distance from the center of the effect.
Required
var sigma: Float
Overview
Topics
Instance Properties
Core Image / CIBlurredRoundedRectangleGenerator
Protocol
CIBlurredRoundedRectangleGenerator
The protocol for the Blurred Rounded Rectangle Generator filter.
iOS
iPadOS
Mac Catalyst
macOS
tvOS
visionOS


## Page 2

The sigma for a gaussian blur.
Required
var smoothness: Float
A value to control the smoothness of the transition between the curved and linear edges of
the shape.
Required
CIFilterProtocol
Relationships
Inherits From


