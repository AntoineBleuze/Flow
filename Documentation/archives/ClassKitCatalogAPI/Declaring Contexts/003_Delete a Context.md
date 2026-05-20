# 003_Delete a Context.pdf

## Page 1

environment
string
(Required) The development or production environment to use for this acces
For details, see Testing Your ClassKit Catalog Implementation.
Possible Values: development, production
identifierPath
string
(Required) The identifier path for the context to delete. Format this value as 
URL-encoded JSON array of strings.
locale
string
(Required) The locale of the context to delete. Use one of the identifiers
supported by the Locale structure. It must match a locale that your app
supports.
202
Accepted
The API accepted but hasn’t completed the request. To ask for a status upda
later, see Get Status.
204
No Content
The request succeeded.
400
Bad Request
URL
Query Parameters
Response Codes
ClassKit Catalog API / Delete a Context
Web Service Endpoint
Delete a Context
Remove information that you previously stored about your app’s assignable
activities.
ClassKit 1.0+


## Page 2

The request contained an error.
403
Forbidden
The request wasn’t authorized.
You can’t delete a context that has child contexts. Delete any child contexts before trying to delet
their parent.
Preparing Context Data
Adjust how you manage context data when working with the web API.
Create or Replace Contexts
Store information about the assignable content that your educational app provides.
Get a Context
Fetch information that you previously stored about your app’s assignable activities.
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


## Page 3



