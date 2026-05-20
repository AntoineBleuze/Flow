# 002_Persistent history.pdf

## Page 1

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


## Page 2

Accessing data when the store changes
Guarantee that a context won’t see store changes until you tell it to look.
Consuming relevant store changes
Filter store transactions for changes relevant to the current view.
See Also
Change processing


