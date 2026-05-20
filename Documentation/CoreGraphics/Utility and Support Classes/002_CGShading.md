# 002_CGShading.pdf

## Page 1

Shading means to fill using a smooth transition between colors across an area. You create a
shading using a custom function with a CGFunction instance. To paint with a Core Graphics
shading, you call drawShading(_:). This function fills the current clipping path using the
specified color gradient, calling your parametric function repeatedly as it draws.
An alternative to using a CGShading instance is to use the CGGradient type. For applications
that run in macOS 10.5 and later, CGGradient objects are much simpler to use.
init?(axialSpace: CGColorSpace, start: CGPoint, end: CGPoint, function:
CGFunction, extendStart: Bool, extendEnd: Bool)
Creates a shading object to use for axial shading.
init?(radialSpace: CGColorSpace, start: CGPoint, startRadius: CGFloat,
end: CGPoint, endRadius: CGFloat, function: CGFunction, extendStart:
Bool, extendEnd: Bool)
Overview
Topics
Creating Shading Objects
Core Graphics / CGShading
Class
CGShading
A definition for a smooth transition between colors, controlled by a custom
function you provide, for drawing radial and axial gradient fills.
iOS
iPadOS
Mac Catalyst
macOS
tvOS
visionOS
watchOS


## Page 2

Creates a shading object to use for radial shading.
class var typeID: CFTypeID
Returns the Core Foundation type identifier for Core Graphics shading objects.
init?(axialHeadroom: Float, space: CGColorSpace, start: CGPoint, end:
CGPoint, function: CGFunction, extendStart: Bool, extendEnd: Bool)
init?(radialHeadroom: Float, space: CGColorSpace, start: CGPoint, start
Radius: CGFloat, end: CGPoint, endRadius: CGFloat, function: CGFunction
extendStart: Bool, extendEnd: Bool)
var contentHeadroom: Float
Equatable, Hashable
Quartz 2D Programming Guide
class CGDataConsumer
An abstraction for data-writing tasks that eliminates the need to manage a raw memory buff
Working with Core Foundation Types
Initializers
Instance Properties
Relationships
Conforms To
See Also
Related Documentation
Utility and Support Classes


## Page 3

class CGDataProvider
An abstraction for data-reading tasks that eliminates the need to manage a raw memory
buffer.
class CGGradient
A definition for a smooth transition between colors for drawing radial and axial gradient fills.
class CGFunction
A general facility for defining and using callback functions.
class CGPattern
A 2D pattern to be used for drawing graphics paths.


