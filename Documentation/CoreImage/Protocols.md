# Protocols.pdf

## Page 1

CIAreaReductionFilter, CIFilterProtocol
protocol CIMaximumScaleTransform
protocol CIToneMapHeadroom
Relationships
Inherits From
See Also
Protocols
Core Image / CIAreaBoundsRed
Protocol
CIAreaBoundsRed
iOS
iPadOS
Mac Catalyst
macOS
tvOS
visionOS


## Page 2

var aspectRatio: Float
Required
var inputImage: CIImage?
Required
var scale: Float
Required
CIFilterProtocol
Topics
Instance Properties
Relationships
Inherits From
See Also
Core Image / CIMaximumScaleTransform
Protocol
CIMaximumScaleTransform
iOS
iPadOS
Mac Catalyst
macOS
tvOS
visionOS


## Page 3

protocol CIAreaBoundsRed
protocol CIToneMapHeadroom
Protocols


## Page 4

var inputImage: CIImage?
Required
var sourceHeadroom: Float
Required
var targetHeadroom: Float
Required
CIFilterProtocol
Topics
Instance Properties
Relationships
Inherits From
See Also
Core Image / CIToneMapHeadroom
Protocol
CIToneMapHeadroom
iOS
iPadOS
Mac Catalyst
macOS
tvOS
visionOS


## Page 5

protocol CIAreaBoundsRed
protocol CIMaximumScaleTransform
Protocols


## Page 6

Calculates the average and maximum red component value for the specified area in an image. Th
result is returned in the red and green channels of a one pixel image.
CIAreaReductionFilter, CIFilterProtocol
Overview
Relationships
Inherits From
Core Image / CIAreaAverageMaximumRed
Protocol
CIAreaAverageMaximumRed
The protocol for the Area Average and Maximum Red filter.
iOS
iPadOS
Mac Catalyst
macOS
tvOS
visionOS


## Page 7

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


## Page 8

The sigma for a gaussian blur.
Required
var smoothness: Float
A value to control the smoothness of the transition between the curved and linear edges of
the shape.
Required
CIFilterProtocol
Relationships
Inherits From


## Page 9

Produces an infinite image where the red channel contains the distance in pixels from each pixel t
the mask.
var inputImage: CIImage?
The input image whose red channel defines a mask. If the red channel pixel value is greater
than 0.5 then the point is considered in the mask and output pixel will be zero. Otherwise the
output pixel will be a value between zero and one.
Required
var maximumDistance: Float
Determines the maximum distance to the mask that can be measured. Distances between
zero and the maximum will be normalized to zero and one.
Required
Overview
Topics
Instance Properties
Core Image / CIDistanceGradientFromRedMask
Protocol
CIDistanceGradientFromRedMask
The protocol for the Distance Gradient From Red Mask filter.
iOS
iPadOS
Mac Catalyst
macOS
tvOS
visionOS


## Page 10

CIFilterProtocol
Relationships
Inherits From


## Page 11

Generate a QR Code image for message data.
var centerSpaceSize: Float
The fraction of the center space of the QRCode to fill with Color 1. If the size is 0.0 or the
Correction Level is L or M, the center of the QRCode will be unaltered. The size will be limite
to 0.25 if the Correction Level is Q. The size will be limited to 0.33 if the Correction Level is H
Required
var color0: CIColor
The background color for the QRCode
Required
var color1: CIColor
The foreground color for the QRCode
Required
Overview
Topics
Instance Properties
Core Image / CIRoundedQRCodeGenerator
Protocol
CIRoundedQRCodeGenerator
The protocol for the Rounded QR Code Generator filter.
iOS
iPadOS
Mac Catalyst
macOS
tvOS
visionOS


## Page 12

var correctionLevel: String
QR Code correction level L, M, Q, or H.
Required
var message: Data
The message to encode in the QR Code
Required
var roundedData: Bool
If true then the data points in the QRCode should have a rounded appearance.
Required
var roundedMarkers: Int
If 1, then the Finder Patterns in the QRCode should have a rounded appearance. If 2, then th
Alignment Patterns will also be rounded
Required
var scale: Float
The scale factor to enlarge the QRCode by.
Required
CIFilterProtocol
Relationships
Inherits From


## Page 13

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


## Page 14

CIFilterProtocol
Relationships
Inherits From


