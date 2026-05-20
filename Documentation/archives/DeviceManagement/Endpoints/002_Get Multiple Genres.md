# 002_Get Multiple Genres.pdf

## Page 1

storefront
string
(Required) An iTunes Store territory, specified by an ISO 3166 alpha-2 count
code. The possible values are the id attributes of Storefrontobjects.
ids
[string]
(Required) The unique identifiers for the genres.
l
string
The localization to use, specified by a language tag. The possible values are i
the supportedLanguageTags array belonging to the Storefront object
specified by storefront. Otherwise, the default is defaultLanguageTag
in Storefront.
200
GenresResponse
OK
The request was successful.
Content-Type: application/json
401
UnauthorizedResponse
Unauthorized
A response indicating an incorrect Authorization header.
URL
Path Parameters
Query Parameters
Response Codes
Device Management / Get Multiple Genres
Web Service Endpoint
Get Multiple Genres
Fetch metadata for genres from the catalog by using their identifiers.
Device Assignment Services
VPP License Management


## Page 2

Content-Type: application/json
500
ErrorsResponse
Internal Server Error
A response indicating an error occurred on the server.
Content-Type: application/json
object GenresResponse
object UnauthorizedResponse
A response that indicates an incorrect authorization header.
object ErrorsResponse
The collection of errors that occurred while processing the request.
Fetch a apps resource's relationship
Fetch a books resource's relationship
Get a Genre
Fetch metadata for a genre from the catalog by using its identifier.
Discussion
Example
Response
Topics
Responses
See Also
Endpoints
Request


## Page 3



