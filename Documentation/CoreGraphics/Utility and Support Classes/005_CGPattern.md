# 005_CGPattern.pdf

## Page 1

Core Graphics tiles the pattern cell for you, based on parameters you specify when you call
init(info:bounds:matrix:xStep:yStep:tiling:isColored:callbacks:).
To create a dashed line, see CGContextSetLineDash.
init?(info: UnsafeMutableRawPointer?, bounds: CGRect, matrix: CGAffine
Transform, xStep: CGFloat, yStep: CGFloat, tiling: CGPatternTiling, is
Colored: Bool, callbacks: UnsafePointer<CGPatternCallbacks>)
Creates a pattern object.
struct CGPatternCallbacks
A structure that holds a version and two callback functions for drawing a custom pattern.
typealias CGPatternDrawPatternCallback
Overview
Topics
Creating a Pattern
Callbacks
Core Graphics / CGPattern
Class
CGPattern
A 2D pattern to be used for drawing graphics paths.
iOS
iPadOS
Mac Catalyst
macOS
tvOS
visionOS
watchOS


## Page 2

Draws a pattern cell.
typealias CGPatternReleaseInfoCallback
Release private data or resources associated with the pattern.
enum CGPatternTiling
Different methods for rendering a tiled pattern.
class var typeID: CFTypeID
Returns the type identifier for Core Graphics patterns.
Equatable, Hashable
Quartz 2D Programming Guide
class CGDataConsumer
An abstraction for data-writing tasks that eliminates the need to manage a raw memory buff
class CGDataProvider
An abstraction for data-reading tasks that eliminates the need to manage a raw memory
buffer.
Constants
Working with Core Foundation Types
Relationships
Conforms To
See Also
Related Documentation
Utility and Support Classes


## Page 3

class CGShading
A definition for a smooth transition between colors, controlled by a custom function you
provide, for drawing radial and axial gradient fills.
class CGGradient
A definition for a smooth transition between colors for drawing radial and axial gradient fills.
class CGFunction
A general facility for defining and using callback functions.


