# 000_Accessing data when the store changes.pdf

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


