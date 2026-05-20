# 008_Providing JavaScript Object Notation _JSON_ chapters.pdf

## Page 1

Content providers supply chapter markers and other per-chapter meta data using the EXT-X-
SESSION-DATA tag in the HTTP Live Streaming (HLS) Multivariant Playlist. Apple’s iOS, tvOS, an
macOS platforms receive this metadata as JSON, a format that uses human-readable text to defin
data objects described in RFC 7159.
Important
This article is for informational purposes only. Apple may have patents, patent applications,
trademarks, copyrights, or other intellectual property rights covering subject matter in this
document. The furnishing of this article doesn’t give you a license to any patents, trademarks,
copyrights, or other intellectual property.
Chapter data is information that describes a chapter using four different types: timing, titles,
images, and general metadata. Keep the following in mind when designing your chapter data:
Each chapter requires a start time and may have an optional duration.
Each chapter may have multiple titles, images, and metadata items.
Each title in a chapter has a unique BCP 47 language tag.
Each metadata item in a chapter has a unique key and language.
Chapter metadata appears as an array of chapters. Each element in the array contains informatio
about that chapter. The first array element describes the first chapter, the second element
Overview
Organize chapter metadata
HTTP Live Streaming / Providing JavaScript Object Notation (JSON) chapters
Article
Providing JavaScript Object Notation
(JSON) chapters
Prepare JSON chapters for HTTP Live Streaming.


## Page 2

describes the second chapter, and so on.
Each element in the chapter array is a JSON object called a chapter entry. The chapter entry mus
contain a start-time. The chapter entry should contain titles, images, and possibly
metadata.
The chapter entry may contain an item named chapter to promote human readability of the
JSON. It may also contain an item named duration. Chapter entries are assumed to have a
duration from start-time to the start-time of the next chapter entry, unless duration is
specified. Chapter timing can overlap and nest, in which case both start-time and duration
must be present.
Below is a simple three-chapter example of chapter data formatted as JSON. Only chapter titles
and start times are present. Each chapter title is in two different languages: English and Spanish.


## Page 3

Here’s the general layout of the JSON chapter data format. The JavaScript comments aren’t legal
JSON and are for illustrative purposes.


## Page 4

Chapter entries may contain a titles JSON array. Each element of a titles array is a JSON
object that must contain both a language BCP 47 string and a title string with the title for tha
chapter, written in the language specified by the language string. All strings must be encoded
using UTF-8. Set the language to “und” if the title strings are language-neutral, such as a numer
string.
Chapter entries may contain an images JSON array. Each element of an images array is a JSON
object containing information about images for each chapter. For example, an images array may
contain an element for a thumbnail image and an element for an HD image.
Each element in an images array must contain an image-category string, a pixel-width
number, a pixel-height number, and a url string.
The image-category string should be the same across chapters for images that are similar. In
the three-chapter case mentioned above, you would use one string for the thumbnails
(thumbnail) and a different string for the HD images (hd).
The url string must be an absolute or relative URL to the image data associated with the chapter
Relative URLs are relative to the path that contained the JSON chapter document.
The images files themselves may be in a variety of image formats. For example, JPEG, PNG, and
TIFF are all supported.
Chapter entries may also contain a metadata JSON array. Each element of a metadata array is a
JSON object containing metadata for that chapter. Each metadata array element contains a
mandatory key and value, along with an optional language BCP-47 string. The key element
must be a string. The value element can be a string, number, array, or object. If any value is a UR
it’s passed as-is. The system has no way to interpret a relative URI in that context.
Add titles
Add images
Add metadata


## Page 5

JSON-formatted chapter data must be specified in a main playlist using the EXT-X-SESSION-
DATA tag for use in HTTP Live Streaming.
The DATA-ID attribute of the EXT-X-SESSION-DATA must be com.apple.hls.chapters. Th
URI attribute must point to the JSON-formatted chapter data. The URI may be absolute or relative
to the path that contained the main playlist, as shown here:
#EXT-X-SESSION-DATA:DATA-ID="com.apple.hls.chapters",URI="http://meta
.example.com/movie403/chapters.json"
Use the following JSON schema to validate your chapter data.
Specify a main playlist
Perform validation


## Page 6



## Page 7

Use QuickTime Player to quickly test your HLS streams with chapter data. QuickTime Player will
display a chapter pop-up control (with images, if you have them). In QuickTime Player, use File >
Open Location or ⌘L to open a URL. QuickTime Player displays your chapters in the order they
appear in the JSON file, without sorting or rearranging them.
AVAsset contains details of how to access chapter data. The methods described return an array
of AVTimedMetadataGroup objects, one object for each chapter. The order of the groups
matches the order of the JSON file.
Each AVTimedMetadataGroup object has a start time, end time, and a list of AVMetadataIte
Every item from the titles, images, and metadata arrays in the JSON is in the list of metadata item
Test and access chapter data


## Page 8

Images have an extraAttributes dictionary. This dictionary contains a key “iTunesImage
Resolution” whose value is a dictionary that contains the pixel-width, pixel-height, an
image-category from the JSON entry.
The metadata item keys are placed in the key space quickTimeMetadata. This key space
defines its key values to be expressed as reverse-DNS strings. This allows you to define your own
keys in a well-established way that avoids collisions.
HTTP Live Streaming (HLS) authoring specification for Apple devices
Learn the requirements for live and on-demand audio and video content delivery using HLS.
Using content protection systems with HLS
Adding encryption keys to media playlists
About the Common Media Application Format with HTTP Live Streaming (HLS)
Learn the Common Media Application Format as it applies to HLS.
Enabling Low-Latency HTTP Live Streaming (HLS)
Add Low-Latency HLS to your content streams to maintain scalability.
Links to additional specifications and videos
Review additional specifications and documents.
Videos about HLS
Review informational videos about HTTP Live Streaming.
Providing metadata for xHE-AAC video soundtracks
Ensure volume normalization by including metadata for loudness and dynamic range control
Adjusting anchor loudness
Adjust anchor loudness when measurements of speech-gated loudness for a full mix may be
inaccurate, such as when speech activity is low.
See Also
Specifications and other documents


