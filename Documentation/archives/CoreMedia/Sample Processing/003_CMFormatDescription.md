# 003_CMFormatDescription.pdf

## Page 1

CMFormatDescriptions are immutable Core Foundation objects that describe media data of
various types, including audio, video, and muxed media data. There are two types of API: media-
type-agnostic APIs (supported by all CMFormatDescriptions) and media-type-specific APIs. The
media-type-agnostic APIs are prefixed with CMFormatDescription, and the media-type-
specific APIs are prefixed with CMAudioFormatDescription, CMVideoFormatDescription
and so on.
func CMFormatDescriptionCreate(allocator: CFAllocator?, mediaType:
CMMediaType, mediaSubType: FourCharCode, extensions: CFDictionary?,
formatDescriptionOut: UnsafeMutablePointer<CMFormatDescription?>) ->
OSStatus
Creates a format description for general use.
func CMFormatDescriptionEqual(CMFormatDescription?, otherFormat
Description: CMFormatDescription?) -> Bool
Returns a Boolean value that indicates whether two format descriptions are equal.
Overview
Topics
Creating Format Descriptions
Comparing Format Descriptions
Core Media / CMFormatDescription
API Collection
CMFormatDescription
A media format descriptor that describes the samples in a sample buffer.


## Page 2

func CMFormatDescriptionEqualIgnoringExtensionKeys(CMFormatDescription?
otherFormatDescription: CMFormatDescription?, extensionKeysToIgnore:
CFTypeRef?, sampleDescriptionExtensionAtomKeysToIgnore: CFTypeRef?) ->
Bool
Returns a Boolean value that indicates whether two format descriptions are equal, ignoring
differences in the extension keys you specify.
func CMFormatDescriptionGetMediaType(CMFormatDescription) -> CMMediaTyp
Returns the media type of a format description.
func CMFormatDescriptionGetMediaSubType(CMFormatDescription) -> FourCha
Code
Returns the media subtype of a format description.
func CMFormatDescriptionGetExtension(CMFormatDescription, extensionKey:
CFString) -> CFPropertyList?
Returns an extension from the format description by using an extension key.
func CMFormatDescriptionGetExtensions(CMFormatDescription) ->
CFDictionary?
Returns all of the extensions for a format description.
func CMFormatDescriptionGetTypeID() -> CFTypeID
Returns the Core Foundation type identifier that identifies format description objects.
struct CMSoundDescriptionFlavor
Types that represent sound format descriptions.
func CMAudioFormatDescriptionCreateSummary(allocator: CFAllocator?,
formatDescriptionArray: CFArray, flags: UInt32, formatDescriptionOut:
UnsafeMutablePointer<CMAudioFormatDescription?>) -> OSStatus
Creates a summary audio format description from an array of descriptions.
func CMAudioFormatDescriptionCreate(allocator: CFAllocator?, asbd:
UnsafePointer<AudioStreamBasicDescription>, layoutSize: Int, layout:
UnsafePointer<AudioChannelLayout>?, magicCookieSize: Int, magicCookie:
UnsafeRawPointer?, extensions: CFDictionary?, formatDescriptionOut:
UnsafeMutablePointer<CMAudioFormatDescription?>) -> OSStatus
Inspecting Format Descriptions
Working with Audio Descriptions


## Page 3

Creates a format description for an audio media stream.
func CMAudioFormatDescriptionEqual(CMAudioFormatDescription, otherForma
Description: CMAudioFormatDescription, equalityMask: CMAudioFormat
DescriptionMask, equalityMaskOut: UnsafeMutablePointer<CMAudioFormat
DescriptionMask>?) -> Bool
Returns a Boolean value that indicates whether the two audio format descriptions are equal.
func CMAudioFormatDescriptionGetChannelLayout(CMAudioFormatDescription,
sizeOut: UnsafeMutablePointer<Int>?) -> UnsafePointer<AudioChannelLayou
>?
Returns a read-only pointer to, and the size of, the audio channel layout inside an audio form
description.
func CMAudioFormatDescriptionGetFormatList(CMAudioFormatDescription,
sizeOut: UnsafeMutablePointer<Int>?) -> UnsafePointer<AudioFormatList
Item>?
Returns a read-only pointer to, and size of, the array of audio format list item structures in an
audio format description.
func CMAudioFormatDescriptionGetMagicCookie(CMAudioFormatDescription,
sizeOut: UnsafeMutablePointer<Int>?) -> UnsafeRawPointer?
Returns a read-only pointer to, and size of, the magic cookie in an audio format description.
func CMAudioFormatDescriptionGetMostCompatibleFormat(CMAudioFormat
Description) -> UnsafePointer<AudioFormatListItem>?
Returns a read-only pointer to the appropriate audio format list item in an audio format
description.
func CMAudioFormatDescriptionGetRichestDecodableFormat(CMAudioFormat
Description) -> UnsafePointer<AudioFormatListItem>?
Returns a read-only pointer to the appropriate audio format list item in an audio format
description.
func CMAudioFormatDescriptionGetStreamBasicDescription(CMAudioFormat
Description) -> UnsafePointer<AudioStreamBasicDescription>?
Returns a read-only pointer to the audio stream description in an audio format description.
func CMDoesBigEndianSoundDescriptionRequireLegacyCBRSampleTableLayout(
CMBlockBuffer, flavor: CMSoundDescriptionFlavor?) -> Bool
Returns a Boolean value that indicates whether the sample tables need to use the legacy
constant bit-rate encoding layout.


## Page 4

func CMSwapBigEndianSoundDescriptionToHost(UnsafeMutablePointer<UInt8>,
Int) -> OSStatus
Converts a sound description data structure from big-endian to host-endian, in place.
func CMSwapHostEndianSoundDescriptionToBig(UnsafeMutablePointer<UInt8>,
Int) -> OSStatus
Converts a sound description data structure from host-endian to big-endian, in place.
func CMAudioFormatDescriptionCreateFromBigEndianSoundDescriptionData(
allocator: CFAllocator?, bigEndianSoundDescriptionData: UnsafePointer<
UInt8>, size: Int, flavor: CMSoundDescriptionFlavor?, formatDescription
Out: UnsafeMutablePointer<CMAudioFormatDescription?>) -> OSStatus
Creates an audio format description from a big-endian sound description data structure.
func CMAudioFormatDescriptionCreateFromBigEndianSoundDescriptionBlock
Buffer(allocator: CFAllocator?, bigEndianSoundDescriptionBlockBuffer:
CMBlockBuffer, flavor: CMSoundDescriptionFlavor?, formatDescriptionOut:
UnsafeMutablePointer<CMAudioFormatDescription?>) -> OSStatus
Creates an audio format description from a big-endian sound description data structure in a
buffer.
func CMAudioFormatDescriptionCopyAsBigEndianSoundDescriptionBlockBuffer
allocator: CFAllocator?, audioFormatDescription: CMAudioFormat
Description, flavor: CMSoundDescriptionFlavor?, blockBufferOut: Unsafe
MutablePointer<CMBlockBuffer?>) -> OSStatus
Copies the contents of an audio format description to a buffer in big-endian byte ordering.
struct CMImageDescriptionFlavor
Types that represent image format descriptions.
func CMVideoFormatDescriptionCreate(allocator: CFAllocator?, codecType:
CMVideoCodecType, width: Int32, height: Int32, extensions: CFDictionary
?, formatDescriptionOut: UnsafeMutablePointer<CMVideoFormatDescription?
>) -> OSStatus
Creates a format description for a video media stream.
func CMVideoFormatDescriptionCreateForImageBuffer(allocator: CFAllocato
?, imageBuffer: CVImageBuffer, formatDescriptionOut: UnsafeMutable
Pointer<CMVideoFormatDescription?>) -> OSStatus
Creates a format description for a video media stream by using an image buffer.
Working with Video Descriptions


## Page 5

func CMVideoFormatDescriptionGetCleanAperture(CMVideoFormatDescription,
originIsAtTopLeft: Bool) -> CGRect
Returns a rectangle that defines the portion of the encoded pixel dimensions that represent
the image data that’s valid for displaying.
func CMVideoFormatDescriptionGetDimensions(CMVideoFormatDescription) ->
CMVideoDimensions
Returns the video dimensions, in encoded pixels.
func CMVideoFormatDescriptionGetExtensionKeysCommonWithImageBuffers() -
CFArray
Returns an array of keys that you use for video format description extensions, image buffer
attachments, and attributes.
func CMVideoFormatDescriptionGetPresentationDimensions(CMVideoFormat
Description, usePixelAspectRatio: Bool, useCleanAperture: Bool) ->
CGSize
Returns the dimensions after taking the pixel aspect ratio and clean aperture into account.
func CMVideoFormatDescriptionMatchesImageBuffer(CMVideoFormatDescriptio
, imageBuffer: CVImageBuffer) -> Bool
Returns a Boolean value that indicates whether a format description matches an image buffe
func CMVideoFormatDescriptionCreateFromH264ParameterSets(allocator:
CFAllocator?, parameterSetCount: Int, parameterSetPointers: Unsafe
Pointer<UnsafePointer<UInt8>>, parameterSetSizes: UnsafePointer<Int>,
nalUnitHeaderLength: Int32, formatDescriptionOut: UnsafeMutablePointer<
CMFormatDescription?>) -> OSStatus
Creates a format description for a video media stream that the parameter set describes.
func CMVideoFormatDescriptionCreateFromHEVCParameterSets(allocator:
CFAllocator?, parameterSetCount: Int, parameterSetPointers: Unsafe
Pointer<UnsafePointer<UInt8>>, parameterSetSizes: UnsafePointer<Int>,
nalUnitHeaderLength: Int32, extensions: CFDictionary?, formatDescriptio
Out: UnsafeMutablePointer<CMFormatDescription?>) -> OSStatus
Creates a format description for a video media stream using HEVC (H.265) parameter set NA
units.
func CMVideoFormatDescriptionGetH264ParameterSetAtIndex(CMFormat
Description, parameterSetIndex: Int, parameterSetPointerOut: Unsafe
MutablePointer<UnsafePointer<UInt8>?>?, parameterSetSizeOut: Unsafe
MutablePointer<Int>?, parameterSetCountOut: UnsafeMutablePointer<Int>?,
nalUnitHeaderLengthOut: UnsafeMutablePointer<Int32>?) -> OSStatus


## Page 6

Returns a parameter set that an H.264 format description contains.
func CMVideoFormatDescriptionCopyAsBigEndianImageDescriptionBlockBuffer
allocator: CFAllocator?, videoFormatDescription: CMVideoFormat
Description, stringEncoding: CFStringEncoding, flavor: CMImage
DescriptionFlavor?, blockBufferOut: UnsafeMutablePointer<CMBlockBuffer?
>) -> OSStatus
Copies the contents of a video format description to a buffer in big-endian byte ordering.
func CMVideoFormatDescriptionCreateFromBigEndianImageDescriptionBlock
Buffer(allocator: CFAllocator?, bigEndianImageDescriptionBlockBuffer:
CMBlockBuffer, stringEncoding: CFStringEncoding, flavor: CMImage
DescriptionFlavor?, formatDescriptionOut: UnsafeMutablePointer<CMVideo
FormatDescription?>) -> OSStatus
Creates a video format description from a big-endian image description inside a buffer.
func CMVideoFormatDescriptionCreateFromBigEndianImageDescriptionData(
allocator: CFAllocator?, bigEndianImageDescriptionData: UnsafePointer<
UInt8>, size: Int, stringEncoding: CFStringEncoding, flavor: CMImage
DescriptionFlavor?, formatDescriptionOut: UnsafeMutablePointer<CMVideo
FormatDescription?>) -> OSStatus
Creates a video format description from a big-endian image description structure.
func CMSwapBigEndianImageDescriptionToHost(UnsafeMutablePointer<UInt8>,
Int) -> OSStatus
Converts an image description data structure from big-endian to host-endian, in place.
func CMSwapHostEndianImageDescriptionToBig(UnsafeMutablePointer<UInt8>,
Int) -> OSStatus
Converts an image description data structure from host-endian to big-endian, in place.
func CMMuxedFormatDescriptionCreate(allocator: CFAllocator?, muxType:
CMMuxedStreamType, extensions: CFDictionary?, formatDescriptionOut:
UnsafeMutablePointer<CMMuxedFormatDescription?>) -> OSStatus
Creates a format description for a muxed media stream.
struct CMMetadataDescriptionFlavor
Types that represent metadata format descriptions.
Working with Muxed Descriptions
Working with Metadata Descriptions


## Page 7

func CMMetadataFormatDescriptionCreateWithKeys(allocator: CFAllocator?,
metadataType: CMMetadataFormatType, keys: CFArray?, formatDescriptionOu
: UnsafeMutablePointer<CMMetadataFormatDescription?>) -> OSStatus
Creates a metadata format description with the metadata keys you specify.
func CMMetadataFormatDescriptionGetKeyWithLocalID(CMMetadataFormat
Description, localKeyID: OSType) -> CFDictionary?
Returns the key for the local identifier.
func CMMetadataFormatDescriptionCopyAsBigEndianMetadataDescriptionBlock
Buffer(allocator: CFAllocator?, metadataFormatDescription: CMMetadata
FormatDescription, flavor: CMMetadataDescriptionFlavor?, blockBufferOut
UnsafeMutablePointer<CMBlockBuffer?>) -> OSStatus
Copies the contents of a metadata format description to a buffer in big-endian byte order.
func CMMetadataFormatDescriptionCreateByMergingMetadataFormat
Descriptions(allocator: CFAllocator?, sourceDescription: CMMetadata
FormatDescription, otherSourceDescription: CMMetadataFormatDescription,
formatDescriptionOut: UnsafeMutablePointer<CMMetadataFormatDescription?
>) -> OSStatus
Creates a metadata format description object by merging with another description.
func CMMetadataFormatDescriptionCreateFromBigEndianMetadataDescription
BlockBuffer(allocator: CFAllocator?, bigEndianMetadataDescriptionBlock
Buffer: CMBlockBuffer, flavor: CMMetadataDescriptionFlavor?, format
DescriptionOut: UnsafeMutablePointer<CMMetadataFormatDescription?>) ->
OSStatus
Creates a metadata format description from a big-endian metadata description structure
inside a buffer.
func CMMetadataFormatDescriptionCreateFromBigEndianMetadataDescription
Data(allocator: CFAllocator?, bigEndianMetadataDescriptionData: Unsafe
Pointer<UInt8>, size: Int, flavor: CMMetadataDescriptionFlavor?, format
DescriptionOut: UnsafeMutablePointer<CMMetadataFormatDescription?>) ->
OSStatus
Creates a metadata format description from a big-endian metadata description structure.
func CMMetadataFormatDescriptionCreateWithMetadataFormatDescriptionAnd
MetadataSpecifications(allocator: CFAllocator?, sourceDescription:
CMMetadataFormatDescription, metadataSpecifications: CFArray, format
DescriptionOut: UnsafeMutablePointer<CMMetadataFormatDescription?>) ->
OSStatus


## Page 8

Creates a metadata format description by extending an existing description with the values
you specify.
func CMMetadataFormatDescriptionCreateWithMetadataSpecifications(
allocator: CFAllocator?, metadataType: CMMetadataFormatType, metadata
Specifications: CFArray, formatDescriptionOut: UnsafeMutablePointer<
CMMetadataFormatDescription?>) -> OSStatus
Creates a metadata format description with the specifications you specify.
func CMSwapBigEndianMetadataDescriptionToHost(UnsafeMutablePointer<UInt
>, Int) -> OSStatus
Converts a metadata description data structure from big-endian to host-endian, in place.
func CMSwapHostEndianMetadataDescriptionToBig(UnsafeMutablePointer<UInt
>, Int) -> OSStatus
Converts a metadata description data structure from host-endian to big-endian, in place.
func CMMetadataFormatDescriptionGetIdentifiers(CMMetadataFormat
Description) -> CFArray?
Returns an array of metadata identifiers from a metadata format description.
struct CMTextDescriptionFlavor
Types that represent text format descriptions.
func CMTextFormatDescriptionGetDefaultStyle(CMFormatDescription, local
FontIDOut: UnsafeMutablePointer<UInt16>?, boldOut: UnsafeMutablePointer
DarwinBoolean>?, italicOut: UnsafeMutablePointer<DarwinBoolean>?,
underlineOut: UnsafeMutablePointer<DarwinBoolean>?, fontSizeOut: Unsafe
MutablePointer<CGFloat>?, colorComponentsOut: UnsafeMutablePointer<
CGFloat>?) -> OSStatus
Returns the default text style.
func CMTextFormatDescriptionGetDefaultTextBox(CMFormatDescription,
originIsAtTopLeft: Bool, heightOfTextTrack: CGFloat, defaultTextBoxOut:
UnsafeMutablePointer<CGRect>) -> OSStatus
Returns the default text box.
func CMTextFormatDescriptionGetDisplayFlags(CMFormatDescription, displa
FlagsOut: UnsafeMutablePointer<CMTextDisplayFlags>) -> OSStatus
Returns the display flags.
Working with Text Descriptions


## Page 9

func CMTextFormatDescriptionGetFontName(CMFormatDescription, localFontI
: UInt16, fontNameOut: AutoreleasingUnsafeMutablePointer<CFString?>) ->
OSStatus
Returns a font name for a local font identifier.
func CMTextFormatDescriptionGetJustification(CMFormatDescription,
horizontalOut: UnsafeMutablePointer<CMTextJustificationValue>?, vertica
Out: UnsafeMutablePointer<CMTextJustificationValue>?) -> OSStatus
Returns the horizontal and vertical justification.
func CMTextFormatDescriptionCopyAsBigEndianTextDescriptionBlockBuffer(
allocator: CFAllocator?, textFormatDescription: CMTextFormatDescription
flavor: CMTextDescriptionFlavor?, blockBufferOut: UnsafeMutablePointer<
CMBlockBuffer?>) -> OSStatus
Copies the contents of a text format description to a buffer in big-endian byte order.
func CMTextFormatDescriptionCreateFromBigEndianTextDescriptionBlock
Buffer(allocator: CFAllocator?, bigEndianTextDescriptionBlockBuffer:
CMBlockBuffer, flavor: CMTextDescriptionFlavor?, mediaType: CMMediaType
formatDescriptionOut: UnsafeMutablePointer<CMTextFormatDescription?>) -
OSStatus
Creates a text format description from a big-endian text description structure inside a buffer
func CMTextFormatDescriptionCreateFromBigEndianTextDescriptionData(
allocator: CFAllocator?, bigEndianTextDescriptionData: UnsafePointer<
UInt8>, size: Int, flavor: CMTextDescriptionFlavor?, mediaType: CMMedia
Type, formatDescriptionOut: UnsafeMutablePointer<CMTextFormatDescriptio
?>) -> OSStatus
Creates a text format description from a big-endian text description structure.
func CMSwapBigEndianTextDescriptionToHost(UnsafeMutablePointer<UInt8>,
Int) -> OSStatus
Converts a text description structure from big-endian to host-endian, in place.
func CMSwapHostEndianTextDescriptionToBig(UnsafeMutablePointer<UInt8>,
Int) -> OSStatus
Converts a text description structure from host-endian to big-endian, in place.
struct CMTimeCodeDescriptionFlavor
Types that represent time code format descriptions.
Working with Time Code Descriptions


## Page 10

func CMTimeCodeFormatDescriptionCreate(allocator: CFAllocator?, timeCod
FormatType: CMTimeCodeFormatType, frameDuration: CMTime, frameQuanta:
UInt32, flags: UInt32, extensions: CFDictionary?, formatDescriptionOut:
UnsafeMutablePointer<CMTimeCodeFormatDescription?>) -> OSStatus
Creates a format description for time code media.
func CMTimeCodeFormatDescriptionGetFrameDuration(CMTimeCodeFormat
Description) -> CMTime
Returns the duration of each frame.
func CMTimeCodeFormatDescriptionGetFrameQuanta(CMTimeCodeFormat
Description) -> UInt32
Returns the frames per second for a time code, or frames per tick in counter mode.
func CMTimeCodeFormatDescriptionGetTimeCodeFlags(CMTimeCodeFormat
Description) -> UInt32
Returns time code flags.
func CMTimeCodeFormatDescriptionCopyAsBigEndianTimeCodeDescriptionBlock
Buffer(allocator: CFAllocator?, timeCodeFormatDescription: CMTimeCode
FormatDescription, flavor: CMTimeCodeDescriptionFlavor?, blockBufferOut
UnsafeMutablePointer<CMBlockBuffer?>) -> OSStatus
Copies the contents of a time code format description to a buffer in big-endian byte order.
func CMTimeCodeFormatDescriptionCreateFromBigEndianTimeCodeDescription
BlockBuffer(allocator: CFAllocator?, bigEndianTimeCodeDescriptionBlock
Buffer: CMBlockBuffer, flavor: CMTimeCodeDescriptionFlavor?, format
DescriptionOut: UnsafeMutablePointer<CMTimeCodeFormatDescription?>) ->
OSStatus
Creates a time code format description from a big-endian time code description data
structure in a buffer.
func CMTimeCodeFormatDescriptionCreateFromBigEndianTimeCodeDescription
Data(allocator: CFAllocator?, bigEndianTimeCodeDescriptionData: Unsafe
Pointer<UInt8>, size: Int, flavor: CMTimeCodeDescriptionFlavor?, format
DescriptionOut: UnsafeMutablePointer<CMTimeCodeFormatDescription?>) ->
OSStatus
Creates a time code format description from a big-endian time code description structure.
func CMSwapBigEndianTimeCodeDescriptionToHost(UnsafeMutablePointer<UInt
>, Int) -> OSStatus
Converts a time code description data structure from big-endian to host-endian, in place.


## Page 11

func CMSwapHostEndianTimeCodeDescriptionToBig(UnsafeMutablePointer<UInt
>, Int) -> OSStatus
Converts a time code description data structure from host-endian to big-endian, in place.
struct CMClosedCaptionDescriptionFlavor
Types that represent closed caption format descriptions.
func CMClosedCaptionFormatDescriptionCopyAsBigEndianClosedCaption
DescriptionBlockBuffer(allocator: CFAllocator?, closedCaptionFormat
Description: CMClosedCaptionFormatDescription, flavor: CMClosedCaption
DescriptionFlavor?, blockBufferOut: UnsafeMutablePointer<CMBlockBuffer?
>) -> OSStatus
Copies the contents of a closed caption format description to a buffer in big-endian byte
order.
func CMClosedCaptionFormatDescriptionCreateFromBigEndianClosedCaption
DescriptionBlockBuffer(allocator: CFAllocator?, bigEndianClosedCaption
DescriptionBlockBuffer: CMBlockBuffer, flavor: CMClosedCaption
DescriptionFlavor?, formatDescriptionOut: UnsafeMutablePointer<CMClosed
CaptionFormatDescription?>) -> OSStatus
Creates a closed caption format description from a big-endian closed caption description
structure in a buffer.
func CMClosedCaptionFormatDescriptionCreateFromBigEndianClosedCaption
DescriptionData(allocator: CFAllocator?, bigEndianClosedCaption
DescriptionData: UnsafePointer<UInt8>, size: Int, flavor: CMClosed
CaptionDescriptionFlavor?, formatDescriptionOut: UnsafeMutablePointer<
CMClosedCaptionFormatDescription?>) -> OSStatus
Creates a closed caption format description from a big-endian closed caption description
structure.
func CMSwapHostEndianClosedCaptionDescriptionToBig(UnsafeMutablePointer
UInt8>, Int) -> OSStatus
Converts a closed caption description structure from host-endian to big-endian, in place.
func CMSwapBigEndianClosedCaptionDescriptionToHost(UnsafeMutablePointer
UInt8>, Int) -> OSStatus
Converts a closed caption description structure from big-endian to host-endian, in place.
Working with Closed Captioning Descriptions
Format Description Types


## Page 12

class CMFormatDescription
An object that describes a media format descriptor.
typealias CMAudioFormatDescription
A type you use to interact with audio format descriptions.
typealias CMClosedCaptionFormatDescription
A type you use to interact with closed caption format descriptions.
typealias CMMetadataFormatDescription
A type you use to interact with metadata format descriptions.
typealias CMMuxedFormatDescription
A type you use to interact with muxed format descriptions.
typealias CMTextFormatDescription
A type you use to interact with text format descriptions.
typealias CMTimeCodeFormatDescription
A type you use to interact with time code format descriptions.
typealias CMVideoFormatDescription
A type you use to interact with video format descriptions.
let kCMFormatDescriptionExtension_ContentColorVolume: CFString
let kCMFormatDescriptionExtension_HasAdditionalViews: CFString
let kCMFormatDescriptionExtension_HasLeftStereoEyeView: CFString
let kCMFormatDescriptionExtension_HasRightStereoEyeView: CFString
let kCMFormatDescriptionExtension_HeroEye: CFString
let kCMFormatDescriptionExtension_HorizontalDisparityAdjustment:
CFString
let kCMFormatDescriptionExtension_LogTransferFunction: CFString
let kCMFormatDescriptionExtension_StereoCameraBaseline: CFString
let kCMFormatDescriptionHeroEye_Left: CFString
let kCMFormatDescriptionHeroEye_Right: CFString
Format Description Extension Keys


## Page 13

typealias CMClosedCaptionFormatType
A closed caption format type.
typealias CMMetadataFormatType
A metadata format type.
Metadata Format Types
Constants that represent media format types.
typealias CMSubtitleFormatType
A type that represents a text subtitle format.
Subtitle Format Types
Constants that represent subtitle format types.
typealias CMTimeCodeFormatType
A time code format type.
Time Code Formats
Constants that represent time code format types.
typealias CMTextFormatType
A text format type.
typealias CMPixelFormatType
A pixel format type.
Tagged Buffer Group Format Types
struct CMVideoDimensions
A structure that represents video dimensions.
typealias CMAudioFormatDescriptionMask
A type for mask bits that represent parts of an audio format description.
typealias CMMediaType
Constants that represent media types.
Format Types
Data Types


## Page 14

typealias CMAudioCodecType
An audio codec type.
typealias CMVideoCodecType
A video codec type.
typealias CMTextDisplayFlags
An integer value that describes the display mode flags for text media.
typealias CMTextJustificationValue
An integer value that describes the justification modes for text media.
Media Type Constants
Constants that represent media types.
Muxed Stream Types
Constants that represent muxed stream types.
Audio Codec Types
Constants that represent audio codec types.
Audio Format Description Mask Codes
Mask codes that identify audio formats.
Chroma Location Extension Constants
Constants that identify chroma location extensions.
Clean Aperture Extension Constants
Constants that identify clean aperture extensions.
Closed Caption Format Type Constants
Types that identify closed caption formats.
Color Primary Extension Constants
Constants that identify color primary extensions.
Field Detail Extension Constants
Constants that identify field detail extensions.
Format Description Bridge Error Codes
Bridge errors the system returns from format description calls.
Constants


## Page 15

Format Description Constants
Constants that identify format descriptions.
Format Description Error Codes
Errors the system returns from format description calls.
HEVC Temporal Level Info Constants
Constants that identify HEVC temporal level information.
Metadata Format Description Constants
Constants that identify metadata format descriptions.
MPEG-2-conformant Formats
Constants that identify MPEG-2 formats.
Pixel Aspect Ratio Extension Constants
Constants that identify pixel aspect ratio extensions.
Text Display Flags
Flags that identify text display methods.
Text Format Constants
Types that identify text formats.
Text Format Description Constants
Constants that identify text format descriptions.
Text Justification Constants
Types that identify text justifications.
Time Code Flags
Flags that identify time codes.
Time Code Format Description Constants
Constants that identify time code format descriptions.
Transfer Function Extension Constants
Constants that identify transfer function extensions.
Video Codec Constants
Types that identify video codecs.
Video Pixel Formats


## Page 16

Constants that identify video pixel formats.
Video Profile Constants
Constants that identify video profiles.
YCbCrMatrix Extension Constants
Constants that identify YCbCrMatrix extensions.
CMSampleBuffer
An object that contains zero or more media samples of a uniform media type.
CMBlockBuffer
An object the system uses to move blocks of memory through a processing system.
CMTaggedBufferGroup
Objective-C types and interfaces for working with Core Media tagged buffer groups.
CMAttachment
Add supporting metadata to sample buffers.
struct CMTaggedBuffer
An instance of a media buffer containing metadata tags.
struct CMMutableDataBlockBuffer
A block buffer that provides read-write access to a range of bytes.
struct CMReadOnlyDataBlockBuffer
A block buffer that provides read-only access to the a range of bytes.
struct CMReadySampleBuffer
Buffer carrying readily available samples of media data.
struct CMSampleDataReference
References sample data in at a URL.
struct CMTaggedDynamicBuffer
See Also
Sample Processing


## Page 17

Contains a collection of tags associated with a read-only media buffer.


