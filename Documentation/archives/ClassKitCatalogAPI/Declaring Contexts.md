# Declaring Contexts.pdf

## Page 1

The Context objects that you send to the ClassKit Catalog API resemble the CLSContext
instances that you construct when declaring a context hierarchy in your app. For example, you
provide information in the Context.Data object like a title, a type, and a summary, correspondin
to the title, type, and summary properties of CLSContext, respectively. However, there are
some differences in the way you describe contexts to the ClassKit Catalog API, like how you refer 
the main app context and how you manage localization.
For general information about building a context hierarchy, see Advertising your app’s assignable
content.
Every app has a single main app context at the root of its context hierarchy. You access the main
app context from inside your app using the mainAppContext property of the ClassKit data store
and can neither create nor destroy the context. ClassKit manages the main app context for you.
When building a context hierarchy in the ClassKit Catalog API, you explicitly create a main app
context. Be sure to set the type field to app, and set the context’s title to match the name of
the app in the context’s locale. To avoid confusion, it’s a good idea to make these match exactly.
The Schoolwork app refers to your app by its name after the teacher installs your app, but by the
main context’s title otherwise.
To refer to your main app context in an API call, use a string that contains the bundle identifier for
the app as its identifier path. For example, the identifier path of the main app context of the
GreatPlays sample app — which you can download from Incorporating ClassKit into an Educationa
App — is:
Overview
Access the Main App Context
ClassKit Catalog API / Preparing Context Data
Article
Preparing Context Data
Adjust how you manage context data when working with the web API.


## Page 2

In your app, you describe exactly one version of a given context identified by an identifier
Path. You localize user-facing elements, like the title and the summary, by providing localized
strings at runtime based on the locale set by the user for the device.
Using the ClassKit Catalog API, on the other hand, you enumerate all of the localized versions of a
given context. Use the locale field in the Context.Metadata object to indicate the locale to
which a context applies. Provide different versions of the same context — uniquely identified by th
identifier path — for each of the locales that you support.
Create or Replace Contexts
Store information about the assignable content that your educational app provides.
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
Provide Localization Data for Contexts
See Also
Declaring Contexts


## Page 3

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


## Page 4

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


## Page 5



## Page 6



## Page 7



## Page 8

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


## Page 9

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


## Page 10

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


## Page 11

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


## Page 12

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


## Page 13



## Page 14

data
Context.Data
(Required) The data that makes up the context. This is largely the same
information that you provide to the ClassKit framework when you create a
CLSContext instance.
metadata
Context.Metadata
(Required) Information about the context, like the locale to which the contex
applies.
Possible types:
Preparing Context Data
The contexts that you specify in your app as CLSContext instances correspond to the Context
.Data object. The Context.Metadata object contains additional information about a context
that’s implicit when working with ClassKit in your app.
Properties
Attributes
Mentioned in
Discussion
ClassKit Catalog API / Context
Dictionary
Context
An area of your app that represents an assignable task, like a quiz or a chapter.
ClassKit 1.0+


## Page 15

object Context.Data
The data that makes up a context.
object Context.Metadata
Information that helps the system categorize a context.
Preparing Context Data
Adjust how you manage context data when working with the web API.
Create or Replace Contexts
Store information about the assignable content that your educational app provides.
Get a Context
Fetch information that you previously stored about your app’s assignable activities.
Delete a Context
Remove information that you previously stored about your app’s assignable activities.
object ContextsRequest
A request that you make when modifying context information.
object ContextsResponse
The response you receive after modifying context information.
Topics
Objects
See Also
Declaring Contexts


## Page 16

contexts
[Context]
(Required) An array of contexts that can contain up to 200 context objects.
Possible types:
Use this request object to define one or more contexts that your app provides.
Preparing Context Data
Adjust how you manage context data when working with the web API.
Create or Replace Contexts
Properties
Attributes
Discussion
See Also
Declaring Contexts
ClassKit Catalog API / ContextsRequest
Dictionary
ContextsRequest
A request that you make when modifying context information.
ClassKit 1.0+


## Page 17

Store information about the assignable content that your educational app provides.
Get a Context
Fetch information that you previously stored about your app’s assignable activities.
Delete a Context
Remove information that you previously stored about your app’s assignable activities.
object Context
An area of your app that represents an assignable task, like a quiz or a chapter.
object ContextsResponse
The response you receive after modifying context information.


## Page 18

contexts
[Context]
An array of contexts returned by a call to the ClassKit Catalog API.
Possible types:
Preparing Context Data
Adjust how you manage context data when working with the web API.
Create or Replace Contexts
Store information about the assignable content that your educational app provides.
Get a Context
Fetch information that you previously stored about your app’s assignable activities.
Properties
Attributes
See Also
Declaring Contexts
ClassKit Catalog API / ContextsResponse
Dictionary
ContextsResponse
The response you receive after modifying context information.
ClassKit 1.0+


## Page 19

Delete a Context
Remove information that you previously stored about your app’s assignable activities.
object Context
An area of your app that represents an assignable task, like a quiz or a chapter.
object ContextsRequest
A request that you make when modifying context information.


