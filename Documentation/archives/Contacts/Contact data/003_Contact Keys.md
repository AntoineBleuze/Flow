# 003_Contact Keys.pdf

## Page 1

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


## Page 2

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


## Page 3

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


## Page 4

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


## Page 5

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


