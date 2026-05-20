# 005_CSSearchQueryContext.pdf

## Page 1

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


## Page 2

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


## Page 3

class CSUserQuery
A type you use to initiate searches from your interface and offer suggested text completions
class CSUserQueryContext
The configuration details to apply to a user query.
class CSSearchQuery
A type you use to programmatically search the indexed app content.
class CSSuggestion
The kind of suggestion to use in a query.


