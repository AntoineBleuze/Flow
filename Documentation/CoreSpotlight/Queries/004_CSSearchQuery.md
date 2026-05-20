# 004_CSSearchQuery.pdf

## Page 1

Searching for information in your app
Use a CSSearchQuery object to search your app’s indexed content using a formatted search
string. To perform a search, build a predicate string to specify the indexed attributes you want to
search and the value you want them to match. After you start the query, you receive batches of
results in the handlers you provide.
Each CSSearchQuery object you create performs a single search operation and delivers the
results back to your code. Build each predicate with an attribute name, one or more values, and
either a comparison operator or the InRange operator. Your predicate string takes one of the
following forms:
attributeName operator value[modifiers]
InRange(attributeName, minValue, maxValue)
Queries search all of your app’s indexes by default. If your app encrypts some of its indexed data,
you can limit your search to one or more of the encrypted indexes by updating the query’s
protectionClasses property. The query must have access to the protected index to search it
For more information about how to construct predicate strings for your query, see Searching for
information in your app.
Mentioned in
Overview
Core Spotlight / CSSearchQuery
Class
CSSearchQuery
A type you use to programmatically search the indexed app content.
iOS 10.0+
iPadOS 10.0+
Mac Catalyst 13.1+
macOS 10.13+
visionOS 1.0+


## Page 2

convenience init(queryString: String, attributes: [String]?)
Initializes and returns a query object with the specified query string and item attributes.
Deprecated
init(queryString: String, queryContext: CSSearchQueryContext?)
Initializes and returns a query object with the specified query string and query context.
let CSSearchQueryString: String
Provides the key for the current query in the info dictionary of the user activity object.
let CSQueryContinuationActionType: String
Indicates that the activity type to continue is a search or query.
var protectionClasses: [FileProtectionType]
The protection types of the indexes you want to search.
var results: CSSearchQuery.Results
The results that match the current query string.
struct Results
An asynchronous sequence that contains the results that match the query string.
func start()
Starts searching the index for items that match the current query string and parameters.
func cancel()
Topics
Creating a query object
Continuing an activity
Specifying the indexes to search
Executing the query automatically
Executing the query with handler blocks


## Page 3

Cancels the current query operation.
var isCancelled: Bool
A Boolean value that indicates whether the current query is no longer running.
var foundItemCount: Int
The number of matching items found for the given query string.
var foundItemsHandler: (([CSSearchableItem]) -> Void)?
The block to execute when the query delivers a new batch of matching items.
var completionHandler: (((any Error)?) -> Void)?
The block to execute when the query finishes delivering all results.
NSObject
CSUserQuery
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Relationships
Inherits From
Inherited By
Conforms To
See Also
Queries


## Page 4

Building a search interface for your app
Add a search interface to your app to execute Spotlight queries and offer suggested text
completions.
Searching for information in your app
Search for app-specific content and refine search results using predicates and filters.
class CSUserQuery
A type you use to initiate searches from your interface and offer suggested text completions
class CSUserQueryContext
The configuration details to apply to a user query.
class CSSearchQueryContext
The behavior configuration to use for a search query.
class CSSuggestion
The kind of suggestion to use in a query.


