# Essentials.pdf

## Page 1

Note
This article is about creating a Maps token for Maps Server API for public use. To create tokens
for other services, or to experiment with Maps Server API, see Creating a Maps token.
Maps Server API uses a Maps token to authenticate map initializations and other API requests, su
as requests to retrieve directions or execute a search. To use a Maps token with Maps Server API
you must have an Apple Developer account and obtain a Maps ID and a private key as described i
Creating a Maps identifier and a private key.
After getting or creating a token, confirm the success of the token authorization by using the toke
to access the API; check the status code that the functions return to verify the calls were
successful.
Maps Server API requires a Maps token to initialize MapKit. A Maps token has two sections, a
header and a payload. The header describes the token and the cryptographic operations applied 
the payload. The payload contains a set of cryptographically signed claims.
Construct a token with these required fields in the header:
alg — The algorithm you use to encrypt the token. Use the ES256 algorithm to encrypt your
token.
Overview
Create a Token to Use Maps Server API
Apple Maps Server API / Creating and using tokens with Maps Server API
Article
Creating and using tokens with Maps
Server API
Sign JSON Web Tokens to use Maps Server API and debug common signing
errors.


## Page 2

kid — A 10-character key identifier that provides the ID of the private key that you obtain from
your Apple Developer account.
typ — A type parameter that you set to "JWT".
In the payload section of the token, include the following claims:
iss — The issuer of the token. This is a 10-character Team ID obtained from your Apple
Developer account.
iat — The Issued At registered claim key. The value of this claim indicates the token creation
time, in terms of the number of seconds since UNIX Epoch, in UTC.
exp — The Expiration Time registered claim key. The value of this claim indicates when the tok
expires, in terms of the number of seconds since UNIX Epoch, in UTC.
To locate your Team ID, sign in to your Apple Developer account, and click Membership in the
sidebar. Your Team ID appears in the Membership information section under the team name.
Generate your token by signing it with your private key.
When decoded, a token for use with Maps Server API has the following format:
To learn more about Maps tokens, see the JSON Web Token (JWT) specification. You can find a
collection of libraries for generating signed tokens at JWT.io.
For next steps, go to Generate a Maps token.
Creating a Maps identifier and a private key
Create a Maps identifier and a private key before generating tokens for MapKit JS.
See Also
Essentials


## Page 3

Generate a Maps token
Returns a JWT maps access token that you use to call the service API.
Debugging an Invalid token
Inspect the JavaScript console logs, the token, and events to determine why a token is invali
Common objects
Understand the common JSON objects that API responses contain.
Integrating the Apple Maps Server API into Java server applications
Streamline your app’s API by moving georelated searches from inside your app to your serve


## Page 4

MapKit JS uses a token to authenticate map initializations and other API requests. Before you can
create a token, you need a Maps identifier (Maps ID) and private key that’s associated with a Map
ID.
You create a Maps ID and private keys through your Apple Developer Account. After you complete
the steps to obtain these items you can construct a token and sign it with your private key, as
Creating and using tokens with Maps Server API describes.
A Maps ID is a string that you provide to identify a domain or environment that calls the MapKit JS
API. Maps IDs use reverse-domain-style notation with three or four fields separated by a dot. The
first field must be maps; the remainder of this string can be a name that’s meaningful to you. For
example, your string might resemble maps.com.mywebsite or maps.com.mycompany
.mywebsite.
To create a Maps ID, follow these steps:
1. Go to developer.apple.com/account and log in with your Apple Developer credentials.
2. Under Certificates, Identifiers & Profiles, click Identifiers in the sidebar.
3. At the top of the identifiers list, click the Add Identifiers button (+).
4. On the following page, select the Maps IDs checkbox, and then click the Continue button at the
top of the page.
5. Enter a string for the description. This can be your app name, team name, project name, or
anything that conveys context and is meaningful to you.
Overview
Create a Maps ID
Apple Maps Server API / Creating a Maps identifier and a private key
Article
Creating a Maps identifier and a private
key
Create a Maps identifier and a private key before generating tokens for MapKit JS


## Page 5

6. Enter a reverse-domain-style string for the identifier (for example, maps.com.mycompany
.mywebsite), then click Continue.
7. Review the information, then click Register.
If you have multiple environments, such as a development environment and a production
environment, it’s good practice to create separate Maps IDs and keys for each environment. That
way, if a key you use in production becomes compromised, revoking it doesn’t affect your UAT or
test environments.
After you create a Maps ID, the next steps are to create a private key, add the MapKit JS service t
this key, and associate it with a Maps ID:
1. In Certificates, Identifiers & Profiles, click Keys in the sidebar, then click the Keys + button at th
top of the keys list.
2. Under Key Name, enter a unique name for the key.
3. Below that, select the checkbox next to MapKit JS. Note that the MapKit JS checkbox isn’t in a
enabled state until you create a Maps ID.
4. Near the top right of the page, click Configure. On the next page, choose a Maps ID to associat
to this key from the pop-up menu, then click Save.
5. Click Continue, review the key configuration, then click Register.
6. Optionally, click Download to download the key. The private key is available to download a sing
time. If the Download button isn’t in an enabled state, you previously downloaded the key
associated with this identifier.
7. Click Done.
After executing these steps, you have a private key that you can use to sign tokens, and you can
begin Creating and using tokens with Maps Server API.
Important
The private key is a shared secret between you and Apple. To keep your private key secure,
don’t put your private key in public facing client-side code, and don’t share the key.
The private key doesn’t expire, but you can revoke it. Revoking a key makes it invalid and affects
calls to the MapKit JS API. If you lose a key or if someone else starts using your key, revoke it. See
Revoke, edit, and download keys for more information.
Obtain a MapKit JS private key


## Page 6

Creating and using tokens with Maps Server API
Sign JSON Web Tokens to use Maps Server API and debug common signing errors.
Generate a Maps token
Returns a JWT maps access token that you use to call the service API.
Debugging an Invalid token
Inspect the JavaScript console logs, the token, and events to determine why a token is invali
Common objects
Understand the common JSON objects that API responses contain.
Integrating the Apple Maps Server API into Java server applications
Streamline your app’s API by moving georelated searches from inside your app to your serve
See Also
Essentials


## Page 7

200
TokenResponse
OK
A response that indicates the authorization request is successful. The
dictionary that accompanies the response contains a maps access token and
an integer that indicates the time in seconds until the token expires.
Content-Type: application/json
401
ErrorResponse
Unauthorized
An error response that indicates the maps token is missing or invalid. The
dictionary that accompanies the error may contain additional details about th
error.
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
An error that indicates the server can’t complete the request. The dictionary
that accompanies the error may contain additional details about the error.
Content-Type: application/json
URL
Response Codes
Apple Maps Server API / Generate a Maps token
Web Service Endpoint
Generate a Maps token
Returns a JWT maps access token that you use to call the service API.
Apple Maps Server API 1.2+


## Page 8

Creating and using tokens with Maps Server API
Creating and using tokens with Maps Server API
Sign JSON Web Tokens to use Maps Server API and debug common signing errors.
Creating a Maps identifier and a private key
Create a Maps identifier and a private key before generating tokens for MapKit JS.
Debugging an Invalid token
Inspect the JavaScript console logs, the token, and events to determine why a token is invali
Common objects
Understand the common JSON objects that API responses contain.
Integrating the Apple Maps Server API into Java server applications
Streamline your app’s API by moving georelated searches from inside your app to your serve
Mentioned in
Discussion
Example
Response
See Also
Essentials
Request


## Page 9

MapKit JS requires a valid token to initialize. If the token you provide isn’t valid, MapKit JS won’t
initialize and doesn’t provide a valid map to the user. When MapKit JS fails to initialize, errors are
available in the JavaScript console.
To diagnose this situation, first check your browser’s JavaScript console for messages that
describe why your token may be invalid. Reasons why a token might be invalid include:
The token is missing required fields.
The token has all the required fields, but some values are incorrect. Verify that the kid claim
matches the key identifier used to sign the token, and that the iss claim matches the 10-
character Team ID for your Apple Developer Account.
The string provided within the origin claim in your token doesn’t exactly match the Origin
header passed by the browser. This string must match exactly, include the protocol (http,
https), trailing slashes, and so on.
For more information about the structure of MapKit-specific token, see Creating and using tokens
with Maps Server API.
MapKit JS considers a token with duplicate headers to be invalid. You can view headers of the
token and check for duplicates by decoding the token at the command line. For example, the
following command decodes the headers of a token:
Overview
Identify errors in the JavaScript console
Examine the token
Apple Maps Server API / Debugging an Invalid token
Article
Debugging an Invalid token
Inspect the JavaScript console logs, the token, and events to determine why a
token is invalid.


## Page 10

In the above output, you can see that the token has two kid headers.
If you find duplicate headers in your token, review the software that you used to create the key to
remove any duplicate headers.
Note
A token contains additional encrypted fields that aren’t decoded and made visible with the
command above.
For more information on how to create a new token, see Creating and using tokens with Maps
Server API.
The MapKit JS API rejects an otherwise valid token when your Apple Developer team exceeds the
number of requests allowed. You can detect when your team exceeds the number of allowed
requests by listening to the error event on the mapkit object.
The following example adds an event listener to the mapkit object and inspects the status stri
to see if the emitted error lists too many requests.
For more information about MapKit JS events, see Handling initialization events.
Inspect the error event on MapKit JS
See Also


## Page 11

Creating and using tokens with Maps Server API
Sign JSON Web Tokens to use Maps Server API and debug common signing errors.
Creating a Maps identifier and a private key
Create a Maps identifier and a private key before generating tokens for MapKit JS.
Generate a Maps token
Returns a JWT maps access token that you use to call the service API.
Common objects
Understand the common JSON objects that API responses contain.
Integrating the Apple Maps Server API into Java server applications
Streamline your app’s API by moving georelated searches from inside your app to your serve
Essentials


## Page 12

object TokenResponse
An object that contains an access token and an expiration time in seconds.
object AutocompleteResult
An object that contains information you can use to suggest addresses and further refine
search results.
object DirectionsResponse
An object that describes the directions from a starting location to a destination in terms
routes, steps, and a series of waypoints.
object EtaResponse
An object that contains an array of one or more estimated times of arrival (ETAs).
object Location
An object that describes a location in terms of its longitude and latitude.
object MapRegion
An object that describes a map region in terms of its upper-right and lower-left corners as a
pair of geographic points.
object Place
Topics
Getting an access token
Getting common object information
Apple Maps Server API / Common objects
API Collection
Common objects
Understand the common JSON objects that API responses contain.


## Page 13

An object that describes a place in terms of a variety of spatial, administrative, and qualitativ
properties.
object PlaceResults
An object that contains an array of places.
object SearchAutocompleteResponse
An array of autocomplete results.
object SearchMapRegion
An object that describes an area to search in terms of its upper-right and lower-left corners 
a pair of geographic points.
object SearchResponse
An object that contains the search region and an array of place descriptions that a search
returns.
object StructuredAddress
An object that describes the detailed address components of a place.
type CountryCode
A string that represents a two-letter country code.
type DirectionsAvoid
A list of the features you can request to avoid when calculating directions.
type Lang
A string that represents a standard tag for identifying languages.
type PoiCategory
A string that describes a specific point of interest (POI) category.
type SearchLocation
A string that describes a geographic location in the form of longitude and latitude.
type SearchRegion
A string that describes a region to search in terms of its upper-right and lower-left corners a
a pair of geographic points.
type UserLocation
A string that describes the user’s location in terms of longitude and latitude.
Getting common type information


## Page 14

object ErrorResponse
Information about an error that occurs while processing a request.
Creating and using tokens with Maps Server API
Sign JSON Web Tokens to use Maps Server API and debug common signing errors.
Creating a Maps identifier and a private key
Create a Maps identifier and a private key before generating tokens for MapKit JS.
Generate a Maps token
Returns a JWT maps access token that you use to call the service API.
Debugging an Invalid token
Inspect the JavaScript console logs, the token, and events to determine why a token is invali
Integrating the Apple Maps Server API into Java server applications
Streamline your app’s API by moving georelated searches from inside your app to your serve
Handling errors
See Also
Essentials


## Page 15

This sample demonstrates how to integrate the Apple Maps Server API into Java-based apps.
The MapsApiClientDemo.java file demonstrates how you use the Apple Maps Server APIs an
the following API features:
Getting an Access Token — Authenticate with the service and retrieve an Apple Maps Server AP
token.
Geocoding — Retrieve the latitude and longitude from a text address.
Reverse Geocoding — Retrieve a list of addresses that are present at the specified latitude and
longitude.
Searching — Search for locations by criteria you provide.
SearchAutoComplete - Get a list of autocomplete results for the specified search query.
ETAs — Calculate estimated times of arrival (ETAs) between a specified starting location and on
or more destinations.
Directions - Get directions between origin and destination points.
Note
This sample code project is associated with WWDC22 session: 10006 Meet Apple Maps
Server APIs
Overview
Apple Maps Server API / Integrating the Apple Maps Server API into Java server applications
Sample Code
Integrating the Apple Maps Server API into
Java server applications
Streamline your app’s API by moving georelated searches from inside your app to
your server.
Download


## Page 16

To build this sample, you need the following tools and other information:
Java 17 — This sample code can run on older versions of Java with some minor modifications,
depending upon your Java installation.
Gradle — The project includes a Gradle command wrapper that uses Gradle version 7.5.1; you
may a different version if you need to use a different Java installation.
Your Apple Developer team ID — This is a 10-character team ID you obtain from the membersh
tab in your Apple Developer portal account.
A Maps key ID and private key — This is a 10-character key identifier that provides the ID of the
private key and the private key that you obtain from your Apple Developer portal account. To
create a Maps ID and private key, follow the steps in Creating a Maps identifier and a private ke
In the MapsApiClientDemo.java file, edit the createJwt() method to set the teamId, key
Id, and key variables to the values you obtained from your Apple Developer portal account.
To run the sample, enter the following commands in Terminal while in the server-api-example
directory:
Creating and using tokens with Maps Server API
Sign JSON Web Tokens to use Maps Server API and debug common signing errors.
Creating a Maps identifier and a private key
Create a Maps identifier and a private key before generating tokens for MapKit JS.
Generate a Maps token
Returns a JWT maps access token that you use to call the service API.
Debugging an Invalid token
Inspect the JavaScript console logs, the token, and events to determine why a token is invali
Configure the sample code project
Run the sample
See Also
Essentials


## Page 17

Common objects
Understand the common JSON objects that API responses contain.


