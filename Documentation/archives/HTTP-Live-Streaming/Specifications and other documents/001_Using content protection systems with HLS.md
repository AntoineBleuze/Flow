# 001_Using content protection systems with HLS.pdf

## Page 1

HTTP Live Streaming (HLS) supports content protection systems through the presence of EXT-X
KEY tags in playlists. HLS allows multiple EXT-X-KEY tags with diﬀerent KEYFORMAT attributes t
apply to the same segments provided that each of the tags ultimately produces the same
decryption key. This is necessary because you can only encrypt a media segment with one
encryption method, using one encryption key, with a single IV (initialization vector).
While a playlist may contain EXT-X-KEY tags for more than one protection system, a player
typically supports only one protection system. This means that every encrypted segment must
have EXT-X-KEY tags for the same set of protection systems. The player refuses to play the
playlist if it doesn’t handle any of the protection systems. If the player can handle more than one
protection system, it chooses one. The playlist has no mechanism to convey a preference for a
protection system.
This document provides general guidance on using such EXT-X-KEY tags.
For convenience sake, this document refers to some details of the Google Widevine and Microsof
PlayReady protection systems. The documentation for those systems should be used to ensure
accurate implementation.
The EXT-X-KEY tag has three attributes that principally control its behavior. These are METHOD,
KEYFORMAT, and URI.
METHOD
Apple’s HLS encryption uses the AES block cipher algorithm and Cipher Block Chaining (CBC
mode. To guarantee compatibility with FairPlay, you must use the METHOD=SAMPLE-AES. In
Overview
Set the playlist key tag
HTTP Live Streaming / Using content protection systems with HLS
Article
Using content protection systems with
HLS
Adding encryption keys to media playlists


## Page 2

terms of the Common Encryption standard (ISO/IEC 23001-7), this is the cbcs protection
scheme. If FairPlay isn’t involved you may use another METHOD.
KEYFORMAT
Use this attribute to convey how to obtain the key. For more information, see Choose a key
format for more detail. This can be modified by the attribute KEYFORMATVERSIONS. Howeve
in most cases, this additional attribute should be either left oﬀ or set to the string value "1".
URI
This contains the information needed to identify the specific key. The format of the URI is
determined by the KEYFORMAT value.
There are four supported key formats:
Identity
FairPlay Streaming
Widevine
PlayReady
All formats (except Identity) require a key server. That is, a server that uses some protocol to
supply the keys. The key server isn’t specified by the playlist. Instead, the playback app is
responsible for knowing the URI of the key server and the protocol for communicating with that
server.
This format is identified by a KEYFORMAT attribute with the value identity or by the lack of a
KEYFORMAT attribute.
The URI attribute is the URI of the key file.
Because there is no key server involved, this protection system aﬀords only a minimal level of
protection. For that reason you shouldn’t use identity keys in conjunction with any other protectio
system.
This format is described in HTTP Live Streaming 2nd Edition
This format is identified by a KEYFORMAT attribute with the value com.apple
.streamingkeydelivery.
Choose a key format
Identity
FairPlay Streaming


## Page 3

The URI attribute typically has the form skd://<key-identifier>. (In theory this can use an
custom URL scheme, but skd is almost always used.) The key-identifier is an arbitrary string that
interpreted by the FairPlay Key Server. FairPlay does impose limits on the overall length of the key
identifier string.
Further details about FairPlay Streaming are available at FairPlay Streaming.
The Widevine format has more than one version. However, the versions use diﬀerent key format
values; from the HLS point of view, they are completely distinct. You should use what the Widevin
documentation refers to as v2.
This key format is identified by a KEYFORMAT attribute with the value urn:uuid:edef8ba9-
79d6-4ace-a3c8-27dcd51d21ed. (The UUID in this URN is the Widevine System ID. See
Widevine PSSH data.)
The URI attribute has the form data:text/plain;base64,<base64 encoded PSSH box>
See Create a PSSH box.
For more information about Widevine refer to Widevine Technologies.
The PlayReady format is defined by Microsoft.
This key format is identified by a KEYFORMAT attribute with the value com.microsoft
.playready.
The URI has the form data:text/plain;charset=UTF-16;base64,<base64 encoded
PlayReady Object>. See PlayReady PSSH data for a discussion of the PlayReady Object.
For more information refer to the PlayReady documentation.
All three of the key formats that use a key server - FairPlay Streaming, Widevine, PlayReady -
contain something called a key identifier. The key identifier is the data sent to the server so it can
return the correct key.
The FairPlay Streaming key identifier has no relationship to that used by the other formats.
The Widevine and PlayReady key identifiers may be identical. Their value should be a UUID. Note
that PlayReady does not store the UUID as a simple 16-byte array. (See the Example below for
more detail.)
Widevine
PlayReady
Select key identifiers


## Page 4

The Protection System Specific Header (‘pssh’) box is defined in ISO/IEC 23001-7.
This is an ISO Base Media File Format (MP4) structure used to convey information about the
protection system. It’s only necessary with Widevine and PlayReady. If you use those protection
systems, you should include a PSSH box for each system you use in the media initialization
sections of your stream.
The following is the layout of the version 0 PSSH box.
The SystemID is a UUID that indicates how to parse the Data portion of the PSSH.
The Widevine SystemID is edef8ba9-79d6-4ace-a3c8-27dcd51d21ed.
The Data field contains a protocol buﬀer (that is, a mechanism for serializing structured data; see
Protocol Buffers).
The Widevine documentation details the specific messages that are possible.
The data will contain the key identifier and the protection scheme.
The PlayReady SystemID is 9a04f079-9840-4286-ab92-e65be0885f95.
The Data field is PlayReady Object that contains a PlayReady Header.
The PlayReady Object is a binary data structure that contains one or more PlayReady Object
Records. Each record has a type; one of these types is a PlayReady Header.
The PlayReady Header is a little-endian UTF-16 XML string. This contains the header version,
protection scheme, and key identifier. You should use the header version v4.3.0.0 as this is
necessary to support the ‘cbcs’ protection scheme.
Create a PSSH box
Widevine PSSH data
PlayReady PSSH data


## Page 5

Here is an example of FairPlay Streaming, Widevine, and PlayReady keys.
The FairPlay Streaming URI value, except for the URL scheme prefix, is the key identifier.
Here is the unpacked form of the Widevine base64 string (a PSSH box).
The protocol buﬀer is the last 24 bytes. This buﬀer decodes into two fields: a key_id (16 byte
value (04 14 24 34 44 54 64 74 84 94 a4 b4 c4 d4 e4 f4), and a protection
_scheme (a var-int that decodes to 63 62 63 73 or ‘cbcs’). While this example contains
only two fields, additional optional fields could be present.
Here is unpacked form of the PlayReady base64 string (a PlayReady Object).
Example
FairPlay
Widevine
PlayReady


## Page 6

The PlayReady Header is the string below. (Converted from UTF-16 with indentation and line
breaks added for clarity.)
The ALGID attribute indicates the protection scheme is ‘cbcs’.
Here is the unpacked form of the KID element’s VALUE attribute, which is a base64 encoded
string.


## Page 7

This is a UUID in Microsoft’s GUID form. That is, three little-endian numbers (4 bytes, 2 bytes, 2
bytes) and an eight-byte sequence. In this example the same key identifier is used for PlayReady
and Widevine.
HTTP Live Streaming (HLS) authoring specification for Apple devices
Learn the requirements for live and on-demand audio and video content delivery using HLS.
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
Providing JavaScript Object Notation (JSON) chapters
Prepare JSON chapters for HTTP Live Streaming.
See Also
Specifications and other documents


