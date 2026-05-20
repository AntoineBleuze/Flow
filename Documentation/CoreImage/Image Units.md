# Image Units.pdf

## Page 1

An image unit is an image processing bundle that contains one or more Core Image filters. The
.plugin extension indicates one or more filters packaged as an image unit.
Note
Starting in macOS 10.15, loading executable CIFilter plugins is deprecated.
class func loadNonExecutablePlugIns()
Scans directories for plugins.
class func loadNonExecutablePlugIn(URL!)
Loads a non-executable plug-in specified by its URL.
Overview
Topics
Loading Plug-ins
Deprecated
Core Image / CIPlugIn
Class
CIPlugIn
The mechanism for loading image units in macOS.
macOS 10.4+


## Page 2

class func loadAllPlugIns()
Scans directories for files that have the .plugin extension and then loads the image units.
Deprecated
class func load(URL!, allowExecutableCode: Bool)
Loads filters from an image unit that have the appropriate executable status.
Deprecated
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
class CIFilterGenerator
An object that creates and configures chains of individual image filters.
protocol CIPlugInRegistration
The interface for loading Core Image image units.
protocol CIFilterConstructor
A general interface for objects that produce filters.
Relationships
Inherits From
Conforms To
See Also
Image Units


## Page 3



## Page 4

The CIFilterGenerator class provides methods for creating a CIFilter object by chaining
together existing CIFilter objects to create complex effects. (A filter chain refers to the
CIFilter objects that are connected in the CIFilterGenerator object.) The complex effect
can be encapsulated as a CIFilterGenerator object and saved as a file so that it can be used
again. The filter generator file contains an archived instance of all the CIFilter objects that are
chained together.
Any filter generator files that you copy to /Library/Graphics/Image Units/ are loaded
when any of the loading methods provided by the CIPlugIn class are invoked. A CIFilter
Generator object is registered by its filename or, if present, by a class attribute that you supply 
its description.
You can create a CIFilterGenerator object programmatically, using the methods provided by
the CIFilterGenerator class, or by using the editor view provided by Core Image.
init?(contentsOf: URL)
Initializes a filter generator object with the contents of a filter generator file.
Overview
Topics
Initializing a Filter Generator Object
Core Image / CIFilterGenerator
Class
CIFilterGenerator
An object that creates and configures chains of individual image filters.
macOS 10.5+


## Page 5

func connect(Any, withKey: String?, to: Any, withKey: String)
Adds an object to the filter chain.
func disconnectObject(Any, withKey: String, to: Any, withKey: String)
Removes the connection between two objects in the filter chain.
var exportedKeys: [AnyHashable : Any]
Returns an array of the exported keys.
func exportKey(String, from: Any, withName: String?)
Exports an input or output key of an object in the filter chain.
func removeExportedKey(String)
Removes a key that was previously exported.
func setAttributes([AnyHashable : Any], forExportedKey: String)
Sets a dictionary of attributes for an exported key.
var classAttributes: [AnyHashable : Any]
The class attributes associated with the filter.
func write(to: URL, atomically: Bool) -> Bool
Archives a filter generator object to a filter generator file.
func registerFilterName(String)
Registers the name associated with a filter chain.
Connecting and Disconnecting Objects
Managing Exported Keys
Setting and Getting Class Attributes
Archiving a Filter Generator Object
Registering a Filter Chain
Creating a Filter from a Filter Chain


## Page 6

func filter() -> CIFilter
Creates a filter object based on the filter chain.
Exported Keys
Keys for the exported parameters of a filter generator object.
NSObject
CIFilterConstructor
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCoding
NSCopying
NSObjectProtocol
NSSecureCoding
class CIPlugIn
The mechanism for loading image units in macOS.
protocol CIPlugInRegistration
The interface for loading Core Image image units.
Constants
Relationships
Inherits From
Conforms To
See Also
Image Units


## Page 7

protocol CIFilterConstructor
A general interface for objects that produce filters.


## Page 8

The principal class of an image unit—a loadable bundle containing custom Core Image filters for
macOS—must support this protocol.
func load(UnsafeMutableRawPointer!) -> Bool
Loads and initializes an image unit, performing custom tasks as needed.
Required
class CIPlugIn
Overview
Topics
Initializing Plug-ins
See Also
Image Units
Core Image / CIPlugInRegistration
Protocol
CIPlugInRegistration
The interface for loading Core Image image units.
macOS


## Page 9

The mechanism for loading image units in macOS.
class CIFilterGenerator
An object that creates and configures chains of individual image filters.
protocol CIFilterConstructor
A general interface for objects that produce filters.


## Page 10

Objects implementing this protocol are called filter constructors—they produce new instances of
CIFilter subclasses when filters are requested by name. You can create a filter constructor to
provide new, custom filters that other Core Image clients can discover using the CIFilter class
Normally, you create and register custom filters by packaging them as Image Units (see Packagin
and Loading Image Units), but you can use this protocol to provide new filters within your app tha
are compositions of existing filters.
To provide custom filters using this protocol, you must:
1. Create your custom filters as CIFilter subclasses.
2. Create a class that implements this protocol to vend instances of the appropriate CIFilter
subclasses when requested.
3. Call the CIFilter class method registerName(_:constructor:classAttributes:)
for each custom filter, providing the filter’s name, an instance of your filter constructor class, a
information about the filter’s attributes.
Overview
Topics
Providing Filter Objects
Core Image / CIFilterConstructor
Protocol
CIFilterConstructor
A general interface for objects that produce filters.
iOS
iPadOS
Mac Catalyst
macOS
tvOS
visionOS


## Page 11

func filter(withName: String) -> CIFilter?
Returns a filter object specified by name.
Required
CIFilterGenerator
class CIPlugIn
The mechanism for loading image units in macOS.
class CIFilterGenerator
An object that creates and configures chains of individual image filters.
protocol CIPlugInRegistration
The interface for loading Core Image image units.
Relationships
Conforming Types
See Also
Image Units


