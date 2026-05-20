# Change processing.pdf

## Page 1

Query generations give your UI a stable view of data in the database, regardless of changes
happening to the store underneath. Whenever you read from a context, you see the same
generation, or snapshot, of data until you choose to advance it to a later generation.
Use query generations when you want to isolate your view context from any changes made in the
store by background threads in your app, app extensions, CloudKit, or other sources.
To use query generations, the persistent store must be an NSSQLiteStoreType in write-ahead
logging (WAL) journal mode. Core Data creates SQLite stores with WAL mode enabled by default
Query generations leverage WAL mode to let you query against the historical state of the databas
Core Data appends transactions to a .sqlite-wal file, or journal, in the same directory as the
main store file. When your context reads from the journal, it starts at the transaction associated
with a specific generation, instead of at the most recent transaction.
To confirm whether a custom store has WAL mode enabled, turn on SQL logging. Choose Produc
> Scheme > Edit Scheme, then choose the Run action, and add the following line under Argument
Passed on Launch:
Run your app, and look for the following output in the console:
Overview
Ensure the correct type and mode for the persistent store
Core Data / Accessing data when the store changes
Article
Accessing data when the store changes
Guarantee that a context won’t see store changes until you tell it to look.


## Page 2

If you try to use query generations with a store that’s not an NSSQLiteStoreType in WAL journa
mode, your contexts gracefully revert to unpinned behavior.
By default, contexts are unpinned, and read from the store at the generation of the most recent
transaction. Pinned contexts read from the store at the generation of a specific transaction.
To pin a context, call setQueryGenerationFrom(_:) and pass an opaque NSQuery
GenerationToken. The context updates to the specified generation lazily on the next read
(fetching or faulting) operation.
Use the current generation token to pin the context to the generation corresponding to the mos
recent store transaction. For example, pass the current generation token when setting up your
stack to pin the view context to the first generation that it fetches.
Alternatively, use the queryGenerationToken from another pinned context to align both
contexts to the same generation.
To unpin a context, call setQueryGenerationFrom(_:), passing nil.
Nested contexts inherit their parent’s generation. They’re implicitly unpinned, but they see data a
viewed through the generation of their parent with the addition of their parent’s pending changes
A generation doesn’t include stores added to the store coordinator after the generation’s creation
Additionally, if you remove a store from the coordinator, don’t try to load data from the deleted
Pin the context to a store generation


## Page 3

store into a context.
Advance a context to the generation of the most recent transaction, and pin it there, by calling se
QueryGenerationFrom(_:) and passing the current token. The context updates to the
specified generation lazily on the next read (fetching or faulting) operation.
Alternatively, update a context’s generation by calling any of the following.
setQueryGenerationFrom(_:)
save()
mergeChanges(fromContextDidSave:)
mergeChanges(fromRemoteContextSave:into:)
reset()
Update contexts to the current generation as soon as a specific generation is no longer needed
Query generations hold a file lock open to maintain the integrity of the journal for the duration of a
query generation. Once no contexts refer to a query generation, it expires, and the system can
reclaim the journal disk space.
Refresh any managed objects registered to the context after you change the context’s query
generation or unpin the context. Managed objects don’t automatically refresh, as this behavior ma
not be desirable and is difficult to revert.
Call refreshAllObjects() on the context to refresh its existing managed objects.
Update the view context to the current store generation
Refresh objects


## Page 4

You can also refresh your objects by fetching them again. Call fetch(_:) on the context to
retrieve a fresh set of managed objects matching your request criteria.
The fetch reads the journal from the context’s query generation if pinned, or from the most recent
transaction if unpinned.
Consuming relevant store changes
Filter store transactions for changes relevant to the current view.
Persistent history
Use persistent history tracking to determine what changes have occurred in the store since
the enabling of persistent history tracking.
See Also
Change processing


## Page 5

Use persistent history tracking to determine what changes have occurred in the store, and to
update your view context only as needed.
For example, consider an app that sometimes shows a list of shopping items, and sometimes
shows a list of stores. As the user views the ShoppingItem objects from the view context, a
background context may download additional Store data from a remote source. If the import
happens through a batch operation, the save to the store doesn’t generate an NSManagedObjec
ContextDidSave notification, and the view misses these relevant updates. Alternatively, the
background context may save changes to the store that don’t affect the current view—for exampl
inserting, modifying, or deleting Store objects. These changes do generate context save events
so your view context processes them even though it doesn’t need to.
Persistent history solves the problem by keeping track of every transaction on the store. You can
filter this history for relevant changes and decide how or whether to update a view.
When you create a persistent container, set the NSPersistentHistoryTrackingKey option o
the store description to true to enable history tracking.
Overview
Enable history tracking for your local store
Core Data / Consuming relevant store changes
Article
Consuming relevant store changes
Filter store transactions for changes relevant to the current view.


## Page 6

Core Data tracks all changes to your local store.
In the persistent container, set the NSPersistentStoreRemoteChangeNotificationPost
OptionKey option to true to enable listening for remote change notifications.
In your view, add an observer to listen for remote change notifications.
Each history transaction automatically includes the originating storeID, bundleID and proces
ID. You can supply additional information about the source of a change by setting each managed
object context’s name and transactionAuthor.
Provide a unique name for each context to identify it in the persistent history. The context’s name
becomes the persistent history transaction’s contextName. You only need to set this once per
Listen for remote changes
Provide details about a transaction’s source


## Page 7

context.
You can also set a transactionAuthor before each context save to differentiate among multip
call sites that modify the same context. The context’s transactionAuthor becomes the
author of subsequent persistent history transactions.
Reset the context’s transactionAuthor to nil after saving the context to prevent
misattribution of future transactions.
Create an instance of NSPersistentHistoryToken to keep track of the most recent history.
Keep track of the most recent history


## Page 8

Save the token to disk so you can track history across app launches and fetch history based on th
token.


## Page 9

To request history, use the fetchHistory(after:) type method on NSPersistentHistory
ChangeRequest.
Important
Execute the fetch request on a background context to avoid blocking the main thread.
The following example shows a request to fetch new history since the last time you fetched histor
and convert the NSPersistentHistoryResult to an array of NSPersistentHistory
Transaction:
Alternatively you can use fetchHistory(after:) to get history after a particular date, or afte
particular a transaction.
Each transaction represents a set of changes. Iterate through the array of transactions to learn
their details. The following code loops through the results of the fetchHistoryRequest to
inspect the properties of each transaction.
Request history
Read history transactions


## Page 10

A transaction’s changes array includes information about multiple changes. A single
NSPersistentHistoryChange represents the insertion, update, or deletion of an object.
Iterate through a transaction’s changes to identify each object that changed, the type of change
that occurred, and any details about the change.
In the case of an update, the updatedProperties set includes any updated attributes and
relationships. In the case of a deletion, the tombstone dictionary includes key-value pairs for any
attributes marked for preservation after deletion.


## Page 11

Filter the history to narrow it to changes that affect the current view. The following code filters for
changes to ShoppingItem instances, and it updates the last transaction token as it goes.
Relevant changes may include all changes to a given entity, or more selectively, only changes to
those properties that are visible on the screen.
To merge the relevant changes into your view context, first obtain a notification by calling object
IDNotification() on the transaction. Then, pass the notification to mergeChanges(from
ContextDidSave:).
Filter for relevant transactions
Merge relevant transactions


## Page 12

After you delete an object from the store, its objectID is no longer relevant. Identify a deleted
object by recording select properties in its tombstone.
In the Core Data model editor, select an attribute. In the data model editor, select the Preserve
After Deletion checkbox.
In the persistent history, NSPersistentHistoryChangeType.delete changes include a
tombstone dictionary with key-value pairs for any attributes marked for preservation after
deletion.
Because persistent history tracking transactions take up space on disk, determine a clean-up
strategy to remove them when you no longer need them. Before you purge history, ensure that yo
app and its clients have consumed the history they need.
Similar to fetching history, you can use deleteHistory(before:) to delete history older than
token, a transaction, or a date. For example, you can delete all transactions older than seven days
Access attributes of deleted objects
Purge History


## Page 13

Important
If you attempt to fetch purged history, Core Data throws an expired token error.
Accessing data when the store changes
Guarantee that a context won’t see store changes until you tell it to look.
Persistent history
Use persistent history tracking to determine what changes have occurred in the store since
the enabling of persistent history tracking.
See Also
Change processing


## Page 14

class NSPersistentHistoryToken
A bookmark for keeping track the most recent history that you’ve processed.
class NSPersistentHistoryChangeRequest
A request to fetch or purge persistent history.
class NSPersistentHistoryResult
The result of a request to fetch persistent history.
class NSPersistentHistoryTransaction
A set of changes in the persistent history based on a context save or batch operation.
class NSPersistentHistoryChange
A change representing the insertion, update, or deletion of a managed object in the persiste
store.
Topics
Tracking History
Requesting History
Reading History
Core Data / Persistent history
API Collection
Persistent history
Use persistent history tracking to determine what changes have occurred in the
store since the enabling of persistent history tracking.


## Page 15

Accessing data when the store changes
Guarantee that a context won’t see store changes until you tell it to look.
Consuming relevant store changes
Filter store transactions for changes relevant to the current view.
See Also
Change processing


