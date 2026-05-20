# 002_CMIOExtensionPropertyAttributes.pdf

## Page 1

Use a property attributes object to describe attributes such as the minimum and maximum values
discrete values, and read-only values.
init(minValue: ObjectType?, maxValue: ObjectType?, validValues: [Object
Type]?, readOnly: Bool)
Creates a property attributes object with the specified configuration.
var isReadOnly: Bool
A Boolean value that indicates whether a property is read-only.
var minValue: ObjectType?
The minimum value a property supports.
Overview
Topics
Creating Property Attributes
Inspecting Attributes
Core Media I/O / CMIOExtensionPropertyAttributes
Class
CMIOExtensionPropertyAttributes
An object that describes the attributes of a property.
Mac Catalyst 15.4+
macOS 12.3+


## Page 2

var maxValue: ObjectType?
The maximum value a property supports.
var validValues: [ObjectType]?
An array of discrete values that this property supports.
class var readOnlyPropertyAttribute: CMIOExtensionPropertyAttributes<An
Object>
A class property for a read-only property attribute.
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
Specifying a Read-Only Attribute
Relationships
Inherits From
Conforms To
See Also
Properties


## Page 3

class CMIOExtensionPropertyState
An object that describes the state of a property.
let CMIOExtensionInfoDictionaryKey: String
A key that specifies the extension information dictionary.
let CMIOExtensionMachServiceNameKey: String
A key that specifies the mach service name.


