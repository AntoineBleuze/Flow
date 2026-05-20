# Formatters.pdf

## Page 1

A CNContactFormatter object handles international ordering and delimiting for the contact
name components. When formatting many contacts, create an instance of this class and use the
instance methods; otherwise use the class methods.
func attributedString(from: CNContact, defaultAttributes: [AnyHashable 
Any]?) -> NSAttributedString?
Formats the contact name as an attributed string.
class func attributedString(from: CNContact, style: CNContactFormatter
Style, defaultAttributes: [AnyHashable : Any]?) -> NSAttributedString?
Formats the contact name as an attributed string.
Overview
Topics
Creating a formatted attributed string
Creating a formatted string
Contacts / CNContactFormatter
Class
CNContactFormatter
An object that you use to format contact information before displaying it to the
user.
iOS 9.0+
iPadOS 9.0+
Mac Catalyst 13.1+
macOS 10.11+
visionOS 1.0+
watchOS 2.0+


## Page 2

func string(from: CNContact) -> String?
Formats the contact name.
class func string(from: CNContact, style: CNContactFormatterStyle) ->
String?
Returns the contact name, formatted with the specified formatter.
var style: CNContactFormatterStyle
The formatting style for the contact name.
enum CNContactFormatterStyle
The formatting styles for contact names.
class func descriptorForRequiredKeys(for: CNContactFormatterStyle) ->
any CNKeyDescriptor
Returns the required key descriptor for the specified formatting style of the contact.
class var descriptorForRequiredKeysForDelimiter: any CNKeyDescriptor
Returns the required key descriptor for the name delimiter.
class var descriptorForRequiredKeysForNameOrder: any CNKeyDescriptor
Returns the required key descriptor for the display name order.
class func delimiter(for: CNContact) -> String
Returns the delimiter to use between name components.
class func nameOrder(for: CNContact) -> CNContactDisplayNameOrder
Returns the display name order.
enum CNContactDisplayNameOrder
The formatting orders for contact names component.
Specifying the formatting style
Getting a descriptor
Getting format information
Relationships


## Page 3

Formatter
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCoding
NSCopying
NSObjectProtocol
NSSecureCoding
class CNPostalAddressFormatter
An object that you use to format a contact’s postal addresses.
class CNContactVCardSerialization
An object you use to convert to and from a vCard representation of the user’s contacts.
class CNContactsUserDefaults
An object that defines the default options to use when displaying contacts.
Inherits From
Conforms To
See Also
Formatters


## Page 4

A CNPostalAddressFormatter object handles international formatting of postal addresses. It
recommended that you create an instance of this class when formatting many postal addresses,
and use the instance methods; otherwise use the class methods.
func attributedString(from: CNPostalAddress, withDefaultAttributes: [An
Hashable : Any]) -> NSAttributedString
Returns a formatted postal address as an attributed string.
class func attributedString(from: CNPostalAddress, style: CNPostal
AddressFormatterStyle, withDefaultAttributes: [AnyHashable : Any]) ->
NSAttributedString
Returns a postal address as an attributed string and formatted for the specified style.
let CNPostalAddressPropertyAttribute: String
An attribute that identifies the purpose of a range of characters in an attributed string.
Overview
Topics
Generating a formatted attributed string
Contacts / CNPostalAddressFormatter
Class
CNPostalAddressFormatter
An object that you use to format a contact’s postal addresses.
iOS 9.0+
iPadOS 9.0+
Mac Catalyst 13.1+
macOS 10.11+
visionOS 1.0+
watchOS 2.0+


## Page 5

let CNPostalAddressLocalizedPropertyNameAttribute: String
An attribute that identifies the localized property of postal address.
func string(from: CNPostalAddress) -> String
Returns a formatted postal address.
class func string(from: CNPostalAddress, style: CNPostalAddressFormatte
Style) -> String
Returns a postal address as a string and formatted for the specified style.
var style: CNPostalAddressFormatterStyle
The style to apply when formatting strings.
enum CNPostalAddressFormatterStyle
Constants for postal formatting styles.
let CNPostalAddressCityKey: String
The city of the address.
let CNPostalAddressCountryKey: String
The country or region name of the address.
let CNPostalAddressISOCountryCodeKey: String
The ISO country code of the address.
let CNPostalAddressPostalCodeKey: String
The postal code of the address.
let CNPostalAddressStateKey: String
The state name of the address.
let CNPostalAddressStreetKey: String
The street name of the address.
let CNPostalAddressSubAdministrativeAreaKey: String
Generating a formatted string
Specifying the formatting style
Getting the postal attribute keys


## Page 6

The subadministrative area of the address.
let CNPostalAddressSubLocalityKey: String
The sublocality of the address.
Formatter
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCoding
NSCopying
NSObjectProtocol
class CNContactFormatter
An object that you use to format contact information before displaying it to the user.
class CNContactVCardSerialization
An object you use to convert to and from a vCard representation of the user’s contacts.
class CNContactsUserDefaults
An object that defines the default options to use when displaying contacts.
Relationships
Inherits From
Conforms To
See Also
Formatters


## Page 7

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


## Page 8

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


## Page 9

class func shared() -> Self
The singleton contacts user defaults object.
var countryCode: String
An ISO country code.
var sortOrder: CNContactSortOrder
Default sorting order by name.
NSObject
Topics
Getting the Shared Database
Getting the Default Values
Relationships
Inherits From
Contacts / CNContactsUserDefaults
Class
CNContactsUserDefaults
An object that defines the default options to use when displaying contacts.
iOS 9.0+
iPadOS 9.0+
Mac Catalyst 13.1+
macOS 10.11+
visionOS 1.0+
watchOS 2.0+


## Page 10

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
class CNContactVCardSerialization
An object you use to convert to and from a vCard representation of the user’s contacts.
Conforms To
See Also
Formatters


