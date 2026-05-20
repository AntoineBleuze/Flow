# 003_CNSaveRequest.pdf

## Page 1

Create a new CNSaveRequest object for each save operation you want to make. You can batch
multiple changes into one save request (note that these changes only apply to objects). In the cas
of overlapping changes in multiple or concurrent save requests, the last change wins.
If you try to add an object (that is, a contact or a group) that already exists in the contact store, yo
receive the CNError.Code.insertedRecordAlreadyExists error and the CNErrorUser
InfoAffectedRecordsKey array is updated to contain the object you tried to add. If you try to
update or delete an object that is not present in the contact store, the save request does not
perform the update or deletion, the CNError.Code.recordDoesNotExist error occurs, and
the CNErrorUserInfoAffectedRecordsKey array is updated to contain the object you tried 
update or delete. Do not access objects in the save request while that request is executing.
func add(CNMutableContact, toContainerWithIdentifier: String?)
Adds the specified contact to the contact store.
Overview
Topics
Saving contact changes
Contacts / CNSaveRequest
Class
CNSaveRequest
An object that collects the changes you want to save to the user’s contacts
database.
iOS 9.0+
iPadOS 9.0+
Mac Catalyst 13.1+
macOS 10.11+
visionOS 1.0+


## Page 2

func update(CNMutableContact)
Updates an existing contact in the contact store.
func delete(CNMutableContact)
Deletes a contact from the contact store.
func add(CNMutableGroup, toContainerWithIdentifier: String?)
Adds a group to the contact store.
func update(CNMutableGroup)
Updates an existing group in the contact store.
func delete(CNMutableGroup)
Deletes a group from the contact store.
func addMember(CNContact, to: CNGroup)
Adds a contact as a member of a group.
func removeMember(CNContact, from: CNGroup)
Removes a contact as a member of a group.
func addSubgroup(CNGroup, to: CNGroup)
Add the specified group to a parent group.
func removeSubgroup(CNGroup, from: CNGroup)
Remove a subgroup from the specified parent group.
var shouldRefetchContacts: Bool
A Boolean value that indicates whether to refetch the added and updated contacts after the
save request executes.
var transactionAuthor: String?
A string that identifies the author of the transaction.
Saving group changes
Adding and removing subgroups
Configuring the save request


## Page 3

NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
class CNContactFetchRequest
An object that defines the options to use when fetching contacts.
class CNFetchRequest
The base class for contact fetch requests.
class CNFetchResult
An object that represents the result of a change-history fetch request.
Relationships
Inherits From
Conforms To
See Also
Fetch and save requests


