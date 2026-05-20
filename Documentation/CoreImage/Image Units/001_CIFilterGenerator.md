# 001_CIFilterGenerator.pdf

## Page 1

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


## Page 2

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


## Page 3

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


## Page 4

protocol CIFilterConstructor
A general interface for objects that produce filters.


