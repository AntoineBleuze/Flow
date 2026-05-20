# 003_CIVector.pdf

## Page 1

A CIVector can store one or more CGFloat in one object. They can store a group of float value
for a variety of different uses such as coordinate points, direction vectors, geometric rectangles,
transform matrices, convolution weights, or just a list a parameter values.
You use CIVector objects in conjunction with other Core Image classes, such as CIFilter and
CIKernel. Many of the built-in Core Image filters have one or more CIVector inputs that you c
set to affect the filter’s behavior.
init(values: UnsafePointer<CGFloat>, count: Int)
Initialize a Core Image vector object with the specified the values.
convenience init(x: CGFloat)
Initialize a Core Image vector object with one value.
convenience init(x: CGFloat, y: CGFloat)
Initialize a Core Image vector object with two values.
Overview
Topics
Initializing a Vector
Core Image / CIVector
Class
CIVector
The Core Image class that defines a vector object.
iOS 5.0+
iPadOS 5.0+
Mac Catalyst 13.1+
macOS 10.4+
tvOS
visionOS 1.0+


## Page 2

convenience init(x: CGFloat, y: CGFloat, z: CGFloat)
Initialize a Core Image vector object with three values.
convenience init(x: CGFloat, y: CGFloat, z: CGFloat, w: CGFloat)
Initialize a Core Image vector object with four values.
convenience init(string: String)
Initialize a Core Image vector object with values provided in a string representation.
convenience init(cgAffineTransform: CGAffineTransform)
Initialize a Core Image vector object with six values provided by a CGAffineTransform
structure.
convenience init(cgPoint: CGPoint)
Initialize a Core Image vector object with two values provided by a CGPoint structure.
convenience init(cgRect: CGRect)
Initialize a Core Image vector object with four values provided by a CGRect structure.
func value(at: Int) -> CGFloat
Returns a value from a specific position in the vector.
var count: Int
The number of items in the vector.
var x: CGFloat
The value located in the first position in the vector.
var y: CGFloat
The value located in the second position in the vector.
var z: CGFloat
The value located in the third position in the vector.
var w: CGFloat
The value located in the forth position in the vector.
var stringRepresentation: String
Returns a formatted string with all the values of a CIVector.
var cgAffineTransformValue: CGAffineTransform
Getting Values From a Vector


## Page 3

Returns the values in the vector as a CGAffineTransformValue structure.
var cgPointValue: CGPoint
Returns the values in the vector as a CGPoint structure.
var cgRectValue: CGRect
Returns the values in the vector as a CGRect structure.
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
Relationships
Inherits From
Conforms To
See Also
Filters


## Page 4

A filter subclass that produces an image by manipulating RAW image sensor data from a
digital camera or scanner.
class CIColor
The Core Image class that defines a color object.


