# 001_User Authentication for MusicKit.pdf

## Page 1

Apple Music API requires the inclusion of a Music User Token for any requests for data specific to
an Apple Music subscriber, such as to fetch content from the user’s library. The way to configure
your requests to Apple Music API with a valid Music User Token depends on the platform for your
app.
MusicKit automatically manages Music User Token for Apple platforms and for web apps. If you’re
developing an app for Apple platforms (iOS, tvOS, watchOS, or macOS), use MusicKit for Swift to
integrate with Apple Music. The framework automatically decorates requests to Apple Music API
with a valid Music User Token.
Similarly, if you’re developing a web app, MusicKit on the Web automatically decorates requests t
Apple Music API with a valid Music User Token.
Automatic Music User Token management is not available for Android. If you’re developing an app
for Android, please refer to the authentication section of the MusicKit for Android’s documentatio
to learn more about how to retrieve a Music User Token.
Once you’ve successfully retrieved a Music User Token, make sure to include it in your HTTP
requests to Apple Music API with the Music-User-Token header.
Below is an example of issuing a personalized request to Apple Music API using curl.
Overview
Automatic Music User Token Management
Manual Music User Token Management for Android
Apple Music API / User Authentication for MusicKit
Article
User Authentication for MusicKit
Authenticate requests for user data using the Music User Token.


## Page 2

For more information about requests, responses, and error handling, see Handling Requests and
Responses.
Generating Developer Tokens
Generate a developer token needed to make requests to Apple Music API.
Handling Requests and Responses
Write a request and handle responses from the API.
Handling Resource Representation and Relationships
Fetch resources with extended attributes and included relationships and relationship views.
Storefronts and Localization
Pick a region-specific geographic location from which to retrieve catalog information, or
retrieve information from the user’s personal library.
Common Objects
Understand the common JSON objects that framework responses contain.
Managing Content Ratings, Alternate Versions, and Equivalencies
Handle multiple and alternate versions of content.
Fetching Resources by Page
Use pagination to fetch the next set of objects.
See Also
Essentials


