# 007_Fetching Resources by Page.pdf

## Page 1

Some GET requests support pagination of the objects or an object’s relationships and relationship
views. Specify a limit parameter to restrict the number of resources returned. If you don’t supp
a limit, the API supplies a default one. If you reach the limit to the number of resource objects in a
response, the response contains a subset of the resource objects matching your criteria. In this
case you must make more requests to get the rest of the objects.
See the corresponding resource’s object model for the default fetch limit. If there are more
resource objects than permitted by the fetch limit, the response contains a next member whose
value is a subpath to use in the next request. The subpath contains the offset parameter that
specifies the next page. Similarly, a Relationship object may contain a next member that you
can use to fetch more objects in a relationship.
For example, you may fetch all objects of a resource type, but specify the amount in the response
by using the limit parameter.
If there are more objects to fetch, the response contains a next member.
Overview
Apple Music API / Fetching Resources by Page
Article
Fetching Resources by Page
Use pagination to fetch the next set of objects.


## Page 2

Pass the next subpath, and optionally, use the limit parameter again, in the next request.
Continue requesting the resource objects until the next member no longer appears in the
response.
Generating Developer Tokens
Generate a developer token needed to make requests to Apple Music API.
User Authentication for MusicKit
Authenticate requests for user data using the Music User Token.
Handling Requests and Responses
Write a request and handle responses from the API.
See Also
Essentials


## Page 3

Handling Resource Representation and Relationships
Fetch resources with extended attributes and included relationships and relationship views.
Storefronts and Localization
Pick a region-specific geographic location from which to retrieve catalog information, or
retrieve information from the user’s personal library.
Common Objects
Understand the common JSON objects that framework responses contain.
Managing Content Ratings, Alternate Versions, and Equivalencies
Handle multiple and alternate versions of content.


