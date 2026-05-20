# Common.pdf

## Page 1

Loading media data asynchronously
Build responsive apps by using language-level concurrency features to efficiently load media
data.
class AVAsset
An object that models timed audiovisual media.
class AVURLAsset
An asset that represents media at a local or remote URL.
class AVAssetTrack
An object that models a track of media that an asset contains.
class AVAssetTrackSegment
An object that represents a time range segment of an asset track.
class AVAssetTrackGroup
A group of related tracks in an asset.
Topics
Essentials
Assets
Metadata
AVFoundation / Media assets
API Collection
Media assets
Load media assets from files and streams to inspect their attributes, tracks, and
embedded metadata.


## Page 2

Retrieving media metadata
Load descriptive metadata for media assets and their tracks.
class AVMetadataItem
A metadata item for an audiovisual asset or one of its tracks.
class AVMutableMetadataItem
A mutable metadata item for an audiovisual asset or for one of its tracks.
struct AVMetadataIdentifier
A structure that defines identifiers for metadata formats.
struct AVMetadataKey
A structure that defines a metadata key.
struct AVMetadataKeySpace
A structure that defines a metadata key space.
struct AVMetadataExtraAttributeKey
A structure that defines keys for extra metadata attributes.
struct AVMetadataFormat
A structure that defines metadata formats.
class AVMetadataItemFilter
An object that filters selected information from a metadata item.
protocol AVAsynchronousKeyValueLoading
A protocol that defines the interface to load media data asynchronously.
class AVAsyncProperty
An asynchronous property that constrains its type and value.
class AVPartialAsyncProperty
An asynchronous property that constrains its type.
class AVAnyAsyncProperty
A base class for asynchronous properties.
Property loading
Fragmented assets


## Page 3

class AVFragmentedAsset
An asset with a duration that the system can extend without modifying its existing media dat
class AVFragmentedAssetTrack
An object that provides the track-level interface to inspect a fragmented asset’s media track
class AVFragmentedAssetMinder
An object that periodically checks whether the system adds new fragments to a fragmented
asset.
protocol AVFragmentMinding
A protocol that defines whether an asset supports fragment minding.
Media reading and writing
Read images from video, export to alternative formats, and perform sample-level reading an
writing of media data.
Media types and utilities
Identify the types of content and file formats that AVFoundation supports.
Video settings
Configure video processing settings using standard key and value constants.
Audio settings
Configure audio processing settings using standard key and value constants.
See Also
Common


## Page 4

Exporting video to alternative formats
Convert an existing movie file to a different format.
class AVAssetExportSession
An object that exports assets in a format that you specify using an export preset.
Creating images from a video asset
Display images for specific times within the media timeline by generating images from a
video’s frames.
class AVAssetImageGenerator
An object that generates images from a video asset.
Reading multiview 3D video files
Render single images for the left eye and right eye from a multiview High Efficiency Video
Coding format file by reading individual video frames.
class AVAssetReader
Topics
Media export
Image generation
Media reading
AVFoundation / Media reading and writing
API Collection
Media reading and writing
Read images from video, export to alternative formats, and perform sample-level
reading and writing of media data.


## Page 5

An object that reads media data from an asset.
class AVAssetReaderOutput
An abstract class that defines the interface to read media samples from an asset reader.
class AVAssetReaderTrackOutput
An object that reads media data from a single track of an asset.
class AVAssetReaderAudioMixOutput
An object that reads audio samples that result from mixing audio from one or more tracks.
class AVAssetReaderVideoCompositionOutput
An object that reads composited video frames from one or more tracks of an asset.
class AVAssetReaderSampleReferenceOutput
An object that reads sample references from an asset track.
class AVAssetReaderOutputMetadataAdaptor
An object that creates timed metadata group objects for an asset track.
Converting projected video to Apple Projected Media Profile
Convert content with equirectangular or half-equirectangular projection to APMP.
Converting side-by-side 3D video to multiview HEVC and spatial video
Create video content for visionOS by converting an existing 3D HEVC file to a multiview HEV
format, optionally adding spatial metadata to create a spatial video.
Adding a display mask rectangle metadata track to a movie file
Show a specific area of a video by using timed display mask rectangle metadata.
Writing fragmented MPEG-4 files for HTTP Live Streaming
Create an HTTP Live Streaming presentation by turning a movie file into a sequence of
fragmented MPEG-4 files.
Creating spatial photos and videos with spatial metadata
Add spatial metadata to stereo photos and videos to create spatial media for viewing on App
Vision Pro.
Tagging media with video color information
Inspect and set video color space information when writing and transcoding media.
Media writing


## Page 6

Evaluating an app’s video color
Check color reproduction for a video in your app by using test patterns, video test equipmen
and light-measurement instruments.
class AVOutputSettingsAssistant
An object that builds audio and video output settings dictionaries.
class AVAssetWriter
An object that writes media data to a container file.
class AVAssetWriterInput
An object that appends media samples to a track in an asset writer’s output file.
class AVAssetWriterInputPixelBufferAdaptor
An object that appends video samples to an asset writer input.
class AVAssetWriterInputTaggedPixelBufferGroupAdaptor
An object that appends tagged buffer groups to an asset writer input.
class AVAssetWriterInputMetadataAdaptor
An object that appends timed metadata groups to an asset writer input.
class AVAssetWriterInputGroup
A group of inputs with tracks that are mutually exclusive to each other for playback or
processing.
Caption authoring
Create captions and subtitles in industry-standard formats.
Media assets
Load media assets from files and streams to inspect their attributes, tracks, and embedded
metadata.
Captions
See Also
Common


## Page 7

Media types and utilities
Identify the types of content and file formats that AVFoundation supports.
Video settings
Configure video processing settings using standard key and value constants.
Audio settings
Configure audio processing settings using standard key and value constants.


## Page 8

struct AVMediaType
An identifier for various media types.
struct AVMediaCharacteristic
A structure that defines media data characteristics.
struct AVFileType
The uniform type identifiers for various file formats.
struct AVFileTypeProfile
File type profiles for streaming formats.
func AVMakeRect(aspectRatio: CGSize, insideRect: CGRect) -> CGRect
Returns a scaled rectangle that maintains the specified aspect ratio within a bounding
rectangle.
Topics
Media types
File types
Utilities
See Also
AVFoundation / Media types and utilities
API Collection
Media types and utilities
Identify the types of content and file formats that AVFoundation supports.


## Page 9

Media assets
Load media assets from files and streams to inspect their attributes, tracks, and embedded
metadata.
Media reading and writing
Read images from video, export to alternative formats, and perform sample-level reading an
writing of media data.
Video settings
Configure video processing settings using standard key and value constants.
Audio settings
Configure audio processing settings using standard key and value constants.
Common


## Page 10

let AVVideoCleanApertureKey: String
A key that defines the region within the video dimension displayed during playback.
let AVVideoCleanApertureWidthKey: String
A key to access the width of video that’s free from transition artifacts caused by signal
encoding.
let AVVideoCleanApertureHeightKey: String
A key to access the height of video that’s free from transition artifacts caused by signal
encoding.
let AVVideoCleanApertureVerticalOffsetKey: String
A key to access the vertical offset of video that’s free from transition artifacts caused by
signal encoding.
let AVVideoCleanApertureHorizontalOffsetKey: String
A key to access the horizontal offset of video that’s free from transition artifacts caused by
signal encoding.
let AVVideoCodecKey: String
A key to access the name of the codec for compressing video.
Topics
Clean aperture
Video codecs
AVFoundation / Video settings
API Collection
Video settings
Configure video processing settings using standard key and value constants.


## Page 11

struct AVVideoCodecType
A set of constants that describe the codecs the system supports for video capture.
Keys specify video properties, and corresponding keys and values specify the color primary,
transfer function, and Y’CbCr matrix.
Setting color properties for a specific resolution
Choose the proper color property keys for the desired color range.
let AVVideoAllowWideColorKey: String
The key for a dictionary that indicates whether the client can process wide color.
let AVVideoColorPrimariesKey: String
The key to identify color primaries in a color properties dictionary.
let AVVideoColorPrimaries_EBU_3213: String
The color primary is in the EBU Tech. 3213 color space.
let AVVideoColorPrimaries_ITU_R_2020: String
The color primary is in the ITU_R BT.2020 color space for ultra high definition television.
let AVVideoColorPrimaries_ITU_R_709_2: String
The color primary is in the ITU_R BT.709 color space.
let AVVideoColorPrimaries_P3_D65: String
The color primary uses the DCI-P3 D65 color space.
let AVVideoColorPrimaries_SMPTE_C: String
The color primary uses the SMPTE C color space.
let AVVideoColorPropertiesKey: String
The key for a dictionary that contains properties specifying video color.
let AVVideoTransferFunctionKey: String
The key to identify the transfer function in a color properties dictionary.
let AVVideoTransferFunction_IEC_sRGB: String
The transfer function for the IEC sRGB color space.
let AVVideoTransferFunction_ITU_R_2100_HLG: String
The transfer function for the ITU_R BT.2100 color space.
Color properties


## Page 12

let AVVideoTransferFunction_ITU_R_709_2: String
The transfer function for the ITU_R BT.709 color space.
let AVVideoTransferFunction_Linear: String
The transfer function for the linear color space.
let AVVideoTransferFunction_SMPTE_240M_1995: String
The transfer function for the SMPTE 240M color space.
let AVVideoTransferFunction_SMPTE_ST_2084_PQ: String
The transfer function for the SMPTE 2084 color space.
let AVVideoYCbCrMatrixKey: String
The key to identify the Y’CbCr matrix in a color properties dictionary.
let AVVideoYCbCrMatrix_ITU_R_2020: String
The Y’CbCr color matrix for ITU-R BT.2020 conversion.
let AVVideoYCbCrMatrix_ITU_R_601_4: String
The Y’CbCr color matrix for ITU-R BT.601 conversion.
let AVVideoYCbCrMatrix_ITU_R_709_2: String
The Y’CbCr color matrix for ITU-R BT.709 conversion.
let AVVideoYCbCrMatrix_SMPTE_240M_1995: String
The Y’CbCr color matrix for SMPTE 240M conversion.
let AVVideoCompressionPropertiesKey: String
A key to access the dictionary of compression properties for a video asset.
let AVVideoDecompressionPropertiesKey: String
The key that indicates the video decompression properties to pass to the video decoder.
let AVVideoAverageBitRateKey: String
A key to access the average bit rate—as bits per second—used in compressing video.
let AVVideoQualityKey: String
A key to set the JPEG compression quality of the video.
let AVVideoMaxKeyFrameIntervalKey: String
A key to access the maximum interval between keyframes.
Compression


## Page 13

let AVVideoMaxKeyFrameIntervalDurationKey: String
A key to access the maximum interval duration between keyframes.
let AVVideoAllowFrameReorderingKey: String
A key to access permission to reorder frames.
let AVVideoAppleProRAWBitDepthKey: String
A key to access the Apple ProRAW bit depth.
let AVVideoH264EntropyModeKey: String
The entropy encoding mode for H.264 compression.
let AVVideoH264EntropyModeCABAC: String
The encoder uses Context-based Adaptive Binary Arithmetic Coding.
let AVVideoH264EntropyModeCAVLC: String
The encoder uses Context-based Adaptive Variable Length Coding.
let AVStreamingKeyDeliveryContentKeyType: String
A URL for a content key.
let AVStreamingKeyDeliveryPersistentContentKeyType: String
A URL for a persistent content key.
let AVVideoExpectedSourceFrameRateKey: String
The expected source frame rate.
let AVVideoAverageNonDroppableFrameRateKey: String
The desired average number of non-droppable frames to be encoded for each second of
video.
let AVVideoWidthKey: String
A key to access the width of the video in pixels.
Entropy mode
FairPlay
Frame rate
Geometry


## Page 14

let AVVideoHeightKey: String
A key to access the height of the video in pixels.
let AVVideoPixelAspectRatioKey: String
A key to access the video’s pixel aspect ratio.
let AVVideoPixelAspectRatioVerticalSpacingKey: String
A key to access the pixel aspect ratio vertical spacing.
let AVVideoPixelAspectRatioHorizontalSpacingKey: String
A key to access the pixel aspect ratio horizontal spacing.
let AVVideoProfileLevelKey: String
A key to access the video profile.
let AVVideoProfileLevelH264High40: String
A high-level 4.0 profile.
let AVVideoProfileLevelH264High41: String
A high-level 4.1 profile.
let AVVideoProfileLevelH264Main30: String
A main-level 3.0 profile.
let AVVideoProfileLevelH264Main31: String
A main-level 3.1 profile.
let AVVideoProfileLevelH264Main32: String
A main-level 3.2 profile.
let AVVideoProfileLevelH264Main41: String
A main-level 4.1 profile.
let AVVideoProfileLevelH264Baseline30: String
A baseline-level 3.0 profile.
let AVVideoProfileLevelH264Baseline31: String
A baseline-level 3.1 profile.
let AVVideoProfileLevelH264Baseline41: String
A baseline-level 4.1 profile.
Profile level


## Page 15

let AVVideoProfileLevelH264HighAutoLevel: String
A high profile auto level profile.
let AVVideoProfileLevelH264MainAutoLevel: String
A main profile auto level profile.
let AVVideoProfileLevelH264BaselineAutoLevel: String
A baseline auto level profile.
let AVVideoScalingModeFit: String
The string identifier for scaling a video to fit the surrounding view’s dimensions.
let AVVideoScalingModeKey: String
A key to retrieve the video scaling mode from a dictionary.
let AVVideoScalingModeResize: String
The string identifier for resizing a video to fit the surrounding view’s dimensions.
let AVVideoScalingModeResizeAspect: String
The string identifier for resizing a video to its surrounding view’s shorter dimension while
preserving its aspect ratio.
let AVVideoScalingModeResizeAspectFill: String
The string identifier for resizing a video to fit the surrounding view’s longer dimension while
preserving aspect ratio.
let AVVideoEncoderSpecificationKey: String
The video encoder specification includes options for choosing a specific video encoder.
Media assets
Scaling mode
VideoToolbox options
See Also
Common


## Page 16

Load media assets from files and streams to inspect their attributes, tracks, and embedded
metadata.
Media reading and writing
Read images from video, export to alternative formats, and perform sample-level reading an
writing of media data.
Media types and utilities
Identify the types of content and file formats that AVFoundation supports.
Audio settings
Configure audio processing settings using standard key and value constants.


## Page 17

class AVAudioFormat
An object that describes the representation of an audio format.
class AVAudioChannelLayout
An object that describes the roles of a set of audio channels.
let AVChannelLayoutKey: String
Linear PCM format settings
The audio settings that apply to linear PCM audio formats.
Format settings
The audio settings that apply to all audio formats that the audio player and recorder classes
support.
Sample rate conversion settings
The constants that define sample rate converter audio quality settings.
enum AVAudioQuality
The values that specify the sample rate audio quality for encoding and conversion.
Encoder settings
The constants that define the audio encoder settings for the audio recorder class.
Topics
Formats
Settings
AVFoundation / Audio settings
Audio settings
Configure audio processing settings using standard key and value constants.


## Page 18

Time pitch algorithm settings
The constants that define the values for the time pitch algorithms.
Encoder bit rate strategy values
The constants that represent the possible bit rate strategy values.
var AVAUDIOENGINE_HAVE_AUAUDIOUNIT: Int32
Media assets
Load media assets from files and streams to inspect their attributes, tracks, and embedded
metadata.
Media reading and writing
Read images from video, export to alternative formats, and perform sample-level reading an
writing of media data.
Media types and utilities
Identify the types of content and file formats that AVFoundation supports.
Video settings
Configure video processing settings using standard key and value constants.
Constants
See Also
Common


