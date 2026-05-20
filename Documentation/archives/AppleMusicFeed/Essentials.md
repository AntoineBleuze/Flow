# Essentials.pdf

## Page 1

The header of each Apple Media Feed API request requires authorization in the form of a develop
token. A developer token is a signed token that authenticates you as a trusted developer and
member of the Apple Developer Program.
Apple Media Feed API limits the number of requests you can make using a developer token within
specific period of time. If you exceed this limit, you temporarily receive 429 Too Many
Requests error responses for requests that use the token. This error resolves itself shortly after
the request rate reduces.
Configuring a media identifier and authorization key using your developer account allows you to
obtain a key ID to use in your developer token.
Apple Media Feed API supports the JSON Web Token (JWT) specification, so you can pass
statements and metadata called claims. For more information, see the JWT specification and the
available libraries for generating signed JWTs.
Create a developer token as a JSON object with a header that includes the following:
alg
The algorithm you use to sign the token, which requires the value of ES256.
kid
A 10-character key ID that you obtain from your developer account.
Overview
Create your developer token
Apple Music Feed / Generating developer tokens
Article
Generating developer tokens
Create a JSON Web Token to authorize your requests to Apple Media Feed API.


## Page 2

Important
Apple Media Feed API supports only developer tokens signed with the ES256 algorithm.
Unsecured developer tokens or developer tokens signed with other algorithms reject with a
401 error code.
In the claims payload of the token, include the following:
iss
The issuer registered claim key, a 10-character Team ID from your developer account.
iat
The issued at registered claim key. This value indicates the time that the system generated th
token, in UNIX time.
exp
The expiration time registered claim key. This value can’t be greater than 15777000 (6 mont
in seconds) from the current UNIX time on the server.
origin
(Optional) The origin claim, recommended for web clients. Only use this JWT if the origin
header of the request matches one of the values in the array. This addition helps prevent
unauthorized use of the tokens. For example: “origin“:[“https://example
.com“,“https://music.example.com“].
Tip
To locate your Team ID, sign in to your developer account, and click “Membership details” at
the top of the page.
A decoded developer token has the following format:
After you create the token, sign it with your private key using the ES256 algorithm.


## Page 3

Note
ES256 is the JSON Web Algorithms (JWA) name for the Elliptic Curve Digital Signature
Algorithm (ECDSA) with the P-256 curve and the SHA-256 hash.
If you manage request authorization directly, in all requests, pass the Authorization: Beare
header set to the developer token.
Requesting a feed export
Create requests for Apple Music Catalog metadata.
Interpreting responses
Learn about responses from Apple Media Feed API to your Apple Music Feed requests.
Authorize requests
See Also
Essentials


## Page 4

To get the data for an Apple Music Feed data set, request information about the latest feed expor
use that information to request links to parts of the feed, and then use those links to download the
data.
To compose a request, first specify the root path, https://api.media.apple.com/v1.
Follow the root path with /feed/ and the required information for the specific request.
To request metadata about the latest available export for an Apple Music Feed data set, construct
URL that includes the feedId followed by /latest.
The possible values for feedId are: album, song, artist, popularityTopChartAlbums, an
popularityTopChartSongs.
The response returns metadata about the most recent export for the specified feedId, including
an id that you can use to request the data from that export.
Overview
Compose a request
Request metadata for the latest feed export
Apple Music Feed / Requesting a feed export
Article
Requesting a feed export
Create requests for Apple Music Catalog metadata.


## Page 5

To request links to parts of the data for a feed export, construct a URL that includes the id of a
specific feed export, which you can get from the response above, followed by /parts. You can
use the limit and offset parameters to paginate the returned results. For more information, se
Fetching Resources by Page.
The response returns parts objects as resources, each of which includes an export
Location for the data in that part of the feed export.
Request feed data links


## Page 6

Use the links that the parts response provides to download the feed data. Note that access to
these links expires after a specified time.
The feed exports are in Parquet format. The following data example is in JSON format for illustrati
purposes:
Download the feed data
Data example


## Page 7



## Page 8



## Page 9



## Page 10

Generating developer tokens
Create a JSON Web Token to authorize your requests to Apple Media Feed API.
Interpreting responses
Learn about responses from Apple Media Feed API to your Apple Music Feed requests.
See Also
Essentials


## Page 11

Learn how Apple Media Feed API responds to requests for Apple Music Feed data and how to
interpret responses.
Apple Media Feed API has two kinds of responses: resource collections and errors.
Resource collection responses contain a data array and a resources object.
Error responses contain an array of one or more error objects that indicate any issues while
handling the request. The status code of the response reflects the primary error.
Default responses for common requests include the following:
Request description
Status code
Response description
The request is for an existing single
resource object.
200 (OK)
The data array contains th
requested resource object.
The request is for a single resource
object that doesn’t exist.
404 (NotFound)
The response doesn’t
contain a data array.
The request is for multiple resource
objects by ID.
200 (OK)
The data array includes th
existing resource objects.
The request is for multiple resource
objects by ID and none of the resources
200 (OK)
The data array is empty.
Overview
Understand a response
Apple Music Feed / Interpreting responses
Article
Interpreting responses
Learn about responses from Apple Media Feed API to your Apple Music Feed
requests.


## Page 12

Request description
Status code
Response description
exist.
The request isn’t accepted because its
authorization is missing or invalid due
to an issue with the developer token.
401
(Unauthorized)
The response doesn’t
contain a data array.
The request isn’t accepted because the
request is using incorrect
authentication.
403 (Forbidden)
The response doesn’t
contain a data array.
The request isn’t supported as
specified.
400 (Bad
Request)
The errors array contains
an error object for any
identified problem.
The request encounters errors on the
server.
Any status code in the
500 range
The errors array contains
error objects for the errors
for any identified problems.
For more information, see Error object and HTTP status codes.
Generating developer tokens
Create a JSON Web Token to authorize your requests to Apple Media Feed API.
Requesting a feed export
Create requests for Apple Music Catalog metadata.
See Also
Essentials


