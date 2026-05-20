# Essentials.pdf

## Page 1

To make requests to the Apple Music API, you need to authorize yourself as a trusted developer
and member of the Apple Developer Program. The header of every Apple Music API request
requires a signed developer token.
There are two paths to generate developer tokens:
If you’re developing an app for Apple platforms (iOS, tvOS, watchOS or macOS), the
recommended way to integrate with Apple Music is to use MusicKit for Swift, following the step
provided in Using Automatic Developer Token Generation for Apple Music API.
Follow the directions below to create and manage developer tokens for other platforms.
A developer token is a signed token used to authenticate a developer in Apple Music requests.
Creating a MusicKit identifier and private key allows you to use a developer token to authenticate
yourself as a trusted developer and member of the Apple Developer Program.
The Apple Music API supports the JSON Web Token (JWT) specification, so you can pass
statements and metadata called claims. For more information, see the JWT specification and the
available libraries for generating signed JWTs.
Construct a developer token as a JSON object whose header contains:
The algorithm (alg) you use to sign the token, which should have a value of ES256
A 10-character key identifier (kid) key, obtained from your developer account
Overview
Create a Developer Token
Apple Music API / Generating Developer Tokens
Article
Generating Developer Tokens
Generate a developer token needed to make requests to Apple Music API.


## Page 2

Important
Apple Music supports only developer tokens signed with the ES256 algorithm. Apple Music
rejects unsecured developer tokens or developer tokens signed with other algorithms. These
rejections result in a 401 error code.
In the claims payload of the token, include:
The issuer (iss) registered claim key, whose value is your 10-character Team ID, obtained from
your developer account
The issued at (iat) registered claim key, whose value indicates the time at which the token wa
generated, in terms of the number of seconds since epoch, in UTC
The expiration time (exp) registered claim key, whose value must not be greater than 1577700
(6 months in seconds) from the current Unix time on the server
Optional, but recommended for web clients, use the origin claim (origin). Only use this JWT 
the origin header of the request matches one of the values in the array. This addition helps
prevent unauthorized use of the tokens. For example: “origin”:[”https://example
.com”,”https://music.example.com”].
Tip
To locate your Team ID, sign in to your developer account, and click Membership in the sidebar.
Your Team ID appears in the Membership Information section under the team name.
A decoded developer token has the following format.
After you create the token, sign it with your MusicKit private key using the ES256 algorithm.


## Page 3

Note
ES256 is the JSON Web Algorithms (JWA) name for the Elliptic Curve Digital Signature
Algorithm (ECDSA) with the P-256 curve and the SHA-256 hash.
A developer token is used to authorize all Apple Music API requests. If you manage this directly, in
all requests, pass the Authorization: Bearer header set to the developer token.
To sign in and authenticate requests for an Apple Music subscriber, see User Authentication for
MusicKit. For more information about requests, responses, and error handling, see Handling
Requests and Responses.
Apple Music API limits the number of requests your app can make using a developer token within 
specific period of time. If this limit is exceeded, you’ll temporarily receive 429 Too Many
Requests error responses for requests that use the token. This error resolves itself shortly after
the request rate has reduced.
User Authentication for MusicKit
Authenticate requests for user data using the Music User Token.
Handling Requests and Responses
Write a request and handle responses from the API.
Handling Resource Representation and Relationships
Fetch resources with extended attributes and included relationships and relationship views.
Storefronts and Localization
Pick a region-specific geographic location from which to retrieve catalog information, or
retrieve information from the user’s personal library.
Authorize Requests
Request Rate Limiting
See Also
Essentials


## Page 4

Common Objects
Understand the common JSON objects that framework responses contain.
Managing Content Ratings, Alternate Versions, and Equivalencies
Handle multiple and alternate versions of content.
Fetching Resources by Page
Use pagination to fetch the next set of objects.


## Page 5

Apple Music API requires the inclusion of a Music User Token for any requests for data specific to
an Apple Music subscriber, such as to fetch content from the user’s library. The way to configure
your requests to Apple Music API with a valid Music User Token depends on the platform for your
app.
MusicKit automatically manages Music User Token for Apple platforms and for web apps. If you’re
developing an app for Apple platforms (iOS, tvOS, watchOS, or macOS), use MusicKit for Swift to
integrate with Apple Music. The framework automatically decorates requests to Apple Music API
with a valid Music User Token.
Similarly, if you’re developing a web app, MusicKit on the Web automatically decorates requests t
Apple Music API with a valid Music User Token.
Automatic Music User Token management is not available for Android. If you’re developing an app
for Android, please refer to the authentication section of the MusicKit for Android’s documentatio
to learn more about how to retrieve a Music User Token.
Once you’ve successfully retrieved a Music User Token, make sure to include it in your HTTP
requests to Apple Music API with the Music-User-Token header.
Below is an example of issuing a personalized request to Apple Music API using curl.
Overview
Automatic Music User Token Management
Manual Music User Token Management for Android
Apple Music API / User Authentication for MusicKit
Article
User Authentication for MusicKit
Authenticate requests for user data using the Music User Token.


## Page 6

For more information about requests, responses, and error handling, see Handling Requests and
Responses.
Generating Developer Tokens
Generate a developer token needed to make requests to Apple Music API.
Handling Requests and Responses
Write a request and handle responses from the API.
Handling Resource Representation and Relationships
Fetch resources with extended attributes and included relationships and relationship views.
Storefronts and Localization
Pick a region-specific geographic location from which to retrieve catalog information, or
retrieve information from the user’s personal library.
Common Objects
Understand the common JSON objects that framework responses contain.
Managing Content Ratings, Alternate Versions, and Equivalencies
Handle multiple and alternate versions of content.
Fetching Resources by Page
Use pagination to fetch the next set of objects.
See Also
Essentials


## Page 7

After adding the appropriate tokens to the header, compose your request to get data from the AP
and handle responses.
Apple Music API requests have common components. To compose a request, first specify the roo
path, https://api.music.apple.com/v1.
Follow this part of the path with either /catalog or /me:
The /catalog path accesses the public Apple Music catalog.
The /me path accesses personalized content for the user such as their music library, ratings an
listening history.
Follow this path with any parameters that are specific to the endpoint. For example, to request
information about a specific genre, construct a URL that includes the ID of the genre in the path.
When requesting resources from the Apple Music catalog, you must include the storefront in the
path. When requesting resources from the user’s personal library, replace the storefront
information with the me string, as shown in the following example.
Overview
Compose a Request
Apple Music API / Handling Requests and Responses
Article
Handling Requests and Responses
Write a request and handle responses from the API.


## Page 8

Every resource has a unique identifier in the Apple Music catalog. Resources in the user’s library
have unique identifiers that are different than the Apple Music catalog identifiers. If a user remove
an item from their music library but then adds it back later, it will have a new and different identifie
Most requests return only the requested resource. For information about how to request related
resources at the same time, see Handling Resource Representation and Relationships.
There are three kinds of responses: Resource Collection, Results, and Errors.
The resource collections can come in multiple common forms which include:
Resource Collection (for example, https://api.music.apple
.com/v1/catalog/us/albums?ids=123,234)
Paginated Resource Collection (for example, https://api.music.apple
.com/v1/me/library-albums)
Relationship Response (for example, https://api.music.apple
.com/v1/catalog/us/albums/123/tracks)
Relationship View Response (for example, https://api.music.apple
.com/v1/catalog/us/albums/123/view/related-albums)
For results responses, there is always a top-level results member object that contains the
information for the response. Results responses are always unique to the endpoint, such as chart
or a search response.
Error responses contain an array of one or more error objects that indicate any issues while
handling the request. The status code of the response reflects the primary error. See Error and
HTTP Status Codes.
Default responses include:
If the request is for an existing single resource object, the status code is 200 (OK) and the dat
array contains the requested resource object.
If the request is for a single resource object that doesn’t exist, the status code is 404 (Not
Found) and the response doesn’t contain a data array.
If the request is for multiple resource objects by ID, the status code is 200 (OK) and the data
array includes the existing resource objects.
Handle a Response


## Page 9

If the request is for multiple resource objects by ID and none of the resources exist, the status
code is 200 (OK) and the data array is empty.
A successful response for a resource collection with additional results contains a next link to
the next page of fetched resources in the collection. See also Fetching Resources by Page.
A successful response for a relationship request is 200 OK and the data array contains a
paginated collection of resources contained in the relationship. A next link signifies that
additional resources may be fetched from the relationship’s resource collection.
A successful response for a relationship view request is 200 OK and the data array contains a
paginated collection of resources contained in the view. The relationship view’s attributes
are included when requested using the with parameter. A next link signifies that additional
resources may be fetched.
If the request contains successfully modified or deleted resources, the status code is 204 (No
Content) and the body is empty.
If you make a successful request to an endpoint that returns results, the status code is 200 (OK
and the response includes those results.
If the request isn’t accepted because its authorization is missing or invalid due to an issue with
the developer token, the status code is 401 (Unauthorized). In this case, the response doesn’t
contain a data array.
If the request isn’t accepted due to an issue with the media user token or because the request 
using incorrect authentication, the status code is 403 (Forbidden). In this case, the response
doesn’t contain a data array.
If the request isn’t supported as specified, the status code is 400 (Bad Request) and the
errors array contains an error object for any identified problem.
The response status code is in the 500 range when errors are encountered on the server while
processing the request. In this case, the errors array contains error objects for the errors for
any identified problem.
object EmptyBodyResponse
A response object that contains no content.
object ErrorsResponse
A response object indicating that an error occurred while processing the request.
Topics
Related Objects


## Page 10

object UnauthorizedResponse
A response object indicating that the request’s authorization is missing or invalid.
object ForbiddenResponse
A response object indicating that the request wasn’t accepted due to an issue with the
authentication.
object ResourceCollectionResponse
A response object composed of resource objects for the request.
Generating Developer Tokens
Generate a developer token needed to make requests to Apple Music API.
User Authentication for MusicKit
Authenticate requests for user data using the Music User Token.
Handling Resource Representation and Relationships
Fetch resources with extended attributes and included relationships and relationship views.
Storefronts and Localization
Pick a region-specific geographic location from which to retrieve catalog information, or
retrieve information from the user’s personal library.
Common Objects
Understand the common JSON objects that framework responses contain.
Managing Content Ratings, Alternate Versions, and Equivalencies
Handle multiple and alternate versions of content.
Fetching Resources by Page
Use pagination to fetch the next set of objects.
See Also
Essentials


## Page 11

Resources are fetched with a default representation of attributes and relationships. Extend the
default representation for a resource type to fetch additional attributes and include relationships
and relationship views.
Note
If any relationship or relationship view contains too many related resources, use pagination to
fetch the next set of objects. See Fetching Resources by Page.
The server will fetch a subset of the available attributes for a resource type by default. The
attributes not fetched by default are known as extended attributes. You may specify a set of
attribute names using the extend query parameter to request these additional attributes for a
resource type.
For example, when fetching an Albums resource, you can request that the server add the extend
artistUrl attribute to the album’s other attributes:
Overview
Extend Resource Attributes
Include Resource Relationships
Apple Music API / Handling Resource Representation and Relationships
Article
Handling Resource Representation and
Relationships
Fetch resources with extended attributes and included relationships and
relationship views.


## Page 12

Responses contain some relationships and their related resources by default. Related resources i
the response will be either resource objects with their attributes or resource identifiers without
attributes. See how to include relationships in a single response below.
For example, these Album relationships have different default behaviors:
The tracks relationship includes the resource objects for the album’s songs and music videos
which are typically essential for working with albums.
The artists relationship only includes resource identifiers for the artist or artists associated
with the album and excludes the attributes member in each resource object. This
relationship allows you to link to an artist from an album, although some artist attributes are als
attributes of the album.
The response doesn’t include all relationships with a resource by default. For example, the
response omits the genres relationship, though you can expressly add this relationship to the
request. This seldom-used relationship is often superseded by genreNames, which appear as
an attribute of an album.
Use the include parameter to specify a set of relationships to include with the resource in the
response. The value of the include parameter is a comma-separated list of the relationship
names to include. For relationships that include resource objects by default, there’s no need to
specify them in the list; they’re included along with the specified relationships. For example, when
fetching an Artists object, you can request the playlists objects using include.
You may request the related resources without their attributes for one or more relationships using
the relate parameter. This is a way to quickly retrieve identifiers to related resources to fetch
later. Modifying the example above, you can request related playlists resource identifiers for
inclusion when fetching an Artists object.
The response never includes relationship views with a resource by default. Use the views
parameter to specify a set of relationship views to include with the resource in the response. The
value of the views parameter is a comma-separated list of the relationship view names to includ
For example, when fetching an Albums object, you can request the other-versions relationsh
view using views.
Include Resource Relationship Views


## Page 13

Note
You can request any combination of resource relationship and relationship views using the
include, relate, and views parameters.
When not classified, the extend, relate, and include parameters apply to the primary
resource collection of the response. For example, when fetching one or more artists, applying
&include=music-videos adds the music-video relationship for the artists in the response’s
primary data resource collection.
The extend, include, and relate parameters can be scoped to specifically target a resource
type in the response. This applies to all resources in the response instead of just the primary
resources. For example, if you wish to fetch a playlist, and would like to extend the artistUrl
attribute on all songs resources in the response, you can extend the songs resource type
specifically.
If you wish to fetch an artist, and would like to include the featured-albums relationship view
along with the tracks for those albums, you can scope the include parameter to the albums
resource type specifically.
To fetch a relationship exclusively, specify the name of the relationship after the id path paramet
For example, fetch just the tracks belonging to an album.
By default, the API fetches a limited number of related resources for the relationship. See the
corresponding object model reference for the default fetch limits. To specify the number of objec
fetched, use the limit parameter. For example, you can fetch an artist’s first five albums.
Scoping Parameters
Fetch Resource Relationships Directly


## Page 14

To fetch a relationship view exclusively, you must append the “/view/” followed by name of the
view to the id path parameter. For example, fetch similar-artists for an identified artist.
When fetching a relationship view directly, you may request the associated attributes using the
with parameter.
By default, the API fetches a limited number of related resources for the relationship view. See the
corresponding object model reference for the default fetch limits. To specify the number of objec
fetched, use the limit parameter. For example, you can fetch the first three featured playlists fo
an artist.
Generating Developer Tokens
Generate a developer token needed to make requests to Apple Music API.
User Authentication for MusicKit
Authenticate requests for user data using the Music User Token.
Handling Requests and Responses
Write a request and handle responses from the API.
Storefronts and Localization
Pick a region-specific geographic location from which to retrieve catalog information, or
retrieve information from the user’s personal library.
Common Objects
Understand the common JSON objects that framework responses contain.
Managing Content Ratings, Alternate Versions, and Equivalencies
Fetch Resource Relationship Views Directly
See Also
Essentials


## Page 15

Handle multiple and alternate versions of content.
Fetching Resources by Page
Use pagination to fetch the next set of objects.


## Page 16

Apple Music is a worldwide service that operates in many countries, regions, and languages.
Content varies from one geographic region to another, so each request must contain a storefront
object. Storefront defines the desired region and the supported languages for that region. For mo
requests, you specify the storefront associated with the current user, but you may also specify
other storefronts as needed. For example, you might specify a storefront that better matches the
user’s preferred language.
Each storefront has a default language, and may support one or more additional languages. For
example, the United States storefront includes American English as the default language, but also
includes Mexican Spanish as an additional supported language. Apple Music automatically localiz
responses using the storefront’s default language, but you can localize to a different language
using the l query parameter. The value of that parameter must be one of the values in the
supportedLanguageTags attribute of the storefront object. For example, the following request
asks the US storefront to return an album in the Mexican Spanish (es-MX) localization.
Get a Storefront
Fetch a single storefront by using its identifier.
Overview
Topics
Requesting a Catalog Storefront
Apple Music API / Storefronts and Localization
API Collection
Storefronts and Localization
Pick a region-specific geographic location from which to retrieve catalog
information, or retrieve information from the user’s personal library.


## Page 17

Get Multiple Storefronts
Fetch one or more storefronts by using their identifiers.
Get All Storefronts
Fetch all the storefronts in alphabetical order.
Get the best supported language for a storefront
Fetch the best supported language for a storefront from a list.
object Storefronts
A resource object that represents a storefront, an Apple Music and iTunes Store territory tha
the content is available in.
Generating Developer Tokens
Generate a developer token needed to make requests to Apple Music API.
User Authentication for MusicKit
Authenticate requests for user data using the Music User Token.
Handling Requests and Responses
Write a request and handle responses from the API.
Handling Resource Representation and Relationships
Fetch resources with extended attributes and included relationships and relationship views.
Common Objects
Understand the common JSON objects that framework responses contain.
Managing Content Ratings, Alternate Versions, and Equivalencies
Handle multiple and alternate versions of content.
Localization
Handling the Response
See Also
Essentials


## Page 18

Fetching Resources by Page
Use pagination to fetch the next set of objects.


## Page 19

object Resource
A resource—such as an album, song, or playlist.
object Relationship
A to-one or to-many relationship from one resource object to others.
object Error
Information about an error that occurred while processing a request.
HTTP Status Codes
Reference error codes returned by the Apple Music API.
Generating Developer Tokens
Generate a developer token needed to make requests to Apple Music API.
Topics
Getting Resource and Relationship Information
Handling Errors
See Also
Essentials
Apple Music API / Common Objects
API Collection
Common Objects
Understand the common JSON objects that framework responses contain.


## Page 20

User Authentication for MusicKit
Authenticate requests for user data using the Music User Token.
Handling Requests and Responses
Write a request and handle responses from the API.
Handling Resource Representation and Relationships
Fetch resources with extended attributes and included relationships and relationship views.
Storefronts and Localization
Pick a region-specific geographic location from which to retrieve catalog information, or
retrieve information from the user’s personal library.
Managing Content Ratings, Alternate Versions, and Equivalencies
Handle multiple and alternate versions of content.
Fetching Resources by Page
Use pagination to fetch the next set of objects.


## Page 21

The Music API can fetch multiple, alternate versions of albums, songs, and music videos that are
available simultaneously on a specific Storefront. For example, these alternates may represent
deluxe, remastered, and reissued versions, as well as separate options for tracks with a clean or
explicit rating.
In the Music Catalog, some albums, songs, and music videos may have a content rating. The
Recording Industry Association of America (RIAA) provides ‘explicit’ ratings. The ‘clean’ value
demarcates tracks that have an ‘explicit’-rated equivalent. Apple Music API can attempt to find
clean substitutions for explicit content in some contexts, such as an artist’s releases and tracks o
a playlist. See below about substituting clean content with equivalents when available.
Use equivalencies to find the best-available equivalent match for the requested content from a
given storefront. A response from a filter equivalencies endpoint returns the best match of an
album, song, or music video for the specified storefront.
Albums and tracks are sometimes made available as different versions between storefronts. Use
equivalencies to find the best-available version in one storefront for an identifier found in another
storefront. For instance, an album could have different identifiers between two separate
storefronts. These identifiers represent different versions of the same album. For example, you ca
filter on equivalents by using an album’s identifier in the US (us) storefront to find its equivalent in
the Japan (jp) storefront.
Overview
Content Ratings
Fetch Equivalent Content for a Storefront
Apple Music API / Managing Content Ratings, Alternate Versions, and Equivalencies
Article
Managing Content Ratings, Alternate
Versions, and Equivalencies
Handle multiple and alternate versions of content.


## Page 22

Based on a user’s preference, you may want to only include clean versions of content. In addition 
the above equivalencies for albums, songs, and music videos, you can also apply this parameter t
the tracks of playlists, as well as artist views. To achieve this, specify a restrict parameter in
your request that attempts to submit a clean substitution when available.
Note
When using the explicit restriction, this parameter replaces content with an explicit rating with
the best available clean equivalent version. If no suitable replacement is available, the original
content is not replaced.
Generating Developer Tokens
Generate a developer token needed to make requests to Apple Music API.
User Authentication for MusicKit
Authenticate requests for user data using the Music User Token.
Handling Requests and Responses
Write a request and handle responses from the API.
Handling Resource Representation and Relationships
Fetch resources with extended attributes and included relationships and relationship views.
Storefronts and Localization
Pick a region-specific geographic location from which to retrieve catalog information, or
retrieve information from the user’s personal library.
Common Objects
Understand the common JSON objects that framework responses contain.
Substitute Content with Clean Equivalents When Available
See Also
Essentials


## Page 23

Fetching Resources by Page
Use pagination to fetch the next set of objects.


## Page 24

Some GET requests support pagination of the objects or an object’s relationships and relationship
views. Specify a limit parameter to restrict the number of resources returned. If you don’t supp
a limit, the API supplies a default one. If you reach the limit to the number of resource objects in a
response, the response contains a subset of the resource objects matching your criteria. In this
case you must make more requests to get the rest of the objects.
See the corresponding resource’s object model for the default fetch limit. If there are more
resource objects than permitted by the fetch limit, the response contains a next member whose
value is a subpath to use in the next request. The subpath contains the offset parameter that
specifies the next page. Similarly, a Relationship object may contain a next member that you
can use to fetch more objects in a relationship.
For example, you may fetch all objects of a resource type, but specify the amount in the response
by using the limit parameter.
If there are more objects to fetch, the response contains a next member.
Overview
Apple Music API / Fetching Resources by Page
Article
Fetching Resources by Page
Use pagination to fetch the next set of objects.


## Page 25

Pass the next subpath, and optionally, use the limit parameter again, in the next request.
Continue requesting the resource objects until the next member no longer appears in the
response.
Generating Developer Tokens
Generate a developer token needed to make requests to Apple Music API.
User Authentication for MusicKit
Authenticate requests for user data using the Music User Token.
Handling Requests and Responses
Write a request and handle responses from the API.
See Also
Essentials


## Page 26

Handling Resource Representation and Relationships
Fetch resources with extended attributes and included relationships and relationship views.
Storefronts and Localization
Pick a region-specific geographic location from which to retrieve catalog information, or
retrieve information from the user’s personal library.
Common Objects
Understand the common JSON objects that framework responses contain.
Managing Content Ratings, Alternate Versions, and Equivalencies
Handle multiple and alternate versions of content.


