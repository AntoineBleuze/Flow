# Dictionaries.pdf

## Page 1

id
string
(Required) The identifier for the album period summaries resource.
relationships
AlbumPeriodSummaries
.Relationships
The connection from artist-period-summary to other resources.
type
string
(Required) The type of resource. This value is always album-period-
summaries.
Value: album-period-summaries
object AlbumPeriodSummaries.Relationships
The relationships from album-period-summary to other resources.
Properties
Topics
Dictionaries
Apple Music API / AlbumPeriodSummaries
Object
AlbumPeriodSummaries
The album for the period summary.
Apple Music 1.0+


## Page 2

id
string
(Required) The identifier for the artist period summaries resource.
relationships
ArtistPeriod
Summaries
.Relationships
The ArtistPeriodSummaries.Relationships relationship.
type
string
(Required) The type of the resource.
Value: artist-period-summaries
object ArtistPeriodSummaries.Relationships
The relationships from ArtistPeriodSummaries to other resources.
Properties
Topics
Dictionaries
Apple Music API / ArtistPeriodSummaries
Object
ArtistPeriodSummaries
The artist for the period summary.
Apple Music 1.0+


## Page 3

bgColor
string
The average background color of the image.
height
number
(Required) The maximum height available for the image.
width
number
(Required) The maximum width available for the image.
textColor1
string
The primary text color used if the background color gets displayed.
textColor2
string
The secondary text color used if the background color gets displayed.
textColor3
string
The tertiary text color used if the background color gets displayed.
textColor4
string
The final post-tertiary text color used if the background color gets displayed.
url
string
(Required) The URL to request the image asset. {w}x{h}must precede ima
filename, as placeholders for the width and height values as described
above. For example, {w}x{h}bb.jpeg).
Properties
Apple Music API / Artwork
Object
Artwork
An object that represents artwork.
Apple Music 1.0+


## Page 4



## Page 5

short
string
An abbreviated description to show inline or when the content appears
alongside other content.
standard
string
(Required) A description to show when the content is prominently displayed
Properties
Apple Music API / DescriptionAttribute
Object
DescriptionAttribute
An object that represents a description attribute.
Apple Music 1.0+


## Page 6

short
string
Abbreviated notes shown inline or when the content appears alongside other
content.
standard
string
Notes shown when the content is prominently displayed.
name
string
Name for the editorial notes.
tagline
string
The tag line for the editorial notes.
Notes may include XML tags for formatting (<b> for bold, <i> for italic, or <br> for line break) an
special characters (&amp; for &, &lt; for <, &gt; for >, &apos; for ‘, and &quot; for “).
Properties
Discussion
Apple Music API / EditorialNotes
Object
EditorialNotes
An object that represents a notes attribute.
Apple Music 1.0+


## Page 7

results
LangageTagResponse
.Results
(Required) The results included in the response for a language tag resource
request.
object LangageTagResponse.Results
Results included in the response for a storefront resource request.
Properties
Topics
Related Objects
Apple Music API / LangageTagResponse
Object
LangageTagResponse
The response to a language tag request.
Apple Music 1.0+


## Page 8

attributes
MusicSummaries
.Attributes
The attributes for the music summaries resource type.
href
string
(Required) A relative location for the music summaries resource.
id
string
(Required) The identifier for the music summaries resource.
type
string
(Required) The type of the resource. This value is always Music Summarie
Value: music-summaries
views
MusicSummaries.Views
The views for associations between Music Summaries and the user’s top
content for that period.
object MusicSummaries.Attributes
Properties
Topics
Dictionaries
Apple Music API / MusicSummaries
Object
MusicSummaries
The music for the period summary.
Apple Music 1.0+


## Page 9

The attributes for the music summaries resource type.
object MusicSummaries.Views
The top albums, artists, and songs that the user listened to for the given period.


## Page 10

data
[MusicSummaries]
(Required) The collection of MusicSummaries for the request.
Properties
Apple Music API / MusicSummariesResponse
Object
MusicSummariesResponse
Apple Music 1.0+


## Page 11

next
string
A relative cursor to fetch the next paginated collection of resources for the
request if more exist.
data
[Resource]
(Required) A paginated collection of resources for the request.
Properties
Apple Music API / PaginatedResourceCollectionResponse
Object
PaginatedResourceCollectionResponse
A response object composed of paginated resource objects for the request.
Apple Music 1.0+


## Page 12

id
string
(Required) The ID of the content to use for playback.
kind
string
(Required) The kind of the content to use for playback.
Properties
Apple Music API / PlayParameters
Object
PlayParameters
An object that represents play parameters for resources.
Apple Music 1.0+


## Page 13

artwork
Artwork
The preview artwork for the associated preview music video.
url
string
(Required) The preview URL for the content.
hlsUrl
string
The HLS preview URL for the content.
Properties
Apple Music API / Preview
Object
Preview
An object that represents a preview for resources.
Apple Music 1.0+


## Page 14

data
[Resource]
(Required) A paginated collection of resources in the relationship.
meta
RelationshipResponse
.Meta
Contextual data about the relationship.
next
string
A relative cursor to fetch the next paginated collection of resources in the
relationship if more exist.
object RelationshipResponse.Meta
Contextual data about the relationship.
Properties
Topics
Related Objects
Apple Music API / RelationshipResponse
Object
RelationshipResponse
The response for a direct resource relationship fetch.
Apple Music 1.0+


## Page 15

attributes
RelationshipView
Response.Attributes
The attribute metadata for the view.
data
[Resource]
(Required) A paginated collection of resources in the view.
meta
RelationshipView
Response.Meta
Contextual data about the view.
next
string
A relative cursor to fetch the next paginated collection of resources in the vie
if more exist.
object RelationshipViewResponse.Attributes
The attribute metadata for the view.
Properties
Topics
Related Objects
Apple Music API / RelationshipViewResponse
Object
RelationshipViewResponse
The response for a direct resource view fetch.
Apple Music 1.0+


## Page 16

object RelationshipViewResponse.Meta
Contextual data about the view.


## Page 17

id
string
(Required) The identifier for the song-period-summaries resource.
relationships
SongPeriodSummaries
.Relationships
The relationships from SongPeriodSummaries to other resources.
type
string
(Required) The type of resource.
Value: song-period-summaries
object SongPeriodSummaries.Relationships
The relationships from SongPeriodSummaries to other resources.
Properties
Topics
Dictionaries
Apple Music API / SongPeriodSummaries
Object
SongPeriodSummaries
The song for the period summary.
Apple Music 1.0+


## Page 18

data
[Storefronts]
(Required) The data included in the response for a storefront resource
request.
Properties
Apple Music API / StorefrontsResponse
Object
StorefrontsResponse
The response to a storefront request.
Apple Music 1.0+


## Page 19

href
string
A URL subpath that fetches the view resources and attributes as the primary
objects. This member is only present in responses.
next
string
Link to the next page of resources in the view. Contains the offset query
parameter that specifies the next page. See Fetch Resources by Page.
attributes
View.Attributes
Attributes specific to the view.
data
[Resource]
(Required) One or more destination objects.
meta
View.Meta
Contextual information about the view for the request or response.
Properties
Topics
Related Objects
Apple Music API / View
Object
View
A to-one or to-many relationship view from one resource object to others
representing interesting associations.
Apple Music 1.0+


## Page 20

object View.Attributes
Attributes representing the metadata of the view.
object View.Meta
Information about the request or response.


