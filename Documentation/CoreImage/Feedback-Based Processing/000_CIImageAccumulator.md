# 000_CIImageAccumulator.pdf

## Page 1

The CIImageAccumulator class enables feedback-based image processing for such things as
iterative painting operations or fluid dynamics simulations. You use CIImageAccumulator
objects in conjunction with other Core Image classes, such as CIFilter, CIImage, CIVector,
and CIContext, to take advantage of the built-in Core Image filters when processing images.
init?(extent: CGRect, format: CIFormat)
Initializes an image accumulator with the specified extent and pixel format.
init?(extent: CGRect, format: CIFormat, colorSpace: CGColorSpace)
Initializes an image accumulator with the specified extent, pixel format, and color space.
func setImage(CIImage)
Overview
Topics
Initializing an Image Accumulator
Setting an Image
Core Image / CIImageAccumulator
Class
CIImageAccumulator
An object that manages feedback-based image processing for tasks such as
painting or fluid simulation.
iOS 9.0+
iPadOS 9.0+
Mac Catalyst 13.1+
macOS 10.4+
tvOS 9.0+
visionOS 1.0+


## Page 2

Sets the contents of the image accumulator to the contents of the specified image object.
func setImage(CIImage, dirtyRect: CGRect)
Updates an image accumulator with a subregion of an image object.
var extent: CGRect
The extent of the image associated with the image accumulator.
var format: CIFormat
The pixel format of the image accumulator.
func image() -> CIImage
Returns the current contents of the image accumulator.
func clear()
Resets the accumulator, discarding any pending updates and the current content.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Obtaining Data From an Image Accumulator
Resetting an Accumulator
Relationships
Inherits From
Conforms To


