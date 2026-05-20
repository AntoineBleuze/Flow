# 001_Consuming relevant store changes.pdf

## Page 1

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


## Page 2

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


## Page 3

context.
You can also set a transactionAuthor before each context save to differentiate among multip
call sites that modify the same context. The context’s transactionAuthor becomes the
author of subsequent persistent history transactions.
Reset the context’s transactionAuthor to nil after saving the context to prevent
misattribution of future transactions.
Create an instance of NSPersistentHistoryToken to keep track of the most recent history.
Keep track of the most recent history


## Page 4

Save the token to disk so you can track history across app launches and fetch history based on th
token.


## Page 5

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


## Page 6

A transaction’s changes array includes information about multiple changes. A single
NSPersistentHistoryChange represents the insertion, update, or deletion of an object.
Iterate through a transaction’s changes to identify each object that changed, the type of change
that occurred, and any details about the change.
In the case of an update, the updatedProperties set includes any updated attributes and
relationships. In the case of a deletion, the tombstone dictionary includes key-value pairs for any
attributes marked for preservation after deletion.


## Page 7

Filter the history to narrow it to changes that affect the current view. The following code filters for
changes to ShoppingItem instances, and it updates the last transaction token as it goes.
Relevant changes may include all changes to a given entity, or more selectively, only changes to
those properties that are visible on the screen.
To merge the relevant changes into your view context, first obtain a notification by calling object
IDNotification() on the transaction. Then, pass the notification to mergeChanges(from
ContextDidSave:).
Filter for relevant transactions
Merge relevant transactions


## Page 8

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


## Page 9

Important
If you attempt to fetch purged history, Core Data throws an expired token error.
Accessing data when the store changes
Guarantee that a context won’t see store changes until you tell it to look.
Persistent history
Use persistent history tracking to determine what changes have occurred in the store since
the enabling of persistent history tracking.
See Also
Change processing


