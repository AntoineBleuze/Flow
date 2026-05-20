# Queries.pdf

## Page 1

Adding search tools to your app gives people a way to find content more easily. Whether you add
search controls to an app window or to one of the views in your interface, use Spotlight to genera
the search results for your content. Spotlight searches the content you already indexed, and
provides relevant text completions and results for you to display. In iOS 18 and macOS 15 and late
Spotlight also supports semantic searches of your content, in addition to lexical matching of a
search term.
To take full advantage of search in your interface, make sure you index your app’s content and
provide it to Spotlight. As your app generates or changes its content, send the details of those
changes to Spotlight so it can update its indexes. It’s also important to provide an app extension
that Spotlight can call to regenerate those details on demand. For more information about
providing Spotlight with your app’s data, see Adding your app’s content to Spotlight indexes.
Apple’s UI frameworks provide search controls you can add to your interface, and support to
provide a consistent search experience. Incorporate these controls into your views and use the
built-in support to initiate searches and display the results.
In SwiftUI, add a searchable modifier to a view in your interface. This modifier creates an
implicit search field in your interface and binds it to the string you use to initiate queries. For
more information, see Adding a search interface to your app.
In UIKit, add a UISearchBar control to your interface, and display results using an associated
UISearchController.
In AppKit, NSSearchField provides a text field with search-related behaviors.
Overview
Add a search field to your interface
Core Spotlight / Building a search interface for your app
Article
Building a search interface for your app
Add a search interface to your app to execute Spotlight queries and offer
suggested text completions.


## Page 2

The built-in search controls provide features that people expect when searching for content, such
as text completions and text tokens. You can also apply filters to limit the scope of the search to a
particular part of your app. Core Spotlight helps you implement these features by providing the
data you need for your app’s interface in a compatible format.
To ensure initial searches happen quickly, call the prepare() class method. Call this method
before you need to perform queries, such as when the view that presents your search interface fi
appears. You don’t need to call the method more than once when your app is running, and you
don’t need to execute the query itself. The method prepares Core Spotlight resources, which can
take a noticeable amount of time. It also increases your app’s memory footprint, so call it as late a
possible to minimize the performance impact.
When someone types a value into your app’s search control, don’t execute the query immediately
Instead, give the person a small amount of time to type more text into the search field. For examp
wait 0.3 seconds after each new keystroke before starting a query with the current text. If a new
keystroke arrives before the time elapses, reset the waiting period. Starting the query on a delay
keeps your app responsive to keystrokes, and doesn’t waste time executing searches and throwin
away the results.
To configure a query with text from a search control, use a CSUserQuery object. User queries ar
for situations where your app takes input directly from a person. Pass the search text directly to t
query object, along with a CSUserQueryContext object with any additional query parameters.
The following example configures a context object with the attributes to fetch for search results
and configures some additional search parameters. The searchText variable contains the string
from the search control.
To execute the query in Swift and get the results, fetch the responses property of the query
object. This property contains an AsyncSequence that delivers values to your app as they
become available. Fetching this sequence starts the query and begins delivering both results and
suggestions asynchronously to your code. For each response, determine whether it is a search
Prepare the search system
Execute a query and receive the responses


## Page 3

result or a suggested text completion and update your interface appropriately. The following
example shows a template to use to process responses from the query:
If you’re not using Swift or prefer to use process results and suggestions separately, configure the
appropriate handlers for your query object and call the start() method. As Spotlight generates
results, it delivers them to the handlers in the foundItemsHandler and foundSuggestions
Handler properties of the query object. Use those handlers to process results and suggestions
and display them in your interface. You can also add a completion handler to the query to
determine when Spotlight finishes delivering results.
When someone interacts with your search control, you typically create multiple query objects to
generate results. Query objects run only once, and you don’t reuse them by changing the query
string. When the person types more text into your search control, cancel the previous query and
create a new one for the new string.
For more information about how to configure query parameters, see CSUserQueryContext.
Suggestions make it easier for someone to discover relevant search terms from your search
interface. The CSUserQuery object you use to fetch results also generates suggestions that you
can use to populate your search interface. You can display these suggestions any time someone
Display completions for typed text


## Page 4

interacts with your search control. When you execute a query, Spotlight offers a set of ranked
suggestions based on the query text and your app’s content.
To display suggested text completions from a SwiftUI, add a searchSuggestions(_:) modifie
to your view. The modifier takes a closure, which you use to build views for the suggestions. Whe
collecting responses using the responses asynchronous sequence, save the CSUserQuery
.Suggestion structures you receive and use them to create your views. Each structure contains
a CSSuggestion object with the details of the suggestion. The following example iterates over t
list of structures and builds a set of text views from the provided suggestions.
Note
If you receive suggestions using the foundSuggestionsHandler closure, the system
provides the CSSuggestion objects directly. Extract the data from those objects and use it to
build your views.
To display suggestions from a UISearchController in your UIKit app, create UISearch
SuggestionItem objects for each suggestion you receive from your query. When you add those
suggestion items to the searchSuggestions property of the search controller, it automatically
displays them from its interface. Each time you execute a new query, clear the old search
suggestions from this property and add the new ones.
For more information on adding search suggestions to your SwiftUI views, see Suggesting search
terms.
See Also
Queries


## Page 5

Searching for information in your app
Search for app-specific content and refine search results using predicates and filters.
class CSUserQuery
A type you use to initiate searches from your interface and offer suggested text completions
class CSUserQueryContext
The configuration details to apply to a user query.
class CSSearchQuery
A type you use to programmatically search the indexed app content.
class CSSearchQueryContext
The behavior configuration to use for a search query.
class CSSuggestion
The kind of suggestion to use in a query.


## Page 6

Add search capabilities to your app to find relevant information quickly. Instead of building your
own custom search tools, index your content using the Core Spotlight APIs and use the framewor
provided queries to retrieve information. Indexing your content makes it available to both your app
and to the system’s Spotlight search feature.
Use a CSSearchQuery object to execute a search of your app’s indexed content. With this query
object, you specify which attributes of an item to match, and the values that constitute a match.
For example, you might tell the query to look for media clips with a duration in a specific range.
Although you might incorporate input from your app’s UI when building your query string, use this
query type to match specific attributes of your indexed content. For information about how to
search based solely on input from a person, see Building a search interface for your app.
When you execute a query, the system doesn’t automatically retrieve every property of your
CSSearchableItem objects. Instead, it retrieves only the properties you specifically request. Th
behavior improves performance by not spending time to retrieve information your app doesn’t
need.
Identify the properties you want, and specify the property names as strings when you initialize yo
query. For example, to fetch the title and display name of each item, include “title” and
“displayName” strings in the fetchAttributes property of your context object.
Overview
Select the attributes you want the query to retrieve
Create a query string for your search
Core Spotlight / Searching for information in your app
Article
Searching for information in your app
Search for app-specific content and refine search results using predicates and
filters.


## Page 7

When you execute a query, Core Spotlight evaluates each item in the index against a query string
you provide. Construct your query string from one or more predicates, and use each predicate to
evaluate an attribute of the indexed item. If the predicates in the overall query string evaluate to
true for an item, the query object returns the item in the search results. For each predicate in your
query string, use one of the following formats:
attributeName operator value[modifiers]
InRange(attributeName, minValue, maxValue)
In both formats, attributeName is a property name from the CSSearchableItemAttribute
Set class. For example, to evaluate the title property of the item, use “title” as the attribute
name. The InRange predicate determines whether a property with a numeric value is between th
specified minimum and maxium values. Other predicates compare the attribute to the value you
specify using one of the following operators:
Operator
Definition
==
Equal.
!=
Not equal.
<
Less than. Works only for numeric and date values.
>
Greater than. Works only for numeric and date values.
<=
Less than or equal. Works only for numeric and date values.
>=
Greater than or equal. Works only for numeric and date values.
When comparing text values, use modifiers to change the matching behavior the query applies to
the comparison. Queries support the following modifiers:
Modifier
Behavior
c
Performs a case-insensitive search.
d
Performs a search that ignores diacritical marks.
w
Matches on word boundaries. This modifier treats transitions from lowercase to
uppercase as word boundaries.
t
Performs a search on a tokenized value. For example, a search field can contain
tokenized values.


## Page 8

Modifier
Behavior
*
Performs a wildcard search. Match a substring at the beginning, end, or middle.
\
Don’t interpret the character that follows. Use this to include special characters.
Examples include \’ and \”.
Combine two predicates using either an AND or OR operation, listed in the table below. Use
parentheses to prioritize the evaluation of predicates.
Combination
operator
Definition
&&
AND operator. If both predicates are true, the entire result is true. If one
predicate is false, the result is false.
||
OR operator. If either predicate is true, the entire result is true. Otherwise,
the result is false.
The following examples show how operators, modifiers, and parentheses work for query strings.
When trying to match a specific word, notice that the w modifier is more precise than a wildcard
because of how it matches word boundaries.
Query string
Example matches
title == “Paris”
Matches “Paris” but not “paris” or “I love
Paris”.
title == “Paris”c
Matches “Paris” and “paris”, but not “I love
Paris”.
title == “Paris”wc
Matches “Paris”, “paris”, “I love Paris”, and
“paris-france.jpg”, but not “Comparison”.
title == “Window”w
Matches “MyWindowClass” and “Broken
Window”, but not “NSWindow”.
authorNames == “Frédéric”
Matches “Frédéric”, but not “Frederic”.
authorNames == “Frédéric”cd
Matches “Frédéric” and “Frederic”, regardless
of case.


## Page 9

Query string
Example matches
title == “paris*”
Matches words that begin with “paris” like
“paris” and “parisol” but not “comparison”.
title == “*paris”
Matches words that end with “paris”.
title == “*paris*”
Matches words that contain “paris” anywhere
in the string, including “paris”, “parisol”, and
“comparison”.
title == ‘paris’
Matches a value that is exactly equal to
“paris”.
authorNames == “Steve”wc &&
contentType == “audio”wc’
Matches audio items that Steve authored.
authorNames == "Steve"wc &&
(contentType == "audio"wc ||
contentType == "video"wc)
Matches any audio or video items that Steve
authored.
When an attribute contains a date or time value, there are two ways you can specify the value
portion of your predicate:
Specify a floating-point value with the number of seconds relative to January 1, 2001. You can
get this value from a CFDate or Date type using the CFDateGetAbsoluteTime(_:)
function.
Specify a property of the built-in $time variable.
CSSearchQuery provides the $time variable as a convenient way to specify date values in your
query strings. When you start a query, the system initializes this variable to the current date and
time. Include this variable in the value portion of your predicate to compare a date-based attribute
to the date you specify. The following table lists the properties of the variable you can use in your
predicates and how the query matches them against attributes.
$time property
Description
$time.now
Matches an attribute set to the current date and time.
$time.today
Matches an attribute set to the current date.
Match dates and times in a query string


## Page 10

$time property
Description
$time.yesterday
Matches an attribute set to yesterday’s date.
$time.last_week
Matches an attribute set to a date from the week before the current
week.
$time.this_week
Matches an attribute set to a date from this week.
$time.this_month
Matches an attribute set to a date in the current month.
$time.this_year
Matches an attribute set to a date in the current year.
$time.now(NUMBER)
Adds NUMBER seconds to the current date and time and matches
the attribute against that value. You can specify negative or positive
numbers.
$time
.today(NUMBER)
Adds NUMBER days to the current date and matches the attribute
against that value. You can specify negative or positive numbers.
$time.this
_week(NUMBER)
Adds NUMBER weeks to the current date and matches the attribute
against that value. You can specify negative or positive numbers.
$time.this
_month(NUMBER)
Adds NUMBER months to the current date and matches the attribute
against that value. You can specify negative or positive numbers.
$time.this
_year(NUMBER)
Adds NUMBER years to the current date and matches the attribute
against that value. You can specify negative or positive numbers.
$time.iso(ISO-
8601-STR)
Matches the date you specify using an ISO-8601-STR compliant
string.
The following example shows a query string that includes different types of predicates and
modifiers and uses the $time variable. The predicate matches an item if author is either Tim or
Steve and the item’s completion date occurred within the past 10 days. For the completion date
check, adding a negative number to the $time.today variable creates a date in the past.
Start the query and process the results


## Page 11

Search queries are one-shot objects. While they run, they deliver matching items asynchronously
to the handlers you provide. When there are no more items, the query stops. You can also stop a
query early by calling its cancel() method before the system delivers all matching results.
Create a new query using a query string and a CSSearchQueryContext object, which contains
the query configuration parameters. Start the query by fetching the results property of the que
object and iterating over the results. The property contains an AsyncSequence, and fetching it
starts the query and begins the delivery of the results. The following function searches for items
with a specific title and processes the results in an asynchronous task:


## Page 12

If you prefer not to process the results using an AsyncSequence, specify values for the found
ItemsHandler and completionHandler properties. When using handler blocks, you’re
responsible for calling the start() method to start the query. To deliver results, the query calls
your foundItemsHandler block one or more times, delivering new results with each call. The
system executes your completion handler block only once after it finishes delivering all the results
Important
Process results using either the results property or handler blocks, but not both.
The following code shows a version of the previous method that uses handler blocks to process t
results.


## Page 13

Building a search interface for your app
Add a search interface to your app to execute Spotlight queries and offer suggested text
completions.
class CSUserQuery
A type you use to initiate searches from your interface and offer suggested text completions
class CSUserQueryContext
The configuration details to apply to a user query.
class CSSearchQuery
A type you use to programmatically search the indexed app content.
class CSSearchQueryContext
The behavior configuration to use for a search query.
class CSSuggestion
The kind of suggestion to use in a query.
See Also
Queries


## Page 14

Building a search interface for your app
A CSUserQuery object provides the back-end support for your app’s search features. Combine
this object with your app’s search interface to perform lexical and semantic searches of human-
entered search terms. You can configure a query object to return ranked or unranked results. You
can also use it to get a list of suggestions to display from your search interface.
When the text in your search control changes, create a query object to begin searching for results
based on the current text. You use a query object only once to perform a search. If the text
changes again while a previous query is in progress, cancel the old query and execute the new on
For this reason, it’s a good idea to delay the start of each query until there is a sufficient gap
between changes.
Configure the query parameters using a CSUserQueryContext object, which you can reuse for
multiple queries. The context lets you configure the behavior for ranking results, specify the
maximum number of results and suggestions, and filter the results using a predicate string. When
you’re ready to start the query, choose one of the following options:
Get the value of the responses property and iterate over the results.
Configure the foundItemsHandler property and call start() to execute the query manual
Mentioned in
Overview
Core Spotlight / CSUserQuery
Class
CSUserQuery
A type you use to initiate searches from your interface and offer suggested text
completions.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
visionOS 1.0+


## Page 15

Each query runs until Spotlight returns the requested maximum number of results. If you don’t
specify the maximum number of results, Spotlight runs until it returns all results. To end a search
before you receive all the results, call the cancel() method. Cancelling a query is especially
important if you’re about to start a new query with an updated search string.
For more information about configuring a CSUserQuery object, see Building a search interface f
your app.
init(userQueryString: String?, userQueryContext: CSUserQueryContext?)
Creates a new user query that searches for the specified term.
class func prepare()
Performs one-time tasks that prepare Spotlight to search for content in all search indexes.
class func prepareProtectionClasses([FileProtectionType])
Performs one-time tasks that prepare Spotlight to search for content in one or more protecte
search indexes.
var responses: CSUserQuery.Responses
The matching results and suggestions for the current query string.
var suggestions: CSUserQuery.Suggestions
An asynchronous sequence of suggested completions for the current query text.
struct Responses
An asynchronous sequence that contains the results and suggestions for a query string.
struct Suggestions
An asynchronous sequence that contains the suggested completions for a search string.
struct Item
A search result that the query returns in a response.
Topics
Creating a user query
Preparing to search
Executing the query automatically


## Page 16

struct Suggestion
A suggested text completion for a query’s search term.
func start()
Starts searching the index for items that match the current query string and parameters.
func cancel()
Cancels the current query operation.
var foundSuggestionsHandler: (([CSSuggestion]) -> Void)?
The block to execute when the query delivers a new batch of suggested items.
var foundSuggestionCount: Int
The number of suggested items the query found so far.
func userEngaged(CSUserQuery.Item, visibleItems: [CSUserQuery.Item],
interaction: CSUserQuery.UserInteractionKind)
Notifies the system that someone engaged with a specific search result in your app’s
interface.
func userEngaged(CSUserQuery.Suggestion, visibleSuggestions: [CSUser
Query.Suggestion], interaction: CSUserQuery.UserInteractionKind)
Notifies the system that someone engaged with a specific text completion in your app’s
interface.
enum UserInteractionKind
Constants that indicate how someone engaged with search-related content.
CSSearchQuery
Executing the query with handler blocks
Improving the quality of ranked results
Relationships
Inherits From


## Page 17

CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Building a search interface for your app
Add a search interface to your app to execute Spotlight queries and offer suggested text
completions.
Searching for information in your app
Search for app-specific content and refine search results using predicates and filters.
class CSUserQueryContext
The configuration details to apply to a user query.
class CSSearchQuery
A type you use to programmatically search the indexed app content.
class CSSearchQueryContext
The behavior configuration to use for a search query.
class CSSuggestion
The kind of suggestion to use in a query.
Conforms To
See Also
Queries


## Page 18

Building a search interface for your app
Use an instance of CSUserQueryContext to configure the search parameters for a CSUser
Query object. This object stores configuration details that the query uses to modify the search
results it delivers. For example, use this object to specify the maximum number of results or
suggestions you want the query to return. You can also use it to enable or disable the ranking of
results by Spotlight.
For information about search filters and other configurable query parameters, see the parent clas
CSSearchQueryContext.
init(currentSuggestion: CSSuggestion?)
Creates a new query context object with an optional suggested search string.
Mentioned in
Overview
Topics
Creating a query context
Core Spotlight / CSUserQueryContext
Class
CSUserQueryContext
The configuration details to apply to a user query.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
visionOS 1.0+


## Page 19

var maxResultCount: Int
The maximum number of search results for the query to return.
var maxSuggestionCount: Int
The maximum number of suggested text completions for the query to return.
var disableSemanticSearch: Bool
A Boolean value that indicates whether to exclude semantic-based search results from the
output.
var enableRankedResults: Bool
A Boolean value that indicates whether the query sorts results by their relevance.
var maxRankedResultCount: Int
The maximum number of ranked results to return during the query.
CSSearchQueryContext
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCoding
NSCopying
NSObjectProtocol
Configuring search options
Configuring the ranked results behavior
Relationships
Inherits From
Conforms To


## Page 20

NSSecureCoding
Building a search interface for your app
Add a search interface to your app to execute Spotlight queries and offer suggested text
completions.
Searching for information in your app
Search for app-specific content and refine search results using predicates and filters.
class CSUserQuery
A type you use to initiate searches from your interface and offer suggested text completions
class CSSearchQuery
A type you use to programmatically search the indexed app content.
class CSSearchQueryContext
The behavior configuration to use for a search query.
class CSSuggestion
The kind of suggestion to use in a query.
See Also
Queries


## Page 21

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


## Page 22

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


## Page 23

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


## Page 24

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


## Page 25

Searching for information in your app
var fetchAttributes: [String]
The attributes the system fetches for the searchable items.
var keyboardLanguage: String?
The language used for the query.
var sourceOptions: CSSearchQueryContext.SourceOptions
The query source options to allow or deny Mail messages in the search.
struct SourceOptions
The query source options to allow or deny Mail messages in the search.
Mentioned in
Topics
Configuring search behavior
Filtering the results
Core Spotlight / CSSearchQueryContext
Class
CSSearchQueryContext
The behavior configuration to use for a search query.
iOS 10.0+
iPadOS 10.0+
Mac Catalyst 13.1+
macOS 10.13+
visionOS 1.0+


## Page 26

var filterQueries: [String]
The query string used to filter the results.
NSObject
CSUserQueryContext
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCoding
NSCopying
NSObjectProtocol
NSSecureCoding
Building a search interface for your app
Add a search interface to your app to execute Spotlight queries and offer suggested text
completions.
Searching for information in your app
Search for app-specific content and refine search results using predicates and filters.
Relationships
Inherits From
Inherited By
Conforms To
See Also
Queries


## Page 27

class CSUserQuery
A type you use to initiate searches from your interface and offer suggested text completions
class CSUserQueryContext
The configuration details to apply to a user query.
class CSSearchQuery
A type you use to programmatically search the indexed app content.
class CSSuggestion
The kind of suggestion to use in a query.


## Page 28

Building a search interface for your app
Your app uses CSSuggestion objects to populate a contextual menu of suggestions.
var localizedAttributedSuggestion: AttributedString
An attributed string for the localized suggestion.
var suggestionKind: CSSuggestion.SuggestionKind
The type of suggestion.
enum SuggestionKind
The suggestion type that determines how the system handles a suggestion.
Mentioned in
Overview
Topics
Setting suggestion attributes
Core Spotlight / CSSuggestion
Class
CSSuggestion
The kind of suggestion to use in a query.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
visionOS 1.0+


## Page 29

func compare(CSSuggestion) -> ComparisonResult
Compares the suggestion with a second specified suggestion.
func compare(byRank: CSSuggestion) -> ComparisonResult
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCoding
NSCopying
NSObjectProtocol
NSSecureCoding
Building a search interface for your app
Add a search interface to your app to execute Spotlight queries and offer suggested text
completions.
Searching for information in your app
Search for app-specific content and refine search results using predicates and filters.
Comparing suggestions
Relationships
Inherits From
Conforms To
See Also
Queries


## Page 30

class CSUserQuery
A type you use to initiate searches from your interface and offer suggested text completions
class CSUserQueryContext
The configuration details to apply to a user query.
class CSSearchQuery
A type you use to programmatically search the indexed app content.
class CSSearchQueryContext
The behavior configuration to use for a search query.


