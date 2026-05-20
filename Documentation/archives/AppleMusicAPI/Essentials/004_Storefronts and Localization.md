# 004_Storefronts and Localization.pdf

## Page 1

Apple Music is a worldwide service that operates in many countries, regions, and languages.
Content varies from one geographic region to another, so each request must contain a storefront
object. Storefront defines the desired region and the supported languages for that region. For mo
requests, you specify the storefront associated with the current user, but you may also specify
other storefronts as needed. For example, you might specify a storefront that better matches the
user’s preferred language.
Each storefront has a default language, and may support one or more additional languages. For
example, the United States storefront includes American English as the default language, but also
includes Mexican Spanish as an additional supported language. Apple Music automatically localiz
responses using the storefront’s default language, but you can localize to a different language
using the l query parameter. The value of that parameter must be one of the values in the
supportedLanguageTags attribute of the storefront object. For example, the following request
asks the US storefront to return an album in the Mexican Spanish (es-MX) localization.
Get a Storefront
Fetch a single storefront by using its identifier.
Overview
Topics
Requesting a Catalog Storefront
Apple Music API / Storefronts and Localization
API Collection
Storefronts and Localization
Pick a region-specific geographic location from which to retrieve catalog
information, or retrieve information from the user’s personal library.


## Page 2

Get Multiple Storefronts
Fetch one or more storefronts by using their identifiers.
Get All Storefronts
Fetch all the storefronts in alphabetical order.
Get the best supported language for a storefront
Fetch the best supported language for a storefront from a list.
object Storefronts
A resource object that represents a storefront, an Apple Music and iTunes Store territory tha
the content is available in.
Generating Developer Tokens
Generate a developer token needed to make requests to Apple Music API.
User Authentication for MusicKit
Authenticate requests for user data using the Music User Token.
Handling Requests and Responses
Write a request and handle responses from the API.
Handling Resource Representation and Relationships
Fetch resources with extended attributes and included relationships and relationship views.
Common Objects
Understand the common JSON objects that framework responses contain.
Managing Content Ratings, Alternate Versions, and Equivalencies
Handle multiple and alternate versions of content.
Localization
Handling the Response
See Also
Essentials


## Page 3

Fetching Resources by Page
Use pagination to fetch the next set of objects.


