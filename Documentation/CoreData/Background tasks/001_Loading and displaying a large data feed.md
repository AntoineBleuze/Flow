# 001_Loading and displaying a large data feed.pdf

## Page 1

This sample creates an app that shows a list of earthquakes recorded in the United States in the
past 30 days by consuming a U. S. Geological Survey (USGS) real-time data feed.
To load the USGS JSON feed, perform either of the following:
On iOS, pull to refresh the List.
On both iOS and macOS, press the refresh button (⌘R).
The app will load the requested data on the default delegate queue of URLSession, which is an
operation queue that runs in the background. After the feed is downloaded and the session data
task completes, the app continues working on this queue to import the large number of feed
elements to the store without blocking the main queue.
Note
This sample code project is associated with WWDC21 session 10017: Bring Core Data
Concurrency to Swift and SwiftUI.
To import data in the background, apps may use one or two managed object contexts. The sampl
uses two (NSManagedObjectContext) instances:
Overview
Import data in the background
SwiftUI / Persistent storage / Loading and displaying a large data feed
Sample Code
Loading and displaying a large data feed
Consume data in the background, and lower memory use by batching imports and
preventing duplicate records.
Download
iOS 15.0+
iPadOS 15.0+
macOS 12.0+
Xcode 13.0+


## Page 2

A main queue context to provide data to the user interface.
A private queue context to perform the import on a background queue.
Both contexts are connected to the same persistentStoreCoordinator. This configuration
more efficient than using a nested context.
The sample creates a main queue context by setting up a Core Data stack using NSPersistent
Container, which initializes a main queue context in its viewContext property.
Create a private queue context by calling the persistent container’s newBackgroundContext()
method.
When the feed download finishes, the sample uses the task context to consume the feed in the
background. In Core Data, every queue-based context has its own serial queue, and apps must
serialize the tasks that manipulate the context with the queue by wrapping the code with a
perform(_:) — with or without the await keyword — or performAndWait(_:) closure.
For more information about working with concurrency, see NSManagedObjectContext.
To efficiently handle large data sets, the sample uses NSBatchInsertRequest which accesses
the store directly — without interacting with the context, triggering any key value observation, or
allocating managed objects. The closure-style initializer of NSBatchInsertRequest allows app
to provide one record at a time when Core Data calls the dictionaryHandler closure, which
helps apps keep their memory footprint low because they do not need to prepare a buffer for all
records.
Merge changes and update the user interface


## Page 3

Because NSBatchInsertRequest bypasses the context and doesn’t trigger a NSManaged
ObjectContextDidSaveNotification notification, apps that need to update the UI with the
changes have two options:
Extract the relevant changes by parsing the store’s Persistent history, then merge them into the
view context. For more information on persistent history tracking, see Consuming relevant stor
changes.
Re-fetch the data from the store. However, if the view context is pinned to a query generation,
the context will need to be reset before fetching data. For more information on query
generations, see Accessing data when the store changes.
This sample uses persistent store remote change notifications and persistent history tracking to
update the UI, because:
The data model contains a single entity, so all changes are relevant to the List and do not
require parsing specific changes within the history.
FetchRequest fetches and retrieves results directly from the store, and the List refreshes it
contents automatically.
SwiftUI is only concerned about the view context, so QuakesProvider observes the
NSPersistentStoreRemoteChange notification to merge changes from the background
context, performing the batch operations, into the view context.
Enable remote change notifications for a persistent store by setting the NSPersistentStore
RemoteChangeNotificationPostOptionKey option on the store description to true.
Enable persistent history tracking for a persistent store by setting the NSPersistentHistory
TrackingKey option to true as well.
Whenever changes occur within a persistent store, including writes by other processes, the store
posts a remote change notification. When the sample receives the notification, it fetches the
persistent history transactions and changes occurring after a given token. After the persistent
history change request retrieves the history, the sample merges each transaction’s object
IDNotification() into the view context via mergeChanges(fromContextDidSave:).


## Page 4

After executing each NSBatchInsertRequest or NSBatchDeleteRequest, the sample
dispatches any UI updates back to the main queue, to render them in SwiftUI.
After merging changes from the last transaction, the sample needs to store the token in memory 
on disk, to use it in subsequent persistent history change requests.
When apps fetch or create objects in a context, Core Data caches the object to avoid a round trip
to the store file when the app uses those objects again. However, that approach grows the memo
footprint of an app as it processes more and more objects, and can eventually lead to low-memor
warnings or app termination on iOS. NSBatchInsertRequest doesn’t obviously increase an
app’s memory footprint because it doesn’t load data into memory.
Note
Apps targeted to run on a system earlier than iOS 13 or macOS 10.15 need to avoid memory
footprint growing by processing the objects in batches and calling reset() to reset the
context after each batch.
The sample sets the viewContext’s automaticallyMergesChangesFromParent property 
false to prevent Core Data from automatically merging changes every time the background
context is saved.
Work in batches to lower memory footprint
Prevent duplicate data in the store


## Page 5

Every time the sample app reloads the JSON feed, the parsed data contains all earthquake record
for the past month, so it can have many duplicates of already imported data. To avoid creating
duplicate records, the app constrains an attribute, or combination of attributes, to be unique acro
all instances.
The code attribute uniquely identifies an earthquake record, so constraining the Quake entity on
code ensures that no two stored records have the same code value.
Select the Quake entity in the data model editor. In the data model inspector, add a new constrain
by clicking the + button under the Constraints list. A constraint placeholder appears.
Double-click the placeholder to edit it. Enter the name of the attribute, or comma-separated list o
attributes, to serve as unique constraints on the entity.
When saving a new record, the store now checks whether any record already exists with the same
value for the constrained attribute. In the case of a conflict, an NSMergeByPropertyObject
TrumpMergePolicy policy comes into play, and the new record overwrites all fields in the existi
record.
var managedObjectContext: NSManagedObjectContext
struct FetchRequest
A property wrapper type that retrieves entities from a Core Data persistent store.
struct FetchedResults
A collection of results retrieved from a Core Data store.
struct SectionedFetchRequest
A property wrapper type that retrieves entities, grouped into sections, from a Core Data
persistent store.
See Also
Accessing Core Data


## Page 6

struct SectionedFetchResults
A collection of results retrieved from a Core Data persistent store, grouped into sections.


