# 004_CMIOExtensionProviderProperties.pdf

## Page 1

Create an instance of this object to manage the provider’s property state.
init(dictionary: [CMIOExtensionProperty : CMIOExtensionPropertyState<An
Object>])
Creates a provider properties object with the specified properties.
var name: String?
The provider name.
var manufacturer: String?
The provider manufacturer.
Overview
Topics
Creating Provider Properties
Managing Properties
Core Media I/O / CMIOExtensionProviderProperties
Class
CMIOExtensionProviderProperties
An object that manages the properties of an extension provider.
Mac Catalyst 15.4+
macOS 12.3+


## Page 2

func setPropertyState(CMIOExtensionPropertyState<AnyObject>?, for
Property: CMIOExtensionProperty)
Sets a state value for the specified property.
var propertiesDictionary: [CMIOExtensionProperty : CMIOExtensionPropert
State<AnyObject>]
A dictionary of properties for a provider.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Creating a camera extension with Core Media I/O
Build high-performance camera drivers that are secure and simple to deploy.
Overriding the default USB video class extension
Create a simple DriverKit extension to override the default driver-matching behavior for USB
devices.
class CMIOExtensionProvider
An object that manages device connections for a provider.
Relationships
Inherits From
Conforms To
See Also
Providers


## Page 3

protocol CMIOExtensionProviderSource
A protocol for objects that act as provider sources.


