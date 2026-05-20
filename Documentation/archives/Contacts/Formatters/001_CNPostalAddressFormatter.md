# 001_CNPostalAddressFormatter.pdf

## Page 1

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


## Page 2

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


## Page 3

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


