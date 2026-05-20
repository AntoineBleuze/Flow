# 001_ABGroup.pdf

## Page 1

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


## Page 2

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


## Page 3

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


## Page 4

A mutable representation of a property that might have multiple values.
protocol ABImageClient
Methods for responding to a request to load images associated with a contact.
class ABRecord
An abstract class that defines the common properties for all Address Book records.


