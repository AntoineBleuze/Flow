# Essentials.pdf

## Page 1

Your app canʼt access a personʼs Contacts entries until that person grants permission. When your
app requests access to contact data, the person can grant either limited or full access, or they ca
deny the request.
Granting limited access to your app allows them to select specific contacts to share during the
request authorization flow. They can expand or restrict the list of contacts your app has access to
later in the Settings app. Your app has automatic access to contacts it creates, but it can only
fetch, edit, or delete contacts that the person grants you access to. If the person approves full
access for the app, you can create, fetch, edit, and delete contact data, including contacts you
didnʼt create. If the person denies the request, your app gets no access to the personʼs data.
Contacts UI includes new APIs you can adopt for an enhanced privacy experience when someone
gives full, partial, or no access to your app. Use ContactAccessButton and contactAccess
Picker(isPresented:completionHandler:) to let the person control which contacts you
app can access.
In Xcode, configure the required NSContactsUsageDescription setting in the Build Settings
tab of your app target. The value for this setting is a string that explains why your app needs
access to a person’s contacts. The system displays the string when prompting the person to
authorize your app for access. The following image shows an example contacts usage description
for an app that requires contacts access to edit your mailing address and profile image:
Overview
Provide a contacts usage description
Contacts / Accessing the contact store
Article
Accessing the contact store
Request permission from the person to read and write their contact data.


## Page 2

Important
Your app crashes if you attempt to access contact data without a contacts usage description.
Verify the authorization status of your app before presenting features that require Contacts acces
in your UI. If your app hasn’t requested access yet, any attempts to use these features
automatically prompt the person for Contacts access. If the person previously denied access to
your app, attempts to use these features fail with a CNError.Code.authorizationDenied
error.
The authorization status of your app is CNAuthorizationStatus.notDetermined until the
person authorizes or denies access. The person can approve or deny your app’s request for
authorization, then change the authorization status later in the Settings app.
To determine your authorization status, call the authorizationStatus(for:) class method o
CNContactStore with an entity type CNEntityType.contacts:
Check your app authorization status


## Page 3

If the authorization status of your app is CNAuthorizationStatus.notDetermined, prompt
the person for access by initializing the contact store, then calling its requestAccess(for:
completionHandler:) or requestAccess(for:) method with an entity type contacts:
If the person grants limited access, your app receives a CNAuthorizationStatus.limited
authorization status. If the person grants full access, your app receives a CNAuthorization
Status.authorized status. The system remembers your app’s authorization status so that
subsequent calls to requestAccess(for:completionHandler:) or request
Access(for:) don’t prompt the person again.
Note
If the person previously granted your app contacts access (CNAuthorizationStatus
.authorized) in an earlier OS, your app still has full access in iOS 18 and later.
Your app can use the entire Contacts API when it has limited contact access. Use Contact
AccessButton to let people choose contacts to share with your app. When someone searches f
a contact, the search results present contacts that your app doesn’t have access to. If the person
taps the button, the system immediately grants access to the contact without prompting them for
authorization, and your app receives a callback that includes the identifier of the newly added
contact. To fetch information about this contact, create a fetch request that uses predicateFor
Contacts(withIdentifiers:), pass the identifier to the predicate, and execute the request
Request access to contact data
Use Contacts with limited access


## Page 4

For more information, see CNContactStore.
If your app needs to read or modify contacts, consider presenting the contact access picker to let
people update which contacts you can access. The picker has full access to all contacts on the
device regardless of your app’s authorization status. When the person dismisses the picker, your
app receives a callback that returns the identifiers of additional contacts the person chose. The
callback doesn’t provide any information about contacts you can no longer access or those you c
already access. The following example creates a fetch request that searches for all approved
contacts, executes the request, and then uses the identifiers to highlight newly added contacts in
the fetch result in your UI:
If you don’t adopt the contact access button or contact access picker, the person needs to use th
Settings app to control which contacts you can access.


## Page 5

To read or write the note field from a contact in iOS 13, macOS 13, or later, add the com.apple
.developer.contacts.notes entitlement to your app. The entitlement requires permission
from Apple to use, and you can’t publicly distribute your app until you have permission to use it. F
more information about adding the entitlement and requesting permission, see com.apple
.developer.contacts.notes.
Accessing a person’s contact data using Contacts and ContactsUI
Allow people to grant your app access to contact data by adding the Contact access button
and Contact access picker to your app.
class CNContactStore
The object that fetches and saves contacts, groups, and containers from the user’s Contact
database.
NSContactsUsageDescription
A message that tells people why the app is requesting access to their contacts.
com.apple.developer.contacts.notes
A Boolean value that indicates whether the app may access the notes in contact entries.
Add entitlement to view or update notes
See Also
Essentials


## Page 6

Note
This sample code project is associated with WWDC24 session 10121: Meet the Contact Access
Button.
Before running the sample code project in Xcode, select the sample target, then configure it to us
your Developer team for signing.
Accessing the contact store
Request permission from the person to read and write their contact data.
Overview
Configure the sample code project
See Also
Essentials
Contacts / Accessing a person’s contact data using Contacts and ContactsUI
Sample Code
Accessing a person’s contact data using
Contacts and ContactsUI
Allow people to grant your app access to contact data by adding the Contact
access button and Contact access picker to your app.
Download
iOS 18.0+
iPadOS 18.0+
Xcode 16.0+


## Page 7

class CNContactStore
The object that fetches and saves contacts, groups, and containers from the user’s Contact
database.
NSContactsUsageDescription
A message that tells people why the app is requesting access to their contacts.
com.apple.developer.contacts.notes
A Boolean value that indicates whether the app may access the notes in contact entries.


## Page 8

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


## Page 9

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


## Page 10

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


## Page 11

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


## Page 12

Name
Privacy - Contacts Usage Description
Type
String
Important
This key is required if your app uses APIs that access the user’s contacts.
Accessing the contact store
Request permission from the person to read and write their contact data.
Details
Discussion
See Also
Contacts
Bundle Resources / Information Property List / NSContactsUsageDescription
Property List Key
NSContactsUsageDescription
A message that tells people why the app is requesting access to their contacts.
iOS 6.0+
iPadOS 6.0+
macOS 10.8+
visionOS 1.0+


## Page 13

Type
Boolean
When your app loads one or more entries from the user’s contacts — for example, by calling the
unifiedContacts(matching:keysToFetch:) method — you provide a list of keys specifyin
the fields to fetch. To request the note field using CNContactNoteKey in iOS 13 or later or
macOS 13 or later, your app must have the com.apple.developer.contacts.notes
entitlement. When your app tries to fetch notes without the entitlement, it receives an
unauthorizedKeys error. Your app only needs the entitlement if it reads or writes notes.
Add the entitlement to your app in the Xcode property list editor. Set the entitlement’s type to
Boolean, and the corresponding value to YES.
Details
Discussion
Bundle Resources / Entitlements / com.apple.developer.contacts.notes
Property List Key
com.apple.developer.contacts.notes
A Boolean value that indicates whether the app may access the notes in contact
entries.
iOS 13.0+
iPadOS 13.0+
macOS 13.0+
visionOS 1.0+


## Page 14

Before you submit an app with this entitlement to the App Store, you need to get permission to us
the entitlement. Request permission at https://developer.apple.com/contact/request/contact-note
field.


