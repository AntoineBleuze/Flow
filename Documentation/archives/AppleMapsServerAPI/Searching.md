# Searching.pdf

## Page 1

Country
AdministrativeArea
SubAdministrativeArea
Locality
SubLocality
PostalCode
Country
Countries and regions. AdministrativeArea The primary administrative divisions of countries o
regions.
SubAdministrativeArea
The secondary administrative divisions of countries or regions.
Locality
Local administrative divisions, postal cities and populated places.
Possible Values
Possible Values
Apple Maps Server API / AddressCategory
Type
AddressCategory
Search categories related to political geographical boundaries.
Apple Maps Server API 1.2+


## Page 2

SubLocality
Local administrative sub-divisions, postal city sub-districts, and neighborhoods.
PostalCode
A code assigned to addresses for mail sorting and delivery.
type SearchACResultType
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
Search for places that meet specific criteria to autocomplete a place
search
Find results that you can use to autocomplete searches.
Search for a place using an identifier
Obtain a Place object for a given Place ID.
Search for places using mulitple identifiers
Obtain a set of Place objects for a given set of Place IDs.
Obtain a list of alternate place identifiers
See Also
Searching


## Page 3

Get a list of alternate Place IDs given one or more Place IDs.


## Page 4

poi
address
physicalFeature
pointOfInterest
query
poi
A point of interest. address An address such as a street address, suburb, city, state, or count
physicalFeature
A natural physical feature, such as a river, mountain, or delta.
pointOfInterest
A point of interest. query A search query string.
Possible Values
Possible Values
Apple Maps Server API / SearchACResultType
Type
SearchACResultType
An enumerated string that indicates the result type for the search request.
Apple Maps Server API 1.2+


## Page 5

type AddressCategory
Search categories related to political geographical boundaries.
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
Search for places that meet specific criteria to autocomplete a place
search
Find results that you can use to autocomplete searches.
Search for a place using an identifier
Obtain a Place object for a given Place ID.
Search for places using mulitple identifiers
Obtain a set of Place objects for a given set of Place IDs.
Obtain a list of alternate place identifiers
Get a list of alternate Place IDs given one or more Place IDs.
See Also
Searching


## Page 6

poi
address
physicalFeature
pointOfInterest
poi
A physical feature or a point of interest.
address
An address such as a street address, suburb, city, state, or country.
physicalFeature
A natural physical feature, such as a river, mountain, or delta.
pointOfInterest
A point of interest such as a cafe or grocery store.
Possible Values
Possible Values
Apple Maps Server API / SearchResultType
Type
SearchResultType
An enumerated string that indicates the result type for the search autocomplete
request.
Apple Maps Server API 1.2+


## Page 7

type AddressCategory
Search categories related to political geographical boundaries.
type SearchACResultType
An enumerated string that indicates the result type for the search request.
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
Search for places that meet specific criteria to autocomplete a place
search
Find results that you can use to autocomplete searches.
Search for a place using an identifier
Obtain a Place object for a given Place ID.
Search for places using mulitple identifiers
Obtain a set of Place objects for a given set of Place IDs.
Obtain a list of alternate place identifiers
Get a list of alternate Place IDs given one or more Place IDs.
See Also
Searching


## Page 8

errors
[PlacesResponse
.PlaceLookupError]
A list f of PlacesResponse.PlaceLookupError results.
results
[AlternateIds
Response.Alternate
Ids]
A list of AlternateIdsResponse.AlternateIds results.
object AlternateIdsResponse.AlternateIds
Contains a list of alternate Place IDs for a given Place ID.
Properties
Topics
Objects
See Also
Apple Maps Server API / AlternateIdsResponse
Object
AlternateIdsResponse
A list of alternate Place IDs and associated errors.
Apple Maps Server API 1.2+


## Page 9

type AddressCategory
Search categories related to political geographical boundaries.
type SearchACResultType
An enumerated string that indicates the result type for the search request.
type SearchResultType
An enumerated string that indicates the result type for the search autocomplete request.
object AlternateIdsResponse.AlternateIds
Contains a list of alternate Place IDs for a given Place ID.
object PlacesResponse
A list of Place IDs and errors.
object PlacesResponse.PlaceLookupError
An error associated with a lookup call.
Search for places that match specific criteria
Find places by name or by specific search criteria.
Search for places that meet specific criteria to autocomplete a place
search
Find results that you can use to autocomplete searches.
Search for a place using an identifier
Obtain a Place object for a given Place ID.
Search for places using mulitple identifiers
Obtain a set of Place objects for a given set of Place IDs.
Obtain a list of alternate place identifiers
Get a list of alternate Place IDs given one or more Place IDs.
Searching


## Page 10

alternateIds
[string]
A list of alternate Place IDs for id.
id
string
The Place ID.
type AddressCategory
Search categories related to political geographical boundaries.
type SearchACResultType
An enumerated string that indicates the result type for the search request.
type SearchResultType
An enumerated string that indicates the result type for the search autocomplete request.
object AlternateIdsResponse
Properties
See Also
Searching
Apple Maps Server API / AlternateIdsResponse / AlternateIdsResponse.AlternateIds
Object
AlternateIdsResponse.AlternateIds
Contains a list of alternate Place IDs for a given Place ID.
Apple Maps Server API 1.2+


## Page 11

A list of alternate Place IDs and associated errors.
object PlacesResponse
A list of Place IDs and errors.
object PlacesResponse.PlaceLookupError
An error associated with a lookup call.
Search for places that match specific criteria
Find places by name or by specific search criteria.
Search for places that meet specific criteria to autocomplete a place
search
Find results that you can use to autocomplete searches.
Search for a place using an identifier
Obtain a Place object for a given Place ID.
Search for places using mulitple identifiers
Obtain a set of Place objects for a given set of Place IDs.
Obtain a list of alternate place identifiers
Get a list of alternate Place IDs given one or more Place IDs.


## Page 12

errors
[PlacesResponse
.PlaceLookupError]
A list of PlacesResponse.PlaceLookupError results.
results
[Place]
A list of Place results.
object PlacesResponse.PlaceLookupError
An error associated with a lookup call.
Properties
Topics
Objects
See Also
Searching
Apple Maps Server API / PlacesResponse
Object
PlacesResponse
A list of Place IDs and errors.
Apple Maps Server API 1.2+


## Page 13

type AddressCategory
Search categories related to political geographical boundaries.
type SearchACResultType
An enumerated string that indicates the result type for the search request.
type SearchResultType
An enumerated string that indicates the result type for the search autocomplete request.
object AlternateIdsResponse
A list of alternate Place IDs and associated errors.
object AlternateIdsResponse.AlternateIds
Contains a list of alternate Place IDs for a given Place ID.
object PlacesResponse.PlaceLookupError
An error associated with a lookup call.
Search for places that match specific criteria
Find places by name or by specific search criteria.
Search for places that meet specific criteria to autocomplete a place
search
Find results that you can use to autocomplete searches.
Search for a place using an identifier
Obtain a Place object for a given Place ID.
Search for places using mulitple identifiers
Obtain a set of Place objects for a given set of Place IDs.
Obtain a list of alternate place identifiers
Get a list of alternate Place IDs given one or more Place IDs.


## Page 14

errorCode
string
An error code that indicates whether an Place ID is invalid because it’s
malformed, not found, or resulted in any other error.
Possible Values: FAILED_INVALID_ID, FAILED_NOT_FOUND,
FAILED_INTERNAL_ERROR
id
string
The Place ID.
type AddressCategory
Search categories related to political geographical boundaries.
type SearchACResultType
An enumerated string that indicates the result type for the search request.
type SearchResultType
An enumerated string that indicates the result type for the search autocomplete request.
Properties
See Also
Searching
Apple Maps Server API / PlacesResponse / PlacesResponse.PlaceLookupError
Object
PlacesResponse.PlaceLookupError
An error associated with a lookup call.
Apple Maps Server API 1.2+


## Page 15

object AlternateIdsResponse
A list of alternate Place IDs and associated errors.
object AlternateIdsResponse.AlternateIds
Contains a list of alternate Place IDs for a given Place ID.
object PlacesResponse
A list of Place IDs and errors.
Search for places that match specific criteria
Find places by name or by specific search criteria.
Search for places that meet specific criteria to autocomplete a place
search
Find results that you can use to autocomplete searches.
Search for a place using an identifier
Obtain a Place object for a given Place ID.
Search for places using mulitple identifiers
Obtain a set of Place objects for a given set of Place IDs.
Obtain a list of alternate place identifiers
Get a list of alternate Place IDs given one or more Place IDs.


## Page 16

q
string
(Required) The place to search for. For example, q=eiffel tower.
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
limitToCountries
[string]
A comma-separated list of two-letter ISO 3166-1 codes of the countries to lim
the results to. For example, limitToCountries=US,CA limits the search t
the United States and Canada.
If you specify two or more countries, the results reflect the best available
results for some or all of the countries rather than everything related to the
query for those countries.
URL
Query Parameters
Apple Maps Server API / Search for places that match specific criteria
Web Service Endpoint
Search for places that match specific
criteria
Find places by name or by specific search criteria.
Apple Maps Server API 1.2+


## Page 17

resultTypeFilter
[SearchResultType]
A comma-separated list of strings that describes the kind of result types to
include in the response. For example, resultTypeFilter=Poi.
lang
Lang
The language the server should use when returning the response, specified
using a BCP 47 language code. For example, for English use lang=en-US.
Defaults to en-US.
Default: en-US
searchLocation
SearchLocation
A location defined by the application as a hint. Specify the location as a
comma-separated string containing the latitude and longitude. For example,
searchLocation=37.78,-122.42.
searchRegion
SearchRegion
A region the app defines as a hint. Specify the region specified as a comma-
separated string that describes the region in the form north-latitude,east-
longitude,south-latitude,west-longitude. For example, search
Region=38,-122.1,37.5,-122.5.
userLocation
UserLocation
The location of the user, specified as a comma-separated string that contains
the latitude and longitude. For example, userLocation=37.78,-122.42.
Search may opt to use the userLocation, if specified, as a fallback for the
searchLocation.
searchRegionPriority
string
A value that indicates the importance of the configured region.
Possible Values: default, required
enablePagination
boolean
A value that tells the server that we expect paginated results.
Default: false
pageToken
string
A value that indicates which page of results to return.
includeAddress
Categories
[AddressCategory]
A comma-separated list of strings that describes the addresses to include in
the search results. For example, includeAddressCategories=Sub
Locality,PostalCode. If you use this parameter, you must
include address in resultTypeFilter. See AddressCategory for a
complete list of possible values.
excludeAddress
Categories
[AddressCategory]
A comma-separated list of strings that describes the addresses to exclude in
the search results. For example, excludeAddress
Categories=Country,AdministrativeArea. If you use this paramete
you must include address in resultTypeFilter. See AddressCategor
for a complete list of possible values.
200
OK
Response Codes


## Page 18

SearchResponse
Returns a SearchMapRegion that describes a region that encloses the
results, and an array of SearchResponse objects that describes the results
the search.
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
Maps access token was missing or invalid, and an array of strings that contain
additional details about the error.
Content-Type: application/json
429
ErrorResponse
An ErrorResponse object that indicates the call exceeds the daily service
call quota for the authorization token presented. The app should try again lat
If your app requires a larger daily quota, submit a quota increase request form
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


## Page 19

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
Search for places that meet specific criteria to autocomplete a place
search
Find results that you can use to autocomplete searches.
Search for a place using an identifier
Obtain a Place object for a given Place ID.
Search for places using mulitple identifiers
Obtain a set of Place objects for a given set of Place IDs.
Obtain a list of alternate place identifiers
Get a list of alternate Place IDs given one or more Place IDs.


## Page 20

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


## Page 21

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


## Page 22

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


## Page 23

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


## Page 24

id
string
(Required) A single Place ID.
lang
Lang
The language code for the response.
Default: en-US
200
Place
OK
A Place result.
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
URL
Path Parameters
Query Parameters
Response Codes
Apple Maps Server API / Search for a place using an identifier
Web Service Endpoint
Search for a place using an identifier
Obtain a Place object for a given Place ID.
Apple Maps Server API 1.2+


## Page 25

An ErrorResponse object that contains an error message that indicates th
Maps access token is missing or invalid, and an array of strings that contains
additional details about the error.
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
Search for places that meet specific criteria to autocomplete a place
search
Find results that you can use to autocomplete searches.
Search for places using mulitple identifiers
See Also
Searching


## Page 26

Obtain a set of Place objects for a given set of Place IDs.
Obtain a list of alternate place identifiers
Get a list of alternate Place IDs given one or more Place IDs.


## Page 27

ids
string
(Required) A comma separated list of Place IDs.
lang
Lang
The language code for the response.
Default: en-US
200
PlacesResponse
OK
A list of PlacesResponse results.
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
URL
Query Parameters
Response Codes
Apple Maps Server API / Search for places using mulitple identifiers
Web Service Endpoint
Search for places using mulitple identifiers
Obtain a set of Place objects for a given set of Place IDs.
Apple Maps Server API 1.2+


## Page 28

500
ErrorResponse
Internal Server Error
An ErrorResponse object that contains a server error message and an arra
of strings that describe additional details about the error.
Content-Type: application/json
type AddressCategory
Search categories related to political geographical boundaries.
type SearchACResultType
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
Search for places that meet specific criteria to autocomplete a place
search
Find results that you can use to autocomplete searches.
Search for a place using an identifier
Obtain a Place object for a given Place ID.
Obtain a list of alternate place identifiers
See Also
Searching


## Page 29

Get a list of alternate Place IDs given one or more Place IDs.


## Page 30

ids
string
(Required) A list of alternate Place IDs.
200
AlternateIdsResponse
OK
A list of AlternateIdsResponse results.
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
500
ErrorResponse
Internal Server Error
URL
Query Parameters
Response Codes
Apple Maps Server API / Obtain a list of alternate place identifiers
Web Service Endpoint
Obtain a list of alternate place identifiers
Get a list of alternate Place IDs given one or more Place IDs.
Apple Maps Server API 1.2+


## Page 31

An ErrorResponse object that contains a server error message and an arra
of strings that describe additional details about the error.
Content-Type: application/json
type AddressCategory
Search categories related to political geographical boundaries.
type SearchACResultType
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
Search for places that meet specific criteria to autocomplete a place
search
Find results that you can use to autocomplete searches.
Search for a place using an identifier
Obtain a Place object for a given Place ID.
Search for places using mulitple identifiers
Obtain a set of Place objects for a given set of Place IDs.
See Also
Searching


## Page 32



