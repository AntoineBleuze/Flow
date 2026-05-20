# 008_Search for places that meet specific criteria to autocomplete a place search.pdf

## Page 1

q
string
(Required) The query to autocomplete. For example, q=eiffel.
excludePoiCategories
[PoiCategory]
A comma-separated list of strings that describes the points of interest to
exclude from the search results. For example, excludePoi
Categories=Restaurant,Cafe.
See PoiCategory for a complete list of possible values.
includePoiCategories
[PoiCategory]
A comma-separated list of strings that describes the points of interest to
include in the search results. For example, includePoi
Categories=Restaurant,Cafe.
See PoiCategory for a complete list of possible values.
lang
Lang
The language the server uses when returning the response, specified using a
BCP 47 language code. For example, for English, use lang=en-US.
Default: en-US
limitToCountries
[string]
A comma-separated list of two-letter ISO 3166-1 codes of the countries to lim
the results to. For example, limitToCountries=US,CA limits the search t
URL
Query Parameters
Apple Maps Server API / Search for places that meet specific criteria to autocomplete a place search
Web Service Endpoint
Search for places that meet specific
criteria to autocomplete a place search
Find results that you can use to autocomplete searches.
Apple Maps Server API 1.2+


## Page 2

the United States and Canada.
If you specify two or more countries, the results reflect the best available
results for some or all of the countries rather than everything related to the
query for those countries.
resultTypeFilter
[SearchACResultType]
A comma-separated list of strings that describes the kind of result types to
include in the response. For example, resultTypeFilter=Poi.
searchLocation
SearchLocation
A location the app defines as a hint. Specify the location as a comma-
separated string containing the latitude and longitude. For example, search
Location=37.78,-122.42.
If you don’t provide a searchLocation, the server uses userLocation a
searchRegion as fallback hints.
searchRegion
SearchRegion
A region the app defines as a hint for the search. Specify the region as a
comma-separated string that describes the region in the form of a north-
latitude, east-longitude, south-latitude, west-longitude string. If you don’t
provide searchLocation, the server uses userLocation and search
Region as fallback hints. For example, searchRegion=38,-122.1,37
.5,-122.5.
userLocation
UserLocation
The location of the user, specified as a comma-separated string that contains
the latitude and longitude. For example, userLocation=37.78,-122.42.
Certain APIs, such as Search, may opt to use the userLocation, if specifie
as a fallback for the searchLocation.
searchRegionPriority
string
A value that indicates the importance of the configured region.
Possible Values: default, required
includeAddress
Categories
[AddressCategory]
A comma-separated list of strings that describes the addresses to include in
the search results. For example, includeAddressCategories=Sub
Locality,PostalCode. If you use this parameter, you must
include address in resultTypeFilter.
See AddressCategory for a complete list of possible values.
excludeAddress
Categories
[AddressCategory]
A comma-separated list of strings that describes the addresses to exclude in
the search results. For example, excludeAddress
Categories=Country,AdministrativeArea. If you use this paramete
you must include address in resultTypeFilter.
See AddressCategory for a complete list of possible values.
200
OK
Response Codes


## Page 3

SearchAutocomplete
Response
Returns a list of SearchAutocompleteResponse results.
Content-Type: application/json
400
ErrorResponse
Bad Request
An ErrorResponse object that contains an error message and an array of
strings that contain additional details about the error.
Content-Type: application/json
401
ErrorResponse
Unauthorized
An ErrorResponse object that contains an error message that indicates th
Maps access token is missing or invalid, and an array of strings that contains
additional details about the error.
Content-Type: application/json
429
ErrorResponse
An ErrorResponse object that indicates the call exceeds the daily service
call quota for the authorization token. The app can try again later. If your app
requires a larger daily quota, submit a quota increase request form.
Content-Type: application/json
500
ErrorResponse
Internal Server Error
An ErrorResponse object that contains a server error message and an arra
of strings that describe additional details about the error.
Content-Type: application/json
type AddressCategory
Search categories related to political geographical boundaries.
type SearchACResultType
Discussion
Example
Response
See Also
Searching
Request


## Page 4

An enumerated string that indicates the result type for the search request.
type SearchResultType
An enumerated string that indicates the result type for the search autocomplete request.
object AlternateIdsResponse
A list of alternate Place IDs and associated errors.
object AlternateIdsResponse.AlternateIds
Contains a list of alternate Place IDs for a given Place ID.
object PlacesResponse
A list of Place IDs and errors.
object PlacesResponse.PlaceLookupError
An error associated with a lookup call.
Search for places that match specific criteria
Find places by name or by specific search criteria.
Search for a place using an identifier
Obtain a Place object for a given Place ID.
Search for places using mulitple identifiers
Obtain a set of Place objects for a given set of Place IDs.
Obtain a list of alternate place identifiers
Get a list of alternate Place IDs given one or more Place IDs.


