# 001_NSAsynchronousFetchRequest.pdf

## Page 1

init(fetchRequest: NSFetchRequest<ResultType>, completionBlock: ((
NSAsynchronousFetchResult<ResultType>) -> Void)?)
Initializes a new asynchronous fetch request configured with the provided fetch request and
completion block.
var completionBlock: NSPersistentStoreAsynchronousFetchResultCompletion
Block?
The block that is executed when the fetch request has completed.
var estimatedResultCount: Int
A configuration parameter that assists Core Data with scheduling the asynchronous fetch
request.
var fetchRequest: NSFetchRequest<ResultType>
Topics
Initializing a Request
Preparing a Request
Core Data / NSAsynchronousFetchRequest
Class
NSAsynchronousFetchRequest
A fetch request that retrieves results asynchronously and supports progress
notification.
iOS 8.0+
iPadOS 8.0+
Mac Catalyst 13.1+
macOS 10.10+
tvOS
visionOS 1.0+
watchOS 2.0+


## Page 2

The underlying fetch request that is executed asynchronously.
NSPersistentStoreRequest
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCopying
NSObjectProtocol
class NSFetchRequest
A description of search criteria used to retrieve data from a persistent store.
class NSAsynchronousFetchResult
A fetch result object that encompasses the response from an executed asynchronous fetch
request.
class NSFetchedResultsController
A controller that you use to manage the results of a Core Data fetch request and to display
data to the user.
Relationships
Inherits From
Conforms To
See Also
Fetch requests


