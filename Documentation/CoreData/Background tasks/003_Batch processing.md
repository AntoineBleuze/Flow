# 003_Batch processing.pdf

## Page 1

class NSBatchInsertRequest
A request to insert a batch of data in a persistent store.
class NSBatchInsertResult
The result that Core Data returns when executing a batch-insertion request.
class NSBatchUpdateRequest
A request to Core Data to do a batch update of data in a persistent store without loading any
data into memory.
class NSBatchUpdateResult
The result returned when executing a batch update request.
class NSBatchDeleteRequest
A request that deletes objects in the SQLite persistent store without loading them into
memory.
class NSBatchDeleteResult
Topics
Data Inserts
Data Updates
Data Deletion
Core Data / Batch processing
API Collection
Batch processing
Use batch processes to manage large data changes.


## Page 2

An object that describes the result of a batch delete request.
Using Core Data in the background
Use Core Data in both a single-threaded and multithreaded app.
Loading and displaying a large data feed
Consume data in the background, and lower memory use by batching imports and preventin
duplicate records.
Conflict resolution
Detect and resolve conflicts that occur when data is changed on multiple threads.
See Also
Background tasks


