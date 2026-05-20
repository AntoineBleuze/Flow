# 000_NSFileProviderSearching.pdf

## Page 1

Implement this protocol in your provider’s principal class to support searching files in cloud
storage. To make search available to the person using the device, also set the property support
StringSearchRequest to true.
Tip
You don’t need to implement this protocol if you only want to expose the contents of the
working set to system search.
When the person using the device performs a search, the system calls the NSFileProvider
Searching implementation for all the accounts they’ve chosen to search. Your implementation
returns a NSFileProviderSearchEnumerator, which receives repeated callbacks to
enumerateSearchResults(for:startingAt:) until one of the following occurs:
The system has received enough results.
The system has received all results.
The person enters another character into the query string, thereby canceling this search and
starting another.
The person explicitly cancels the search.
Overview
File Provider / NSFileProviderSearching
Protocol
NSFileProviderSearching
A protocol you implement to support searching in your file provider.
macOS 26.0+


## Page 2

func searchEnumerator(for: NSFileProviderStringSearchRequest) -> any
NSFileProviderSearchEnumerator
Provides an object that enumerates over search results, in response to a call from the system
Required
class NSFileProviderStringSearchRequest
A type that contains details of a string-based search request.
protocol NSFileProviderSearchEnumerator
A protocol that defines methods for providing search results and canceling searches.
NSObjectProtocol
Topics
Implementing search
Relationships
Inherits From


