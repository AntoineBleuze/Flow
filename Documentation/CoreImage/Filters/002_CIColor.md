# 002_CIColor.pdf

## Page 1

Selectively Focusing on an Image
Use CIColor instances in conjunction with other Core Image classes, such as CIFilter and
CIKernel. Many of the built-in Core Image filters have one or more CIColor inputs that you can
set to affect the filter’s behavior.
A color is defined as a N-dimensional model where each dimension’s color component is
represented by intensity values. A color component may also be referred to as a color channel. An
RGB color model, for example, is three-dimensional and the red, green, and blue component
intensities define each unique color.
A color is also defined by a color space that locates the axes of N-dimensional model within the
greater volume of human perceivable colors. Core Image uses CGColorSpace instances to
specify a variety of different color spaces such as sRGB, P3, BT.2020, etc. The CGColorSpace
Mentioned in
Overview
Color Model
Color Space
Core Image / CIColor
Class
CIColor
The Core Image class that defines a color object.
iOS 5.0+
iPadOS 5.0+
Mac Catalyst 13.1+
macOS 10.4+
tvOS
visionOS 1.0+


## Page 2

also defines if the color space is coded linearly or in a non-linear perceptual curve. (For more
information on CGColorSpace see CGColorSpace)
Standard dynamic range (SDR) color color component values range from 0.0 to 1.0, with 0.0
representing an 0% of that component and 1.0 representing 100%. In contrast, high dynamic
range (HDR) color values can be less than 0.0 (for more saturation) or greater than 1.0 (for mor
brightness).
CIColor instances also have an alpha component, which represents the opacity of the color, wit
0.0 meaning completely transparent and 1.0 meaning completely opaque. If a color does not have
an explicit alpha component, Core Image assumes that the alpha component equals 1.0. With
CIColor that color components values are not premultiplied. So for example, a semi-transparent
pure red CIColor is represented by RGB 1.0,0.0,0.0 and A 0.5. In contrast color componen
values in CIImage buffers or read in CIKernel samplers are premultiplied by default.
init(cgColor: CGColor)
Create a Core Image color object with a Core Graphics color object.
convenience init(color: UIColor)
convenience init(red: CGFloat, green: CGFloat, blue: CGFloat, alpha:
CGFloat)
Initialize a Core Image color object in the sRGB color space with the specified red, green, blu
and alpha component values.
convenience init?(red: CGFloat, green: CGFloat, blue: CGFloat, color
Space: CGColorSpace)
Initialize a Core Image color object with the specified red, green, and blue component values
as measured in the specified color space.
convenience init?(red: CGFloat, green: CGFloat, blue: CGFloat, alpha:
CGFloat, colorSpace: CGColorSpace)
Color Range
Color Opacity
Topics
Initializing Color Objects


## Page 3

Initialize a Core Image color object with the specified red, green, and blue component values
as measured in the specified color space.
convenience init(red: CGFloat, green: CGFloat, blue: CGFloat)
Create a Core Image color object in the sRGB color space with the specified red, green, and
blue component values.
convenience init(string: String)
Create a Core Image color object in the sRGB color space using a string containing the RGBA
color component values.
var colorSpace: CGColorSpace
Returns the CGColorSpace associated with the color
var components: UnsafePointer<CGFloat>
Return a pointer to an array of CGFloat values including alpha.
var numberOfComponents: Int
Returns the color components of the color including alpha.
var red: CGFloat
Returns the unpremultiplied red component of the color.
var green: CGFloat
Returns the unpremultiplied green component of the color.
var blue: CGFloat
Returns the unpremultiplied blue component of the color.
var alpha: CGFloat
Returns the alpha value of the color.
var stringRepresentation: String
Returns a formatted string with the unpremultiplied color and alpha components of the color
class var black: CIColor
Creating Color Objects
Getting Color Components
Creating a CIColor Object with Preset Components


## Page 4

Returns a singleton Core Image color instance in the sRGB color space with RGB values
0,0,0 and alpha value 1.
class var blue: CIColor
Returns a singleton Core Image color instance in the sRGB color space with RGB values
0,0,1 and alpha value 1.
class var clear: CIColor
Returns a singleton Core Image color instance in the sRGB color space with RGB values
0,0,0 and alpha value 0.
class var cyan: CIColor
Returns a singleton Core Image color instance in the sRGB color space with RGB values
0,1,1 and alpha value 1.
class var gray: CIColor
Returns a singleton Core Image color instance in the sRGB color space with RGB values 0
.5,0.5,0.5 and alpha value 1.
class var green: CIColor
Returns a singleton Core Image color instance in the sRGB color space with RGB values
0,1,0 and alpha value 1.
class var magenta: CIColor
Returns a singleton Core Image color instance in the sRGB color space with RGB values
1,0,1 and alpha value 1.
class var red: CIColor
Returns a singleton Core Image color instance in the sRGB color space with RGB values
1,0,0 and alpha value 1.
class var white: CIColor
Returns a singleton Core Image color instance in the sRGB color space with RGB values
1,1,1 and alpha value 1.
class var yellow: CIColor
Returns a singleton Core Image color instance in the sRGB color space with RGB values
1,1,0 and alpha value 1.
Relationships


## Page 5

NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCoding
NSCopying
NSObjectProtocol
NSSecureCoding
Sendable
SendableMetatype
class CIFilter
An image processor that produces an image by manipulating one or more input images or by
generating new image data.
class CIRAWFilter
A filter subclass that produces an image by manipulating RAW image sensor data from a
digital camera or scanner.
class CIVector
The Core Image class that defines a vector object.
Inherits From
Conforms To
See Also
Filters


