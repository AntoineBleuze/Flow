# Records.pdf

## Page 1

CloudKit uses records and record zones to manage your app’s schema and the data it contains.
You create these objects on the user’s device and save them to iCloud. After saving the objects,
other devices can access and use them.
Use CKRecord to create a record, which must have a record ID. The record ID consists of the
record’s name and the ID of the record zone to store it in. If you don’t provide a record zone ID,
CloudKit stores the record in the default zone. Record IDs must be unique within the database tha
contains the record. Derive a record’s name from an object that guarantees uniqueness, such as a
UUID. CloudKit assigns a unique record name if you don’t provide one. After you create a record,
assign its keys and their values, and then save it to iCloud with CKModifyRecordsOperation.
Use the same operation to delete records.
CloudKit stores records in record zones, which allow you to group specific types of records. For
example, you might store a Product record type in one zone, and a Customer record type in
another. Storing records in zones can make fetching them more efficient because you can scope
queries, and other fetch operations, to a specific record zone to prevent searching the entire
database. Only the private database supports custom record zones. Use CKRecordZone to crea
a zone, and then save it to the user’s private database with CKModifyRecordZonesOperation
The same operation supports deleting record zones. When you delete a zone, CloudKit deletes al
the records it contains. To retrieve one or more record zones from iCloud, use CKFetchRecord
ZonesOperation. After you save a zone, create a record zone subscription. CloudKit uses
subscriptions to notify your app of record changes. For more information, see Remote Records.
To allow users to share records, you must store those records in a custom record zone. For more
information, see Shared Records.
CloudKit provides two ways to fetch records from iCloud. If you know the IDs of the records to
fetch, use CKFetchRecordsOperation. Otherwise, use CKQuery and CKQueryOperation. A
query consists of a record type, a predicate that defines criteria, and sort descriptors. You can
further scope a query to retrieve records from a specific record zone. Queries limit the number of
Overview
CloudKit / Local Records
API Collection
Local Records
Manipulate records on-device and save changes to the server.


## Page 2

records they return. If the record count exceeds the limit, iCloud returns a subset of records and a
cursor. You then use the cursor to fetch the next batch of records in another operation.
It’s important to consider the cost of a record when fetching it, especially when the record contain
one or more assets. Both CKFetchRecordsOperation and CKQueryOperation provide a
desiredKeys property, which allows you to specify the fields the operation retrieves from iCloud
If you don’t immediately need any associated assets, use desiredKeys to exclude the
corresponding fields. You can then download individual assets as you need them.
The following example shows how to construct a query operation. It searches a specific record
zone for properties in Cupertino, and uses a sort descriptor to request that iCloud returns the
results in chronological order. The operation excludes a field that contains an asset using desire
Keys. For brevity, the example omits configuring the operation’s callbacks and executing it.


## Page 3

class CKModifyRecordZonesOperation
An operation that modifies one or more record zones.
class CKModifyRecordsOperation
An operation that modifies one or more records.
class CKFetchRecordZonesOperation
An operation for retrieving record zones from a database.
class CKFetchRecordsOperation
An operation for retrieving records from a database.
class CKQuery
A query that describes the criteria to apply when searching for records in a database.
class CKQueryOperation
An operation for executing queries in a database.
class CKLocationSortDescriptor
An object for sorting records that contain location data.
class CKDatabaseOperation
The abstract base class for operations that act upon databases in CloudKit.
Topics
Transactions
Fetch Requests
Queries
Base Objects
See Also


## Page 4

Remote Records
Use subscriptions and change tokens to efficiently manage modifications to remote records
class CKSyncEngine
An object that manages the synchronization of local and remote record data.
Shared Records
Share one or more records with other iCloud users.
Records


## Page 5

CloudKit stores your records in iCloud and uses subscriptions to notify your app in real time abou
record changes. You then use change tokens to handle these changes efficiently. Additionally, yo
can improve your app’s performance and support offline use by storing records in a local cache.
When your app launches for the first time on a new device, use CKFetchDatabaseChanges
Operation and CKFetchRecordZoneChangesOperation to fetch any records you need to
populate your cache. Each operation expects a change token, which is an opaque token that
represents a specific point in the database’s history. For the initial fetch, pass nil as the token to
retrieve all changes in the database’s history. When the operation completes, save its change toke
so you can use it with your next fetch. Change tokens help reduce the amount of data CloudKit
returns.
After you fetch the records, subscribe to future changes. Subscriptions run in iCloud and listen fo
record changes, such as record creation, modification, and deletion. Create subscriptions, as
necessary, in the public database, and the user’s private and shared databases. A subscription
responds to changes to a database, to a custom record zone, or to records that match a specific
set of criteria. You can further scope subscriptions to an individual record type.
Overview
CloudKit / Remote Records
API Collection
Remote Records
Use subscriptions and change tokens to efficiently manage modifications to
remote records.


## Page 6

When the user modifies records on their device, save those changes to iCloud. In response, a
subscription generates push notifications using the configuration you provide, and iCloud sends
them to the user’s other devices. On receipt of a notification, fetch the changes from iCloud and
update your cache. Use the change token from the previous fetch to limit the fetched records.
Overwrite the token with the new one the fetch operation provides when it completes.
Note
Subscriptions belong to the users that create them. iCloud can notify several users’ devices in
response to a change in the public database. This is because each user’s subscription is
tracking the same set of records.
Every subscription type has a corresponding notification object that you can configure to meet
your app’s needs. CloudKit supports high-priority visual notifications and medium-priority
background notifications. A notification can include a limited number of fields from the changed
record. You opt in to this behavior. For more information, see desiredKeys.
Because the system coalesces notifications, don’t rely on them for specific changes. Consider
notifications an indication of remote changes, and use the fetch operations to reliably retrieve all
changes that occur after your most recent fetch.
CloudKit supports the following subscription types:
Database
Use a database subscription when you don’t know what record zones exist,
such as in the shared database. Only private and shared databases support
database subscriptions. For more information, see CKDatabase
Subscription.
Record
zone
Use a record zone subscription to track changes in a custom record zone in the
user’s private database. You can’t use this subscription in public or shared
databases. For more information, see CKRecordZoneSubscription.
Query
Use a query subscription to track changes to records in a database that match a
predicate. Only public and private databases support query subscriptions. For
more information, see CKQuerySubscription.
If you already cache your app’s model objects, you don’t need to cache CloudKit records in
tandem. Instead, attach a record’s metadata to a model to associate the two. The metadata
includes the record’s ID, record type, record zone ID, and change tag, as well as other information
Integrate Records with Your Existing Models


## Page 7

When you fetch a record from iCloud, update the local model object using the record’s fields. The
encode the record’s metadata, attach it to the model, and save the model to the cache. To update
record in iCloud, decode the model’s metadata and use it to create an instance of CKRecord. Set
the record’s fields to the model’s values and save it to iCloud.
The following example shows how to encode a record’s metadata and store it on a custom
Product model. It also shows how to decode the metadata and use it to create an instance of
CKRecord.
class CKDatabaseSubscription
Topics
Database Changes


## Page 8

A subscription that generates push notifications when CloudKit modifies records in a
database.
class CKDatabaseNotification
A notification that triggers when the contents of a database change.
class CKFetchDatabaseChangesOperation
An operation that fetches database changes.
class CKRecordZoneSubscription
A subscription that generates push notifications when CloudKit modifies records in a specifi
record zone.
class CKRecordZoneNotification
A notification that triggers when the contents of a record zone change.
class CKFetchRecordZoneChangesOperation
An operation that fetches record zone changes.
class CKServerChangeToken
An opaque token that represents a specific point in a database’s history.
class CKFetchSubscriptionsOperation
An operation for fetching subscriptions.
class CKModifySubscriptionsOperation
An operation for modifying one or more subscriptions.
class CKQuerySubscription
A subscription that generates push notifications when CloudKit modifies records that match
predicate.
class CKQueryNotification
Record Zone Changes
Change Tokens
Subscription Management
Predicate-Driven Changes


## Page 9

A notification that triggers when a record that matches the subscription’s predicate changes
class CKSubscription
An abstract base class for subscriptions.
class CKNotification
The abstract base class for CloudKit notifications.
class CKDatabaseOperation
The abstract base class for operations that act upon databases in CloudKit.
Local Records
Manipulate records on-device and save changes to the server.
class CKSyncEngine
An object that manages the synchronization of local and remote record data.
Shared Records
Share one or more records with other iCloud users.
Base Objects
See Also
Records


## Page 10

Deciding whether CloudKit is right for your app
Use CKSyncEngine to handle your app’s CloudKit sync operations and benefit from the
performance and reliability it provides. To use the class, create an instance early in your app’s
launch process and specify a database to sync. Thereafter, and depending on good system
conditions, the sync engine will periodically push and pull database and record zone changes on
the app’s behalf. To participate in those sync operations and to provide the engine with the
changes to send, create a type that conforms to CKSyncEngineDelegate and assign an
instance of it to the engine’s configuration. You can have multiple instances of CKSyncEngine in
single process, each targeting a different database. For example, you may have one syncing a
person’s private database and another syncing their shared database.
Because periodic sync relies on good system conditions — adequate battery charge, an active
network connection, a signed-in iCloud account, and so on — the engine’s sync schedule is
indeterminate; if you need to sync immediately, like when you need to ensure your app has the
most recent changes before continuing, use the fetchChanges(_:) and sendChanges(_:)
methods.
The sync engine uses an opaque type to track its internal state, and it’s your responsibility to
persist that state to disk and make it available across app launches so the engine can function
properly. For more information, see handleEvent(_:syncEngine:) and CKSyncEngine
.Event.StateUpdate.
Mentioned in
Overview
CloudKit / CKSyncEngine
Class
CKSyncEngine
An object that manages the synchronization of local and remote record data.
iOS 17.0+
iPadOS 17.0+
Mac Catalyst 17.0+
macOS 14.0+
tvOS 17.0+
visionOS
watchOS 10.0+


## Page 11

CKSyncEngine requires the CloudKit and Remote notifications entitlements. For more informatio
see Configuring iCloud services and Configuring background execution modes.
Important
Don’t use CKSyncEngine to sync your app’s public database.
A sync engine requires you to tell it about any changes to send, which you do by invoking the
add(pendingDatabaseChanges:) and add(pendingRecordZoneChanges:) methods on
the engine’s state property. If there are no scheduled sync operations when you invoke these
methods, the engine automatically schedules one. Database changes don’t require any additiona
input, but the sync engine does expect you to provide the individual record zone changes — in
batches — and return them from your delegate’s implementation of nextRecordZoneChange
Batch(_:syncEngine:). After the engine sends the changes, it notifies your delegate about
their success (or failure) by dispatching CKSyncEngine.Event.sentDatabaseChanges(_:
and CKSyncEngine.Event.sentRecordZoneChanges(_:) events.
By default, a sync engine attempts to discover an existing CKDatabaseSubscription for the
associated database and uses that to receive silent notifications about remote record changes. If
the engine doesn’t find a subscription, it automatically creates one to use. On receipt of a
notification, the engine schedules a sync operation to fetch the related changes. When that
operation runs, the engine dispatches a CKSyncEngine.Event.willFetchChanges(_:)
event to your delegate. As it receives fetched changes, the engine dispatches CKSyncEngine
.Event.fetchedDatabaseChanges(_:) and CKSyncEngine.Event.fetchedRecord
ZoneChanges(_:), accordingly. After the operation finishes, the sync engine notifies your
delegate by dispatching a CKSyncEngine.Event.didFetchChanges(_:) event. You handle
all dispatched events in your delegate’s implementation of handleEvent(_:syncEngine:).
Tip
A sample code project for CKSyncEngine is available on GitHub here: CloudKit Samples:
CKSyncEngine.
Send changes to iCloud
Fetch changes from iCloud
Topics


## Page 12

init(CKSyncEngine.Configuration)
Creates a sync engine with the specified configuration.
struct Configuration
A type that configures the attributes and behavior of a sync engine.
var database: CKDatabase
The associated database.
var state: CKSyncEngine.State
The sync engine’s state.
class State
An object that manages the sync engine’s state.
protocol CKSyncEngineDelegate
An interface for providing record data to a sync engine and customizing that engine’s
behavior.
func fetchChanges(CKSyncEngine.FetchChangesOptions) async throws
Fetches pending remote changes from the server.
struct FetchChangesOptions
A set of options to use with a fetch operation.
func sendChanges(CKSyncEngine.SendChangesOptions) async throws
Sends pending local changes to the server.
struct SendChangesOptions
A set of options to use with a send operation.
Creating a sync engine
Accessing the engine’s attributes
Participating in scheduled sync operations
Invoking manual sync operations


## Page 13

func cancelOperations() async
Cancels any in-progress or pending sync operations.
struct FetchChangesContext
struct RecordZoneChangeBatch
A type that contains the record changes for a single send operation.
struct SendChangesContext
A type that describes a single attempt to send changes to the iCloud servers.
enum Event
Describes an event that occurs during a sync operation.
enum PendingDatabaseChange
Describes an unsent database modification.
enum PendingRecordZoneChange
Describes an unsent record modification.
enum SyncReason
Describes the reason for a sync operation.
Copyable
CustomStringConvertible
Sendable
Canceling operations
Structures
Enumerations
Relationships
Conforms To


## Page 14

SendableMetatype
Local Records
Manipulate records on-device and save changes to the server.
Remote Records
Use subscriptions and change tokens to efficiently manage modifications to remote records
Shared Records
Share one or more records with other iCloud users.
See Also
Records


## Page 15

CloudKit users can share records in their private databases with other iCloud users, which enable
collaboration between the people using your app. The user that initiates sharing, the owner,
handles all aspects of the collaboration, from inviting people to participate to restricting what
actions the participants can perform.
CloudKit allows you to share both record zones and record hierarchies. If you want to share an
unbounded collection of records that don’t have natural parent-child relationships, share their
containing record zone. However, if you want to share only a specific set of related records, defin
an explicit record hierarchy and share that instead.
For more information, see Sharing CloudKit Data with Other iCloud Users.
Overview
CloudKit / Shared Records
API Collection
Shared Records
Share one or more records with other iCloud users.


## Page 16

You store shareable records in a custom record zone in the user’s private database. As you create
records in that zone, they become eligible for record zone sharing. If you then choose to share tha
record zone, CloudKit allows participants to access all the records it contains.
Alternatively, you can build a hierarchy by defining relationships between records as you create
them. Set a record’s parent property to designate it as a child of the referenced record. If your
data model is hierarchical, this is good practice even if you don’t plan to share the records.
Whereas sharing a record zone is catch-all, sharing a record hierarchy allows you to specify exact
which records to include.
To begin sharing, create an instance of CKShare with either the ID of the record zone to share, o
the root record, which defines the point in the record hierarchy where you want to start sharing.
CloudKit shares all the records in the record zone, or every record in the hierarchy below the root
record can take part in only a single share. This applies to every record in the shared record zone 
hierarchy.
After you create the share, save it using CKModifyRecordsOperation. The shared records mu
already exist in iCloud or be part of the same save operation.
After saving the share, CloudKit assigns it a stable share URL. Use this URL to invite other users t
participate. In iOS, UICloudSharingController provides a consistent and familiar experience
for managing a share’s participants and their permissions, and for distributing the share URL. Use
NSItemProvider and NSSharingService in macOS (with the cloudSharing service name
to achieve similar functionality. Only invited participants can join a private share. Anyone with the
share URL can join a public share. For more information, see publicPermission.
When an invited user taps or clicks the share URL, CloudKit verifies they have an active iCloud
account, which must match their participant details. After successful verification, the system
launches your app. CloudKit provides share metadata to your app’s scene delegate or app
delegate. The method the system calls varies by platform and app configuration. For more
information, see CKShare.Metadata.
Important
To enable the system to launch your app when the user taps or clicks the share URL, add the
CKSharingSupported key to the app’s Info.plist file. For more information, see
CKSharingSupported.
Share a Record Zone or Hierarchy
Invite Participants
Manage Share Participation


## Page 17

After receiving the share metadata from CloudKit, use CKAcceptSharesOperation to confirm
the user’s participation. CloudKit then creates a record zone in the participant’s shared database
that provides a view into the owner’s private database. The record zone contains only the records
in the share; no other data is accessible. A participant with write permissions can change or delet
records in this new record zone. Any changes they make are visible to all participants.
Create a database subscription in the user’s shared database the first time they launch your app.
Then, when they confirm participation in a share, iCloud notifies your app, on all of the user’s
devices, of any changes to the shared records. For more information, see CKDatabase
Subscription.
To stop sharing, the share’s owner must delete the share or, for shared hierarchies, the root recor
If a participant wants to leave the share, delete the share record from their shared database. Use
UICloudSharingController or NSSharingService to allow a participant to stop
participating. Or remove them from the share using the removeParticipant(_:) method, and
then save the updated share to iCloud.
You can use the framework’s share-related operations to implement behavior similar to that of
UICloudSharingController and NSSharingService to build a custom sharing experience
by following these steps:
1. Use CKFetchShareParticipantsOperation to generate participants and add them to the
share using addParticipant(_:). Your app presents a list of potential participants to the
user. You can also allow the owner to add participants by entering a participant’s email address
or phone number.
2. Save the share to iCloud.
3. Provide the share URL to the participants. You can send the URL in an email or a message, or
your app might have secure, in-app chat between users to facilitate distribution of the URL.
4. For each participant, fetch the share’s metadata using CKFetchShareMetadataOperation
and the share URL.
5. Use CKAcceptSharesOperation to confirm participation.
6. After you share records, use the properties and methods on CKShare to manage the share’s
participants.
For public shares, you can skip the first step. Accepting a public share’s metadata automatically
adds the user as a participant.
Customize the Sharing Experience
Topics


## Page 18

Sharing CloudKit Data with Other iCloud Users
Create and share private CloudKit data with other users by implementing the sharing UI.
Sharing Core Data objects between iCloud users
Use Core Data and CloudKit to synchronize data between devices of an iCloud user and sha
data between different iCloud users.
class CKShare
A specialized record type that manages a collection of shared records.
struct CKShareTransferRepresentation
A transfer representation the system uses to share an item.
class CKAllowedSharingOptions
An object that controls participant access and permission options.
class CKSystemSharingUIObserver
An object the system uses to monitor changes in sharing.
class UICloudSharingController
A view controller that presents standard screens for adding and removing people from a
CloudKit share record.
CKSharingSupported
A Boolean value that indicates your app supports CloudKit Sharing.
class CKFetchShareMetadataOperation
An operation that fetches metadata for one or more shares.
class Metadata
An object that describes a shared record’s metadata.
class CKAcceptSharesOperation
An operation that confirms a user’s participation in a share.
Collaboration
Share Requests
Participants


## Page 19

class CKFetchShareParticipantsOperation
An operation that converts user identities into share participants.
class Participant
An object that describes a user’s participation in a share.
class CKOperation
The abstract base class for all operations that execute in a database.
Local Records
Manipulate records on-device and save changes to the server.
Remote Records
Use subscriptions and change tokens to efficiently manage modifications to remote records
class CKSyncEngine
An object that manages the synchronization of local and remote record data.
Base Objects
See Also
Records


