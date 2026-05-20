# Fetch requests.pdf

## Page 1

An instance of NSFetchRequest collects the criteria needed to select and optionally to sort a
group of NSManagedObject managed objects held in an NSPersistentStore persistent store.
fetch request contains an NSEntityDescription or an entity name that specifies which entity
search. It frequently also contains:
An NSPredicate predicate that specifies which properties to filter by and the constraints on
selection, such as, “last name begins with a ‘J’”. If you don’t specify a predicate, th
the system fetches all instances of the entity that you specified, subject to other constraints. F
more information, see fetch(_:).
An array of NSSortDescriptor sort descriptors that specify how to order the returned
objects, such as ascending by last name and then by first name.
You can also specify other aspects of a fetch request:
fetchLimit
The maximum number of objects that a request returns
fetchOffset
The number of objects to skip
affectedStores
Which data stores the request accesses
resultType
Whether the fetch returns managed objects, object IDs, dictionaries, or a count
Overview
Core Data / NSFetchRequest
Class
NSFetchRequest
A description of search criteria used to retrieve data from a persistent store.
iOS 3.0+
iPadOS 3.0+
Mac Catalyst 13.1+
macOS 10.4+
tvOS
visionOS 1.0+
watchOS 2.0+


## Page 2

includesPropertyValues and
Whether objects are fully populated with their properties
returnsObjectsAsFaults
Whether the objects are faults
includesSubentities
Whether the fetch includes subentities of the fetched entity
propertiesToFetch
Which properties to fetch
includesPendingChanges
Whether to include unsaved changes
Use execute() to perform the fetch directly on the managed object context that’s associated
with the current queue. Or use one of the NSManagedObjectContext methods such as
perform(_:) to execute the fetch.
Note
When you execute an instance of NSFetchRequest, it always accesses the underlying
persistent stores to retrieve the latest results.
In SwiftUI, you can use a FetchRequest property wrapper to execute the fetch and assign the
results to a property. First, create the request:


## Page 3

Then use a FetchRequest property wrapper with the request to declare a property that receive
the objects that the fetch returns:
Tip
If you don’t need to specify multiple properties of the fetch, you can avoid creating the fetch
request separately and declare it in the property wrapper instead. See FetchRequest for
more information.
You often predefine fetch requests in an NSManagedObjectModel managed object model to
provide an API to retrieve a stored fetch request by name. Stored fetch requests can include
placeholders for variable substitution, and serve as templates for later completion. Fetch request
templates allow you to predefine queries with variables to substitute at runtime.
init()
Creates a new fetch request.
convenience init(entityName: String)
Initializes a fetch request configured with a given entity name.
var entityName: String?
The name of the entity the request is configured to fetch.
var entity: NSEntityDescription?
The entity specified for the fetch request.
var includesSubentities: Bool
A Boolean value that indicates whether the fetch request includes subentities in the results.
struct NSFetchRequestResultType
Constants that specify the possible result types a fetch request can return.
Topics
Managing the Fetch Request’s Entity


## Page 4

var predicate: NSPredicate?
The predicate of the fetch request.
var fetchLimit: Int
The fetch limit of the fetch request.
var fetchOffset: Int
The fetch offset of the fetch request.
var fetchBatchSize: Int
The batch size of the objects specified in the fetch request.
var affectedStores: [NSPersistentStore]?
An array of persistent stores specified for the fetch request.
class NSFetchRequestExpression
An expression that evaluates the result of a fetch request on a managed object context.
class NSExpressionDescription
An object that describes an expression to include with a fetch request.
class NSFetchedPropertyDescription
A description object used to define which properties are fetched from Core Data.
var sortDescriptors: [NSSortDescriptor]?
The sort descriptors of the fetch request.
var relationshipKeyPathsForPrefetching: [String]?
The relationship key paths to prefetch along with the entity for the request.
var resultType: NSFetchRequestResultType
The result type of the fetch request.
Specifying Fetch Constraints
Sorting the Results
Prefetching Related Objects
Managing How Results Are Returned


## Page 5

var includesPendingChanges: Bool
A Boolean value that indicates whether, when the fetch is executed, it matches against
currently unsaved changes in the managed object context.
var propertiesToFetch: [Any]?
A collection of either property descriptions or string property names that specify which
properties should be returned by the fetch.
var returnsDistinctResults: Bool
A Boolean value that indicates whether the fetch request returns only distinct values for the
fields specified by propertiesToFetch.
var includesPropertyValues: Bool
A Boolean value that indicates whether, when the fetch is executed, property data is obtaine
from the persistent store.
var shouldRefreshRefetchedObjects: Bool
A Boolean value that indicates whether the property values of fetched objects will be update
with the current values in the persistent store.
var returnsObjectsAsFaults: Bool
A Boolean value that indicates whether the objects resulting from a fetch request are faults.
struct NSFetchRequestResultType
Constants that specify the possible result types a fetch request can return.
protocol NSFetchRequestResult
An abstract protocol used with parameterized fetch requests.
var propertiesToGroupBy: [Any]?
An array of objects that indicates how data should be grouped before a select statement is
run in a SQL database.
var havingPredicate: NSPredicate?
The predicate used to filter rows being returned by a query containing a GROUP BY directive
func execute() throws -> [ResultType]
Grouping and Filtering Dictionary Results
Executing a Fetch Request Directly


## Page 6

Executes the fetch request against the managed object context that is associated with the
current queue.
NSPersistentStoreRequest
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCoding
NSCopying
NSObjectProtocol
class NSAsynchronousFetchRequest
A fetch request that retrieves results asynchronously and supports progress notification.
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


## Page 7

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


## Page 8

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


## Page 9

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


## Page 10

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


## Page 11

While you can use table views can in several ways, fetched results controllers primarily assist you
with a primary list view. UITableView expects its data source to provide cells as an array of
sections made up of rows. You configure a fetched results controller using a fetch request — an
object that specifies what type of entity to fetch and how to sort the results. You can also add
criteria for when to include a specific instance of the entity.
The fetched results controller efficiently analyzes the result of the fetch request and computes al
the information about sections in the result set. It also computes all the information for the index
based on the result set.
In addition, fetched results controllers:
Optionally monitor changes to objects in the associated managed object context, and report
changes in the results set to its delegate (see The controller’s delegate).
Optionally cache the results of its computation to enable redisplaying the same data without
repeating the work to fetch it. For more information, see The cache.
A controller thus effectively has three modes of operation, determined by whether it has a delega
and whether you set the cache file name.
No tracking: The delegate is nil. The controller provides access to the data as it was when it
fetched it.
Overview
Core Data / NSFetchedResultsController
Class
NSFetchedResultsController
A controller that you use to manage the results of a Core Data fetch request and t
display data to the user.
iOS 3.0+
iPadOS 3.0+
Mac Catalyst 13.1+
macOS 10.12+
tvOS
visionOS 1.0+
watchOS 2.0+


## Page 12

Memory-only tracking: the delegate is non-nil and the file cache name is nil. The controller
monitors objects in its result set and updates section and ordering information in response to
relevant changes.
Full persistent tracking: the delegate and the file cache name are non-nil. The controller
monitors objects in its result set and updates section and ordering information in response to
relevant changes. The controller maintains a persistent cache of the results of its computation.
Important
A delegate must implement at least one of the change tracking delegate methods to enable
change tracking. Providing an empty implementation of controllerDidChange
Content(_:) is sufficient.
You typically create an instance of NSFetchedResultsController as an instance variable of 
table view controller. When you initialize the fetch results controller, you provide four parameters:
A fetch request. This must contain at least one sort descriptor to order the results.
A managed object context. The controller uses this context to execute the fetch request.
Optionally, a key path on result objects that returns the section name. The controller uses the
key path to split the results into sections (passing nil indicates that the controller should
generate a single section).
Optionally, the name of the cache file the controller should use (passing nil prevents caching
Using a cache can avoid the overhead of computing the section and index information.
After creating an instance, you invoke performFetch() to actually execute the fetch:
Using NSFetchedResultsController
Creating the fetched results controller


## Page 13

Important
If you use a cache, call deleteCache(withName:) before changing any of the fetch
request, its predicate, or its sort descriptors. Don’t reuse the same fetched results controller
for multiple queries unless you set the cacheName to nil.
If you set a delegate for a fetched results controller, the controller registers to receive change
notifications from its managed object context. The controller processes any change in the contex
that affects the result set or section information and updates the results as necessary. The
controller notifies the delegate when result objects change location or when changes occur in
sections. For more information, see NSFetchedResultsControllerDelegate. You typically
use these methods to update the display of the table view.
Where possible, a controller uses a cache to avoid the need to repeat work performed in setting u
any sections and ordering the contents. The system maintains the cache across launches of your
application.
When you initialize an instance of NSFetchedResultsController, you typically specify a
cache name. If you don’t specify a cache name, the controller doesn’t cache data. When you crea
a controller, it looks for an existing cache with the given name:
The controller’s delegate
The cache


## Page 14

If the controller can’t find an appropriate cache, it calculates the required sections and the orde
of objects within sections. It then writes this information to disk.
If it finds a cache with the same name, the controller tests the cache to determine whether its
contents are still valid. The controller compares the current entity name, entity version hash, so
descriptors, and section key-path with those stored in the cache, as well as the modification
date of the cached information file and the persistent store file.
If the cache is consistent with the current information, the controller reuses the previously-
computed information.
If the cache isn’t consistent with the current information, then the controller recomputes the
required information and updates the cache.
Any time the section and ordering information change, the controller updates cache.
If you create multiple fetched results controllers with different configurations, such as different so
descriptors, give each configuration a different cache name.
You can purge a cache using deleteCache(withName:).
You ask the object to provide relevant information in your implementation of the table view data
source methods:
Implementing the table view datasource methods


## Page 15

INSFetchedResultsController responds to changes at the model layer, and informs its
delegate when result objects change location or when sections change.
If you allow a user to reorder table rows, then your implementation of the delegate methods must
take this into account; see NSFetchedResultsControllerDelegate.
The controller doesn’t show changes until after its managed object context receives a process
PendingChanges() message. Therefore, if you change the value of a managed object’s attribu
so that its location in a fetched results controller’s results set changes, its index as reported by th
controller won’t typically change until the end of the current event cycle, when the system calls
processPendingChanges(). For example, the following code would log “same”:
Responding to changes


## Page 16

You can’t change the fetch request to modify the results. Do the following if you want to change t
fetch request:
1. Delete the cache if you’re using one, by calling deleteCache(withName:).
2. Change the fetch request.
3. Call performFetch().
Note
Don’t use a cache if you’re changing the fetch request.
When a managed object context notifies the fetched results controller of invalidated individual
objects, the controller treats these as deleted objects and sends the proper delegate calls.
Simultaneous invalidation of all the objects in a managed object context is possible, for example, 
a result of calling reset(), or if you remove a store from the persistent store coordinator. When
this happens, NSFetchedResultsController doesn’t invalidate all objects, nor does it send
individual notifications for object deletions. Instead, you need to call performFetch() to reset
the state of the controller then reload the data in the table view (reloadData()).
Modifying the fetch request
Handling object invalidation


## Page 17

You create a subclass of this class if you want to customize the creation of sections and index
titles. You override sectionIndexTitle(forSectionName:) if you want the section index ti
to be something other than the capitalized first letter of the section name. You override section
IndexTitles if you want the index titles to be something other than the array created by calling
sectionIndexTitle(forSectionName:) on all the known sections.
init(fetchRequest: NSFetchRequest<ResultType>, managedObjectContext:
NSManagedObjectContext, sectionNameKeyPath: String?, cacheName: String?
Returns a fetch request controller initialized using the given arguments.
func performFetch() throws
Executes the controller’s fetch request.
var fetchRequest: NSFetchRequest<ResultType>
The fetch request used to do the fetching.
var managedObjectContext: NSManagedObjectContext
The managed object context used to fetch objects.
var sectionNameKeyPath: String?
The key path of the attribute that determines which section the fetched entity belongs to.
var cacheName: String?
The name of the file used to cache section information.
var delegate: (any NSFetchedResultsControllerDelegate)?
The object that is notified when the fetched results changed.
class func deleteCache(withName: String?)
Deletes the cached section information with the given name.
Subclassing notes
Topics
Initializing a Fetched Results Controller
Getting Configuration Information
Accessing Results


## Page 18

var fetchedObjects: [ResultType]?
The results of the fetch.
func object(at: IndexPath) -> ResultType
Returns the object at the given index path in the fetch results.
func indexPath(forObject: ResultType) -> IndexPath?
Returns the index path of a given object.
var sections: [any NSFetchedResultsSectionInfo]?
The sections for the fetch results.
func section(forSectionIndexTitle: String, at: Int) -> Int
Returns the section number for a given section title and index in the section index.
func sectionIndexTitle(forSectionName: String) -> String?
Returns the corresponding section index entry for a given section name.
var sectionIndexTitles: [String]
The array of section index titles.
protocol NSFetchedResultsControllerDelegate
A delegate protocol that describes the methods that the associated fetched results controlle
calls when the fetch results change.
protocol NSFetchedResultsSectionInfo
A protocol that defines the interface for section objects vended by a fetched results controll
struct NSFetchRequestResultType
Constants that specify the possible result types a fetch request can return.
enum NSFetchedResultsChangeType
Constants that specify the possible types of changes that are reported.
Querying Section Information
Configuring Section Information
Responding to Changes


## Page 19

NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
class NSFetchRequest
A description of search criteria used to retrieve data from a persistent store.
class NSAsynchronousFetchRequest
A fetch request that retrieves results asynchronously and supports progress notification.
class NSAsynchronousFetchResult
A fetch result object that encompasses the response from an executed asynchronous fetch
request.
Relationships
Inherits From
Conforms To
See Also
Fetch requests


