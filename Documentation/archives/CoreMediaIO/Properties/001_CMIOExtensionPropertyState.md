# 001_CMIOExtensionPropertyState.pdf

## Page 1

Create a property state object by specifying the type of data it stores, which must be a NSStrin
NSNumber, NSDictionary, NSArray, or NSData. You can optionally specify attributes that
restrict the range of values a property allows.
convenience init(value: ObjectType?)
Creates a property state with a value.
init(value: ObjectType?, attributes: CMIOExtensionPropertyAttributes<
ObjectType>?)
Creates a property state with a value and attributes.
var value: ObjectType?
The value for a property state.
Overview
Topics
Creating a Property State
Inspecting a Property State
Core Media I/O / CMIOExtensionPropertyState
Class
CMIOExtensionPropertyState
An object that describes the state of a property.
Mac Catalyst 15.4+
macOS 12.3+


## Page 2

var attributes: CMIOExtensionPropertyAttributes<ObjectType>?
The attributes for a property state.
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
struct CMIOExtensionProperty
A structure that defines the properties that providers, devices, and streams support.
class CMIOExtensionPropertyAttributes
An object that describes the attributes of a property.
let CMIOExtensionInfoDictionaryKey: String
A key that specifies the extension information dictionary.
let CMIOExtensionMachServiceNameKey: String
Relationships
Inherits From
Conforms To
See Also
Properties


## Page 3

A key that specifies the mach service name.


