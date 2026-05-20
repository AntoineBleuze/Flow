# Geocoding.pdf

## Page 1

q
string
(Required) The address to geocode. For example: q=1 Apple Park,
Cupertino, CA
limitToCountries
[string]
A comma-separated list of two-letter ISO 3166-1 codes to limit the results to
For example: limitToCountries=US,CA.
If you specify two or more countries, the results reflect the best available
results for some or all of the countries rather than everything related to the
query for those countries.
lang
Lang
The language the server should use when returning the response, specified
using a BCP 47 language code. For example, for English use lang=en-US.
Default: en-US
searchLocation
SearchLocation
A location defined by the application as a hint. Specify the location as a
comma-separated string containing the latitude and longitude. For example,
searchLocation=37.78,-122.42.
searchRegion
SearchRegion
A region the app defines as a hint. Specify the region specified as a comma-
separated string that describes the region in the form north-latitude, east-
longitude, south-latitude, west-longitude. For example, search
Region=38,-122.1,37.5,-122.5.
URL
Query Parameters
Apple Maps Server API / Geocode an address
Web Service Endpoint
Geocode an address
Returns the latitude and longitude of the address you specify.
Apple Maps Server API 1.2+


## Page 2

userLocation
UserLocation
The location of the user, specified as a comma-separated string that contains
the latitude and longitude. For example: userLocation=37.78,-122.42.
Certain APIs, such as Searching, may opt to use the userLocation, if
specified, as a fallback for the searchLocation.
200
PlaceResults
OK
An array of Place objects.
Content-Type: application/json
400
ErrorResponse
Bad Request
An ErrorResponse object that contains an error message and an array of
strings that contains additional details.
Content-Type: application/json
401
ErrorResponse
Unauthorized
An ErrorResponse object that contains an error message that indicates th
Maps access token was missing or invalid and an array of strings that contain
additional details about the error.
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
An ErrorResponse object that contains a server error message and an arra
of strings that describe additional details about the error.
Content-Type: application/json
Response Codes
Discussion
Example
Response
See Also
Request


## Page 3

Reverse geocode a location
Returns an array of addresses present at the coordinates you provide.
Geocoding


## Page 4

loc
string
(Required) The coordinate to reverse geocode as a comma-separated string
that contains the latitude and longitude. For example: loc=37
.3316851,-122.0300674.
lang
Lang
The language the server uses when returning the response, specified using a
BCP 47 language code. For example, for English, use lang=en-US.
Default: en-US
200
PlaceResults
OK
An array of one or more Place objects.
Content-Type: application/json
400
ErrorResponse
Bad Request
An ErrorResponse object that contains an error message and an array of
strings that contain additional details.
Content-Type: application/json
401
ErrorResponse
Unauthorized
An ErrorResponse object that contains an error message that indicates th
Maps access token is missing or invalid, and an array of strings that contains
URL
Query Parameters
Response Codes
Apple Maps Server API / Reverse geocode a location
Web Service Endpoint
Reverse geocode a location
Returns an array of addresses present at the coordinates you provide.
Apple Maps Server API 1.2+


## Page 5

additional details about the error.
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
An ErrorResponse object that contains a server error message and an arra
of strings that contains additional details about the error.
Content-Type: application/json
Geocode an address
Returns the latitude and longitude of the address you specify.
Discussion
Example
Response
See Also
Geocoding
Request


