# Specifications and other documents.pdf

## Page 1

For a deeper discussion of the features available in HLS, refer to Apple’s streaming resource page
which contains pointers to the overview document, the HLS specification, technical notes, tools,
presentations, and examples.
The HLS specification is a published RFC (RFC 8216). However, HLS continues to evolve, so there
an updated draft specification — draft-pantos-hls-rfc8216bis (HLS2).
Please see Documentation, which may contain a reference to a preliminary version of the draft
specification.
This document always uses the most up-to-date version, which is, either the preliminary version o
the draft specification (whichever has a higher version number).
Note
HLS was originally specified in draft-pantos-http-live-streaming (HLS1). That document was
superseded by RFC 8216.
The key words “MUST,” “MUST NOT,” “REQUIRED,” “SHALL,” “SHALL NOT,” “SHOULD,” “SHOULD
NOT,” “RECOMMENDED,” “MAY,” and “OPTIONAL” in this document are to be interpreted as
described in RFC 2119.
Find additional information for HLS specifications at HTTP Live Streaming (HLS) Authoring
Specification for Apple devices appendixes.
Overview
About HLS authoring
HTTP Live Streaming / HTTP Live Streaming (HLS) authoring specification for Apple devices
HTTP Live Streaming (HLS) authoring
specification for Apple devices
Learn the requirements for live and on-demand audio and video content delivery
using HLS.


## Page 2

Spatial video is intended to produce a richer experience for the user. Spatial video MUST use the
REQ-VIDEO-LAYOUT attribute to specify desired channel and projection specifiers. Please see HL
specification for valid channel and projection specifiers.
Spatial video media is split into following categories.
Stereo Video
Similar to Stereo audio, which indicates different audio for the left and the right ear, visual
media can be stereoscopic in which a separate view is available for the left eye and another
view is available to be presented simultaneously to the right eye.
Projection Video
Rectilinear projection is default for the video media which indicates there is no further
processing necessary to present the video. Content creators can opt for non rectilinear
projections to preserve the artistic intent. Please refer to HLS specification for possible non-
rectilinear projections. This content is categorized under Apple Projected Media Profile (APM
and can be monoscopic or stereo.
Immersive Video
This video is projected from a hemisphere (typically a special lens) and often requires a spec
metadata file in order render correctly.
This video relies on a special projection type, known as ‘PROJ-AIV’ which is defined outside the
core HLS specification. For details, see QuickTime and ISO Base Media File Formats and Spatial
and Immersive Media
Note
Stereo, Immersive and stereo APMP video is only supported in visionOS. See amended
requirements for visionOS.
Multi-format audio codecs support combinations of channels, audio objects, and ambisonics as
opposed to multi-channel codecs that just support channels. Examples of such a multi-format
codec are:
Apple Positional Audio Codec APAC
Dolby Digital Plus JOC
About spatial video
About multi-format audio codecs
General authoring requirements


## Page 3

A stream that matches these requirements should be compatible with iOS, tvOS, macOS or
visionOS. Rules with a leading asterisk (*) are modified by one or more of the Amended
Requirements listed below.
Support for a specific video Profile and Level doesn’t imply that any particular device supports th
maximum bit rate for that Level.
1. Video encoding requirements
1.1. All video MUST be encoded using H.264/AVC, HEVC/H.265, Dolby Vision, or AV1.
1.2. The container format for H.264 video MUST be fragmented MP4 (fMP4) files or MPEG
transport streams.
1.3.
1.3a. * For maximum compatibility, some H.264 variants SHOULD be less than or equal to High
Profile, Level 4.1.
1.3b. * Profile and Level for H.264 MUST be less than or equal to High Profile, Level 5.2.
1.4. For H.264, you SHOULD use High Profile in preference to Main or Baseline Profile.
1.5. The container format for HEVC video MUST be fMP4.
1.6.
1.6a. * For maximum compatibility, some HEVC variants SHOULD be less than or equal to Main 10
Profile, Level 4.0, Main Tier.
1.6b. * Profile, Level, and Tier for HEVC MUST be less than or equal to Main 10 Profile, Level 5.1,
High Tier.
1.7. High Dynamic Range (HDR) HEVC video MUST be HDR10, HLG, or Dolby Vision.
1.8. For HDR10 video, the SEI NAL units (that is, static metadata) SHOULD be in the HEVC
Configuration Box ('hvcC') and not in the individual sample data.
1.9. * Profile and Level for Dolby Vision MUST be Profile 5 (single layer 10-bit HEVC) and less than
or equal to Level 7.
1.10. You SHOULD use video formats in which the parameter sets are stored in the sample
descriptions, rather than the samples. (That is, use 'avc1', 'hvc1', or 'dvh1' rather than
'avc3', 'hev1', or 'dvhe'.)
1.11. For backward compatibility, content SHOULD NOT use a higher level than required by the
content resolution and frame rate.
1.12. * For backward compatibility, some video content SHOULD be encoded with H.264.
Video


## Page 4

1.13. Key frames (IDRs) SHOULD be present every two seconds.
1.14. All interlaced source content MUST be deinterlaced.
1.15. You SHOULD deinterlace 30i content to 60p instead of 30p.
1.16. Live (linear) video from NTSC or ATSC source SHOULD be 60 or 59.94 fps.
1.17. Live (linear) video from PAL source SHOULD be 50 fps.
1.18. Video on Demand (VOD) content SHOULD use a natural frame rate for the content. Frame
rates 23.976, 24, 25, 29.97, 30, 50, 59.94, and 60 fps are supported.
1.19. Frame rates above 60 fps SHALL NOT be used.
1.20. * For HDR content, frame rates less than or equal to 30 fps SHOULD be provided.
1.21. Streams SHOULD use a single color space — one of either Rec. 601, Rec. 709, DCI-P3, or Re
2020.
1.22. For VOD, the color space SHOULD be the original color space of the material.
1.23. * If multiple video streams are provided (H.264, HEVC, HDR), each stream SHOULD provide
all anticipated bandwidths. Clients SHOULD NOT be required to switch codecs.
1.24. * For backward compatibility, SDR streams MUST be provided. (See also item 6.16.)
1.25. * There are many possible choices of bit rates for variants. The following tables provide one
possible set of bit rate variants. (See On bit rates for variants for additional considerations.)
16:9 aspect ratio
H.264/AVC
Frame rate
416 x 234
145
≤ 30 fps
640 x 360
365
≤ 30 fps
768 x 432
730
≤ 30 fps
768 x 432
1100
≤ 30 fps
960 x 540
2000
Same as source
1280 x 720
3000
Same as source
1280 x 720
4500
Same as source
1920 x 1080
6000
Same as source
1920 x 1080
7800
Same as source


## Page 5

16:9 aspect ratio
HEVC/H.265 30 fps
HDR (HEVC) 30 fps
Frame rate
640 x 360
145
160
≤ 30 fps
768 x 432
300
360
≤ 30 fps
960 x 540
600
730
≤ 30 fps
960 x 540
900
1090
≤ 30 fps
960 x 540
1600
1930
Same as source
1280 x 720
2400
2900
Same as source
1280 x 720
3400
4080
Same as source
1920 x 1080
4500
5400
Same as source
1920 x 1080
5800
7000
Same as source
2560 x 1440
8100
9700
Same as source
3840 x 2160
11600
13900
Same as source
3840 x 2160
16800
20000
Same as source
Following tables provide a possible bit rate recommendations for APMP videos.
Tier
Resolution
Bit rate
Projection specifier
fps
1
8k x 4k
80 Mbps
PROJ-EQUI
60
2
8k x 4k
60 Mbps
PROJ-EQUI
60
3
8k x 4k
40 Mbps
PROJ-EQUI
60
If the quality of the 3rd tier is not acceptable, or you are working with very high motion content, o
can lower the resolution and bitrate combination further.
APMP monoscopic videos:


## Page 6

Tier
Resolution
Bit rate
Projection specifier
fps
4
5760 x 2880
60 Mbps
PROJ-EQUI
60
5
5760 x 2880
40 Mbps
PROJ-EQUI
60
6
5760 x 2880
30 Mbps
PROJ-EQUI
60
7
4096 x 2048
20 Mbps
PROJ-EQUI
60
Tier
Resolution
Bit rate
Projection specifier
fps
1
4k x 4k
80 Mbps
PROJ-HEQU
60
2
4k x 4k
60 Mbps
PROJ-HEQU
60
3
4k x 4k
40 Mbps
PROJ-HEQU
60
If the quality of the 3rd tier is not acceptable, or you are working with very high motion content, o
can lower the resolution and bitrate combination further.
Tier
Resolution
Bit rate
Projection specifier
fps
4
2880 x 2880
60 Mbps
PROJ-EQUI
60
5
2880 x 2880
40 Mbps
PROJ-EQUI
60
6
2880 x 2880
30 Mbps
PROJ-EQUI
60
7
2048 x 2048
20 Mbps
PROJ-EQUI
60
Following table provides a possible bit rate recommendations for AIV.
Tier
Average bandwith
Peak bandwidth
Resolution
fps
1
100 Mbps
150 Mbps
4320 x 4320
90
2
80 Mbps
120 Mbps
4320 x 4320
90
3
50 Mbps
100 Mbps
4320 x 4320
90
APMP stereoscopic videos:


## Page 7

Tier
Average bandwith
Peak bandwidth
Resolution
fps
4
32 Mbps
64 Mbps
4320 x 4320
90
5
25 Mbps
50 Mbps
4320 x 4320
90
Note
The above bit rates are initial encoding targets for typical content delivered via HLS. Apple
recommends that you evaluate them against your specific content and encoding workflow,
then adjust accordingly.
30i source content is considered to have a source frame rate of 60 fps. 24 fps HEVC content
should use bit rates reduced by about 20% from the values above.
1.26. For VOD content, the average segment bit rate MUST be within 10% of the AVERAGE-
BANDWIDTH attribute. (See Declared versus measured values of bandwidths.)
1.27. For VOD content, the measured peak bit rate MUST be within 10% of the BANDWIDTH
attribute.
1.28. For live (linear) content, the average segment bit rate over a long (~1 hour) period of time
MUST be less than 110% of the AVERAGE-BANDWIDTH attribute.
1.29. For live (linear) content, the measured peak bit rate MUST be less than 125% of the
BANDWIDTH attribute.
1.30. For VOD content, the peak bit rate SHOULD be no more than 200% of the average bit rate.
1.31. Different variants MAY have different frame rates.
1.32. * The default video variants SHOULD be the 2000 kbit/s (average bit rate) variant. (Defaults
are the first variant listed in the Multivariant Playlist within a group of variants having compatible
audio).
1.33. All video variants SHOULD have identical aspect ratios.
1.34. For maximum compatibility when UHD video resolution is provided, some UHD variants
SHOULD be less than or equal to 15 Mbit/s.
1.35. For HDR10 content, the Mastering Display Color Volume and Content Light Level Information
SEI messages SHOULD be present.
1.36. MV-HEVC video MUST NOT be used for anything other than stereo video.
1.37. Level for AV1 MUST be less than or equal to Level 6.2
1.38. All APMP monoscopic videos MUST be encoded using HEVC/H.265.


## Page 8

1.39. The container format for AV1 video MUST be fMP4.
2. Audio encoding requirements
2.1. Audio data SHOULD be provided as an elementary audio stream or in fMP4.
2.2. Codecs that provide stereo audio are:
Apple Positional Audio Codec (APAC)
AAC-LC
HE-AAC v1
HE-AAC v2
xHE-AAC
Apple Lossless
FLAC
2.3. * Stereo audio in AAC, HE-AAC v1, or HE-AAC v2 format MUST be provided.
2.4. You SHOULD NOT use HE-AAC if your audio bit rate is above 64 kbit/s.
2.5. Supported multichannel audio codecs are:
APAC
AAC-LC
HE-AAC v1
Apple Lossless
FLAC
Dolby Digital (AC-3)
Dolby Digital Plus (E-AC-3)(ec-3)
Dolby Digital Plus JOC (ec+3)
(See Values for the CODECS attribute for more information about specifying Dolby Digital Plus
JOC.)
2.6. * If Dolby Digital Plus is provided and your streams are delivered to devices that don’t suppor
Dolby Digital Plus, then Dolby Digital MUST be provided also. See Audio compatibility.
2.7. Stereo audio MAY be provided at multiple bit rates.
2.8. * Multichannel audio using a particular codec MAY be provided at multiple bit rates.
Audio


## Page 9

2.9. Overall bit rate recommendations are as follows:
Audio channels
Codec
Total (kbit/s)
2.0 (stereo)
APAC
32 to 160
2.0 (stereo)
AAC
32 to 160
2.0 (stereo)
xHE-AAC
24 to 160
2.0 (stereo)
Dolby Digital Plus
96 to 160
Audio channels
Codec
Total (kbit/s)
5.1 (surround)
APAC
320
5.1 (surround)
AAC
320
5.1 (surround)
Dolby Digital
384
5.1 (surround)
Dolby Digital Plus
192
7.1 (surround)
APAC
384
7.1 (surround)
Dolby Digital Plus
384
Ambisonic order
Codec
Audio coding identifier
Total (kbit/s)
1
APAC
1OA
192 to 384
2
APAC
2OA
240 to 512
3
APAC
3OA
/270 to 768
Bitrate recommendations for stereo are as follows:
Bitrate recommendations for multi-channel surround formats are as
follows:
Bitrate recommendations for Ambisonics are as follows:


## Page 10

See APAC for more information about ambisonics.
2.10. * You MAY change channel layout within a stream.
2.11. Channel layout changes MUST be in conjunction with an EXT-X-DISCONTINUITY tag.
2.12. If you provide Descriptive Video Service (DVS), also called “Audio Description”, it MUST be
marked with the attribute CHARACTERISTICS="public.accessibility.describes-
video".
2.13. If you provide DVS, the AUTOSELECT attribute MUST have a value of “YES".
2.14. The name of DVS audio SHOULD indicate that the stream is DVS content.
2.15. If you provide alternative audio or DVS, you MUST provide it for the entire content duration,
even if it only really exists for a portion of the main content.
2.16. Alternative audio or DVS MAY reuse the audio segments of regular content when the
alternative content isn’t available.
2.17. A single Media Segment MUST NOT contain multiple audio streams.
2.18. Loudness management or Dynamic range control SHOULD be present unless all content
(including ads) has been encoded at the same audio levels.
2.19. In fMP4 files, except for the APAC codec, you SHOULD provide loudness information by way
of a loudness box (’ludt’). When present, the loudness box takes precedence over any loudness
information in the audio stream. For APAC, a loudness box SHALL not be used.
2.20. In the absence of a loudness box, Dolby Digital and Dolby Digital Plus loudness SHOULD be
specified by the dialnorm field (ATSC A/52:2012). 
2.21. For AAC, in the absence of a loudness box, AAC dialog loudness SHOULD be specified by
either AAC prog_ref_level (ISO 14496-3 subclause 4.5.2.7), as specified by SCTE 193-1
section 7.4.1, or by the loudnessInfo() payload as specified by ISO 23003-4, in which case,
samplePeakLevel or truePeakLevel MUST be present, measurementSystem MUST be 2,
and methodDefinition MUST be 1 or 2, while for video content it SHOULD be 2.
2.22. For xHE-AAC, loudness metadata MUST be present according to the Basic Loudness
Metadata specified in ISO 23003-4 Table I.5; samplePeakLevel or truePeakLevel MUST be
present. The methodDefinition SHOULD be 2 for video content.
2.23. The loudness value MUST indicate the actual loudness of the content.
2.24. HE-AAC in fMP4 files MUST use explicit signaling of SBR data.
2.25. The container format for xHE-AAC, Apple Lossless, FLAC, and APAC audio MUST be fMP4.
2.26. If you provide non-Dolby multichannel audio, you SHOULD provide multichannel AAC also.
2.27. For audio description, the LANGUAGE attribute MUST be present and indicate the primary
language used to convey the descriptions.


## Page 11

2.28. Audio that has been prepared or otherwise processed to heighten the intelligibility of speec
MAY be marked with the attribute CHARACTERISTICS="public.accessibility.enhances
speech-intelligibility".
2.29. Supported multi-format audio codecs that carry the combination of two or more formats ou
of channels, objects and Ambisonics are:
APAC
Dolby Digital Plus JOC
2.30. APAC encoded content MUST have in-stream loudness and DRC metadata.
2.31. If you provide APAC immersive audio, you SHOULD provide stereo AAC also.
3. Ad requirements (See also the Media Playlists section of HTTP Live Streaming (HLS) authoring
specification for Apple devices.)
3.1. Your ads and other nonprimary media MAY be inserted in the Media Playlists or as Interstitials
3.2. Inserted media SHOULD be encoded with the same codecs as the other content in the Media
Playlist.
3.3. Inserted media SHOULD be encoded with the same aspect ratio as the other content in the
Media Playlist.
3.4. Inserted media SHOULD be at or under the specified bandwidths for that variant.
4. Accessibility requirements
4.1. Captions SHOULD be provided with your streams to make content accessible to people who
are deaf or hard of hearing.
4.2. Supported caption formats are:
CEA-608 closed captions
CEA-708 closed captions
WebVTT subtitles
IMSC1 subtitles (text profile only)
4.3. Closed captions (if any) MUST be included in the video Media Segments.
4.4. The presence of closed captions MUST be declared via an EXT-X-MEDIA tag that contains a
LANGUAGE attribute.
Ads and pre-/mid-/post-rolls
Accessibility


## Page 12

4.5. If a subtitles track is intended to provide accessibility for people who are deaf or hard of
hearing, it MUST be marked with the attribute CHARACTERISTICS="public.accessibility
.transcribes-spoken-dialog,public.accessibility.describes-music-and-
sound". (Subtitles with this attribute value are treated the same as closed captions.)
4.6. If a subtitles track is intended to provide accessibility for people who are deaf or hard of
hearing, the AUTOSELECT attribute MUST have a value of "YES".
4.7. The LANGUAGE attribute MUST be included in the EXT-X-MEDIA tag for a subtitles track.
4.8. For information on including audio descriptions with your streams, see items 2.12 through 2.1
5. Subtitle requirements
5.1. Subtitles MAY be provided.
5.2. * Subtitles MUST be WebVTT (according to the HLS specification) or IMSC1 in fMP4.
5.3. WebVTT subtitles MUST be in text files, with an X-TIMESTAMP-MAP according to the HLS
specification.
5.4. IMSC1 subtitles MUST be in fMP4 files.
5.5. The subtitle playlist MUST exist for the entirety of the main content, even if the actual subtitle
only exist for a portion of the content.
5.6. For live (linear) content, target durations for subtitle playlists MUST be identical to other med
5.7. For VOD content, target durations of subtitle playlists MAY be longer than the other media.
5.8. If the content has forced subtitles and regular subtitles in a given language, the regular
subtitles track in that language MUST contain both the forced subtitles and the regular subtitles f
that language.
5.9. If your videos contain text burnt into the video and you have access to a version without the
burn-in, you SHOULD use forced subtitles instead. (This allows you to easily translate into multipl
languages. An example of when you might use forced subtitles is a science fiction film, where alie
languages are translated into English.)
5.10. The kind of subtitles SHOULD be specified in the CODECS attribute of the associated EXT-X
STREAM-INF tags. You SHOULD use "stpp.ttml.im1t" to identify IMSC1 subtitles. You MAY
use "wvtt" to identify WebVTT subtitles.
5.11. Forced subtitles SHOULD always have AUTOSELECT=YES.
6. Trick play requirements
Subtitles
Trick Play


## Page 13

6.1. I-frame playlists (EXT-X-I-FRAME-STREAM-INF) MUST be provided to support scrubbing
and scanning UI.
6.2. You SHOULD have one frame per second dense I-frame renditions. These are dedicated
renditions that only contain I-frames.
6.3. Alternatively, you MAY use the I-frames from your normal content, but trick play performance
is improved with a higher density of I-frames.
6.4. If you provide multiple bit rates at the same spatial resolution for your regular video, you
SHOULD create the I-frame playlist for that resolution from the same source used for the lowest b
rate in that group.
6.5. The bit rate of I-frame playlists SHOULD be the bit rate of a normal playlist of the same
resolution times the fps of the I-frame playlist divided by eight. (See I-frame bit rates versus norm
bit rates.)
6.6. * You SHOULD provide multiple I-frame Media Playlists with different bit rates.
6.7. As with normal video, there are many possible choices of bit rates for dense I-frame variants.
The following tables provide one possible set of variants. (See On bit rates for variants.)
16:9 aspect ratio
H.264/AVC
640 x 360
45
768 x 432
90
960 x 540
250
1280 x 720
375
1920 x 1080
580
16:9 aspect ratio
HEVC/H.265
HDR (HEVC)
768 x 432
40
55
960 x 540
75
94
960 x 540
200
238
1280 x 720
300
360
1920 x 1080
525
650


## Page 14

Note
These bit rates are based on the assumption of a 1 fps dense I-frame track. The values should
be modified based on the actual frame rate of the I-frame rendition. (See item 6.5.)
The above tables are average bit rates. Earlier versions of this specification used peak bit
rates.
6.8. I-frame playlists MUST contain the EXT-X-I-FRAMES-ONLY tag.
6.9. The peak segment bit rate MUST be calculated according to the HLS specification.
6.10. If using fMP4, I-frame segments MUST include the ‘moof’ header associated with the I-fram
6.11. For live (linear) content, target durations for I-frame playlists MUST be identical to other
media.
6.12. For VOD content, target durations of I-frame playlists MAY be different from the other media
6.13. * I-frame playlists MAY use a different video codec than the normal video segments.
6.14. * For backward compatibility, some trick play content SHOULD be encoded with H.264.
6.15. If HDR trick play streams are provided, they SHOULD be provided at all resolutions.
6.16. * For backward compatibility, SDR trick play streams MUST be provided.
6.17. I-frame content MAY be encoded using the fMP4 ‘mjpg’ codec. (See I-frame image
sequences.)
7. Media segmentation requirements
7.1. Your media MUST be continuous across segments, with the exception of transitions for ads an
other inserted material.
7.2. If using a transport stream, continuity counters and timestamps MUST be sequential.
7.3. If using fMP4, the track fragment decode time MUST be consistent with the decode time and
duration of the previous segment.
7.4. Video segments MUST start with an IDR frame.
7.5. Target durations SHOULD be 6 seconds.
7.6. Segment durations SHOULD be nominally 6 seconds (for example, NTSC 29.97 may be 6.006
seconds).
7.7. Media Segments MUST NOT exceed the target duration by more than 0.5 seconds.
Media Segmentation


## Page 15

7.8. Each xHE-AAC segment SHOULD start with an Immediate Playout Frame (IPF).
7.9. Each APAC segment MUST start with an Audio Synchronization Packet (ASP).
8. Media Playlist requirements
8.1. You MUST use sufficiently accurate segment durations to ensure that the sum of the EXTINF
durations of any contiguous group of segments is within one video frame duration of the actual
duration of the content.
8.2. Audio and video playlists MUST all use the same target duration.
8.3. Audio and video playlists MUST contain the same duration of the content.
8.4. The EXT-X-PROGRAM-DATE-TIME tag MUST be present in every live (linear) Media Playlist.
8.5. The date-time value of an EXT-X-PROGRAM-DATE-TIME tag SHOULD be aligned with the
airtime of the content.
8.6. If your Media Playlists are created from static source content (VOD), you MUST add the EXT-
X-PLAYLIST-TYPE with the value VOD.
8.7. Within one asset, all Media Playlists with an EXT-X-PLAYLIST-TYPE of VOD MUST cover
exactly the same media time range.
8.8. If your Media Playlists are event style (start from a fixed point with segments never removed)
you MUST add the EXT-X-PLAYLIST-TYPE with the value EVENT.
8.9. Separate audio streams MUST be declared using EXT-X-MEDIA tags.
8.10. The LANGUAGE attribute MUST be included in every EXT-X-MEDIA tag that doesn’t have
TYPE=VIDEO.
8.11. You MUST provide at least six segments in a live (linear) playlist.
8.12. * You SHOULD provide at least 15 minutes of content in a live (linear) playlist.
8.13. Breaks of encoding continuity MUST be indicated with the EXT-X-DISCONTINUITY tag.
8.14. Video frame rate changes MUST be marked as a discontinuity using EXT-X-
DISCONTINUITY tags.
8.15. All variants and renditions MUST have discontinuities at the same points in time.
8.16. * You SHOULD avoid switching codecs at discontinuities, for example, switching between
HEVC and H.264, or between AAC and Dolby Digital.
8.17. If live (linear) content will ever contain an EXT-X-DISCONTINUITY tag, the EXT-X-
DISCONTINUITY-SEQUENCE tag MUST always be present.
Media Playlists


## Page 16

8.18. Your media requests MUST NOT use HTTP redirects, with the exception of ad content to allo
dynamic selection of ads.
8.19. You SHOULD identify interstitial and program boundaries using the EXT-X-DATERANGE tag
8.20. If using fMP4, EXT-X-MAP tags MUST be present.
8.21. Metadata SHOULD be in the playlist (using EXT-X-DATERANGE) rather than in the media
(using Timed Metadata).
8.22. * For maximum interoperability, all audio/video variants and renditions SHOULD have segme
boundaries at the same points in time.
8.23. If your xHE-AAC segments start with an IPF, you SHOULD use the EXT-X-INDEPENDENT-
SEGMENTS tag in the Media Playlist.
8.24. A live (linear) playlist update SHOULD be considered invalid when the Last-Modified HTTP
header, if supplied, is more than three target durations from the Date HTTP header.
8.25. If your APAC segments start with an ASP, you SHOULD use the EXT-X-INDEPENDENT-
SEGMENTS tag in the Media Playlist.
9. Multivariant Playlist requirements
9.1. Your EXT-X-STREAM-INF tag MUST always provide the CODECS attribute.
9.2. Your EXT-X-STREAM-INF tag MUST always provide the RESOLUTION attribute if the
rendition includes video.
9.3. Your EXT-X-I-FRAME-STREAM-INF tag MUST always provide the CODECS attribute.
9.4. Your EXT-X-I-FRAME-STREAM-INF tag MUST always provide the RESOLUTION attribute.
9.5. You SHOULD deliver video and audio as separate streams.
9.6. If you have multichannel audio, you MUST use separate audio streams.
9.7. If you have alternative audio content (languages/commentary/DVS), you MUST use separate
audio streams.
9.8. If you have different video angles, you MUST use separate audio streams.
9.9. You MUST provide multiple bit rates of video (that is, variants).
9.10. For HD content, there SHOULD be at least two variants encoded at the highest-available
resolution.
9.11. If your video segments start with an IDR, you SHOULD use the EXT-X-INDEPENDENT-
SEGMENTS tag in the Multivariant Playlist. (See item 7.4.)
Multivariant Playlist


## Page 17

9.12. If your video segments start with an IDR and the EXT-X-INDEPENDENT-SEGMENTS tag isn
in the Multivariant Playlist, you MUST use the EXT-X-INDEPENDENT-SEGMENTS tag in all video
Media Playlists. (See item 7.4.)
9.13. The BANDWIDTH attribute MUST be the largest sum of peak segment bit rates that’s
produced by any playable combination of renditions.
9.14. You MUST include the AVERAGE-BANDWIDTH attribute.
9.15. Each EXT-X-STREAM-INF tag that includes video content MUST have a FRAME-RATE
attribute.
9.16. The VIDEO-RANGE attribute MUST be specified unless all variants and renditions are SDR.
9.17. Within a group of Renditions (EXT-X-MEDIA tags having the same TYPE and GROUP-ID),
those tags having the same LANGUAGE value should be ordered from most general to most
specific. (Because CHARACTERISTICS are open-ended, the matching algorithm needs the
ordering since it can’t interpret all the semantics.)
9.18. An EXT-X-CONTENT-STEERING tag SHOULD always have a PATHWAY-ID attribute.
9.19. The SCORE attribute (if present) MUST be on every variant. Otherwise, the SCORE attribute
will be ignored.
9.20. For APAC, the APAC profile and level MUST be provided as a part of Codec string. See APAC
for more information about APAC profile and level.
10. Delivery requirements
10.1. The server MUST deliver playlists using gzip content-encoding.
10.2. You SHOULD support stream failover, for example by listing duplicate streams in the
Multivariant Playlist.
10.3. Media data SHOULD NOT be delivered to the application through a local server.
10.4. You SHOULD use the recommended MIME types for content. The recommendations are in t
following table:
Media type
Format
Recommended MIME type
Typical file
extension
Playlist
HLS playlist
application/vnd.apple
.mpegurl
m3u8
Playlist
M3U playlist
audio/mpegurl
m3u
Delivery


## Page 18

Media type
Format
Recommended MIME type
Typical file
extension
Video
MPEG transport
stream
video/mp2t
ts
Media Initializaton
Fragmented MP4
video/mp4
mp4
Video or audio
Fragmented MP4
video/iso.segment
m4s
Video
Fragmented MP4
video/mp4
mp4
Audio
MPEG transport
stream
video/mp2t
ts
Audio
Fragmented MP4
audio/mp4
mp4
Audio
Packed audio
audio/aac
aac
Audio
Packed audio
audio/mpeg
mp3
Audio
Packed audio
audio/ac3
ac3
Audio
Packed audio
audio/eac3
ec3
Subtitles
WebVTT
text/vtt or text/plain
vtt
Subtitles
IMSC1
application/mp4
mp4
Content Steering
Manifest
JSON file
application/vnd.apple
.steering-list
json
X-ASSET-LIST
response
JSON file
application/json
json
Note
The M3U playlist MIME type audio/mpegurl isn’t registered with the IANA. According to the
IANA, the audio/aac MIME type allows LATM/LOAS or ADTS. HLS only supports ADTS. Some
older players are known to reject text/vtt as an illegal type. For compatibility, text/plain
is acceptable.
Privacy


## Page 19

Note
In a future release, Apple may require delivery over TLS.
11. Privacy requirements
11.1. Multivariant Playlists SHOULD be delivered using Transport Layer Security (TLS).
11.2. Media Playlists SHOULD be delivered using TLS.
11.3. Media Segments SHOULD be delivered using TLS.
11.4. Media Segment URLs requested over unencrypted transport SHOULD NOT contain revealing
strings, such as movie title, show title, episode name, episode number, genre, advertiser, or
product.
12. Security requirements
12.1. Transport Layer Security (TLS) MUST be version 1.2 or later with forward secrecy.
12.2. TLS MUST NOT use known-insecure cryptographic primitives (such as, RC4 encryption, SH
1 certificate signatures).
12.3. Within TLS, key sizes MUST be 2048 bits for RSA and 256 bits for EC.
12.4. The URLs for Media Segments SHOULD NOT be completely static. URLs should be issued p
device or changed over time.
13. Content protection requirements
13.1. Content protection of video and audio SHOULD follow the FairPlay Streaming (FPS)
specification.
13.2. If the content is encrypted with FPS, the method MUST be SAMPLE-AES.
13.3. If the content is encrypted with FPS, the key format MUST be "com.apple
.streamingkeydelivery".
13.4. The IV attribute SHOULD NOT be used with FPS unless necessary for interoperability.
13.5. Content with HD resolutions SHOULD use HDCP-LEVEL of TYPE-0.
13.6. Content with greater than HD resolutions SHOULD use HDCP-LEVEL of TYPE-1.
13.7. Video encrypted with Common Encryption MUST use an encrypt:skip pattern of 1:9 (10%
partial encryption).
Security
Content Protection


## Page 20

13.8. Content encrypted with FPS MAY use the ALLOWED-CPC attribute. (See ALLOWED-CPC
values for FairPlay Streaming.)
13.9. Common encryption MUST NOT use content sensitive encryption.
13.10. Content authors MAY mix encrypted and unencrypted samples in a single HLS fMP4
segment with a single Media Initialization Section by supplying both an encrypted
SampleDescription at index 0 and an unencrypted SampleDescription at index 1 for each track. Th
sample index field of each sample should point to the appropriate SampleDescription.
13.11. Encryption with SAMPLE-AES-CTR SHALL NOT be used on Apple devices.
Note
HD is approximately the range of 720p to 1080p.
14. Low-Latency HLS requirements
14.1. Low-Latency stream delivery MUST meet all requirements of the Low-Latency Server
Configuration Profile in Appendix B of draft-pantos-hls-rfc8216bis-07 or later.
14.2.
14.2a. The Part Target Duration MUST be at least the maximum round-trip time (RTT) to the serve
that 95% of the clients are expected to see (P95 RTT).
14.2b. The Part Target Duration SHOULD be at least three times the P95 RTT.
14.2c. The RECOMMENDED Part Target Duration is one second.
14.3. The PART-HOLD-BACK value MUST be at least three times the Part Target Duration.
14.4. Services with Playlist windows longer than two minutes SHOULD offer Playlist Delta Updates
14.5. Services that offer Playlist Delta Updates and use EXT-X-DATERANGE tags SHOULD also u
CAN-SKIP-DATERANGES=YES.
Note
Other requirements only apply to the playlists and media received by a single client. SharePlay
adds requirements that apply to all participants in the SharePlay session.
Low-Latency HLS
SharePlay


## Page 21

15. SharePlay HLS requirements
15.1. For live (linear) content, the timeline derived from the EXT-X-PROGRAM-DATE-TIME tag is
used for synchronization. That timeline MUST be in agreement for all participants.
15.2. For VOD content, the timeline based on the start of the playlist is used for synchronization.
That timeline MUST be in agreement for all participants.
15.3. Interstitials delivered to participants in a SharePlay session SHOULD match in duration. If the
do not, participants receiving longer duration interstitials will miss some of the primary content.
This behavior can only be overridden when all participants are using apps that support control of
coordinated media playback.
Note
Please see About spatial video for information regarding Spatial Video.
16. Spatial (stereo, immersive and projected) video requirements
16.1. All variants containing spatial video MUST be marked with a REQ-VIDEO-LAYOUT attribute.
16.2. All spatial video content MUST include Video Extended Usage ('vexu') atoms/boxes. (See
Additional spatial video specifications.)
16.3. Switches between spatial and non-spatial video content MUST be marked with an EXT-X-
DISCONTINUITY tag, or the Media Initialization Section MUST contain sample descriptions for bo
kinds of content.
16.4. Stereo and Immersive video content SHOULD include parallax metadata if your content has
subtitles. (See Additional spatial video specifications.)
16.5. If spatial video content includes sections of monoscopic video content, then the REQ-VIDEO
LAYOUT attribute MUST include “CH-MONO” as one entry.
All general rules apply except as expressly modified by a rule with the same number in this sectio
Rules with a leading plus sign (+) are additional rules.
1. Video encoding requirements
1.3.
Spatial (stereo, immersive and projected) video
Amended requirements for macOS
Video


## Page 22

1.3b. Profile and Level for H.264 MUST be less than or equal to High Profile, Level 5.0.
All general rules apply except as expressly modified by a rule with the same number in this sectio
Rules with a leading plus sign (+) are additional rules.
1. Video encoding requirements
1.6.
1.6b. Profile and Level for H.264 MUST be less than or equal to High Profile, Level 6.0.
1.9.
1.9a. Profile and Level for Dolby Vision MUST be Profile 5 (single layer 10-bit HEVC) or Profile 10
(single layer 10-bit AV1) and less than or equal to Level 9.
1.9b. + For maximum compatibility, some Dolby Vision variants SHOULD be Profile 5 and less than
or equal to Level 7.
1.32.
1.32a. For Wi-Fi delivery, the default video variant SHOULD be the 2000 kbit/s (average bit rate)
variant.
1.32b. For cellular delivery, the default video variant SHOULD be the 730 kbit/s (average bit rate)
variant.
9. Multivariant Playlist requirements
9.21. + Multivariant Playlists that are delivered over cellular networks MUST contain a variant who
peak BANDWIDTH is less than or equal to 192 kbit/s.
9.22. + For backward compatibility, a peak 192 kbit/s H.264 variant packaged in a transport stream
SHOULD be provided for cellular.
All general rules apply except as expressly modified by a rule with the same number in this sectio
Rules with a leading plus sign (+) are additional rules.
Amended requirements for iOS
Video
Multivariant Playlist
Amended requirements for visionOS


## Page 23

The following general rules regarding compatibility aren’t applicable in visionOS if all variants
contain stereo video content: 1.3a, 1.6a, 1.9b, 1.12, 1.24, 2.3, 2.6, 6.14, 6.16.
1. Video encoding requirements
1.9.
1.9a. Dolby Vision monoscopic content MUST be Profile 5 (single layer 10-bit HEVC) and less than
or equal to Level 9.
1.9c. + Dolby Vision stereo video MUST be Profile 20 (MV-HEVC) and less than or equal to Level 9
1.25. Suggested bit rates for MV-HEVC variants.
16:9 aspect ratio
MV-HEVC SDR 30 fps
MV-HEVC HDR 30 fps
Frame rate
640 x 360
246
272
≤ 30 fps
768 x 432
510
612
≤ 30 fps
960 x 540
1020
1241
≤ 30 fps
960 x 540
1530
1853
≤ 30 fps
960 x 540
2720
3281
Same as source
1280 x 720
4080
4930
Same as source
1280 x 720
5780
6936
Same as source
1920 x 1080
7650
9180
Same as source
1920 x 1080
9660
11900
Same as source
2560 x 1440
13770
16490
Same as source
3840 x 2160
19720
23630
Same as source
3840 x 2160
28560
34000
Same as source
1.40. + Stereo video MUST be encoded using Dolby Vision Profile 20 (MV-HEVC).
Video
Trick play


## Page 24

6. Trick play requirements
6.6. If your only content is stereo video, then you SHOULD provide only one I-frame Media Playlis
(See item 6.19.)
6.18. + Trick play content SHOULD be monoscopic and rectilinear.
6.19. + In visionOS, a thumbnail list is produced for scrubbing and scanning. These thumbnails are
160px height with a width that matches the aspect ratio of the main content. For better
performance, you MAY provide an I-frame playlist having exactly this height.
16. Spatial (stereo, immersive and projected) video requirements
16.6. + All Stereo (including APMP) video MUST be encoded using MV-HEVC.
16.7. + Immersive video content MUST use CH-STEREO and PROJ-AIV for channel and projection
specifier in REQ-VIDEO-LAYOUT.
All general rules apply except as expressly modified by a rule with the same number in this sectio
Rules with a leading plus sign (+) are additional rules.
1. Video encoding requirements
1.3.
1.3b. Profile and Level for H.264 MUST be less than or equal to High Profile, Level 5.1.
1.20. For HDR content, frame rates less than or equal to 30 fps MUST be provided.
1.25. The 145 kbit/s variant SHOULD NOT be provided.
2. Audio encoding requirements
2.8. Multichannel audio using a particular codec MAY be provided at multiple bit rates. However,
Dolby Atmos content SHOULD be restricted to a single bit rate.
6. Trick play requirements
Spatial (stereo, immersive and projected) video
Amended requirements for tvOS
Video
Audio
Trick Play


## Page 25

6.16. SDR trick play streams MUST be provided.
8. Media Playlist requirements
8.12. You SHOULD provide at least 120 minutes of content in a live (linear) playlist.
9. Multivariant Playlist requirements
9.20. + You MUST have no audio-only variants listed in the Multivariant Playlist.
All general rules apply except as expressly modified by a rule with the same number in this sectio
Rules with a leading plus sign (+) are additional rules.
Note
AirPlay on older third-party TVs does not support the Sample Group Description Box ('sgpd')
and Sample to Group Box ('sbgp') for encrypted content. You must remove them from
encrypted CMAF content to enable playback.
1. Video encoding requirements
1.23. If multiple video streams are provided (H.264, HEVC, HDR), each stream MUST provide all
anticipated bandwidths.
1.41. + Encrypted fMP4 content MUST contain either a Sample Encryption Box ('senc'), or both 
Sample Auxiliary Information Sizes Box ('saiz') and a Sample Auxiliary Information Offsets Box
('saio').
2. Audio encoding requirements
2.10. Channel layout SHOULD NOT change within a stream.
Media Playlists
Multivariant Playlist
Amended requirements for AirPlay 2-Enabled TVs
Video
Audio
Ads and pre-/mid-/post-rolls


## Page 26

3. Ad requirements
3.5. + Inserted media SHOULD be at a similar frame rate (x, 2x, x/2) as the other content in the
Media Playlist.
5. Subtitle requirements
5.2. Subtitles MUST be WebVTT.
6. Trick play requirements
6.13. If a normal video variant uses a video codec, one or more I-frame variants MUST exist with t
same video codec or the mjpg codec.
8. Media Playlist requirements
8.16. You SHOULD NOT switch codecs at discontinuities. For example, don’t switch between HEV
and H.264, or between AAC and Dolby Digital.
8.22. All video variants and renditions MUST have segment boundaries at the same points in time
8.25. + Frame rate changes at discontinuities SHOULD use a similar frame rate (x, 2x, x/2).
9. Multivariant Playlist requirements
9.23. + You SHOULD provide a full range of variants for each codec type and frame rate. Similar
frame rates (x, 2x, x/2) are compatible, nonsimilar frame rates may cause playback issues.
9.24. + If you supply HDR content, you SHOULD provide both Dolby Vision and HDR10.
The following table describes the changes to this document.
Subtitles
Trick Play
Media Playlists
Multivariant Playlist
Revision history


## Page 27

Date
Notes
2025-
06-26
Fixed malformed URLs.
2025-
06-24
Added container format rule for AV1.
2025-
05-08
Added AIV bit-rate tiers.
2025-
05-02
Added Offline download guidelines.
2025-
04-30
Added APAC authoring guidelines.
2025-
04-18
Added Spatial (Stereo, APMP and AIV) authoring guidelines.
2025-
03-25
Clarified use of DV20 for Stereo video for VisionOS.
2023-
05-24
Minor changes.
2023-
08-15
Added visionOS requirements. Added note about audio/aac.
2023-
06-27
Added stereo video rules and MV-HEVC bit rate.
2023-
05-19
Added detail about I-frame image sequences.
2022-
08-22
Added “Audio rendition groups and variants” section to the appendix, clarified
language around the LANGUAGE attribute, and added additional information about
Apple TV and Dolby ATMOS.
2021-
11-12
Renamed “primary playlist” to “Multivariant Playlist.”
2020-
06-22
Added new sections: Low-Latency HLS and ALLOWED-CPC Values for FairPlay
Streaming.


## Page 28

Date
Notes
2019-
06-03
Added new table describing MIME types.
2019-
03-04
Added new rules for Airplay 2-enabled TVs. Moved appendixes into child article.
2018-
09-11
Added new rules for content protection and media playlists.
2018-
06-18
Added Dolby Digital Plus with Dolby Atmos information. Added codec value section.
2018-
04-09
Made several minor changes to individual spec points. Updated the variant bit rate
table and broke it into two separate tables.
2018-
01-16
Fixed several typos and made a couple of minor changes to audio encoding
requirements.
2017-
09-19
Updated document with HDR (HEVC) information.
2017-
06-06
Updated document with HEVC/H.265 information.
2016-
09-13
Added rules for fragmented MP4 files.
2016-
06-13
Updated for iOS and macOS specifications.
2016-
03-21
Updated Dolby Digital bit rate recommendation to 384 kbit/s.
2016-
01-11
Fixed typo in section 10.2.
2015-
12-17
Added section on using the hlsreport tool.
2015-
12-08
Corrected a mistake in Table 2-3, Column 2 heading. Changed to 16:9 aspect from
19:0.


## Page 29

Date
Notes
2015-
10-21
Published the first edition of this document describing the HTTP Live Streaming
specifications for audio and video content delivery for Apple TV.
HTTP Live Streaming (HLS) Authoring Specification for Apple devices appendixes
Learn additional information related to the HLS Authoring Specification for Apple Devices.
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
Topics
Appendixes
See Also
Specifications and other documents


## Page 30

Providing JavaScript Object Notation (JSON) chapters
Prepare JSON chapters for HTTP Live Streaming.


## Page 31

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


## Page 32

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


## Page 33

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


## Page 34

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


## Page 35

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


## Page 36

The PlayReady Header is the string below. (Converted from UTF-16 with indentation and line
breaks added for clarity.)
The ALGID attribute indicates the protection scheme is ‘cbcs’.
Here is the unpacked form of the KID element’s VALUE attribute, which is a base64 encoded
string.


## Page 37

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


## Page 38

The Common Media Application Format (CMAF) for segmented media is an extensible standard fo
the encoding and packaging of segmented media objects for delivery and decoding on end user
devices in adaptive multimedia presentations. Delivery and presentation are abstracted by a
hypothetical application model that allows a wide range of implementations including HLS and
MPEG’s Dynamic Adaptive Streaming over HTTP (MPEG DASH). The CMAF specification defines
several logical media objects:
CMAF Track: Tracks contain encoded media samples, including audio, video, and subtitles. Media
samples are stored in a CMAF specified container derived from the ISO Base Media File Format.
Media samples may optionally be protected by MPEG Common Encryption. Tracks are made up o
a CMAF Header and one or more CMAF Fragments.
CMAF Switching Set: Switching sets contain alternative tracks that can be switched and spliced 
CMAF Fragment boundaries to adaptively stream the same content at different bit rates and
resolutions.
Aligned CMAF Switching Set: Two or more CMAF Switching Sets encoded from the same source
with alternative encodings, for example, different codecs, and time aligned to each other.
CMAF Selection Set: A group of switching sets of the same media type that may include
alternative content (for example, different languages or camera angles) or alternative encodings
(for example, different codecs).
CMAF Presentation: One or more presentation time synchronized selection sets.
Note
A presentation is the first point where different media types can be combined.
Overview
HTTP Live Streaming / About the Common Media Application Format with HTTP Live Streaming (HLS)
Article
About the Common Media Application
Format with HTTP Live Streaming (HLS)
Learn the Common Media Application Format as it applies to HLS.


## Page 39

The CMAF Hypothetical Reference Model defines how tracks can be delivered, combined, and
synchronized in CMAF Presentations, but the model allows the use of any compatible
implementation. It’s possible to create HLS Playlists and a DASH Media Presentation Description
that share the same resources, CMAF Addressable Objects, thereby allowing efficient caching ev
when delivering to multiple platforms. CMAF Addressable Media objects consist of:
CMAF Header: Headers contain information that includes information for initializing a track.
CMAF Segment: A sequence of one or more consecutive fragments from the same track.
CMAF Chunk: A chunk contains a sequential subset of samples from a fragment.
CMAF Track File: A complete track in one ISO_BMFF file.
Apple’s HLS specification is a published RFC, RFC 8216. However, HLS continues to evolve, so
there’s an updated draft specification — draft-pantos-hls-rfc8216bis.
The HLS specification defined support for fragmented MPEG-4 Segments (ISO_BMFF) in
September 2016. Clients based on earlier revisions will likely not be able to handle CMAF content
Apple hardware running iOS 10.0, macOS 10.12, and tvOS 10.0 or later OS versions should suppor
CMAF content.
Note
HLS was originally specified in draft-pantos-http-live-streaming. That document was
superseded by RFC 8216.
Support for CMAF
Manifests, resources, and CMAF presentations


## Page 40

In HLS, the role of the Manifest is divided between the HLS Multivariant Playlist and the Media
Playlists it references. They describe a single CMAF Presentation or a sequence of CMAF
Presentations.
In an HLS Multivariant Playlist, EXT-X-STREAM-INF tags define different tiers of the presentatio
Tiers are distinguished by bit rate, required codecs, resolution, and other attributes. Each tier
specifies an HLS Media Playlist. Each tier may also indicate additional HLS Renditions, which are
Media Playlists described in EXT-X-MEDIA tags that are available for selection while playing that
tier. For example, an audio Rendition can be used to supply audio if the tier’s Media Playlist only
contains video; a group of audio Renditions can be used to offer a selection of different language
tracks.
Because CMAF Segments can’t, in general, contain multiple media types, EXT-X-MEDIA tags ne
to be used to associate audio and subtitle Playlists with video, which is usually in the EXT-X-
STREAM-INF tag’s Media Playlist. The same Rendition can be used by several EXT-X-STREAM-
INF tags; for instance, multiple video tiers can specify the same audio Rendition. Alternately,
higher bit rate video tiers can specify separate, higher bit rate audio Renditions so that audio
quality scales with video quality.
There should be one HLS Media Playlist per CMAF Track. In HLS Media Playlists, CMAF Segments
are used as HLS Segments. There has to be an EXT-X-MAP tag applied to each HLS Segment; th
tag points to a CMAF Header that’s appropriate for all CMAF Fragments inside the HLS Segment.
Since all CMAF Fragments are independently decodable, their HLS Playlists should contain an
EXT-X-INDEPENDENT-SEGMENTS tag. When the media is encrypted, EXT-X-SESSION-KEY tags
should be included in the Multivariant Playlist to enable prefetching of keys.
The EXT-X-BYTERANGE tag can be used to indicate that an HLS Segment is a byte range inside 
larger resource.
Media Segments inside EXT-X-I-FRAMES-ONLY Playlists start on a CMAF Fragment boundary.
The EXT-X-DISCONTINUITY tag can be used to concatenate multiple CMAF Tracks of the sam
media type in a Media Playlist. Each discontinuity demarcates a boundary between successive
CMAF Presentations. A discontinuity allows the resetting of presentation timestamps and other
characteristics. Many changes can require a discontinuity, for example, switching from Sample
Encryption to unencrypted. A new EXT-X-MAP tag is usually required after a discontinuity. For
further information, see the HLS specification.
Note
For fragmented MPEG-4 Segments, an EXT-X-KEY tag with a METHOD=SAMPLE-AES
attribute indicates that the Segment is encrypted using the ‘cbcs’ scheme in ISO/IEC 23001-
7.
CMAF Tracks, Segments, Headers, and Fragments


## Page 41

HLS supports all CMAF subtitle and caption formats, except for IMSC1 Image Tracks.
You can include one or more Event Message boxes (‘emsg’) in each segment. You must use
version 1 of the Event Message box standard found in ISO-23009-1. The following values define t
semantics:
scheme_id_uri
Set to https://aomedia.org/emsg/ID3 to identify boxes that carry ID3v2 metadata.
value
The URI that defines the semantics of the ID field. Any relative URI is considered to be relativ
to scheme_id_uri.
message_data
Contains data compatible with ID3 version 2.x.x.
Each Track in a video CMAF Switching Set should appear in the Multivariant Playlist as a Media
Playlist URI prefixed by an EXT-X-STREAM-INF tag describing it. The EXT-X-STREAM-INF tag
should also specify any other renditions, such as audio that are intended to play with the video by
indicating an appropriate EXT-X-MEDIA GROUP-ID.
Each Track in an audio CMAF Switching Set should be represented in the Multivariant Playlist by a
EXT-X-MEDIA tag. The URI attribute of the EXT-X-MEDIA tag should be a URI to that Track’s
Media Playlist. It has to have a GROUP-ID attribute that allows it to be associated with one or mor
EXT-X-STREAM-INF tags, which specify video tiers.
In HLS, when multiple codecs are offered, EXT-X-STREAM-INF tags in the Multivariant Playlist a
typically arranged in sets of parallel tiers, for example, low-bitrate-codec-A, high-
bitrate-codec-A, low-bitrate-codec-B, high-bitrate-codec-B.
CMAF Selection Sets generally offer either alternate encodings of the same source content (for
example, encoded with different codecs) or homogenous encodings of different versions of the
source content (for example, different audio language tracks).
For Selection Sets offering codec variants, each Switching Set in the Selection Set should appear
as a set of EXT-X-STREAM-INF tags, for video, or a set of EXT-X-MEDIA tags, for other media
types. See CMAF Switching Sets.
For Selection Sets offering source variants, each Track of a member Switching Set should appear
as an EXT-X-MEDIA tag. Tracks encoded with the same settings should get the same EXT-X-
MEDIA GROUP-ID. For example, a Selection Set containing French and English Switching Sets,
with just one Track in each Switching Set, should appear as two EXT-X-MEDIA tags with the sam
CMAF Switching Sets
CMAF Selection Sets


## Page 42

GROUP-ID. For more EXT_X_MEDIA tag rules, see RFC 8216 and HTTP Live Streaming 2nd
Edition.
The CMAF specification defines three presentation profiles: unencrypted, encrypted with ‘cbcs
and encrypted with ‘cenc’. HLS supports unencrypted and encrypted with ‘cbcs’.
In this example, there’s a video CMAF Track containing 29.97 fps video in 60-frame GOPs, each
2.002 seconds long. Each GOP forms a CMAF Fragment. The CMAF Fragments, V1, V2, V3, V4, a
V5, total 10.010 seconds of video. Their CMAF Header is VH.
Accompanying the video is an English audio CMAF Track consisting of an English CMAF Header,
EH, and five audio CMAF Fragments: E1, E2, E3, E4, and E5, encoded at a sample rate of 44.1 Khz
Each CMAF Segment is 86 AAC frames, with a duration of 1.997 seconds each, except for E5,
which has 87 frames, for a total of 10.008 seconds of audio. There are also five French audio CMA
Fragments — F1, F2, F3, F4, and F5 — and a French CMAF Header, FH.
The CMAF Fragments have been packaged into three CMAF Segments per track for delivery and
those CMAF Resources identified as HLS segments: V1andV2, V3andV4, and V5; E1andE2,
E3andE4, and E5; and so on.
In addition, there’s a high quality video Track containing CMAF Fragments: VHQ1, VHQ2, VHQ3,
VHQ4, and VHQ5, with Header VHQH, packaged and identified similarly.
The two video Tracks, V and VHQ, are CMAF Switching Sets. Each audio Track can also be
considered a Switching Set, with only one member. Together, both audio Switching Sets form a
CMAF Selection Set.
Media Playlists
The HLS Media Playlist for the regular video Track video.m3u8 would be as follows.
CMAF Presentation Profiles
HLS example


## Page 43

The Media Playlist for the high quality video Track video-hq.m3u8 would be similar.
The Media Playlist for the English audio Track english.m3u8 would be as follows.
The Media Playlist the French audio Track french.m3u8 would be similar.
Basic Multivariant Playlist
The HLS Multivariant Playlist might look like the following example.
Multivariant Playlist with Codec Variants
We could also supply HEVC versions of video.m3u8 and video-hq.m3u8, and perhaps give th
high-bandwidth tier better-quality audio. Then the Multivariant Playlist might look like the followin
example.


## Page 44

This example illustrates how CMAF Selection Sets can appear as separate Renditions, english
.m3u8 and french.m3u8, or as separate sets of tiers distinguished by different required codecs
{video.m3u8, video-hq.m3u8} is the AVC Switching Set; {hevc-video.m3u8, hevc-
video-hq.m3u8} is the HEVC Switching Set. Together they form a Selection Set that allows
selection by codec.
HTTP Live Streaming (HLS) authoring specification for Apple devices
Learn the requirements for live and on-demand audio and video content delivery using HLS.
Using content protection systems with HLS
Adding encryption keys to media playlists
Enabling Low-Latency HTTP Live Streaming (HLS)
Add Low-Latency HLS to your content streams to maintain scalability.
See Also
Specifications and other documents


## Page 45

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


## Page 46

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


## Page 47

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


## Page 48

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


## Page 49

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


## Page 50



## Page 51

Here’s an example of a playlist delta update. Note that use of tha EXT-X-SKIP tag requires a later
version than the basic use of Low-Latency HLS above.
Examine a Playlist Delta Update


## Page 52

Here’s an example of a byterange-addressed part. In a real playlist at least some of the EXT-X-
PART tags would contain an INDEPENDENT attribute. Those have been removed to make the
example clearer.
Examine Byterange-Addressed Parts


## Page 53

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


## Page 54

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


## Page 55

The following links are in addition to the specifications listed below.
RFC 8216. The IETF Informational specfication for HTTP Live Streaming. This document
describes the HTTP Live Streaming protocol as of August 2017. This document specifies the
data format of the files and the actions to be taken by the server and the clients of the streams
FairPlay Streaming. A technology describing how to secure the delivery of streaming media to
devices through the HTTP Live Streaming protocol. Using FairPlay Streaming (FPS) technology
content providers, encoding vendors, and delivery networks can encrypt content, securely
exchange keys, and protect playback on iOS, tvOS, and Safari on macOS.
MPEG-2 Stream Encryption Format for HTTP Live Streaming. This document describes a
sample-level encryption format for several types of elementary streams that can be carried in
MPEG-2 transport streams ISO/IEC 13818-1 and MPEG elementary audio streams.
Timed Metadata for HTTP Live Streaming. This document describes how ID3 metadata is carrie
as timed metadata in MPEG-2 Transport Streams as used by the HTTP Live Streaming protoco
Providing JavaScript Object Notation (JSON) chapters. This document describes how to provid
chapter markers and other per-chapter metadata used by iOS, tvOS, and macOS for HTTP Live
Streaming (HLS).
Carriage of ID3 Timed Metadata in the Common Media Application Format (CMAF). This
document defines how ID3 metadata are carried as timed metadata in Common Media
Application Format (CMAF) compatible fragmented MP4 streams using Event Message boxes.
Overview
HTTP Live Streaming / Links to additional specifications and videos
Article
Links to additional specifications and
videos
Review additional specifications and documents.


## Page 56

HTTP Live Streaming (HLS) authoring specification for Apple devices
Learn the requirements for live and on-demand audio and video content delivery using HLS.
Using content protection systems with HLS
Adding encryption keys to media playlists
About the Common Media Application Format with HTTP Live Streaming (HLS)
Learn the Common Media Application Format as it applies to HLS.
Enabling Low-Latency HTTP Live Streaming (HLS)
Add Low-Latency HLS to your content streams to maintain scalability.
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


## Page 57

The following WWDC videos provide additional information about HTTP Live Streaming.
Preparing and Presenting Media for Accessibility: AVFoundation automatically selects
appropriate audio and subtitle tracks in your media. Learn how media selection works and find
out how to author media with accessibility features like subtitles and closed captions. Go beyon
the basics to use AVFoundation for customizing subtitle appearance and presentation.
Content Protection for HTTP Live Streaming: FairPlay streaming provides industrial-grade
protection for audio and video content. Learn how to implement and deploy FairPlay streaming 
protect content when using HTTP Live Streaming.
Validating HTTP Live Streams: HTTP Live Streaming enables the reliable delivery of media
content over a wide variety of network conditions. Learn best practices in HLS authoring, see
how to verify your streams using the HTTP Live Streaming tools, and apply the results to impro
the performance of your streams.
What’s New in HTTP Live Streaming: HTTP Live Streaming offers a reliable media playback
experiences over a wide variety of network conditions. Join us to learn how to deliver offline
playback using the same media assets you already host for online playback. See new additions
to the HLS protocol, such as support for fragmented MP4 and in-playlist metadata.
HLS Authoring Update: HTTP Live Streaming (HLS) reliably delivers video to audiences around
the world. Key to this reliability is a comprehensive set of tools to help you author, deliver, and
validate the HLS streams you create. See what’s new in these tools, learn the latest authoring
recommendations, and how they apply to advances in HLS such as support for HEVC and IMSC
Error Handling Best Practices for HTTP Live Streaming: HTTP Live Streaming (HLS) reliably
delivers media content across a variety of network and bandwidth conditions. However, there a
many factors that can impact stream delivery, such as server or encoder failures, caching issue
or network dropouts. Learn the best-practice behaviors that your servers should adopt to
Overview
HTTP Live Streaming / Videos about HLS
Article
Videos about HLS
Review informational videos about HTTP Live Streaming.


## Page 58

maximize reliability, and gain a practical understanding of the errors your app may encounter a
how to handle them.
Advances in HTTP Live Streaming: HTTP Live Streaming allows you to stream live and on-
demand content to global audiences. Learn about great new features and enhancements to
HTTP Live Streaming. Highlights include support for HEVC, playlist metavariables, IMSC1
subtitles, and synchronized playback of multiple streams. Discover how to simplify your FairPla
key handling with the new AVContentKeySession API, and take advantage of enhancements to
offline HLS playback.
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
Providing metadata for xHE-AAC video soundtracks
Ensure volume normalization by including metadata for loudness and dynamic range control
Adjusting anchor loudness
Adjust anchor loudness when measurements of speech-gated loudness for a full mix may be
inaccurate, such as when speech activity is low.
Providing JavaScript Object Notation (JSON) chapters
Prepare JSON chapters for HTTP Live Streaming.
See Also
Specifications and other documents


## Page 59

Soundtracks that use xHE-AAC (Extended High-Efficiency Advanced Audio Codec) encoding
include MPEG-D DRC metadata for loudness and dynamic range control (DRC). When you create
video soundtracks with xHE-AAC, provide at least the following metadata to ensure consistent
results across different services. For playback, set up the MPEG-D DRC tool at the decoder by
following the guidelines below.
Note
Refer to ISO/IEC 23003-4 for additional information about these metadata specifications.
The loudness and DRC metadata that you include in video content needs to fulfill the MPEG-D DR
requirements for the Basic DRC Metadata Profile, and always include the following values:
Loudness Metadata
loudness info fields
value
Include a methodValue for methodDefinition ==
“Anchor Loudness” and measurementSystem ==
“ITU-R BS.1770”
Measure anchor loudness using
speech-gating or estimate when
speech activity is low.
Overview
Configure metadata for content generation
HTTP Live Streaming / Providing metadata for xHE-AAC video soundtracks
Article
Providing metadata for xHE-AAC video
soundtracks
Ensure volume normalization by including metadata for loudness and dynamic
range control.


## Page 60

loudness info fields
value
bs_true_peak_level or bs_sample_peak
_level
True peak according to ITU-R BS.1770
or sample peak level.
Measure anchor loudness of the dialog stem using the ITU-R BS.1770 standard because method
Value must reflect the actual anchor loudness of the content. Apply speech-gating to the full mi
to obtain the anchor loudness value when only the full mix is available for measurement.
Anchor loudness can be inaccurate when the speech detector can’t find much speech in the full
mix. Monitor this situation by computing the speech activity, which is the duration of detected
speech divided by the duration of the content. When speech activity is low, ignore this
measurement because it can be inaccurate. Instead, derive the anchor loudness value from the
program loudness value and other applicable measurements to model the value from statistics of
variety of content. See Adjusting anchor loudness for additional information.
DRC Metadata
drcSetEffect of the
required DRC
metadata
Required minimum level that
supports playback with mini‐
mal peak limiter engagement
(LKFS)
Position of bit in drcSetEffect
field of drcInstructions, which
must have a value of 1
Late Night
-24
1
Noisy Environment
-16
2
Limited Playback
Range
-16
3
General
Compression
-24
6
Match as close as possible the output anchor loudness of the DRC-processed versions with the
anchor loudness of the unprocessed output.
The DRC for General Compression can have several instances to accommodate various targe
loudness values, which provides just enough compression to reach the target without engaging a
limiter. If no compression is necessary or desired for specific loudness targets, include a
corresponding DRC for General Compression that doesn’t have a compression effect.


## Page 61

Note
Refer to ISO/IEC 23003-4:2020 Table 12 for additional information about these metadata
specifications.
Configure the MPEG-D DRC decoder for playback according to the specifications below. The
configuration occurs completely or partially at the system level and those settings don’t appear a
the API level.
Loudness Metadata
Set up the MPEG-D DRC decoder to assign the highest priority to the following loudness
metadata:****
Metadata field
Value (highest priority)
methodDefinition
Anchor Loudness
measurementSystem
Expert/Panel
The methodDefinition field defaults to Program Loudness, if present, if you don’t specify
Anchor Loudness. This configuration deviates from the default configuration specified in
ISO/IEC 23003-4, which selects Program Loudness and ITU-R BS.1770 with highest priority
However, the standard specifies an interface to customize the configuration, including the loudne
metadata priority.
Some previously deployed implementations may use the default ISO/IEC 23003-4 configuration
and may not support the interface for customization. These systems may select loudness metada
with a methodDefinition value of Program Loudness, if present, in addition to other
loudness metadata. This can result in a deviation of the output loudness of the same content from
systems that select Anchor Loudness, if present, in addition to Program Loudness.
Note
Refer to ISO/IEC 23003-4:2020 Table 51 for information about the priority order for
measurementSystem for the Expert/Panel value.
The following table (ANSI/CTA-2075) provides recommended target loudness value settings of th
DRC tool to control the integrated loudness at the output:
Configure metadata for playback


## Page 62

Transducer SPL range
Maximum SPL (dBA)
Target loudness (LKFS)
small
below 75
-16
medium
between 70 and 90
-24
large
above 85
-31
unknown
NA
-24
To achieve sufficient output SPL, ensure the target loudness value depends on the SPL range of
the active transducer, which has three categories (small, medium, large). Choose the SPL ran
category by measuring the maximum SPL of the transducer at the anticipated listener location
using pink noise at -24 LKFS. Assign the category according to the middle column as ANSI/CTA-
2075 Annex G describes. For example, micro loudspeakers in portable devices typically fall into th
small SPL range category.
DRC Metadata
The following table specifies the appropriate DRC requests for different listening environments an
transducer SPL ranges (ANSI/CTA-2075):
Environment
Transducer SPL range
DRC request
ideal, unknown
small
limited
ideal, unknown
large, medium, unknown
general
noisy
all
noisy
Note
An ideal environment is a quiet listening environment.
Request general for DRC when you want loudness normalization unless a different DRC request
is applicable for the playback scenario. This applies appropriate compression to reach the target
loudness, such as when applying gain during normalization.
User preferences can override DRC settings. The following table provides examples of two
preferences and the conditions, transducer SPL range, and environment under which to apply
these preferences:


## Page 63

User preference
Environment
Transducer SPL range
DRC request
max DRC
all
all
noisy
late night
ideal, unknown
large, medium, unknown
late night
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
Adjusting anchor loudness
Adjust anchor loudness when measurements of speech-gated loudness for a full mix may be
inaccurate, such as when speech activity is low.
Providing JavaScript Object Notation (JSON) chapters
Prepare JSON chapters for HTTP Live Streaming.
See Also
Specifications and other documents


## Page 64

Apply the adjustment method below to improve the consistency of your anchor loudness, or
standard, value for low speech activity. The method’s basis is a statistical model of anchor
loudness for a large variety of long-form content that takes advantage of the correlation with othe
loudness-based measurements. The method uses the following measurements:
Speech-gated loudness
Speech activity that derives from a speech detector
Program loudness (ITU-R BS.1770-4)
Top value of LRA (loudness range) (EBU Tech 3342)
For low speech activity, the model ignores the speech-gated loudness value and computes ancho
loudness from the other three measurements. A gradual transition from the model to the measure
speech-gated loudness occurs as the speech activity increases.
The following examples and source code show how to calculate anchor loudness using program
loudness and speech-gated loudness.
The following figure shows a visual representation of anchor loudness for an example with a
speech-gated loudness of -27 LKFS (loudness, K-weighted, relative to full scale) and different
program loudness values.
Overview
Determine anchor loudness using different program
loudness values
HTTP Live Streaming / Adjusting anchor loudness
Article
Adjusting anchor loudness
Adjust anchor loudness when measurements of speech-gated loudness for a full
mix may be inaccurate, such as when speech activity is low.


## Page 65

The lines on the left correspond to the calculated anchor loudness as a result of the adjustment
method. The labels for each line indicate the program loudness values. For low speech activity,
anchor loudness increases with program loudness. For increasing speech activity, there’s a
transition to the speech-gated loudness measurement.
The next figure displays anchor loudness for an example with speech-gated loudness of -27 LKFS
and program loudness of -24 LKFS. The difference between top value of LRA and program
loudness characterizes how dynamic the content is. The lines on the left correspond to the
calculated anchor loudness as a result of the adjustment method. The labels for each line indicate
the value of the loudness difference in loudness units (LU). The loudness difference correlates wi
anchor loudness, and the modeling results in lower anchor loudness for more dynamic content at
low speech activity. As the speech activity increases, anchor loudness transitions to the measure
speech-gated loudness.


## Page 66

The following source code includes a function to compute the adjusted anchor loudness value fro
the parameters in the preceding examples, which is applicable to long-form content.


## Page 67



## Page 68

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
See Also
Specifications and other documents


## Page 69

Ensure volume normalization by including metadata for loudness and dynamic range control
Providing JavaScript Object Notation (JSON) chapters
Prepare JSON chapters for HTTP Live Streaming.


## Page 70

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


## Page 71

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


## Page 72

Here’s the general layout of the JSON chapter data format. The JavaScript comments aren’t legal
JSON and are for illustrative purposes.


## Page 73

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


## Page 74

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


## Page 75



## Page 76

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


## Page 77

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


