# 000_Add resource to favorites.pdf

## Page 1

ids
[string]
(Required) The ids of the specific type.
l
string
The localization to use, specified by a language tag. The possible values are i
the supportedLanguageTags array belonging to the Storefront object
that storefront specifies. Otherwise, the default is defaultLanguageTa
in Storefront.
202
EmptyBodyResponse
Accepted
Request accepted.
Content-Type: application/json
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
URL
Query Parameters
Response Codes
Apple Music API / Add resource to favorites
Web Service Endpoint
Add resource to favorites
Add the user’s resource to favorites.
Apple Music 1.0+


## Page 2

500
ErrorsResponse
Internal Server Error
A response indicating an error occurred on the server.
Content-Type: application/json
This endpoint allows the user to favorite a resource. For example, if a customer favorites a song,
the song is added to their favorite songs playlist. If they like an album or playlist, they can filt
on favorited album in their library view.
If successful, the HTTP status code is 202 (Accepted) and there’s no response body. For request
IDs that the system can’t add to a user’s library, Apple Music Library ignores those IDs. If
unsuccessful, the HTTP status code indicates the error and the details are in the errors array.
Note
Bulk additions of heterogenous types are permitted.
Discussion


