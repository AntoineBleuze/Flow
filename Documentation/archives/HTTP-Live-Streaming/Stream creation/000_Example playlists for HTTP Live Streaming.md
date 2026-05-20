# 000_Example playlists for HTTP Live Streaming.pdf

## Page 1

HTTP Live Streaming sends audio and video as a series of small files, typically of about 6 second
duration, called media segment files. An index file, or playlist, provides an ordered list of the URLs
of the media segment files. Index files for HTTP Live Streaming are saved as M3U8 playlists, an
extension of the M3U format used for MP3 playlists. The URL of the index file is accessed by
clients, which then request the indexed files in sequence.
You can use the Apple HTTP Live Streaming tools to generate playlists. These tools are frequently
updated and you can get them from Downloads for Apple Developers if you’re a member of the
Apple Developer Program. See Using Apple’s HTTP Live Streaming (HLS) Tools for more
information about the individual tools.
Video on Demand playlist construction
Understand the basic composition for a Video on Demand playlist.
Live Playlist (sliding window) construction
Understand the basic composition for a live session playlist.
Event playlist construction
Learn about the basic composition of an event session playlist.
Creating a Multivariant Playlist
Offer multiple playlist files to provide different encodings of the same content.
Overview
Topics
Basic playlists
HTTP Live Streaming / Example playlists for HTTP Live Streaming
Example playlists for HTTP Live Streaming
View and compare playlists for different HLS applications.


## Page 2

Incorporating Ads into a Playlist
Add branding or ads to a playlist.
Adding alternate media to a playlist
Specify Rendition Playlists that can override the main presentation.
About the EXT-X-VERSION tag
Find the protocol version that corresponds with the HLS features your app supports.
Modified playlists
See Also
Stream creation


