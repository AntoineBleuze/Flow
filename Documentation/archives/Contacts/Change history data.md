# Change history data.pdf

## Page 1

var contact: CNContact
The contact the user added.
var containerIdentifier: String?
A string that uniquely identifies the container where the user added the contact.
CNChangeHistoryEvent
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Topics
Getting event details
Relationships
Inherits From
Conforms To
Contacts / CNChangeHistoryAddContactEvent
Class
CNChangeHistoryAddContactEvent
An object that represents a user adding a contact.
iOS 13.0+
iPadOS 13.0+
Mac Catalyst 13.1+
macOS 10.15+
visionOS 1.0+
watchOS 6.0+


## Page 2

Equatable
Hashable
NSCoding
NSCopying
NSObjectProtocol
NSSecureCoding
class CNChangeHistoryAddGroupEvent
An object that represents a user adding a group.
class CNChangeHistoryAddMemberToGroupEvent
An object that represents a user adding a contact to a group.
class CNChangeHistoryAddSubgroupToGroupEvent
An object that represents a user adding a subgroup to a group.
class CNChangeHistoryDeleteContactEvent
An object that represents a user deleting a contact.
class CNChangeHistoryDeleteGroupEvent
An object that represents a user deleting a group.
class CNChangeHistoryDropEverythingEvent
An object that indicates the delegate should drop all contacts and groups before handling
change events.
class CNChangeHistoryEvent
An object that represents the user adding, updating, or deleting a contact or group.
class CNChangeHistoryFetchRequest
An object that specifies the criteria for fetching change history.
class CNChangeHistoryRemoveMemberFromGroupEvent
An object that represents a user removing a contact from a group.
class CNChangeHistoryRemoveSubgroupFromGroupEvent
See Also
Change history data


## Page 3

An object that represents a user removing a subgroup from a group.
class CNChangeHistoryUpdateContactEvent
An object that represents a user updating a contact.
class CNChangeHistoryUpdateGroupEvent
An object that represents an updated group event.
protocol CNChangeHistoryEventVisitor
An interface for receiving notice of changes to contacts and groups.


## Page 4

var group: CNGroup
The group the user added.
var containerIdentifier: String
A string that uniquely identifies the container where the user added the group.
CNChangeHistoryEvent
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Topics
Getting event details
Relationships
Inherits From
Conforms To
Contacts / CNChangeHistoryAddGroupEvent
Class
CNChangeHistoryAddGroupEvent
An object that represents a user adding a group.
iOS 13.0+
iPadOS 13.0+
Mac Catalyst 13.1+
macOS 10.15+
visionOS 1.0+
watchOS 6.0+


## Page 5

Equatable
Hashable
NSCoding
NSCopying
NSObjectProtocol
NSSecureCoding
class CNChangeHistoryAddContactEvent
An object that represents a user adding a contact.
class CNChangeHistoryAddMemberToGroupEvent
An object that represents a user adding a contact to a group.
class CNChangeHistoryAddSubgroupToGroupEvent
An object that represents a user adding a subgroup to a group.
class CNChangeHistoryDeleteContactEvent
An object that represents a user deleting a contact.
class CNChangeHistoryDeleteGroupEvent
An object that represents a user deleting a group.
class CNChangeHistoryDropEverythingEvent
An object that indicates the delegate should drop all contacts and groups before handling
change events.
class CNChangeHistoryEvent
An object that represents the user adding, updating, or deleting a contact or group.
class CNChangeHistoryFetchRequest
An object that specifies the criteria for fetching change history.
class CNChangeHistoryRemoveMemberFromGroupEvent
An object that represents a user removing a contact from a group.
class CNChangeHistoryRemoveSubgroupFromGroupEvent
See Also
Change history data


## Page 6

An object that represents a user removing a subgroup from a group.
class CNChangeHistoryUpdateContactEvent
An object that represents a user updating a contact.
class CNChangeHistoryUpdateGroupEvent
An object that represents an updated group event.
protocol CNChangeHistoryEventVisitor
An interface for receiving notice of changes to contacts and groups.


## Page 7

var group: CNGroup
The group where the user added a contact.
var member: CNContact
The contact the user added to the group.
CNChangeHistoryEvent
CVarArg
Topics
Getting event details
Relationships
Inherits From
Conforms To
Contacts / CNChangeHistoryAddMemberToGroupEvent
Class
CNChangeHistoryAddMemberToGroup
Event
An object that represents a user adding a contact to a group.
iOS 13.0+
iPadOS 13.0+
Mac Catalyst 13.1+
macOS 10.15+
visionOS 1.0+
watchOS 6.0+


## Page 8

CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCoding
NSCopying
NSObjectProtocol
NSSecureCoding
class CNChangeHistoryAddContactEvent
An object that represents a user adding a contact.
class CNChangeHistoryAddGroupEvent
An object that represents a user adding a group.
class CNChangeHistoryAddSubgroupToGroupEvent
An object that represents a user adding a subgroup to a group.
class CNChangeHistoryDeleteContactEvent
An object that represents a user deleting a contact.
class CNChangeHistoryDeleteGroupEvent
An object that represents a user deleting a group.
class CNChangeHistoryDropEverythingEvent
An object that indicates the delegate should drop all contacts and groups before handling
change events.
class CNChangeHistoryEvent
An object that represents the user adding, updating, or deleting a contact or group.
class CNChangeHistoryFetchRequest
An object that specifies the criteria for fetching change history.
class CNChangeHistoryRemoveMemberFromGroupEvent
An object that represents a user removing a contact from a group.
See Also
Change history data


## Page 9

class CNChangeHistoryRemoveSubgroupFromGroupEvent
An object that represents a user removing a subgroup from a group.
class CNChangeHistoryUpdateContactEvent
An object that represents a user updating a contact.
class CNChangeHistoryUpdateGroupEvent
An object that represents an updated group event.
protocol CNChangeHistoryEventVisitor
An interface for receiving notice of changes to contacts and groups.


## Page 10

var group: CNGroup
The group where the user added a subgroup.
var subgroup: CNGroup
The subgroup that the user added to the group.
CNChangeHistoryEvent
CVarArg
Topics
Getting event details
Relationships
Inherits From
Conforms To
Contacts / CNChangeHistoryAddSubgroupToGroupEvent
Class
CNChangeHistoryAddSubgroupToGroup
Event
An object that represents a user adding a subgroup to a group.
iOS 13.0+
iPadOS 13.0+
Mac Catalyst 13.1+
macOS 10.15+
visionOS 1.0+
watchOS 6.0+


## Page 11

CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCoding
NSCopying
NSObjectProtocol
NSSecureCoding
class CNChangeHistoryAddContactEvent
An object that represents a user adding a contact.
class CNChangeHistoryAddGroupEvent
An object that represents a user adding a group.
class CNChangeHistoryAddMemberToGroupEvent
An object that represents a user adding a contact to a group.
class CNChangeHistoryDeleteContactEvent
An object that represents a user deleting a contact.
class CNChangeHistoryDeleteGroupEvent
An object that represents a user deleting a group.
class CNChangeHistoryDropEverythingEvent
An object that indicates the delegate should drop all contacts and groups before handling
change events.
class CNChangeHistoryEvent
An object that represents the user adding, updating, or deleting a contact or group.
class CNChangeHistoryFetchRequest
An object that specifies the criteria for fetching change history.
class CNChangeHistoryRemoveMemberFromGroupEvent
An object that represents a user removing a contact from a group.
See Also
Change history data


## Page 12

class CNChangeHistoryRemoveSubgroupFromGroupEvent
An object that represents a user removing a subgroup from a group.
class CNChangeHistoryUpdateContactEvent
An object that represents a user updating a contact.
class CNChangeHistoryUpdateGroupEvent
An object that represents an updated group event.
protocol CNChangeHistoryEventVisitor
An interface for receiving notice of changes to contacts and groups.


## Page 13

var contactIdentifier: String
A string that uniquely identifies the contact that the user deleted.
CNChangeHistoryEvent
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCoding
Topics
Getting event details
Relationships
Inherits From
Conforms To
Contacts / CNChangeHistoryDeleteContactEvent
Class
CNChangeHistoryDeleteContactEvent
An object that represents a user deleting a contact.
iOS 13.0+
iPadOS 13.0+
Mac Catalyst 13.1+
macOS 10.15+
visionOS 1.0+
watchOS 6.0+


## Page 14

NSCopying
NSObjectProtocol
NSSecureCoding
class CNChangeHistoryAddContactEvent
An object that represents a user adding a contact.
class CNChangeHistoryAddGroupEvent
An object that represents a user adding a group.
class CNChangeHistoryAddMemberToGroupEvent
An object that represents a user adding a contact to a group.
class CNChangeHistoryAddSubgroupToGroupEvent
An object that represents a user adding a subgroup to a group.
class CNChangeHistoryDeleteGroupEvent
An object that represents a user deleting a group.
class CNChangeHistoryDropEverythingEvent
An object that indicates the delegate should drop all contacts and groups before handling
change events.
class CNChangeHistoryEvent
An object that represents the user adding, updating, or deleting a contact or group.
class CNChangeHistoryFetchRequest
An object that specifies the criteria for fetching change history.
class CNChangeHistoryRemoveMemberFromGroupEvent
An object that represents a user removing a contact from a group.
class CNChangeHistoryRemoveSubgroupFromGroupEvent
An object that represents a user removing a subgroup from a group.
class CNChangeHistoryUpdateContactEvent
See Also
Change history data


## Page 15

An object that represents a user updating a contact.
class CNChangeHistoryUpdateGroupEvent
An object that represents an updated group event.
protocol CNChangeHistoryEventVisitor
An interface for receiving notice of changes to contacts and groups.


## Page 16

var groupIdentifier: String
A string that uniquely identifies the group that the user deleted.
CNChangeHistoryEvent
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCoding
Topics
Getting event details
Relationships
Inherits From
Conforms To
Contacts / CNChangeHistoryDeleteGroupEvent
Class
CNChangeHistoryDeleteGroupEvent
An object that represents a user deleting a group.
iOS 13.0+
iPadOS 13.0+
Mac Catalyst 13.1+
macOS 10.15+
visionOS 1.0+
watchOS 6.0+


## Page 17

NSCopying
NSObjectProtocol
NSSecureCoding
class CNChangeHistoryAddContactEvent
An object that represents a user adding a contact.
class CNChangeHistoryAddGroupEvent
An object that represents a user adding a group.
class CNChangeHistoryAddMemberToGroupEvent
An object that represents a user adding a contact to a group.
class CNChangeHistoryAddSubgroupToGroupEvent
An object that represents a user adding a subgroup to a group.
class CNChangeHistoryDeleteContactEvent
An object that represents a user deleting a contact.
class CNChangeHistoryDropEverythingEvent
An object that indicates the delegate should drop all contacts and groups before handling
change events.
class CNChangeHistoryEvent
An object that represents the user adding, updating, or deleting a contact or group.
class CNChangeHistoryFetchRequest
An object that specifies the criteria for fetching change history.
class CNChangeHistoryRemoveMemberFromGroupEvent
An object that represents a user removing a contact from a group.
class CNChangeHistoryRemoveSubgroupFromGroupEvent
An object that represents a user removing a subgroup from a group.
class CNChangeHistoryUpdateContactEvent
See Also
Change history data


## Page 18

An object that represents a user updating a contact.
class CNChangeHistoryUpdateGroupEvent
An object that represents an updated group event.
protocol CNChangeHistoryEventVisitor
An interface for receiving notice of changes to contacts and groups.


## Page 19

The system sends this event to your delegate when the system determines that enough has
changed since the last time your app fetched the history changes that an incremental update is n
longer possible. Following the drop-everything event, your app receives an add event for each
contact and group currently in the database. This allows you to implement full syncs and
incremental syncs using the same code.
CNChangeHistoryEvent
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
Overview
Relationships
Inherits From
Conforms To
Contacts / CNChangeHistoryDropEverythingEvent
Class
CNChangeHistoryDropEverythingEvent
An object that indicates the delegate should drop all contacts and groups before
handling change events.
iOS 13.0+
iPadOS 13.0+
Mac Catalyst 13.1+
macOS 10.15+
visionOS 1.0+
watchOS 6.0+


## Page 20

NSCoding
NSCopying
NSObjectProtocol
NSSecureCoding
class CNChangeHistoryAddContactEvent
An object that represents a user adding a contact.
class CNChangeHistoryAddGroupEvent
An object that represents a user adding a group.
class CNChangeHistoryAddMemberToGroupEvent
An object that represents a user adding a contact to a group.
class CNChangeHistoryAddSubgroupToGroupEvent
An object that represents a user adding a subgroup to a group.
class CNChangeHistoryDeleteContactEvent
An object that represents a user deleting a contact.
class CNChangeHistoryDeleteGroupEvent
An object that represents a user deleting a group.
class CNChangeHistoryEvent
An object that represents the user adding, updating, or deleting a contact or group.
class CNChangeHistoryFetchRequest
An object that specifies the criteria for fetching change history.
class CNChangeHistoryRemoveMemberFromGroupEvent
An object that represents a user removing a contact from a group.
class CNChangeHistoryRemoveSubgroupFromGroupEvent
An object that represents a user removing a subgroup from a group.
class CNChangeHistoryUpdateContactEvent
See Also
Change history data


## Page 21

An object that represents a user updating a contact.
class CNChangeHistoryUpdateGroupEvent
An object that represents an updated group event.
protocol CNChangeHistoryEventVisitor
An interface for receiving notice of changes to contacts and groups.


## Page 22

func accept(any CNChangeHistoryEventVisitor)
Forwards the event to the delegate you provide to process the change-history event.
NSObject
CNChangeHistoryAddContactEvent
CNChangeHistoryAddGroupEvent
CNChangeHistoryAddMemberToGroupEvent
CNChangeHistoryAddSubgroupToGroupEvent
CNChangeHistoryDeleteContactEvent
CNChangeHistoryDeleteGroupEvent
Topics
Processing an event
Relationships
Inherits From
Inherited By
Contacts / CNChangeHistoryEvent
Class
CNChangeHistoryEvent
An object that represents the user adding, updating, or deleting a contact or grou
iOS 13.0+
iPadOS 13.0+
Mac Catalyst 13.1+
macOS 10.15+
visionOS 1.0+
watchOS 6.0+


## Page 23

CNChangeHistoryDropEverythingEvent
CNChangeHistoryRemoveMemberFromGroupEvent
CNChangeHistoryRemoveSubgroupFromGroupEvent
CNChangeHistoryUpdateContactEvent
CNChangeHistoryUpdateGroupEvent
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCoding
NSCopying
NSObjectProtocol
NSSecureCoding
class CNChangeHistoryAddContactEvent
An object that represents a user adding a contact.
class CNChangeHistoryAddGroupEvent
An object that represents a user adding a group.
class CNChangeHistoryAddMemberToGroupEvent
An object that represents a user adding a contact to a group.
class CNChangeHistoryAddSubgroupToGroupEvent
An object that represents a user adding a subgroup to a group.
class CNChangeHistoryDeleteContactEvent
An object that represents a user deleting a contact.
class CNChangeHistoryDeleteGroupEvent
An object that represents a user deleting a group.
Conforms To
See Also
Change history data


## Page 24

class CNChangeHistoryDropEverythingEvent
An object that indicates the delegate should drop all contacts and groups before handling
change events.
class CNChangeHistoryFetchRequest
An object that specifies the criteria for fetching change history.
class CNChangeHistoryRemoveMemberFromGroupEvent
An object that represents a user removing a contact from a group.
class CNChangeHistoryRemoveSubgroupFromGroupEvent
An object that represents a user removing a subgroup from a group.
class CNChangeHistoryUpdateContactEvent
An object that represents a user updating a contact.
class CNChangeHistoryUpdateGroupEvent
An object that represents an updated group event.
protocol CNChangeHistoryEventVisitor
An interface for receiving notice of changes to contacts and groups.


## Page 25

The system always returns changes to contacts. The system coalesces changes to remove
redundant adds, updates, and deletes.
Create and configure a fetch request, then call enumeratorForChangeHistoryFetch
Request:error: to process changes.
var additionalContactKeyDescriptors: [any CNKeyDescriptor]?
An array of contact property keys or key descriptors from contact objects to fetch in the
returned contacts.
var excludedTransactionAuthors: [String]?
An array of strings that identify transaction authors to exclude from the fetch results.
var includeGroupChanges: Bool
A Boolean value that indicates whether the fetch should also return group changes.
Overview
Topics
Configuring the fetch request
Contacts / CNChangeHistoryFetchRequest
Class
CNChangeHistoryFetchRequest
An object that specifies the criteria for fetching change history.
iOS 13.0+
iPadOS 13.0+
Mac Catalyst 13.1+
macOS 10.15+
visionOS 1.0+
watchOS 6.0+


## Page 26

var mutableObjects: Bool
A Boolean value that indicates whether the fetch should return mutable contacts and groups
var shouldUnifyResults: Bool
A Boolean value that indicates whether the fetch should return contact changes as unified
contacts.
var startingToken: Data?
An opaque token that indicates a point in history in the user’s Contacts database.
CNFetchRequest
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCoding
NSObjectProtocol
NSSecureCoding
class CNChangeHistoryAddContactEvent
An object that represents a user adding a contact.
class CNChangeHistoryAddGroupEvent
An object that represents a user adding a group.
Relationships
Inherits From
Conforms To
See Also
Change history data


## Page 27

class CNChangeHistoryAddMemberToGroupEvent
An object that represents a user adding a contact to a group.
class CNChangeHistoryAddSubgroupToGroupEvent
An object that represents a user adding a subgroup to a group.
class CNChangeHistoryDeleteContactEvent
An object that represents a user deleting a contact.
class CNChangeHistoryDeleteGroupEvent
An object that represents a user deleting a group.
class CNChangeHistoryDropEverythingEvent
An object that indicates the delegate should drop all contacts and groups before handling
change events.
class CNChangeHistoryEvent
An object that represents the user adding, updating, or deleting a contact or group.
class CNChangeHistoryRemoveMemberFromGroupEvent
An object that represents a user removing a contact from a group.
class CNChangeHistoryRemoveSubgroupFromGroupEvent
An object that represents a user removing a subgroup from a group.
class CNChangeHistoryUpdateContactEvent
An object that represents a user updating a contact.
class CNChangeHistoryUpdateGroupEvent
An object that represents an updated group event.
protocol CNChangeHistoryEventVisitor
An interface for receiving notice of changes to contacts and groups.


## Page 28

var group: CNGroup
The group where the user removed a contact.
var member: CNContact
The contact that the user removed from the group.
CNChangeHistoryEvent
CVarArg
Topics
Getting event details
Relationships
Inherits From
Conforms To
Contacts / CNChangeHistoryRemoveMemberFromGroupEvent
Class
CNChangeHistoryRemoveMemberFrom
GroupEvent
An object that represents a user removing a contact from a group.
iOS 13.0+
iPadOS 13.0+
Mac Catalyst 13.1+
macOS 10.15+
visionOS 1.0+
watchOS 6.0+


## Page 29

CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCoding
NSCopying
NSObjectProtocol
NSSecureCoding
class CNChangeHistoryAddContactEvent
An object that represents a user adding a contact.
class CNChangeHistoryAddGroupEvent
An object that represents a user adding a group.
class CNChangeHistoryAddMemberToGroupEvent
An object that represents a user adding a contact to a group.
class CNChangeHistoryAddSubgroupToGroupEvent
An object that represents a user adding a subgroup to a group.
class CNChangeHistoryDeleteContactEvent
An object that represents a user deleting a contact.
class CNChangeHistoryDeleteGroupEvent
An object that represents a user deleting a group.
class CNChangeHistoryDropEverythingEvent
An object that indicates the delegate should drop all contacts and groups before handling
change events.
class CNChangeHistoryEvent
An object that represents the user adding, updating, or deleting a contact or group.
class CNChangeHistoryFetchRequest
An object that specifies the criteria for fetching change history.
See Also
Change history data


## Page 30

class CNChangeHistoryRemoveSubgroupFromGroupEvent
An object that represents a user removing a subgroup from a group.
class CNChangeHistoryUpdateContactEvent
An object that represents a user updating a contact.
class CNChangeHistoryUpdateGroupEvent
An object that represents an updated group event.
protocol CNChangeHistoryEventVisitor
An interface for receiving notice of changes to contacts and groups.


## Page 31

var group: CNGroup
The group where the user removed a subgroup.
var subgroup: CNGroup
The subgroup that the user removed from the group.
CNChangeHistoryEvent
CVarArg
Topics
Getting event details
Relationships
Inherits From
Conforms To
Contacts / CNChangeHistoryRemoveSubgroupFromGroupEvent
Class
CNChangeHistoryRemoveSubgroupFrom
GroupEvent
An object that represents a user removing a subgroup from a group.
iOS 13.0+
iPadOS 13.0+
Mac Catalyst 13.1+
macOS 10.15+
visionOS 1.0+
watchOS 6.0+


## Page 32

CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCoding
NSCopying
NSObjectProtocol
NSSecureCoding
class CNChangeHistoryAddContactEvent
An object that represents a user adding a contact.
class CNChangeHistoryAddGroupEvent
An object that represents a user adding a group.
class CNChangeHistoryAddMemberToGroupEvent
An object that represents a user adding a contact to a group.
class CNChangeHistoryAddSubgroupToGroupEvent
An object that represents a user adding a subgroup to a group.
class CNChangeHistoryDeleteContactEvent
An object that represents a user deleting a contact.
class CNChangeHistoryDeleteGroupEvent
An object that represents a user deleting a group.
class CNChangeHistoryDropEverythingEvent
An object that indicates the delegate should drop all contacts and groups before handling
change events.
class CNChangeHistoryEvent
An object that represents the user adding, updating, or deleting a contact or group.
class CNChangeHistoryFetchRequest
An object that specifies the criteria for fetching change history.
See Also
Change history data


## Page 33

class CNChangeHistoryRemoveMemberFromGroupEvent
An object that represents a user removing a contact from a group.
class CNChangeHistoryUpdateContactEvent
An object that represents a user updating a contact.
class CNChangeHistoryUpdateGroupEvent
An object that represents an updated group event.
protocol CNChangeHistoryEventVisitor
An interface for receiving notice of changes to contacts and groups.


## Page 34

var contact: CNContact
The contact that the user updated.
CNChangeHistoryEvent
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCoding
Topics
Getting event details
Relationships
Inherits From
Conforms To
Contacts / CNChangeHistoryUpdateContactEvent
Class
CNChangeHistoryUpdateContactEvent
An object that represents a user updating a contact.
iOS 13.0+
iPadOS 13.0+
Mac Catalyst 13.1+
macOS 10.15+
visionOS 1.0+
watchOS 6.0+


## Page 35

NSCopying
NSObjectProtocol
NSSecureCoding
class CNChangeHistoryAddContactEvent
An object that represents a user adding a contact.
class CNChangeHistoryAddGroupEvent
An object that represents a user adding a group.
class CNChangeHistoryAddMemberToGroupEvent
An object that represents a user adding a contact to a group.
class CNChangeHistoryAddSubgroupToGroupEvent
An object that represents a user adding a subgroup to a group.
class CNChangeHistoryDeleteContactEvent
An object that represents a user deleting a contact.
class CNChangeHistoryDeleteGroupEvent
An object that represents a user deleting a group.
class CNChangeHistoryDropEverythingEvent
An object that indicates the delegate should drop all contacts and groups before handling
change events.
class CNChangeHistoryEvent
An object that represents the user adding, updating, or deleting a contact or group.
class CNChangeHistoryFetchRequest
An object that specifies the criteria for fetching change history.
class CNChangeHistoryRemoveMemberFromGroupEvent
An object that represents a user removing a contact from a group.
class CNChangeHistoryRemoveSubgroupFromGroupEvent
See Also
Change history data


## Page 36

An object that represents a user removing a subgroup from a group.
class CNChangeHistoryUpdateGroupEvent
An object that represents an updated group event.
protocol CNChangeHistoryEventVisitor
An interface for receiving notice of changes to contacts and groups.


## Page 37

var group: CNGroup
The group that the user updated.
CNChangeHistoryEvent
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCoding
Topics
Getting event details
Relationships
Inherits From
Conforms To
Contacts / CNChangeHistoryUpdateGroupEvent
Class
CNChangeHistoryUpdateGroupEvent
An object that represents an updated group event.
iOS 13.0+
iPadOS 13.0+
Mac Catalyst 13.1+
macOS 10.15+
visionOS 1.0+
watchOS 6.0+


## Page 38

NSCopying
NSObjectProtocol
NSSecureCoding
class CNChangeHistoryAddContactEvent
An object that represents a user adding a contact.
class CNChangeHistoryAddGroupEvent
An object that represents a user adding a group.
class CNChangeHistoryAddMemberToGroupEvent
An object that represents a user adding a contact to a group.
class CNChangeHistoryAddSubgroupToGroupEvent
An object that represents a user adding a subgroup to a group.
class CNChangeHistoryDeleteContactEvent
An object that represents a user deleting a contact.
class CNChangeHistoryDeleteGroupEvent
An object that represents a user deleting a group.
class CNChangeHistoryDropEverythingEvent
An object that indicates the delegate should drop all contacts and groups before handling
change events.
class CNChangeHistoryEvent
An object that represents the user adding, updating, or deleting a contact or group.
class CNChangeHistoryFetchRequest
An object that specifies the criteria for fetching change history.
class CNChangeHistoryRemoveMemberFromGroupEvent
An object that represents a user removing a contact from a group.
class CNChangeHistoryRemoveSubgroupFromGroupEvent
See Also
Change history data


## Page 39

An object that represents a user removing a subgroup from a group.
class CNChangeHistoryUpdateContactEvent
An object that represents a user updating a contact.
protocol CNChangeHistoryEventVisitor
An interface for receiving notice of changes to contacts and groups.


## Page 40

Implement this protocol to receive events that describe when a user adds, updates, or deletes
contacts or groups outside your app.
func visit(CNChangeHistoryAddContactEvent)
Tells the delegate that the user added a contact.
Required
func visit(CNChangeHistoryUpdateContactEvent)
Tells the delegate that the user updated a contact.
Required
func visit(CNChangeHistoryDeleteContactEvent)
Tells the delegate that the user deleted a contact.
Required
Overview
Topics
Updating contacts
Contacts / CNChangeHistoryEventVisitor
Protocol
CNChangeHistoryEventVisitor
An interface for receiving notice of changes to contacts and groups.
iOS 13.0+
iPadOS 13.0+
Mac Catalyst 13.1+
macOS 10.15+
visionOS 1.0+
watchOS 6.0+


## Page 41

func visit(CNChangeHistoryAddGroupEvent)
Tells the delegate that the user added a group.
func visit(CNChangeHistoryUpdateGroupEvent)
Tells the delegate that the user updated a group.
func visit(CNChangeHistoryDeleteGroupEvent)
Tells the delegate that the user deleted a group.
func visitAddSubgroup(CNChangeHistoryAddSubgroupToGroupEvent)
Tells the delegate that the user added a subgroup to a group.
func visitRemoveSubgroup(CNChangeHistoryRemoveSubgroupFromGroupEvent)
Tells the delegate that the user removed a subgroup from a group.
func visitAddMember(CNChangeHistoryAddMemberToGroupEvent)
Tells the delegate that the user added a contact to a group.
func visitRemoveMember(CNChangeHistoryRemoveMemberFromGroupEvent)
Tells the delegate that the user removed a contact from a group.
func visit(CNChangeHistoryDropEverythingEvent)
Tells the delegate to drop all contacts and groups before handling more events.
Required
Updating groups
Updating subgroups
Updating contacts in groups
Resetting synced data
Relationships
Inherits From


## Page 42

NSObjectProtocol
class CNChangeHistoryAddContactEvent
An object that represents a user adding a contact.
class CNChangeHistoryAddGroupEvent
An object that represents a user adding a group.
class CNChangeHistoryAddMemberToGroupEvent
An object that represents a user adding a contact to a group.
class CNChangeHistoryAddSubgroupToGroupEvent
An object that represents a user adding a subgroup to a group.
class CNChangeHistoryDeleteContactEvent
An object that represents a user deleting a contact.
class CNChangeHistoryDeleteGroupEvent
An object that represents a user deleting a group.
class CNChangeHistoryDropEverythingEvent
An object that indicates the delegate should drop all contacts and groups before handling
change events.
class CNChangeHistoryEvent
An object that represents the user adding, updating, or deleting a contact or group.
class CNChangeHistoryFetchRequest
An object that specifies the criteria for fetching change history.
class CNChangeHistoryRemoveMemberFromGroupEvent
An object that represents a user removing a contact from a group.
class CNChangeHistoryRemoveSubgroupFromGroupEvent
An object that represents a user removing a subgroup from a group.
See Also
Change history data


## Page 43

class CNChangeHistoryUpdateContactEvent
An object that represents a user updating a contact.
class CNChangeHistoryUpdateGroupEvent
An object that represents an updated group event.


