# 001_Reverse geocode a location.pdf

## Page 1

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


## Page 2

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


