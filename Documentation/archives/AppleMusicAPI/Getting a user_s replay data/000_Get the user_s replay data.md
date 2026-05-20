# 000_Get the user_s replay data.pdf

## Page 1

extend
[string]
A list of attribute extensions applied to resources in the response.
filter[year]
[string]
(Required) A filter applied to the request. The value is always latest.
include
[string]
A list of relationship names to include for resouces in the response.
l
string
The localization specified by a language tag. The possible values are in the
supportedLanguageTags array belonging to the Storefront object
specified by the storefront. Otherwise, the storefront’s defaultLanguage
Tag is used.
views
[string]
The views to activate for the music summaries resource.
Possible Values: top-artists, top-albums, top-songs
200
MusicSummaries
Response
OK
The request was successful.
Content-Type: application/json
URL
Query Parameters
Response Codes
Apple Music API / Get the user's replay data
Web Service Endpoint
Get the user's replay data
Fetch the user’s replay data for the latest eligible year.
Apple Music 1.0+


## Page 2

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
A successful HTTP request returns music summaries for the most recent year that the user has
enough listening history. If unsuccessful, the HTTP status code indicates the error, and the details
are in the errors array. For more information, see Handling Requests and Responses.
Discussion


