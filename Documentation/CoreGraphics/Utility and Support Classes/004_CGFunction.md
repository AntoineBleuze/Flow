# 004_CGFunction.pdf

## Page 1

These functions can take an arbitrary number of floating-point input values and pass back an
arbitrary number of floating-point output values.
Core Graphics uses function objects to implement shadings. CGShading describes the
parameters and semantics required for the callbacks used by function objects.
init?(info: UnsafeMutableRawPointer?, domainDimension: Int, domain:
UnsafePointer<CGFloat>?, rangeDimension: Int, range: UnsafePointer<
CGFloat>?, callbacks: UnsafePointer<CGFunctionCallbacks>)
Creates a Core Graphics function.
struct CGFunctionCallbacks
A structure that contains callbacks needed by a CGFunctionRef object.
Overview
Topics
Creating Function Objects
Callbacks
Core Graphics / CGFunction
Class
CGFunction
A general facility for defining and using callback functions.
iOS
iPadOS
Mac Catalyst
macOS
tvOS
visionOS
watchOS


## Page 2

typealias CGFunctionEvaluateCallback
Performs custom operations on the supplied input data to produce output data.
typealias CGFunctionReleaseInfoCallback
Performs custom clean-up tasks when Core Graphics deallocates a CGFunctionRef objec
class var typeID: CFTypeID
Returns the type identifier for Core Graphics function objects.
Equatable, Hashable
Quartz 2D Programming Guide
class CGDataConsumer
An abstraction for data-writing tasks that eliminates the need to manage a raw memory buff
class CGDataProvider
An abstraction for data-reading tasks that eliminates the need to manage a raw memory
buffer.
class CGShading
A definition for a smooth transition between colors, controlled by a custom function you
provide, for drawing radial and axial gradient fills.
Working with Core Foundation Types
Relationships
Conforms To
See Also
Related Documentation
Utility and Support Classes


## Page 3

class CGGradient
A definition for a smooth transition between colors for drawing radial and axial gradient fills.
class CGPattern
A 2D pattern to be used for drawing graphics paths.


