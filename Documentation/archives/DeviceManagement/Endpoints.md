# Endpoints.pdf

## Page 1

id
string
(Required)
relationship
string
(Required)
Value: genres
storefront
string
(Required)
additionalPlatforms
[string]
Possible Values: appletv, ipad, iphone, mac, realityDevice,
web
extend
[string]
Possible Values: description, fileSizeByDevice, languageList
latestVersionInfo, privacyPolicyUrl,
requirementsByDeviceFamily, screenshotsByType,
supportURLForLanguage, versionHistory, websiteUrl
include
[string]
l
string
URL
Path Parameters
Query Parameters
Device Management / Fetch a apps resource's relationship
Web Service Endpoint
Fetch a apps resource's relationship
Device Assignment Services
VPP License Management


## Page 2

limit
integer
platform
string
(Required)
Possible Values: appletv, ipad, iphone, mac, realityDevice,
web
relate
[string]
200
RelationshipResponse
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
Fetch a books resource's relationship
Get Multiple Genres
Fetch metadata for genres from the catalog by using their identifiers.
Get a Genre
Fetch metadata for a genre from the catalog by using its identifier.
Response Codes
See Also
Endpoints


## Page 3

id
string
(Required)
relationship
string
(Required)
Value: genres
storefront
string
(Required)
additionalPlatforms
[string]
Possible Values: appletv, ipad, iphone, mac, realityDevice,
web
extend
[string]
include
[string]
l
string
URL
Path Parameters
Query Parameters
Device Management / Fetch a books resource's relationship
Web Service Endpoint
Fetch a books resource's relationship
Device Assignment Services
VPP License Management


## Page 4

limit
integer
platform
string
(Required)
Possible Values: appletv, ipad, iphone, mac, realityDevice,
web
relate
[string]
200
RelationshipResponse
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
Fetch a apps resource's relationship
Get Multiple Genres
Fetch metadata for genres from the catalog by using their identifiers.
Get a Genre
Fetch metadata for a genre from the catalog by using its identifier.
Response Codes
See Also
Endpoints


## Page 5

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


## Page 6

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


## Page 7



## Page 8

id
string
(Required) The unique identifier for the genre.
storefront
string
(Required) An iTunes Store territory, specified by an ISO 3166 alpha-2 count
code. The possible values are the id attributes of Storefrontobjects.
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
Device Management / Get a Genre
Web Service Endpoint
Get a Genre
Fetch metadata for a genre from the catalog by using its identifier.
Device Assignment Services
VPP License Management


## Page 9

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
Get Multiple Genres
Fetch metadata for genres from the catalog by using their identifiers.
Discussion
Example
Response
Topics
Responses
See Also
Endpoints
Request


## Page 10



