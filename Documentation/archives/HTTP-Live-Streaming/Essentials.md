# Essentials.pdf

## Page 1

An HLS stream may either be live or on-demand (VOD). The requirements for deploying an HLS
stream are:
Either an HTML page for browsers or a client app to act as a receiver
A web server or CDN to act as a host
A way to encode your source material or live streams as fragmented MPEG-4 media files
containing HEVC or H.264 video and AAC or AC-3 audio. Although you can use MP3 audio files
or MPEG-2 transport streams for H.264 video, these formats aren’t recommended.
The easiest way to distribute HLS media is to create a webpage that includes the HTML5 <video
tag, using an M3U8 playlist file as the video source. For browsers that don’t support the HTML5
video element, or browsers that don’t support HLS, you can include fallback code between the
<video> and </video> tags. For example, you could fall back to a progressive download movie
or a Real Time Streaming Protocol (RTSP) stream using the QuickTime plug-in. See Safari HTML5
Audio and Video Guide for examples. The following example shows the HTML code for a basic
webpage.
Overview
Create an HTML page
HTTP Live Streaming / Deploying a Basic HTTP Live Streaming (HLS) Stream
Article
Deploying a Basic HTTP Live Streaming
(HLS) Stream
Create a basic webpage to deliver HLS.


## Page 2

HLS streams can be served from an ordinary web server. Configure your web server and associat
the MIME types of the files being served with their file extensions. The following table shows the
MIME types for HLS.
File Extension
MIME Type
.m3u8
vnd.apple.mpegURL
.ts
video/MP2T
.mp4
video/mp4
If your web server is constrained with respect to MIME types, you can serve files ending in .m3u
with MIME type audio/mpegURL for compatibility.
Index files are often long and are frequently redownloaded, but because they’re text files, they ca
be compressed very efficiently. Reduce server overhead by enabling real-time gzip compression
of M3U8 index files. The HTTP Live Streaming client automatically unzips compressed index files.
You might need to shorten time-to-live (TTL) values for M3U8 files to achieve proper caching
behavior for downstream web caches. M3U8 files are frequently overwritten during live broadcast
and the latest version should be downloaded for each request. Check with your content delivery
service provider for specific recommendations. For VOD, the index file is static and is downloaded
only once, so caching isn’t a factor.
The mediastreamvalidator tool is a command-line utility for validating HLS streams and
servers. See Using Apple’s HTTP Live Streaming (HLS) Tools for details on obtaining the tool.
The media stream validator simulates an HLS session and verifies that the index file and media
segments conform to the HLS specification. It performs several checks to ensure reliable
streaming. If any errors or problems are found, a detailed diagnostic report is displayed. Always ru
the validator prior to serving a new stream or alternate stream set.
See FairPlay Streaming for details on validating with secure protocols.
Configure a web server
Validate your streams


## Page 3

Protect your media by encrypting it. The file segmenter and stream segmenter tools both have
encryption options, and you can configure them to change the encryption key periodically. Who
you share the keys with is up to you.
Key files require an initialization vector to decode encrypted media. The initialization vectors can 
changed periodically, just as the keys can. The current recommendation for encrypting media wh
minimizing overhead is to change the key every 3 to 4 hours and change the initialization vector
after every 50 Mb of data.
Even with restricted access to keys, it’s possible for an eavesdropper to obtain copies of the key
files if they’re sent over HTTP. One solution to this problem is to send the keys securely over
HTTPS. Before attempting to serve key files over HTTPS, test serving the keys from an internal we
server over HTTP. This allows you to debug your setup before adding HTTPS to the mix. Once you
have a known working system, you can make the switch to HTTPS.
The requirements for using HTTPS to serve keys for HLS are:
Verify that you have an SSL certificate signed by a trusted authority on your HTTPS server. If n
you can still test your setup by creating a self-signed SSL Certificate Authority and a leaf
certificate for your server. Attach the certificate for the certificate authority to an email, send it 
a device you want to use as an HLS client, and tap the attachment in Mail to make the device
trust the server.
Ensure that the authentication domain for the key files is the same as the authentication domai
for the first playlist file. The simplest way to accomplish this is to serve the Multivariant Playlist
file from the HTTPS server. The playlist file is downloaded once, so this shouldn’t cause an
excessive burden. Other playlist files can be served using HTTP.
Either initiate your own dialog for the user to authenticate, or store the credentials on the client
device. HLS doesn’t provide user dialogs for authentication. If you’re writing your own client ap
you can store cookie-based or HTTP credentials and supply them in the connection(_:did
Receive:) callback. The credentials you supply are cached and reused by the media player.
A sample-level encryption format is documented in MPEG-2 Stream Encryption Format for HTTP
Live Streaming. For the strongest level of content protection, an alternative to serving keys direct
over HTTPS is to use FairPlay Streaming. See HTTP Live Streaming (HLS) authoring specification
for Apple devices for more information.
Preparing Audio for HTTP Live Streaming
Serve key files securely over HTTPS
See Also
Essentials


## Page 4

Encode your media properly to ensure synchronized audio and video playback.


## Page 5

Producing media for HTTP Live Streaming (HLS) requires special considerations if you’re encodin
audio using the Advanced Audio Coding (AAC) family of formats.
AAC audio processing requires a small amount of leading “throw-away” audio to prime the encod
and initialize internal tables. This small amount of audio results from encoder delay which happen
during encoding to produce properly formed, encoded audio packets, and its duration is common
referred to as the priming duration. This audio needs to occur before the first frame of video;
otherwise, there will be no audio for the first few frames of video.
The audio sample rates are normally 44.1 kHz or 48 kHz. For more information, see the HTTP Live
Streaming Specification and the HTTP Live Streaming (HLS) authoring specification for Apple
devices.
Overview
Encode MPEG-2 transport stream segments
HTTP Live Streaming / Preparing Audio for HTTP Live Streaming
Article
Preparing Audio for HTTP Live Streaming
Encode your media properly to ensure synchronized audio and video playback.


## Page 6

MPEG-2 transport streams create an arbitrary timestamp when encoding media, using an 33-bit
clock that rolls over every 26 hours. For example, if your video starts at the two-hour mark, your
audio starts at two hours plus the time for the leading audio. Therefore, a segment of audio that’s
paired with a segment of video starting at the two-hour mark needs audio that starts at the two-
hour mark minus the priming duration. This additional segment ensures the first frame of video
plays synchronously with the audio.
The MPEG-4 file format (ISO BMFF) carries the presumption that all track timelines begin with tim
zero, regardless of whether the timeline is divided into fragments. However, you can set the initial
decode time of any fragment to an arbitrary value by means of the Track Fragment Base Media
Decode Time Box (tfdt). Use this box to permit the alignment of the audio timeline with the vide
timeline that places the priming audio prior to the first video frame.
Alternatively, starting with iOS 13.1 it’s possible to utilize an Edit List Box (elst) within the Track
Box (trak) in order to place the duration of the priming audio prior to time 0. This permits a natur
alignment of other tracks with audio at time 0. The edit list needs to have a single entry in which t
value of media_start is equivalent to the audio priming duration and the value of segment
_duration is 0. This is the recommended approach for time alignment for the Common Media
Application Format (CMAF).
Changing the play position to a specific point in time within content is known as seeking, and is
another consideration for encoding audio. HTTP Live Streaming (HLS) has individual segments th
are individually downloadable; each contains media data for 4 to 6 seconds of the overall media
timeline. When seeking into a point in the video, skip over the intervening segments between the
current and target play position and load the appropriate segment.
Deploying a Basic HTTP Live Streaming (HLS) Stream
Create a basic webpage to deliver HLS.
Encode fragmented MPEG-4 segments
Handle play position changes within content
See Also
Essentials


