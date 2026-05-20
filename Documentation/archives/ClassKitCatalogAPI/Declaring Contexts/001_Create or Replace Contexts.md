# 001_Create or Replace Contexts.pdf

## Page 1

environment
string
(Required) The development or production environment to use for this acces
For details, see Testing Your ClassKit Catalog Implementation.
Possible Values: development, production
ContextsRequest
The context or contexts to add.
Content-Type: application/json
201
Created
The request succeeded.
202
Accepted
The API accepted but hasn’t completed the request. To ask for a status upda
later, see Get Status.
400
Bad Request
The request contained an error.
URL
Query Parameters
HTTP Body
Response Codes
ClassKit Catalog API / Create or Replace Contexts
Web Service Endpoint
Create or Replace Contexts
Store information about the assignable content that your educational app
provides.
ClassKit 1.0+


## Page 2

403
Forbidden
The request wasn’t authorized.
Define parent contexts of any of the contexts defined in this call, either in a previous call to the
same endpoint, or as part of the same call.
You can specify up to 200 contexts for any one call to this endpoint. The call overwrites any
contexts that already exist with the same identifier path and locale.
Discussion
Example
Response
Request


## Page 3



## Page 4



## Page 5



## Page 6

Preparing Context Data
Adjust how you manage context data when working with the web API.
Get a Context
Fetch information that you previously stored about your app’s assignable activities.
Delete a Context
Remove information that you previously stored about your app’s assignable activities.
object Context
An area of your app that represents an assignable task, like a quiz or a chapter.
object ContextsRequest
A request that you make when modifying context information.
object ContextsResponse
The response you receive after modifying context information.
See Also
Declaring Contexts


