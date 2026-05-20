# 003_Enabling Low-Latency HTTP Live Streaming _HLS_.pdf

## Page 1

The HLS protocol delivers live and on-demand content streams to global-scale audiences.
Historically, HLS has favored stream reliability over latency. Low-Latency HLS extends the protoco
to enable low-latency video streaming while maintaining scalability. The new low-latency mode
lowers video latencies over public networks into the range of standard television broadcasts.
Backend production tools and content delivery systems must implement new rules to enable low-
latency stream playback. Low-Latency HLS offers new functionality in these areas:
Generation of partial segments
Playlist delta updates
Blocking of playlist reload
Using preload hints
Rendition reports
The HLS specification defines low-latency extensions in HTTP Live Streaming 2nd Edition revision
7 and later.
Low-Latency HLS provides a parallel channel for distributing media at the live edge of the Media
Playlist, which divides the media into a larger number of smaller files, such as CMAF Chunks. The
smaller files are called HLS Partial Segments. Because each Partial Segment has a short duration
can be packaged, published, and added to the Media Playlist much earlier than its Parent Segmen
Overview
Generate Partial Media Segments
HTTP Live Streaming / Enabling Low-Latency HTTP Live Streaming (HLS)
Article
Enabling Low-Latency HTTP Live
Streaming (HLS)
Add Low-Latency HLS to your content streams to maintain scalability.


## Page 2

While regular Media Segments might be 6 seconds each, an example Partial Segment might be
only 200 milliseconds. A first Partial Segment might publish only 200 milliseconds after the
previous segment publishes, followed by 29 of its peers, followed at last by a regular-length, 6-
second Media Segment containing the same media as the concatenation of its 30 Partial
Segments. In order to reduce Playlist bloat, the server removes Partial Segments from the Media
Playlist once they’re greater (older) than three target durations from the live edge.
You add Partial Segments to the Media Playlist using the new EXT-X-PART tag. You can place
other Media Segment Tags (such as EXT-X-DISCONTINUITY) at Parent Segment boundaries.
A Partial Segment must be in one of the Supported Media Segment Formats described in section
3.1 of HTTP Live Streaming 2nd Edition.
Clients transfer playlists more frequently with Low-Latency HLS. They can request and servers ca
provide Playlist Delta Updates, which reduce this transfer cost. These updates replace a
considerable portion of the Playlist that the client already has with the new EXT-X-SKIP tag.
To support efficient client notification of new Media Segments and Partial Segments, Low-Latenc
HLS introduces the ability to block a Playlist reload request. When a client issues an HTTP GET to
request a Media Playlist update, it can add special query parameters called Delivery Directives to
specify that it wants the Playlist response to include a future segment. The server then holds onto
the request (blocks) until a version of the Playlist that contains that segment is available. Blocking
Playlist Reloads eliminates Playlist polling.
Eliminating unnecessary round trips is critical when delivering low-latency streams at global scale
Servers use a new tag, EXT-X-PRELOAD-HINT, to inform clients of upcoming Partial Segments
and Media Initialization Sections. A client can issue a GET request for a hinted resource in advanc
the server responds to the request as soon as the media becomes available.
When playing at low latency, the client must be able to switch renditions with a minimum number 
round trips in order to perform bit-rate adaptation. To support this, the server adds Rendition
Reports on the other renditions in the Multivariant Playlist to each Media Playlist. The EXT-X-
RENDITION-REPORT tag carries a Rendition Report and provides information, such as the last
Media Sequence Number and Part currently in the Media Playlist of that rendition.
Provide Playlist Delta Updates
Blocking Playlist reloads
Provide Preload Hints and Blocking of Media Downloads
Provide Rendition Reports


## Page 3

HLS now defines Delivery Directives, which are special query parameters that can be added to th
URL of a GET request for a Playlist. These Delivery Directives include:
_HLS_msn=<M>
Indicates that the server must hold the request until a Playlist contains a Media Segment with
Media Sequence Number of M or later.
_HLS_part=<N>
Indicates, in combination with _HLS_msn, that the server must hold the request until a Playlis
contains Partial Segment N of Media Sequence Number M or later. The first Partial Segment o
a segment is _HLS_part=0, the second is _HLS_part=1, and so on. The _HLS
_part parameter requires an _HLS_msn parameter.
_HLS_skip=YES|v2
Requests a Playlist Delta Update, in which the earlier portion of the Playlist is replaced with a
EXT-X-SKIP tag.
The following Playlist tags support Low-Latency HLS.
EXT-X-SERVER-CONTROL
Allows the server to indicate support for features such as Blocking Playlist Reload and Playlis
Delta Updates.
EXT-X-PART-INF
Provides information about HLS Partial Segments in the Playlist.
EXT-X-PART
Identifies a Partial Segment in the Playlist.
EXT-X-PRELOAD-HINT
Hints that a resource or a byte range of a resource are needed to play back an upcoming part
of the presentation.
Note that when a hinted Partial Segment eventually appears in the Playlist as an EXT-X-PAR
tag, it may be different than previous Partial Segment. It may have a different Discontinuity
Sequence Number, Media Initialization Section, or encryption configuration. In other words, t
Partial Segment can be preceded by an EXTINF tag indicating the end of the previous Paren
Segment and an EXT-X-DISCONTINUITY, EXT-X-MAP, or EXT-X-KEY tag.
A server may choose not to publish a previously hinted Partial Segment if the planned
segmentation changes, such as in the case of early return from an ad.
EXT-X-RENDITION-REPORT
Carries information about an associated rendition that’s as up to date as the Playlist that
contains it.
Add Low-Latency HLS Delivery Directives
Utilize New Media Playlist Tags for Low-Latency HLS


## Page 4

EXT-X-SKIP
When a server issues a Playlist Delta Update, it replaces Media Segments earlier than the Ski
Boundary and their associated tags with an EXT-X-SKIP tag.
To support timely delivery of media, Low-Latency HLS requires certain transport features beyond
what is necessary for regular HLS. These requirements are defined in the Low-Latency Server
Configuration Profile. Because the Low-Latency HLS syntax is backward-compatible with existing
HLS, clients fall back to regular-latency HLS playback if they discover that the server doesn’t
support an aspect of the required configuration. HTTP Live Streaming 2nd Edition defines the Low
Latency Server Configuration Profile in Appendix B.
Players of Low-Latency HLS should expect delivery of low-latency streams through CDNs and
other HTTP caches. To start playback at low latency, the client must first obtain a reasonably up-
to-date version of the Media Playlist. Appendix C of HTTP Live Streaming 2nd Edition describes a
efficient approach for obtaining an up-to-date Media Playlist served through an HTTP cache.
Here’s an example of a low-latency playlist. As mentioned above, the Low-Latency HLS syntax is
backward-compatible, so we can use a version number of six. Clients that do not understand the
Low-Latency tags will ignore them.
Comply with the Low-Latency Server Configuration Profile
Expect Delivery from CDN Tune-In
Examine a Low-Latency HLS Playlist


## Page 5



## Page 6

Here’s an example of a playlist delta update. Note that use of tha EXT-X-SKIP tag requires a later
version than the basic use of Low-Latency HLS above.
Examine a Playlist Delta Update


## Page 7

Here’s an example of a byterange-addressed part. In a real playlist at least some of the EXT-X-
PART tags would contain an INDEPENDENT attribute. Those have been removed to make the
example clearer.
Examine Byterange-Addressed Parts


## Page 8

The following table describes the changes to the Protocol Extension for Low-Latency HLS.
Date
Notes
2024-
05-21
Added some clarifying text.
2024-
01-16
Corrected errors in examples.
2021-11-
12
Renamed “primary playlist” to “Multivariant Playlist.”
2021-
01-11
Added missing double quotes around BYTERANGE parameters.
2020-
05-04
Moved protocol rules to the HLS spec. This document is now a descriptive
supplement.
2020-
02-05
Added additional information related to preload hints and blocking of media
downloads.
2019-
08-22
Removed the _HLS_report parameter and made Rendition Reports mandatory.
Clarified the LAST-MSN definition.
2019-
07-25
Added the CDN Tune-in appendix.
Revision History


## Page 9

Date
Notes
2019-
07-10
Updated MSN and part validation rules. Made server response recommended
instead of mandatory. Added the requirement of the AGE header when using HTTP
proxy caches.
2019-
06-03
Added a new document describing Low-Latency HLS.
HTTP Live Streaming (HLS) authoring specification for Apple devices
Learn the requirements for live and on-demand audio and video content delivery using HLS.
Using content protection systems with HLS
Adding encryption keys to media playlists
About the Common Media Application Format with HTTP Live Streaming (HLS)
Learn the Common Media Application Format as it applies to HLS.
Links to additional specifications and videos
Review additional specifications and documents.
Videos about HLS
Review informational videos about HTTP Live Streaming.
Providing metadata for xHE-AAC video soundtracks
Ensure volume normalization by including metadata for loudness and dynamic range control
Adjusting anchor loudness
Adjust anchor loudness when measurements of speech-gated loudness for a full mix may be
inaccurate, such as when speech activity is low.
Providing JavaScript Object Notation (JSON) chapters
Prepare JSON chapters for HTTP Live Streaming.
See Also
Specifications and other documents


