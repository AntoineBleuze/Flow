# Data Types.pdf

## Page 1

An ABPerson object corresponds to a single person record in the database. A person object
contains the person’s name, company, address, email addresses, and phone numbers.
The ABPerson class is “toll-free bridged” with its procedural C opaque-type counterpart. This
means that the ABPersonRef type is interchangeable in function or method calls with instances 
the ABPerson class.
class func addPropertiesAndTypes([AnyHashable : Any]!) -> Int
Adds the given properties to all the records of this type in the Address Book database.
class func removeProperties([Any]!) -> Int
Removes the given properties from all the records of this type in the Address Book database
class func properties() -> [Any]!
Overview
Topics
Managing Properties
Address Book / ABPerson
Class
ABPerson
An object that encapsulates all information about a person in the Address Book
database.
macOS


## Page 2

Returns an array of the names of all the properties for the record in the Address Book
database.
class func type(ofProperty: String!) -> ABPropertyType
Returns the type of a given property.
func linkedPeople() -> [Any]!
Returns the array of all person records that are linked to the person this record represents.
func parentGroups() -> [Any]!
Returns an array of the address book groups that this person belongs to.
class func cancelLoadingImageData(forTag: Int)
Cancels an asynchronous fetch of the images for a given tag.
func beginLoadingImageData(for: (any ABImageClient)!) -> Int
Starts an asynchronous fetch for image data in all locations
func imageData() -> Data!
Returns data that contains a picture of this person.
func setImageData(Data!) -> Bool
Sets the image for this person to the given data.
class func searchElement(forProperty: String!, label: String!, key:
String!, value: Any!, comparison: ABSearchComparison) -> ABSearchElemen
!
Returns a search element object that specifies a query for records of this type.
init!(VCardRepresentation: Data!)
Managing Linked People
Managing Groups
Managing Images
Searching
Importing and Exporting vCard Formatted Files


## Page 3

Returns an ABPerson instance initialized with the given data.
func vCardRepresentation() -> Data!
Returns the vCard representation of the person record as a data object in vCard format.
Person Flags
Settings that determine how person records are displayed.
ABRecord
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
class ABGroup
An object that represents a group of records in the Address Book database.
class ABMultiValue
An immutable representation of a property that might have multiple values.
class ABMutableMultiValue
Constants
Relationships
Inherits From
Conforms To
See Also
Data Types


## Page 4

A mutable representation of a property that might have multiple values.
protocol ABImageClient
Methods for responding to a request to load images associated with a contact.
class ABRecord
An abstract class that defines the common properties for all Address Book records.


## Page 5

The ABGroup class supports the concept of a “group” containing one or more persons. People
may belong to multiple groups, and groups may also belong to other groups unless the relationsh
causes a circular reference. The only predefined property of a group is its name. However, similar
to person records, you can add your own properties to group records. Groups not only help to
organize person records, but also allow you to create email distribution lists.
The ABGroup class is “toll-free bridged” with its procedural C opaque-type counterpart. This
means that the ABGroupRef type is interchangeable in function or method calls with instances o
the ABGroup class.
class func addPropertiesAndTypes([AnyHashable : Any]!) -> Int
Adds the given properties to all records of this type in the Address Book database.
class func removeProperties([Any]!) -> Int
Removes the given properties from all the records of this type in the Address Book database
Overview
Topics
Managing properties
Address Book / ABGroup
Class
ABGroup
An object that represents a group of records in the Address Book database.
macOS


## Page 6

class func properties() -> [Any]!
Returns an array of the names of all the properties for this record type in the Address Book
database.
class func type(ofProperty: String!) -> ABPropertyType
Returns the type for a given property.
func addMember(ABPerson!) -> Bool
Adds a person to a group.
func removeMember(ABPerson!) -> Bool
Removes a person from a group.
func members() -> [Any]!
Returns an array of persons in a group.
func addSubgroup(ABGroup!) -> Bool
Adds a subgroup to another group.
func removeSubgroup(ABGroup!) -> Bool
Removes a subgroup from a group.
func parentGroups() -> [Any]!
Returns an array containing a group’s parents—that is, the groups that a group belongs to.
func subgroups() -> [Any]!
Returns an array containing a group’s subgroups.
func distributionIdentifier(forProperty: String!, person: ABPerson!) ->
String!
Returns the distribution identifier for the given property and person.
func setDistributionIdentifier(String!, forProperty: String!, person:
ABPerson!) -> Bool
Managing persons
Managing subgroups
Managing Distribution Lists


## Page 7

Assigns a specific distribution identifier for a person’s multivalue list property so that the
group can be used as a distribution list.
class func searchElement(forProperty: String!, label: String!, key:
String!, value: Any!, comparison: ABSearchComparison) -> ABSearchElemen
!
Returns a search element object that searches for records of this type.
ABRecord
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
class ABPerson
An object that encapsulates all information about a person in the Address Book database.
class ABMultiValue
An immutable representation of a property that might have multiple values.
class ABMutableMultiValue
Searching
Relationships
Inherits From
Conforms To
See Also
Data Types


## Page 8

A mutable representation of a property that might have multiple values.
protocol ABImageClient
Methods for responding to a request to load images associated with a contact.
class ABRecord
An abstract class that defines the common properties for all Address Book records.


## Page 9

Each value in a multivalue list must be of the same type, and must have an associated predefined
or user-defined label, and unique identifier. The labels, however, need not be unique. For example
you can have multiple Home phone numbers. Each multivalue object may have a primary identifie
—used as a default value when a label is not provided. For example, a person record may have
multiple addresses with the labels Home and Work, where Work is designated as the primary valu
Instances of this class are immutable, see ABMutableMultiValue for methods that manipulate
the content of a multivalue list.
The ABMultiValue class is “toll-free bridged” with its procedural C opaque-type counterpart.
This means that the ABMultiValue type is interchangeable in function or method calls with
instances of the ABMultiValue class.
func primaryIdentifier() -> String!
Returns the identifier for the primary value.
Overview
Topics
Accessing the primary identifier
Accessing identifiers
Address Book / ABMultiValue
Class
ABMultiValue
An immutable representation of a property that might have multiple values.
macOS


## Page 10

func identifier(at: Int) -> String!
Returns the identifier for the given index.
func index(forIdentifier: String!) -> Int
Returns the index for the given identifier.
func label(at: Int) -> String!
Returns the label for the given index.
func value(at: Int) -> Any!
Returns the value for the given index.
func value(forIdentifier: String!) -> Any!
Returns the value for the given identifier.
func label(forIdentifier: String!) -> Any!
Returns the label for the given identifier.
func count() -> Int
Returns the number of entries in a multivalue list.
func propertyType() -> ABPropertyType
Returns the type for the values in a multivalue list.
NSObject
ABMutableMultiValue
Accessing entries
Querying the list
Relationships
Inherits From
Inherited By


## Page 11

CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCopying
NSFastEnumeration
NSMutableCopying
NSObjectProtocol
class ABPerson
An object that encapsulates all information about a person in the Address Book database.
class ABGroup
An object that represents a group of records in the Address Book database.
class ABMutableMultiValue
A mutable representation of a property that might have multiple values.
protocol ABImageClient
Methods for responding to a request to load images associated with a contact.
class ABRecord
An abstract class that defines the common properties for all Address Book records.
Conforms To
See Also
Data Types


## Page 12

Each value in a multivalue list must be of the same type, and must have an associated predefined
or user-defined label, and unique identifier. The labels, however, need not be unique. For example
you can have multiple Home phone numbers. Each multivalue object may have a primary identifie
—used as a default value when a label is not provided. For example, a person record may have
multiple addresses with the labels Home and Work, where Work is designated as the primary valu
Instances of ABMutableMultiValue are mutable, see ABMultiValue for additional methods
that access the content of a multivalue list.
The ABMutableMultiValue class is “toll-free bridged” with its procedural C opaque-type
counterpart. This means that the ABMutableMultiValue type is interchangeable in function or
method calls with instances of the ABMutableMultiValue class.
func add(Any!, withLabel: String!) -> String!
Adds a value and its label to a multivalue list.
func insert(Any!, withLabel: String!, at: Int) -> String!
Overview
Topics
Adding a value
Address Book / ABMutableMultiValue
Class
ABMutableMultiValue
A mutable representation of a property that might have multiple values.
macOS


## Page 13

Inserts a value and its label at the given index in a multivalue list.
func replaceLabel(at: Int, withLabel: String!) -> Bool
Replaces the label at the given index.
func replace(at: Int, withValue: Any!) -> Bool
Replaces the value at the given index.
func removeAndLabel(at: Int) -> Bool
Removes the value and label at the given index.
func setPrimaryIdentifier(String!) -> Bool
Sets the primary value to be the value for the given identifier.
ABMultiValue
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCopying
NSFastEnumeration
NSMutableCopying
NSObjectProtocol
Replacing values and labels
Removing values
Setting the Primary identifier
Relationships
Inherits From
Conforms To


## Page 14

class ABPerson
An object that encapsulates all information about a person in the Address Book database.
class ABGroup
An object that represents a group of records in the Address Book database.
class ABMultiValue
An immutable representation of a property that might have multiple values.
protocol ABImageClient
Methods for responding to a request to load images associated with a contact.
class ABRecord
An abstract class that defines the common properties for all Address Book records.
See Also
Data Types


## Page 15

func consumeImageData(Data!, forTag: Int)
Gets the image data for the given tag that was initiated by an asynchronous fetch.
Required
NSObjectProtocol
Topics
Loading an image
Relationships
Inherits From
See Also
Data Types
Address Book / ABImageClient
Protocol
ABImageClient
Methods for responding to a request to load images associated with a contact.
macOS


## Page 16

class ABPerson
An object that encapsulates all information about a person in the Address Book database.
class ABGroup
An object that represents a group of records in the Address Book database.
class ABMultiValue
An immutable representation of a property that might have multiple values.
class ABMutableMultiValue
A mutable representation of a property that might have multiple values.
class ABRecord
An abstract class that defines the common properties for all Address Book records.


## Page 17

ABRecord is an abstract superclass providing a common interface to, and defining common
properties for, all Address Book records. A property is a field in the database record, such as the
first or last name of a person record. ABRecord defines the types of properties supported, and
basic methods for getting, setting, and removing property values.
The ABRecord class is “toll-free bridged” with its procedural C opaque-type counterpart. This
means that the ABRecordRef type is interchangeable in function or method calls with instances 
the ABRecord class.
init!(addressBook: ABAddressBook!)
Initializes a record using the given address book.
init!()
Initializes a record using the shared address book.
Overview
Topics
Creating a Record
Address Book / ABRecord
Class
ABRecord
An abstract class that defines the common properties for all Address Book
records.
macOS


## Page 18

func removeValue(forProperty: String!) -> Bool
Removes the value for a given property.
func setValue(Any!, forProperty: String!) -> Bool
Sets the value of a given property for a record.
func setValue(Any!, forProperty: String!, error: ()) throws
Sets the value of a given property for a record, returning error information.
func value(forProperty: String!) -> Any!
Returns the value of a given property for a record.
func isReadOnly() -> Bool
Returns whether a record is read-only.
var displayName: String!
A user-visible string representing the record.
var uniqueId: String!
Returns the unique ID for a record.
NSObject
ABGroup, ABPerson
Retrieving and Setting Values
Retrieving a Specific Record
Getting Identifying Information
Relationships
Inherits From
Inherited By


## Page 19

CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
class ABPerson
An object that encapsulates all information about a person in the Address Book database.
class ABGroup
An object that represents a group of records in the Address Book database.
class ABMultiValue
An immutable representation of a property that might have multiple values.
class ABMutableMultiValue
A mutable representation of a property that might have multiple values.
protocol ABImageClient
Methods for responding to a request to load images associated with a contact.
Conforms To
See Also
Data Types


