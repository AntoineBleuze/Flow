# Downloads.pdf

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
Account Data Transfer / Get one-time request download URLs
Web Service Endpoint
Get one-time request download URLs
Get URLs to retrieve someone’s data.
Account Data Transfer 1.0+
Request


## Page 2

Get recurring request download URLs
Get URLs to download a snapshot of someone’s data from a recurring series.
object DownloadLinks
An object that contains URLs to download someone’s account data.
object DownloadError
An object that describes an error the server encounters preparing download URLs for a
request.
See Also
Downloads


## Page 3

requestId
string
(Required) A UUID that identifies the individual download request in the
recurring sequence.
parentRequestId
string
(Required) A UUID that identifies the recurring sequence of download
requests.
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
Account Data Transfer / Get recurring request download URLs
Web Service Endpoint
Get recurring request download URLs
Get URLs to download a snapshot of someone’s data from a recurring series.
Account Data Transfer 1.0+


## Page 4

Get one-time request download URLs
Get URLs to retrieve someone’s data.
object DownloadLinks
An object that contains URLs to download someone’s account data.
object DownloadError
An object that describes an error the server encounters preparing download URLs for a
request.
Overview
Response
See Also
Downloads
Request


## Page 5

assetInfo
[string]
An array of URLs to which you make GET requests to download someone’s
account data if jobStatus is completed; otherwise, [TBD].
jobStatus
string
Possible Values: completed, request_not_found, in_progress,
error, completed_with_error, cancelled
status
string
Value: success
The URLs you get from the assetInfo property are valid for 15 minutes after you receive them.
=======
assetInfo: An array of URLs to which you make GET requests to download someone’s account
data.
Properties
Overview
Account Data Transfer / DownloadLinks
Object
DownloadLinks
An object that contains URLs to download someone’s account data.
Account Data Transfer 1.0+


## Page 6

Note
Note
Note
Note
Note
Note
Note
Main
jobStatus: The result of the download request.
status: The result of the operation to request download links.
Get one-time request download URLs
Get URLs to retrieve someone’s data.
Get recurring request download URLs
Get URLs to download a snapshot of someone’s data from a recurring series.
object DownloadError
An object that describes an error the server encounters preparing download URLs for a
request.
See Also
Downloads


## Page 7

statusCheckDelay
integer
The number of seconds to wait before re-requesting the status.
status
string
The outcome of the operation.
Value: error
statusMessage
string
The reason the server encountered an error.
Possible Values: in_progress, request_not_found,
invalid_request_status
The statusMessage field has one of these values:
invalid_request_status
The download request isn’t complete and you need to request the download URLs again afte
statusCheckDelay seconds.
request_not_found
The request ID you provided isn’t recognized.
Properties
Overview
Account Data Transfer / DownloadError
Object
DownloadError
An object that describes an error the server encounters preparing download URL
for a request.
Account Data Transfer 1.0+


## Page 8

Get one-time request download URLs
Get URLs to retrieve someone’s data.
Get recurring request download URLs
Get URLs to download a snapshot of someone’s data from a recurring series.
object DownloadLinks
An object that contains URLs to download someone’s account data.
See Also
Downloads


