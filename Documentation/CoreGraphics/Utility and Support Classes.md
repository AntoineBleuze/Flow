# Utility and Support Classes.pdf

## Page 1

Most apps should use CGImageDestination objects instead.
init?(info: UnsafeMutableRawPointer?, cbks: UnsafePointer<CGDataConsume
Callbacks>)
Creates a data consumer that uses callback functions to write data.
init?(url: CFURL)
Creates a data consumer that writes data to a location specified by a URL.
init?(data: CFMutableData)
Creates a data consumer that writes to a CFData object.
struct CGDataConsumerCallbacks
A structure that contains pointers to callback functions that manage the copying of data for 
data consumer.
Overview
Topics
Creating Data Consumers
Core Graphics / CGDataConsumer
Class
CGDataConsumer
An abstraction for data-writing tasks that eliminates the need to manage a raw
memory buffer.
iOS
iPadOS
Mac Catalyst
macOS
tvOS
visionOS
watchOS


## Page 2

typealias CGDataConsumerPutBytesCallback
Copies data from a Core Graphics-supplied buffer into a data consumer.
typealias CGDataConsumerReleaseInfoCallback
Releases any private data or resources associated with the data consumer.
class var typeID: CFTypeID
Returns the Core Foundation type identifier for Core Graphics data consumers.
Equatable, Hashable
Quartz 2D Programming Guide
class CGDataProvider
An abstraction for data-reading tasks that eliminates the need to manage a raw memory
buffer.
class CGShading
A definition for a smooth transition between colors, controlled by a custom function you
provide, for drawing radial and axial gradient fills.
class CGGradient
A definition for a smooth transition between colors for drawing radial and axial gradient fills.
Working with Core Foundation Types
Relationships
Conforms To
See Also
Related Documentation
Utility and Support Classes


## Page 3

class CGFunction
A general facility for defining and using callback functions.
class CGPattern
A 2D pattern to be used for drawing graphics paths.


## Page 4

Data provider objects abstract the data-access task and eliminate the need for applications to
manage data through a raw memory buffer.
For information on how to use CGDataProvider functions, see Quartz 2D Programming Guide
Programming Guide.
See also CGDataConsumer.
init?(sequentialInfo: UnsafeMutableRawPointer?, callbacks: UnsafePointe
<CGDataProviderSequentialCallbacks>)
Creates a sequential-access data provider.
struct CGDataProviderSequentialCallbacks
Defines a structure containing pointers to client-defined callback functions that manage the
sending of data for a sequential-access data provider.
Overview
Topics
Creating Sequential-Access Data Providers
Core Graphics / CGDataProvider
Class
CGDataProvider
An abstraction for data-reading tasks that eliminates the need to manage a raw
memory buffer.
iOS
iPadOS
Mac Catalyst
macOS
tvOS
visionOS
watchOS


## Page 5

typealias CGDataProviderRewindCallback
A callback function that moves the current position in the data stream back to the beginning
typealias CGDataProviderGetBytesCallback
A callback function that copies from a provider data stream into a Core Graphics buffer.
typealias CGDataProviderSkipForwardCallback
A callback function that advances the current position in the data stream supplied by the
provider.
typealias CGDataProviderReleaseInfoCallback
A callback function that releases any private data or resources associated with the data
provider.
init?(directInfo: UnsafeMutableRawPointer?, size: off_t, callbacks:
UnsafePointer<CGDataProviderDirectCallbacks>)
Creates a direct-access data provider.
init?(data: CFData)
Creates a data provider that reads from a CFData object.
init?(url: CFURL)
Creates a direct-access data provider that uses a URL to supply data.
init?(dataInfo: UnsafeMutableRawPointer?, data: UnsafeRawPointer, size:
Int, releaseData: CGDataProviderReleaseDataCallback)
Creates a direct-access data provider that uses data your program supplies.
init?(filename: UnsafePointer<CChar>)
Creates a direct-access data provider that uses a file to supply data.
struct CGDataProviderDirectCallbacks
Defines pointers to client-defined callback functions that manage the sending of data for a
direct-access data provider.
typealias CGDataProviderGetBytePointerCallback
A callback function that returns a generic pointer to the provider data.
typealias CGDataProviderGetBytesAtPositionCallback
A callback function that copies data from the provider into a Core Graphics buffer.
Creating Direct-Access Data Providers


## Page 6

typealias CGDataProviderReleaseBytePointerCallback
A callback function that releases the pointer Core Graphics obtained by calling CGData
ProviderGetBytePointerCallback.
typealias CGDataProviderReleaseInfoCallback
A callback function that releases any private data or resources associated with the data
provider.
typealias CGDataProviderReleaseDataCallback
A callback function that releases data you supply to the function init(dataInfo:data:
size:releaseData:).
var data: CFData?
Returns a copy of the provider’s data.
class var typeID: CFTypeID
Returns the Core Foundation type identifier for data providers.
var info: UnsafeMutableRawPointer?
Equatable, Hashable
Getting Data from a Data Provider
Working with Core Foundation Types
Instance Properties
Relationships
Conforms To
See Also
Related Documentation


## Page 7

Quartz 2D Programming Guide
class CGDataConsumer
An abstraction for data-writing tasks that eliminates the need to manage a raw memory buff
class CGShading
A definition for a smooth transition between colors, controlled by a custom function you
provide, for drawing radial and axial gradient fills.
class CGGradient
A definition for a smooth transition between colors for drawing radial and axial gradient fills.
class CGFunction
A general facility for defining and using callback functions.
class CGPattern
A 2D pattern to be used for drawing graphics paths.
Utility and Support Classes


## Page 8

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


## Page 9

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


## Page 10

class CGDataProvider
An abstraction for data-reading tasks that eliminates the need to manage a raw memory
buffer.
class CGGradient
A definition for a smooth transition between colors for drawing radial and axial gradient fills.
class CGFunction
A general facility for defining and using callback functions.
class CGPattern
A 2D pattern to be used for drawing graphics paths.


## Page 11

A gradient defines a smooth transition between colors across an area. A CGGradient has a colo
space, two or more colors, and a location for each color. The color space cannot be a pattern or
indexed color space, otherwise it can be any Core Graphics color space (CGColorSpace).
Colors can be provided as component values (such as red, green, blue) or as Core Graphics color
objects (CGColor). Component values can vary from 0.0 to 1.0, designating the proportion of the
component present in the color.
A location is a normalized value. When it comes time to paint the gradient, Core Graphics maps th
normalized location values to the points in coordinate space that you provide.
For more precise control over gradients, see CGShading.
init?(colorSpace: CGColorSpace, colorComponents: UnsafePointer<CGFloat>
locations: UnsafePointer<CGFloat>?, count: Int)
Overview
Topics
Creating Gradient Instances
Core Graphics / CGGradient
Class
CGGradient
A definition for a smooth transition between colors for drawing radial and axial
gradient fills.
iOS
iPadOS
Mac Catalyst
macOS
tvOS
visionOS
watchOS


## Page 12

Creates a CGGradient object from a color space and the provided color components and
locations.
init?(colorsSpace: CGColorSpace?, colors: CFArray, locations: Unsafe
Pointer<CGFloat>?)
Creates a gradient object from a color space and the provided color objects and locations.
class var typeID: CFTypeID
Returns the Core Foundation type identifier for CGGradient objects.
init?(headroom: Float, colorSpace: CGColorSpace, colorComponents: Unsaf
Pointer<CGFloat>, locations: UnsafePointer<CGFloat>?, count: Int)
var contentHeadroom: Float
Equatable, Hashable
class CGDataConsumer
An abstraction for data-writing tasks that eliminates the need to manage a raw memory buff
class CGDataProvider
Working with Core Foundation Types
Initializers
Instance Properties
Relationships
Conforms To
See Also
Utility and Support Classes


## Page 13

An abstraction for data-reading tasks that eliminates the need to manage a raw memory
buffer.
class CGShading
A definition for a smooth transition between colors, controlled by a custom function you
provide, for drawing radial and axial gradient fills.
class CGFunction
A general facility for defining and using callback functions.
class CGPattern
A 2D pattern to be used for drawing graphics paths.


## Page 14

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


## Page 15

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


## Page 16

class CGGradient
A definition for a smooth transition between colors for drawing radial and axial gradient fills.
class CGPattern
A 2D pattern to be used for drawing graphics paths.


## Page 17

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


## Page 18

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


## Page 19

class CGShading
A definition for a smooth transition between colors, controlled by a custom function you
provide, for drawing radial and axial gradient fills.
class CGGradient
A definition for a smooth transition between colors for drawing radial and axial gradient fills.
class CGFunction
A general facility for defining and using callback functions.


