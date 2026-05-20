# 011_Obtain a list of alternate place identifiers.pdf

## Page 1

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


## Page 2

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


## Page 3



