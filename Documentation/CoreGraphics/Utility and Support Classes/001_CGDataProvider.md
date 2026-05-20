# 001_CGDataProvider.pdf

## Page 1

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


## Page 2

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


## Page 3

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


## Page 4

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


