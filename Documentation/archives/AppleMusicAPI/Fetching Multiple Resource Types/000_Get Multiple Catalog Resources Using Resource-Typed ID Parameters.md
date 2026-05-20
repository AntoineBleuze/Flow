# 000_Get Multiple Catalog Resources Using Resource-Typed ID Parameters.pdf

## Page 1

storefront
string
(Required) An iTunes Store territory, specified by an ISO 3166 alpha-2 count
code. The possible values are the id attributes of Storefront objects.
include
[string]
Additional relationships to include in the fetch.
l
string
The localization to use, specified by a language tag. The possible values are i
the supportedLanguageTags array belonging to the Storefront object
specified by storefront. Otherwise, the default is defaultLanguageTag
in Storefront.
extend
[string]
A list of attribute extensions to apply to resources in the response.
ids[stations]
[string]
The unique identifiers for the stations.
ids[station-genres]
The unique identifiers for the station genres.
URL
Path Parameters
Query Parameters
Apple Music API / Get Multiple Catalog Resources Using Resource-Typed ID Parameters
Web Service Endpoint
Get Multiple Catalog Resources Using
Resource-Typed ID Parameters
Fetch one or more catalog resources by using their identifiers.
Apple Music 1.0+


## Page 2

[string]
ids[songs]
[string]
The unique identifiers for the songs.
ids[record-labels]
[string]
The unique identifiers for the record labels.
ids[ratings]
[string]
The unique identifiers for the ratings.
ids[playlists]
[string]
The unique identifiers for the playlists.
ids[music-videos]
[string]
The unique identifiers for the music videos.
ids[genres]
[string]
The unique identifiers for the genres.
ids[curators]
[string]
The unique identifiers for the curators.
ids[artists]
[string]
The unique identifiers for the artists.
ids[apple-curators]
[string]
The unique identifiers for the Apple Music curators.
ids[albums]
[string]
The unique identifiers for the albums.
ids[activities]
[string]
The unique identifiers for the activities.
200
ResourceCollection
Response
OK
The request was successful.
Content-Type: application/json
401
UnauthorizedResponse
Unauthorized
A response indicating an incorrect Authorization header.
Content-Type: application/json
Response Codes


## Page 3

500
ErrorsResponse
Internal Server Error
A response indicating an error occurred on the server.
Content-Type: application/json
If successful, the HTTP status code is 200 (OK) and the data array contains the requested
resource object. If unsuccessful, the HTTP status code indicates the error and the details are in th
errors array. For more information, see Handling Requests and Responses.
object Resource
A resource—such as an album, song, or playlist.
Get Multiple Library Resources Using Resource-Typed ID Parameters
Fetch one or more library resources by using their identifiers.
Discussion
Example
Response
See Also
Related Documentation
Fetching Multiple Resource Types
Request


