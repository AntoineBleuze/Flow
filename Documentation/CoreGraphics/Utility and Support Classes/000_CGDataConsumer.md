# 000_CGDataConsumer.pdf

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


