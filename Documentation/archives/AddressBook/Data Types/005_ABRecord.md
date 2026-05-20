# 005_ABRecord.pdf

## Page 1

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


## Page 2

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


## Page 3

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


