# 002_NSAsynchronousFetchResult.pdf

## Page 1

var fetchRequest: NSAsynchronousFetchRequest<ResultType>
The underlying fetch request that was executed.
var finalResult: [ResultType]?
The results that were received from the fetch request.
NSPersistentStoreAsynchronousResult
CVarArg
Topics
Getting Information About a Result
Relationships
Inherits From
Conforms To
Core Data / NSAsynchronousFetchResult
Class
NSAsynchronousFetchResult
A fetch result object that encompasses the response from an executed
asynchronous fetch request.
iOS 8.0+
iPadOS 8.0+
Mac Catalyst 13.1+
macOS 10.10+
tvOS
visionOS 1.0+
watchOS 2.0+


## Page 2

CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
class NSFetchRequest
A description of search criteria used to retrieve data from a persistent store.
class NSAsynchronousFetchRequest
A fetch request that retrieves results asynchronously and supports progress notification.
class NSFetchedResultsController
A controller that you use to manage the results of a Core Data fetch request and to display
data to the user.
See Also
Fetch requests


