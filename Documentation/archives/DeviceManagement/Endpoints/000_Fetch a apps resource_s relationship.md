# 000_Fetch a apps resource_s relationship.pdf

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


