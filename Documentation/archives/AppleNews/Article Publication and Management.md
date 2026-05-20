# Article Publication and Management.pdf

## Page 1

In this tutorial, you’ll use Python to request channel data and publish an article to your channel. T
tutorial assumes you’re familiar with basic Python programming constructs and techniques.
Beginning programmers should be able to follow along and run this tutorial.
In addition to Python, the tutorial code is also available in Java, C#, and PHP. To get the code for a
four, download the Apple-News-API-Tutorial-Example-Code.zip file.
Before beginning the tutorial, make sure you have the following information and installed software
Channel ID, Key ID, and Key Secret. See Use your CMS with News Publisher in News Publisher
User Guide.
Python. Ensure that you have PIP installed. PIP is automatically installed if you have Python
3.4+. See Installing Python Modules.
Python’s Requests library.
If you are not familiar with Apple News API endpoints, see Apple News API before you get started
Overview
Alternative Tutorial Code Languages
Requirements
Topics
Apple News API Python Tutorial
Apple News / Apple News API Tutorial
Apple News API Tutorial
Request channel data and publish an article using the Apple News API.


## Page 2

Making an HTTP Request to the Apple News API
Create the URL, set the method, and send the request.
Signing the HTTP Request
Sign the canonical request and send the custom authorization header to the Apple News AP
Publishing an Article
Build a URL and article body for the publish-article request.
Apple News API
Publish and manage Apple News Format articles.
See Also
Article Publication and Management


## Page 3

The Apple News API delivers Apple News Format articles to be published in the Apple News app
and helps you manage and monitor those articles after they’ve been published.
Based on representational state transfer (REST) technology, the Apple News API has typical
RESTful characteristics, which means that it:
Does operations on a set of resources. Resources are objects that have a type, associated data
and relationships to other resources. In the Apple News API, resources include channels,
sections that you’ve set up for your channels (for example, Sports or Politics), and the articles
that you want to publish and manage.
Has stateless operations. Interactions with the create, read, update, and delete (CRUD)
operations are handled using only the information that comes with the request — no previous
information or state is assumed. Therefore, requests made using the Apple News API must
include all information required to complete the operation within the request.
Getting Ready to Publish and Manage Your Articles
Get set up for using the Apple News API.
About the Apple News Security Model
Learn how the Apple News API authenticates clients, authorizes your news channel, and
enforces confidentiality.
Overview
Topics
Essentials
Web Service
Apple News API
Publish and manage Apple News Format articles.


## Page 4

About Apple News API Field Types
Understand the standard field types used in the Apple News API.
Formatting Strings
Learn how to format strings to pass to the API client.
Release notes announce new features, updates, and deprecations for major releases, so you can
plan for changes and make adjustments as needed.
Apple News API Release Notes for iOS 17, iPadOS 17, and macOS 14
Learn about the new features and deprecated fields in Apple News API.
Read Channel Information
Get details about your channel, including the name, corresponding website, and default
section.
Read Channel Quota Information
Get details about your channel’s remaining quota for sending create and update requests, th
queue size, and wait time.
object Channel
See the fields the read channel endpoint returned.
object ChannelLinks
See the links the read channel endpoint returned.
object ChannelResponse
See which objects make up the channel response.
List All Sections
See a list of available sections in your channel.
Read Section Information
Get information about the specified section, including its name, its channel, and whether it’s
default section.
Release Notes
Channel
Sections


## Page 5

Promote Articles in a Section
Set the list of promoted articles for the specified section.
object Section
See the fields the section endpoints returned.
object SectionLinks
See the links the section endpoints returned.
object SectionResponse
See which objects make up the section response.
object PromoteArticleRequest
See the required field for the Promote an Article request.
object PromoteArticleResponse
See the field the Promote an Article response returned.
Create an Article
Publish an article to your channel.
Read Article Information
Retrieve information about an article, such as the revision number and maturity rating.
Search Articles in a Channel
See a list of all articles in a channel that match the specified search criteria.
Search Articles in a Section
See a list of all articles in a section that match the specified search criteria.
Update an Article
Update an existing article in your channel.
Delete an Article
Delete the specified article from your channel.
object Create Article Metadata Fields
See the optional metadata fields for the Create an Article Request.
object ArticleLinksRequest
See the required field for the Create an Article request.
Articles


## Page 6

object Update Article Metadata Fields
See the metadata fields for the Update an Article request.
object Article
See the fields the article endpoints returned.
object ArticleResponse
See which objects make up the Create an Article, Read an Article, and Update an Article
responses.
object ArticleLinksResponse
See the links the article endpoints returned.
object SearchResponse
See the fields the search article endpoints returned.
object Meta
See the object that wraps the throttling information that’s returned for the Create an Article
and Read an Article endpoints.
object Throttling
See the object that wraps the throttling information that’s returned for the Create an Article
and Update an Article endpoints.
About Apple News API Error Messages
Understand the error message format for the Apple News API.
object Warning
See the properties of a warning the Apple News API returned.
object Error
See the properties of an error the Apple News API returned.
type Code
See the error codes the Apple News API returned.
type Status
See the HTTP status codes the Apple News API returned.
Errors


## Page 7

Apple News API Tutorial
Request channel data and publish an article using the Apple News API.
See Also
Article Publication and Management


