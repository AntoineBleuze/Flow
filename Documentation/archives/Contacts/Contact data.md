# Contact data.pdf

## Page 1

A CNContact object stores an immutable copy of a contact’s information, so you cannot change
the information in this object directly. Contact objects are thread-safe, so you may access them
from any thread of your app.
To modify a contact’s information, call the mutableCopy() method to obtain a CNMutable
Contact object with the same information. After modifying the mutable contact, save your
changes back to the contacts database using the CNContactStore object.
Every contact in the contacts database has a unique ID, which you access using the identifier
property. The mutable and immutable versions of the same contact have the same identifier.
var identifier: String
A value that uniquely identifies a contact on the device.
var contactType: CNContactType
An enum identifying the contact type.
Overview
Topics
Identifying the Contact
Contacts / CNContact
Class
CNContact
An immutable object that stores information about a single contact, such as the
contact’s first name, phone numbers, and addresses.
iOS 9.0+
iPadOS 9.0+
Mac Catalyst 13.1+
macOS 10.11+
visionOS 1.0+
watchOS 2.0+


## Page 2

enum CNContactType
The types a contact can be.
var namePrefix: String
The name prefix of the contact.
var givenName: String
The given name of the contact.
var middleName: String
The middle name of the contact.
var familyName: String
The family name of the contact.
var previousFamilyName: String
A string for the previous family name of the contact.
var nameSuffix: String
The name suffix of the contact.
var nickname: String
The nickname of the contact.
var phoneticGivenName: String
The phonetic given name of the contact.
var phoneticMiddleName: String
The phonetic middle name of the contact.
var phoneticFamilyName: String
A string for the phonetic family name of the contact.
var jobTitle: String
The contact’s job title.
var departmentName: String
The name of the department associated with the contact.
Getting Name Information
Getting Work Information


## Page 3

var organizationName: String
The name of the organization associated with the contact.
var phoneticOrganizationName: String
The phonetic name of the organization associated with the contact.
var postalAddresses: [CNLabeledValue<CNPostalAddress>]
An array of labeled postal addresses for a contact.
var emailAddresses: [CNLabeledValue<NSString>]
An array of labeled email addresses for the contact.
var urlAddresses: [CNLabeledValue<NSString>]
An array of labeled URL addresses for a contact.
var phoneNumbers: [CNLabeledValue<CNPhoneNumber>]
An array of labeled phone numbers for a contact.
var socialProfiles: [CNLabeledValue<CNSocialProfile>]
An array of labeled social profiles for a contact.
var birthday: DateComponents?
A date component for the Gregorian birthday of the contact.
var nonGregorianBirthday: DateComponents?
A date component for the non-Gregorian birthday of the contact.
var dates: [CNLabeledValue<NSDateComponents>]
An array containing labeled Gregorian dates.
Getting Addresses
Getting Phone Information
Getting Social Profiles
Getting Birthday Information
Getting Notes


## Page 4

var note: String
A string containing notes for the contact.
var imageData: Data?
The profile picture of a contact.
var thumbnailImageData: Data?
The thumbnail version of the contact’s profile picture.
var imageDataAvailable: Bool
A Boolean indicating whether a contact has a profile picture.
var contactRelations: [CNLabeledValue<CNContactRelation>]
An array of labeled relations for the contact.
var instantMessageAddresses: [CNLabeledValue<CNInstantMessageAddress>]
An array of labeled IM addresses for the contact.
class func localizedString(forKey: String) -> String
Returns a string containing the localized contact property name.
class func descriptorForAllComparatorKeys() -> any CNKeyDescriptor
Fetches all the keys required for the contact sort comparator.
class func comparator(forNameSortOrder: CNContactSortOrder) ->
Comparator
Returns a comparator to sort contacts with the specified order.
func isUnifiedWithContact(withIdentifier: String) -> Bool
Returns a Boolean indicating whether the current contact is a unified contact and includes a
contact with the specified identifier.
enum CNContactSortOrder
Getting Contact Images
Getting Related Information
Localizing Contact Data
Comparing Contacts


## Page 5

Indicates the sorting order for contacts.
func isKeyAvailable(String) -> Bool
Determines whether the contact property value for the specified key is fetched.
func areKeysAvailable([any CNKeyDescriptor]) -> Bool
Determines whether all contact property values for the specified keys are fetched.
Predicates to match contacts. You can only use these predicates with CNContactStore and
CNContactFetchRequest.
class func predicateForContacts(matchingName: String) -> NSPredicate
Returns a predicate to find the contacts matching the specified name.
class func predicateForContacts(withIdentifiers: [String]) ->
NSPredicate
Returns a predicate to find the contacts matching the specified identifiers.
class func predicateForContactsInGroup(withIdentifier: String) ->
NSPredicate
Returns a predicate to find the contacts that are members in the specified group.
class func predicateForContactsInContainer(withIdentifier: String) ->
NSPredicate
Returns a predicate to find the contacts in the specified container.
class func predicateForContacts(matching: CNPhoneNumber) -> NSPredicate
Returns a predicate to find the contacts whose phone number matches the specified value.
class func predicateForContacts(matchingEmailAddress: String) ->
NSPredicate
Returns a predicate to find the contacts whose email address matches the specified value.
Checking the Availability of Data
Getting Search Predicates
Relationships


## Page 6

NSObject
CNMutableContact
CVarArg
Copyable
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
Identifiable
NSCoding
NSCopying
NSItemProviderReading
NSItemProviderWriting
NSMutableCopying
NSObjectProtocol
NSSecureCoding
class CNMutableContact
A mutable object that stores information about a single contact, such as the contact’s first
name, phone numbers, and addresses.
Data Objects
Access contact-related data, such as the user’s postal address and phone number.
Contact Keys
Inherits From
Inherited By
Conforms To
See Also
Contact data


## Page 7

Specify contact-related properties during fetch operations.


## Page 8

CNMutableContact objects are not a thread-safe class. To access the contact information in a
thread-safe manner, use a CNContact object instead.
You may modify only those properties whose values you fetched from the contacts database.
When fetching a contact, you specify which properties you want to retrieve from the database. Th
contact store then populates the properties of a CNContact object with those values. After
creating a mutable copy of that object, you can modify only those properties for which a value
exists. If you attempt to access a property that is not available, the CNMutableContact object
throws a CNContactPropertyNotFetchedExceptionName exception.
To remove the value for a property, set string and array properties to empty, and set all other
properties to nil.
var contactType: CNContactType
An enum identifying the contact type.
Overview
Topics
Setting the Identity of the Contact
Contacts / CNMutableContact
Class
CNMutableContact
A mutable object that stores information about a single contact, such as the
contact’s first name, phone numbers, and addresses.
iOS 9.0+
iPadOS 9.0+
Mac Catalyst 13.1+
macOS 10.11+
visionOS 1.0+
watchOS 2.0+


## Page 9

var namePrefix: String
The name prefix of the contact.
var givenName: String
The given name of the contact.
var middleName: String
The middle name of the contact.
var familyName: String
The family name of the contact.
var previousFamilyName: String
The previous family name of the contact.
var nameSuffix: String
The name suffix of the contact.
var nickname: String
The nickname of the contact.
var phoneticGivenName: String
The phonetic given name of the contact.
var phoneticMiddleName: String
The phonetic middle name of the contact.
var phoneticFamilyName: String
The phonetic family name of the contact.
var jobTitle: String
The contact’s job title.
var departmentName: String
The name of the department associated with the contact.
var organizationName: String
Setting Name Information
Setting Work Information


## Page 10

The name of the organization associated with the contact.
var phoneticOrganizationName: String
The phonetic name of the organization associated with the contact.
var postalAddresses: [CNLabeledValue<CNPostalAddress>]
An array of labeled postal addresses for a contact.
var emailAddresses: [CNLabeledValue<NSString>]
An array of labeled email addresses for the contact.
var urlAddresses: [CNLabeledValue<NSString>]
An array of labeled URL addresses for a contact.
var phoneNumbers: [CNLabeledValue<CNPhoneNumber>]
An array of labeled phone numbers for a contact.
var socialProfiles: [CNLabeledValue<CNSocialProfile>]
An array of labeled social profiles for a contact.
var dates: [CNLabeledValue<NSDateComponents>]
An array containing labeled Gregorian dates.
var nonGregorianBirthday: DateComponents?
A date component for the non-Gregorian birthday of the contact.
var birthday: DateComponents?
A date component for the Gregorian birthday of the contact.
var note: String
Setting Addresses
Setting Phone Information
Setting Social Profiles
Setting Birthday Information
Setting Notes


## Page 11

A string containing notes for the contact.
var imageData: Data?
The profile picture of a contact.
var contactRelations: [CNLabeledValue<CNContactRelation>]
An array of labeled contact relations for the contact.
var instantMessageAddresses: [CNLabeledValue<CNInstantMessageAddress>]
An array of labeled IM addresses for the contact.
var id: UUID
CNContact
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
Identifiable
NSCoding
NSCopying
NSItemProviderReading
NSItemProviderWriting
NSMutableCopying
NSObjectProtocol
Setting Images
Relating Other Information to the Contact
Instance Properties
Relationships
Inherits From
Conforms To


## Page 12

NSSecureCoding
class CNContact
An immutable object that stores information about a single contact, such as the contact’s fir
name, phone numbers, and addresses.
Data Objects
Access contact-related data, such as the user’s postal address and phone number.
Contact Keys
Specify contact-related properties during fetch operations.
See Also
Contact data


## Page 13

class CNPostalAddress
An immutable representation of the postal address for a contact.
class CNMutablePostalAddress
A mutable representation of the postal address for a contact.
class CNInstantMessageAddress
An immutable object representing an instant message address for the contact.
class CNPhoneNumber
An immutable object representing a phone number for a contact.
class CNGroup
An immutable object that represents a group of contacts.
class CNMutableGroup
A mutable object that represents a group of contacts.
class CNContainer
Topics
Addresses
Phone Numbers
Groups and Containers
Contacts / Data Objects
API Collection
Data Objects
Access contact-related data, such as the user’s postal address and phone numbe


## Page 14

An immutable object that represents a collection of contacts.
class CNSocialProfile
An immutable object that represents one of the user’s social profiles.
class CNContactRelation
An immutable object that represents the relationship between one contact to another.
class CNLabeledValue
An immutable object that combines a contact property value with a label that describes that
property.
class CNContactProperty
An object that represents a property of a contact.
class CNContact
An immutable object that stores information about a single contact, such as the contact’s fir
name, phone numbers, and addresses.
class CNMutableContact
A mutable object that stores information about a single contact, such as the contact’s first
name, phone numbers, and addresses.
Contact Keys
Specify contact-related properties during fetch operations.
Social Profiles
Related Data
Generic Types
See Also
Contact data


## Page 15

let CNContactIdentifierKey: String
The contact’s unique identifier.
let CNContactTypeKey: String
The type of contact.
let CNContactPropertyAttribute: String
The contact’s name component property key.
let CNContactNamePrefixKey: String
The prefix for the contact’s name.
let CNContactGivenNameKey: String
The contact’s given name.
let CNContactMiddleNameKey: String
The contact’s middle name.
let CNContactFamilyNameKey: String
The contact’s family name.
let CNContactPreviousFamilyNameKey: String
Topics
Contact Identification
Name
Contacts / Contact Keys
API Collection
Contact Keys
Specify contact-related properties during fetch operations.


## Page 16

The contact’s previous family name.
let CNContactNameSuffixKey: String
The contact’s name suffix.
let CNContactNicknameKey: String
The contact’s nickname.
let CNContactPhoneticGivenNameKey: String
The phonetic spelling of the contact’s given name.
let CNContactPhoneticMiddleNameKey: String
The phonetic spelling of the contact’s middle name.
let CNContactPhoneticFamilyNameKey: String
The phonetic spelling of the contact’s family name.
let CNContactJobTitleKey: String
The contact’s job title.
let CNContactDepartmentNameKey: String
The contact’s department name.
let CNContactOrganizationNameKey: String
The contact’s organization name.
let CNContactPhoneticOrganizationNameKey: String
The phonetic spelling of the contact’s organization name.
let CNContactPostalAddressesKey: String
The postal addresses of the contact.
let CNContactEmailAddressesKey: String
The email addresses of the contact.
let CNContactUrlAddressesKey: String
The URL addresses of the contact.
Work
Addresses


## Page 17

let CNContactInstantMessageAddressesKey: String
The instant message addresses of the contact.
let CNContactPhoneNumbersKey: String
A phone numbers of a contact.
let CNContactSocialProfilesKey: String
A social profiles of a contact.
let CNContactBirthdayKey: String
The birthday of a contact.
let CNContactNonGregorianBirthdayKey: String
The non-Gregorian birthday of the contact.
let CNContactDatesKey: String
Dates associated with a contact.
let CNContactNoteKey: String
A note associated with a contact.
com.apple.developer.contacts.notes
A Boolean value that indicates whether the app may access the notes in contact entries.
let CNContactImageDataKey: String
Image data for a contact.
let CNContactThumbnailImageDataKey: String
Thumbnail data for a contact.
Phone
Social Profiles
Birthday
Notes
Images


## Page 18

let CNContactImageDataAvailableKey: String
Image data availability for a contact.
let CNContactRelationsKey: String
The relationships of the contact.
let CNGroupNameKey: String
The name of the group.
let CNGroupIdentifierKey: String
The identifier of the group.
let CNContainerNameKey: String
The name of the container.
let CNContainerTypeKey: String
The type of the container.
let CNInstantMessageAddressServiceKey: String
Instant message address service key.
let CNInstantMessageAddressUsernameKey: String
Instant message address username key.
let CNSocialProfileServiceKey: String
The social profile service.
let CNSocialProfileURLStringKey: String
The social profile URL.
let CNSocialProfileUsernameKey: String
The social profile user name.
Relationships
Groups and Containers
Instant Messaging Keys
Social Profile Keys


## Page 19

let CNSocialProfileUserIdentifierKey: String
The social profile user identifier.
protocol CNKeyDescriptor
This protocol is reserved for Contacts framework usage.
class CNContact
An immutable object that stores information about a single contact, such as the contact’s fir
name, phone numbers, and addresses.
class CNMutableContact
A mutable object that stores information about a single contact, such as the contact’s first
name, phone numbers, and addresses.
Data Objects
Access contact-related data, such as the user’s postal address and phone number.
Key Descriptors
See Also
Contact data


