# 002_CNContactVCardSerialization.pdf

## Page 1

class func contacts(with: Data) throws -> [CNContact]
Returns the contacts from the vCard data.
class func data(with: [CNContact]) throws -> Data
Returns the vCard representation of the specified contacts.
class func descriptorForRequiredKeys() -> any CNKeyDescriptor
Use to fetch all contact keys required to create vCard data from a contact.
Topics
Extracting Contacts from a vCard
Getting a vCard for Contacts
Getting a Descriptor
Relationships
Contacts / CNContactVCardSerialization
Class
CNContactVCardSerialization
An object you use to convert to and from a vCard representation of the user’s
contacts.
iOS 9.0+
iPadOS 9.0+
Mac Catalyst 13.1+
macOS 10.11+
visionOS 1.0+
watchOS 2.0+


## Page 2

NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
class CNContactFormatter
An object that you use to format contact information before displaying it to the user.
class CNPostalAddressFormatter
An object that you use to format a contact’s postal addresses.
class CNContactsUserDefaults
An object that defines the default options to use when displaying contacts.
Inherits From
Conforms To
See Also
Formatters


