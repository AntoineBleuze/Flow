# 001_Requesting a feed export.pdf

## Page 1

To get the data for an Apple Music Feed data set, request information about the latest feed expor
use that information to request links to parts of the feed, and then use those links to download the
data.
To compose a request, first specify the root path, https://api.media.apple.com/v1.
Follow the root path with /feed/ and the required information for the specific request.
To request metadata about the latest available export for an Apple Music Feed data set, construct
URL that includes the feedId followed by /latest.
The possible values for feedId are: album, song, artist, popularityTopChartAlbums, an
popularityTopChartSongs.
The response returns metadata about the most recent export for the specified feedId, including
an id that you can use to request the data from that export.
Overview
Compose a request
Request metadata for the latest feed export
Apple Music Feed / Requesting a feed export
Article
Requesting a feed export
Create requests for Apple Music Catalog metadata.


## Page 2

To request links to parts of the data for a feed export, construct a URL that includes the id of a
specific feed export, which you can get from the response above, followed by /parts. You can
use the limit and offset parameters to paginate the returned results. For more information, se
Fetching Resources by Page.
The response returns parts objects as resources, each of which includes an export
Location for the data in that part of the feed export.
Request feed data links


## Page 3

Use the links that the parts response provides to download the feed data. Note that access to
these links expires after a specified time.
The feed exports are in Parquet format. The following data example is in JSON format for illustrati
purposes:
Download the feed data
Data example


## Page 4



## Page 5



## Page 6



## Page 7

Generating developer tokens
Create a JSON Web Token to authorize your requests to Apple Media Feed API.
Interpreting responses
Learn about responses from Apple Media Feed API to your Apple Music Feed requests.
See Also
Essentials


