# 006_CSSuggestion.pdf

## Page 1

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


## Page 2

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


## Page 3

class CSUserQuery
A type you use to initiate searches from your interface and offer suggested text completions
class CSUserQueryContext
The configuration details to apply to a user query.
class CSSearchQuery
A type you use to programmatically search the indexed app content.
class CSSearchQueryContext
The behavior configuration to use for a search query.


