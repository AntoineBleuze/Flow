# 000_Get one-time request download URLs.pdf

## Page 1

requestId
string
(Required) A UUID that identifies the one-time request.
200
DownloadLinks
OK
Content-Type: application/json
400
DownloadError
Bad Request
Content-Type: application/json
401
Unauthorized
403
Forbidden
500
Internal Server Error
URL
Path Parameters
Response Codes
Overview
Response
App Data Transfer / Get one-time request download URLs
Web Service Endpoint
Get one-time request download URLs
Get URLs to retrieve someone’s data.
App Data Transfer 1.0+
Request


## Page 2

Get recurring request download URLs
Get URLs to download a snapshot of someone’s data specific to your app from a recurring
series.
object DownloadLinks
An object that contains URLs to download someone’s data specific to your app.
object DownloadError
An object that describes an error the server encounters while preparing download URLs for a
request.
See Also
Downloads


