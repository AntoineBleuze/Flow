# 002_Get a Context.pdf

## Page 1

environment
string
(Required) The development or production environment to use for this acces
For details, see Testing Your ClassKit Catalog Implementation.
Possible Values: development, production
identifierPath
string
(Required) The identifier path for the context to retrieve. Format this value as
URL-encoded JSON array of strings.
locale
string
(Required) The locale of the context to retrieve. Use one of the identifiers
supported by the Locale structure. It must match a locale that your app
supports.
200
ContextsResponse
OK
Content-Type: application/json
400
Bad Request
The request contained an error.
403
Forbidden
The request wasn’t authorized.
URL
Query Parameters
Response Codes
ClassKit Catalog API / Get a Context
Web Service Endpoint
Get a Context
Fetch information that you previously stored about your app’s assignable activitie
ClassKit 1.0+


## Page 2

Preparing Context Data
Adjust how you manage context data when working with the web API.
Create or Replace Contexts
Store information about the assignable content that your educational app provides.
Delete a Context
Remove information that you previously stored about your app’s assignable activities.
object Context
An area of your app that represents an assignable task, like a quiz or a chapter.
object ContextsRequest
A request that you make when modifying context information.
object ContextsResponse
The response you receive after modifying context information.
Discussion
Example
Response
See Also
Declaring Contexts
Request


