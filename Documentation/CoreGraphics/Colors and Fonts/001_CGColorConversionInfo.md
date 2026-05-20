# 001_CGColorConversionInfo.pdf

## Page 1

A CGColorConversionInfo object specifies a conversion between two or more color spaces,
including information about the intent of the conversion. You use color conversion objects to
specify the work to be done by an MPSImageConversion filter, which can then perform GPU-
accelerated image conversion.
init?(src: CGColorSpace, dst: CGColorSpace)
Creates a conversion between two specified color spaces.
init?(optionsSrc: CGColorSpace, dst: CGColorSpace, options: CFDictionar
?)
enum CGColorConversionInfoTransformType
Constants describing how a color conversion uses color spaces.
Overview
Topics
Creating a Color Conversion
Core Graphics / CGColorConversionInfo
Class
CGColorConversionInfo
An object that describes how to convert between color spaces for use by other
system services.
iOS
iPadOS
Mac Catalyst
macOS
tvOS
visionOS
watchOS


## Page 2

class var typeID: CFTypeID
Returns the Core Foundation type identifier for a color conversion info data type.
func convert(width: Int, height: Int, to: UnsafeMutableRawPointer,
format: CGColorBufferFormat, from: UnsafeRawPointer, format: CGColor
BufferFormat, options: CFDictionary?) -> Bool
init?(src: CGColorSpace, srcHeadroom: Float, dst: CGColorSpace, dst
Headroom: Float, toneMapping: CGToneMapping, options: CFDictionary?,
UnsafeMutablePointer<Unmanaged<CFError>?>?)
Deprecated
Equatable, Hashable
class CGColor
A set of components that define a color, with a color space specifying how to interpret them
class CGColorSpace
A profile that specifies how to interpret a color value for display.
class CGFont
Working with Core Foundation Types
Instance Methods
Initializers
Relationships
Conforms To
See Also
Colors and Fonts


## Page 3

A set of character glyphs and layout information for drawing text.


