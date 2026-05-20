# 000_Building a search interface for your app.pdf

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


