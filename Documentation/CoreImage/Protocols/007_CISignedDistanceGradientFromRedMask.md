# 007_CISignedDistanceGradientFromRedMask.pdf

## Page 1

Produces an infinite image where the red channel contains the distance in pixels from each pixel t
the mask.
var inputImage: CIImage?
The input image whose red channel defines a mask. If the red channel pixel value is greater
than 0.5 then the point is considered in the mask and output pixel will be a value between ze
and negative one. Otherwise the output pixel will be a value between zero and one.
Required
var maximumDistance: Float
Determines the maximum distance to the mask that can be measured. Distances between
zero and the maximum will be normalized to negative one and one.
Required
Overview
Topics
Instance Properties
Core Image / CISignedDistanceGradientFromRedMask
Protocol
CISignedDistanceGradientFromRedMask
The protocol for the Signed Distance Gradient From Red Mask filter.
iOS
iPadOS
Mac Catalyst
macOS
tvOS
visionOS


## Page 2

CIFilterProtocol
Relationships
Inherits From


