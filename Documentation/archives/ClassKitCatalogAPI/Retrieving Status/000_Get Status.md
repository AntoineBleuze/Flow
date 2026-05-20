# 000_Get Status.pdf

## Page 1

statusId
string
(Required) The identifier of the operation for which you want to retrieve the
status.
200
Status
OK
The request succeeded.
Content-Type: application/json
400
Bad Request
The request contained an error.
403
Forbidden
The request wasn’t authorized.
If the system can’t immediately complete a request, the ClassKit Catalog API may acknowledge
that it received the request and respond with a HTTP response containing the status code 202
ACCEPTED. In this case, the response contains a header with the name “Location”. The
URL
Path Parameters
Response Codes
Discussion
ClassKit Catalog API / Get Status
Web Service Endpoint
Get Status
Fetch the status of an operation that you initiated earlier.
ClassKit 1.0+


## Page 2

corresponding value is a URL that points to the Get Status endpoint, including a statusId as
the last path parameter. The header item might look like this:
Use this statusID to ask the server for a status update at a later time.
object Status
The state of a request that the API previously accepted, but didn’t complete right away.
Example
Response
See Also
Retrieving Status
Request


