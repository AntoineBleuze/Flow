# 002_CNContactStore.pdf

## Page 1

Accessing the contact store
The CNContactStore object represents the user’s contacts store database, and you use it to
fetch information from that database and save changes back to it. There are a few recommended
ways you can implement fetch and save requests in your app:
Fetch only the properties that you need for contacts.
When fetching all contacts and caching the results, first fetch all contacts identifiers, then fetc
batches of detailed contacts by identifiers as required.
To aggregate several contacts fetches, first collect a set of unique identifiers from the fetches.
Then fetch batches of detailed contacts by those unique identifiers.
If you cache the fetched contacts, groups, or containers, you need to refetch these objects (an
release the old cached objects) when CNContactStoreDidChange is posted.
Because CNContactStore fetch methods perform I/O, it’s recommended that you avoid using t
main thread to execute fetches.
Mentioned in
Overview
Contacts / CNContactStore
Class
CNContactStore
The object that fetches and saves contacts, groups, and containers from the user
Contacts database.
iOS 9.0+
iPadOS 9.0+
Mac Catalyst 13.1+
macOS 10.11+
visionOS 1.0+
watchOS 2.0+


## Page 2

func requestAccess(for: CNEntityType, completionHandler: (Bool, (any
Error)?) -> Void)
Requests access to the user’s contacts.
class func authorizationStatus(for: CNEntityType) -> CNAuthorization
Status
Returns the current authorization status to access the contact data.
enum CNAuthorizationStatus
An authorization status the user can grant for an app to access the specified entity type.
enum CNEntityType
The entities the user can grant access to.
func enumerateContacts(with: CNContactFetchRequest, usingBlock: (
CNContact, UnsafeMutablePointer<ObjCBool>) -> Void) throws
Returns a Boolean value that indicates whether the enumeration of all contacts matching a
contact fetch request executes successfully.
func unifiedMeContactWithKeys(toFetch: [any CNKeyDescriptor]) throws ->
CNContact
Fetches the unified contact that’s the me card.
func unifiedContact(withIdentifier: String, keysToFetch: [any CNKey
Descriptor]) throws -> CNContact
Fetches a unified contact for the specified contact identifier.
func unifiedContacts(matching: NSPredicate, keysToFetch: [any CNKey
Descriptor]) throws -> [CNContact]
Fetches all unified contacts matching the specified predicate.
func defaultContainerIdentifier() -> String
Topics
Requesting access to the user’s contacts
Fetching contacts
Fetching groups and containers


## Page 3

Returns the identifier of the default container.
func groups(matching: NSPredicate?) throws -> [CNGroup]
Fetches all groups matching the specified predicate.
func containers(matching: NSPredicate?) throws -> [CNContainer]
Fetches all containers matching the specified predicate.
var currentHistoryToken: Data?
The current history token.
func execute(CNSaveRequest) throws
Executes a save request and returns success or failure.
static let CNContactStoreDidChange: NSNotification.Name
Posted when changes occur to the contact store.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Fetching change history info
Saving changes
Responding to contact store changes
Relationships
Inherits From
Conforms To


## Page 4

Accessing the contact store
Request permission from the person to read and write their contact data.
Accessing a person’s contact data using Contacts and ContactsUI
Allow people to grant your app access to contact data by adding the Contact access button
and Contact access picker to your app.
NSContactsUsageDescription
A message that tells people why the app is requesting access to their contacts.
com.apple.developer.contacts.notes
A Boolean value that indicates whether the app may access the notes in contact entries.
See Also
Essentials


