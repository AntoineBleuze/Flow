# 004_CGLayer.pdf

## Page 1

init?(CGContext, size: CGSize, auxiliaryInfo: CFDictionary?)
Creates a layer object that is associated with a graphics context.
var context: CGContext?
Returns the graphics context associated with a layer object.
var size: CGSize
Returns the width and height of a layer object.
class var typeID: CFTypeID
Returns the unique type identifier used for CGLayer objects.
Topics
Creating Layer Objects
Examining a Layer
Working with Core Foundation Types
Core Graphics / CGLayer
Class
CGLayer
An offscreen context for reusing content drawn with Core Graphics.
iOS
iPadOS
Mac Catalyst
macOS
tvOS
visionOS
watchOS


## Page 2

Equatable, Hashable
class CGContext
A Quartz 2D drawing environment.
class CGImage
A bitmap image or image mask.
class CGPath
An immutable graphics path: a mathematical description of shapes or lines to be drawn in a
graphics context.
class CGMutablePath
A mutable graphics path: a mathematical description of shapes or lines to be drawn in a
graphics context.
Relationships
Conforms To
See Also
2D Drawing


