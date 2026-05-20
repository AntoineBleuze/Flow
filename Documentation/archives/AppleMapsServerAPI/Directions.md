# Directions.pdf

## Page 1

origin
string
(Required) The starting location as an address, or coordinates you specify a
latitude, longitude. For example, origin=37.7857,-122.4011
destination
string
(Required) The destination as an address, or coordinates you specify as
latitude, longitude. For example, destination=San Francisco City
Hall, CA
arrivalDate
string
The date and time to arrive at the destination in ISO 8601 format in UTC time
For example, 2023-04-15T16:42:00Z.
You can specify only arrivalDate or departureDate. If you don’t specif
either option, the departureDate defaults to now, which the server
interprets as the current time.
avoid
[DirectionsAvoid]
A comma-separated list of the features to avoid when calculating direction
routes. For example, avoid=Tolls.
See DirectionsAvoid for a complete list of possible values.
departureDate
string
The date and time to depart from the origin in ISO 8601 format in UTC time. F
example, 2023-04-15T16:42:00Z.
URL
Query Parameters
Apple Maps Server API / Search for directions and estimated travel time between locations
Web Service Endpoint
Search for directions and estimated travel
time between locations
Find directions by specific criteria.
Apple Maps Server API 1.2+


## Page 2

You can only specify arrivalDate or departureDate. If you don’t specif
either option, the departureDate defaults to now, which the server
interprets as the current time.
lang
Lang
The language the server uses when returning the response, specified using a
BCP 47 language code. For example, for English, use lang=en-US.
Default: en-US
requestsAlternate
Routes
boolean
When you set this to true, the server returns additional routes, when availab
For example, requestsAlternateRoutes=true.
Default: false
searchLocation
SearchLocation
A searchLocation the app defines as a hint for the query input for origi
or destination. Specify the location as a comma-separated string that
contains the latitude and longitude. For example, 37.7857,-122.4011.
If you don’t provide a searchLocation, the server uses userLocation a
searchLocation as fallback hints.
searchRegion
SearchRegion
A region the app defines as a hint for the query input for origin or
destination. Specify the region as a comma-separated string that describ
the region in the form of a north-latitude, east-longitude, south-latitude, wes
longitude string. For example, 38,-122.1,37.5,-122.5.
If you don’t provide a searchLocation, the server uses userLocation a
searchRegion as fallback hints.
transportType
string
The mode of transportation the server returns directions for.
Default: Automobile
Possible Values: Automobile, Walking, Cycling
userLocation
UserLocation
The location of the user, specified as a comma-separated string that contains
the latitude and longitude. For example, userLocation=37.78,-122.42.
If you don’t provide a searchLocation, the server uses userLocation a
searchRegion as fallback hints.
200
DirectionsResponse
OK
Returns a DirectionsResponse result that describes the steps and routes
from the origin to the destination.
Content-Type: application/json
400
ErrorResponse
Bad Request
An ErrorResponse object that contains an error message and an array of
strings that contain additional details about the error.
Content-Type: application/json
Response Codes


## Page 3

401
ErrorResponse
Unauthorized
An ErrorResponse object that contains an error message that indicates th
Maps access token is missing or invalid, and an array of strings that contains
additional details about the error.
Content-Type: application/json
429
ErrorResponse
An ErrorResponse object that indicates the call exceeds the daily service
call quota for the authorization token. The app can try again later. If your app
requires a larger daily quota, submit a quota increase request form.
Content-Type: application/json
500
ErrorResponse
Internal Server Error
An ErrorResponse object that contains a server error message and an arra
of strings that describe additional details about the error.
Content-Type: application/json
Determine estimated arrival times and distances to one or more
destinations
Returns the estimated time of arrival (ETA) and distance between starting and ending
locations.
Discussion
Example
Response
See Also
Directions
Request


## Page 4

origin
string
(Required) The starting point for estimated arrival time requests, specified a
comma-separated string that contains the latitude and longitude. For exampl
origin=37.331423,-122.030503.
destinations
[string]
(Required) Destination coordinates represented as pairs of latitude and
longitude separated by a vertical bar character (”|”).
For example, destinations=37.32556561130194,-121
.94635203581443|37.44176585512703,-122.17259315798667.
The parameter must specify at least one destination coordinate, but no more
than 10 destinations. Specify the location as a comma-separated string that
contains the latitude and longitude.
transportType
string
The mode of transportation to use when estimating arrival times.
Default: Automobile
Possible Values: Automobile, Transit, Walking, Cycling
departureDate
string
The time of departure to use in an estimated arrival time request, in ISO 8601
format in UTC time.
URL
Query Parameters
Apple Maps Server API / Determine estimated arrival times and distances to one or more destinations
Web Service Endpoint
Determine estimated arrival times and
distances to one or more destinations
Returns the estimated time of arrival (ETA) and distance between starting and
ending locations.
Apple Maps Server API 1.2+


## Page 5

For example, departureDate=2020-09-15T16:42:00Z.
If you don’t specify a departure date, the server uses the current date and tim
when you make the request.
arrivalDate
string
The intended time of arrival in ISO 8601 format in UTC time.
200
EtaResponse
OK
An array of EtaResponse objects that contain distance and time from the
origin to each destination.
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
Request


## Page 6

Search for directions and estimated travel time between locations
Find directions by specific criteria.
See Also
Directions


