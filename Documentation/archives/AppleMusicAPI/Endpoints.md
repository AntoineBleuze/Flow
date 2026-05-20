# Endpoints.pdf

## Page 1

l
string
200
EmptyBodyResponse
OK
Content-Type: application/json
401
UnauthorizedResponse
Unauthorized
Content-Type: application/json
500
ErrorsResponse
Internal Server Error
Content-Type: application/json
URL
Query Parameters
Response Codes
Apple Music API / Placeholder Endpoint to Test Connectivity
Web Service Endpoint
Placeholder Endpoint to Test Connectivity
Apple Music 1.0+


## Page 2

l
string
The localization to use, specified by a language tag. The possible values are i
the supportedLanguageTags array belonging to the Storefront object
specified by storefront. Otherwise, the default is defaultLanguageTag
in Storefront.
limit
integer
The number of objects or number of objects in the specified relationship
returned.
include
[string]
Additional relationships to include in the fetch.
offset
string
The offset to use for a paginated request. See Fetching Resources by Page.
extend
[string]
A list of attribute extensions to apply to resources in the response.
200
PaginatedResource
CollectionResponse
OK
The request was successful.
Content-Type: application/json
URL
Query Parameters
Response Codes
Apple Music API / Get a User's Storefront
Web Service Endpoint
Get a User's Storefront
Fetch a storefront for a specific user.
Apple Music 1.0+


## Page 3

401
UnauthorizedResponse
Unauthorized
A response indicating an incorrect Authorization header.
Content-Type: application/json
403
ForbiddenResponse
Forbidden
A response indicating invalid or insufficient authentication.
Content-Type: application/json
500
ErrorsResponse
Internal Server Error
A response indicating an error occurred on the server.
Content-Type: application/json
If successful, the HTTP status code is 200 (OK) and the data array contains a single
Storefronts object. If unsuccessful, the HTTP status code indicates the error and the details a
in the errors array.
This endpoint requires a music user token. For more information, see User Authentication for
MusicKit.
object Storefronts
A resource object that represents a storefront, an Apple Music and iTunes Store territory tha
the content is available in.
object StorefrontsResponse
The response to a storefront request.
Discussion
Example
Response
See Also
Related Documentation
Request


## Page 4



