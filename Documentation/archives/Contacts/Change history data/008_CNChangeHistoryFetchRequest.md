# 008_CNChangeHistoryFetchRequest.pdf

## Page 1

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


## Page 2

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


## Page 3

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


