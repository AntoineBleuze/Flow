# Streams.pdf

## Page 1

You can configure an audio stream basic description (ASBD) to specify a linear PCM format or a
constant bit rate (CBR) format that has channels of equal size. For variable bit rate (VBR) audio,
and for CBR audio where the channels have unequal sizes, also use an AudioStreamPacket
Description structure to additionally describe each packet.
A field value of 0 indicates that the value is either unknown or not applicable to the format.
Always initialize the fields of a new audio stream basic description structure to 0, as the example
below shows:
To determine the duration that one packet represents, use the mSampleRate field with the m
FramesPerPacket field, as follows:
In Core Audio, the following definitions apply:
An audio stream is a continuous series of data that represents a sound, such as a song.
A channel is a discrete track of monophonic audio. A monophonic stream has one channel; a
stereo stream has two channels.
Overview
Core Audio Types / AudioStreamBasicDescription
Structure
AudioStreamBasicDescription
A format specification for an audio stream.
iOS 2.0+
iPadOS 2.0+
macOS 10.0+
tvOS 9.0+
visionOS 1.0+
watchOS 3.0+


## Page 2

A sample is single numerical value for a single audio channel in an audio stream.
A frame is a collection of time-coincident samples. For instance, a linear PCM stereo sound file
has two samples per frame, one for the left channel and one for the right channel.
A packet is a collection of one or more contiguous frames. A packet defines the smallest
meaningful set of frames for a given audio data format, and is the smallest data unit for which
time can be measured. In linear PCM audio, a packet holds a single frame. In compressed
formats, it typically holds more frames. In some formats, the number of frames per packet
varies.
The sample rate for a stream is the number of frames per second of uncompressed audio, or, f
compressed formats, the equivalent in decompressed audio.
var mFormatID: AudioFormatID
An identifier specifying the general audio data format in the stream.
var mFormatFlags: AudioFormatFlags
Format-specific flags to specify details of the format.
var mSampleRate: Float64
The number of frames per second of the data in the stream, when playing the stream at
normal speed.
var mBitsPerChannel: UInt32
The number of bits for one audio sample.
var mBytesPerFrame: UInt32
The number of bytes from the start of one frame to the start of the next frame in an audio
buffer.
var mChannelsPerFrame: UInt32
The number of channels in each frame of audio data.
var mBytesPerPacket: UInt32
The number of bytes in a packet of audio data.
var mFramesPerPacket: UInt32
The number of frames in a packet of audio data.
Topics
Inspecting a description


## Page 3

var mReserved: UInt32
The amount to pad the structure to force an even 8-byte alignment.
init()
Creates an empty description.
init(mSampleRate: Float64, mFormatID: AudioFormatID, mFormatFlags: Audi
FormatFlags, mBytesPerPacket: UInt32, mFramesPerPacket: UInt32, mBytes
PerFrame: UInt32, mChannelsPerFrame: UInt32, mBitsPerChannel: UInt32, m
Reserved: UInt32)
Creates a description with the specified values.
BitwiseCopyable, Sendable
struct AudioStreamPacketDescription
A value that describes a packet in a buffer of audio data.
typealias AudioFormatFlags
A type definition for audio format flags.
Audio Format Flags
Commonly used combinations of data format flags for an audio stream description.
typealias AudioFormatID
A type definition for audio format identifiers.
Initializers
Relationships
Conforms To
See Also
Streams


## Page 4

Audio Format Identifiers
Identifiers for supported audio formats.
let kAudioStreamAnyRate: Float64
A value that indicates that an audio stream can use any sample rate.
enum MPEG4ObjectID
Constants that define the type of MPEG-4 audio data.
Deprecated


## Page 5

For data formats where the packet size isn’t constant, such as variable bit rate data and data whe
the channels have unequal sizes, use this structure to supplement the information in the Audio
StreamBasicDescription structure.
var mDataByteSize: UInt32
The number of bytes in the packet.
var mStartOffset: Int64
The number of bytes from the start of the buffer to the beginning of the packet.
var mVariableFramesInPacket: UInt32
The number of sample frames of data in the packet.
Overview
Topics
Inspecting an audio stream packet description
Creating an audio stream packet descripiton
Core Audio Types / AudioStreamPacketDescription
Structure
AudioStreamPacketDescription
A value that describes a packet in a buffer of audio data.
iOS 2.0+
iPadOS 2.0+
macOS 10.2+
tvOS 9.0+
visionOS 1.0+
watchOS 3.0+


## Page 6

init()
Creates an audio stream basic description.
init(mStartOffset: Int64, mVariableFramesInPacket: UInt32, mDataByteSiz
: UInt32)
Creates an audio stream basic description with the start offset, and the number of sample
frames and bytes in the packet that you specify.
BitwiseCopyable, Sendable
struct AudioStreamBasicDescription
A format specification for an audio stream.
typealias AudioFormatFlags
A type definition for audio format flags.
Audio Format Flags
Commonly used combinations of data format flags for an audio stream description.
typealias AudioFormatID
A type definition for audio format identifiers.
Audio Format Identifiers
Identifiers for supported audio formats.
let kAudioStreamAnyRate: Float64
A value that indicates that an audio stream can use any sample rate.
enum MPEG4ObjectID
Relationships
Conforms To
See Also
Streams


## Page 7

Constants that define the type of MPEG-4 audio data.
Deprecated


## Page 8

struct AudioStreamBasicDescription
A format specification for an audio stream.
struct AudioStreamPacketDescription
A value that describes a packet in a buffer of audio data.
Audio Format Flags
Commonly used combinations of data format flags for an audio stream description.
typealias AudioFormatID
A type definition for audio format identifiers.
Audio Format Identifiers
Identifiers for supported audio formats.
let kAudioStreamAnyRate: Float64
A value that indicates that an audio stream can use any sample rate.
enum MPEG4ObjectID
Constants that define the type of MPEG-4 audio data.
See Also
Streams
Core Audio Types / AudioFormatFlags
Type Alias
AudioFormatFlags
A type definition for audio format flags.
iOS 8.0+
iPadOS 8.0+
macOS 10.10+
tvOS 9.0+
visionOS 1.0+
watchOS 3.0+


## Page 9

Deprecated


## Page 10

Prefer using fixed-point formats in iOS and floating-point formats in macOS.
var kAppleLosslessFormatFlag_16BitSourceData: AudioFormatFlags
A flag that indicates Apple Lossless data sourced from 16-bit native endian signed integer
data.
var kAppleLosslessFormatFlag_20BitSourceData: AudioFormatFlags
A flag that indicates Apple Lossless data sourced from 20-bit native endian signed integer
data aligned high in 24 bits.
var kAppleLosslessFormatFlag_24BitSourceData: AudioFormatFlags
A flag that indicates Apple Lossless data sourced from 24-bit native endian signed integer
data.
var kAppleLosslessFormatFlag_32BitSourceData: AudioFormatFlags
A flag that indicates Apple Lossless data sourced from 32-bit native endian signed integer
data.
var kAudioFormatFlagIsAlignedHigh: AudioFormatFlags
Overview
Topics
Format flags
Core Audio Types / Audio Format Flags
API Collection
Audio Format Flags
Commonly used combinations of data format flags for an audio stream descriptio


## Page 11

A flag that indicates whether placement of the sample bits is with the high or low bits of the
channel.
var kAudioFormatFlagIsBigEndian: AudioFormatFlags
A flag that indicates whether the format is big or little endian.
var kAudioFormatFlagIsFloat: AudioFormatFlags
A flag that indicates whether the format is floating point or integer.
var kAudioFormatFlagIsNonInterleaved: AudioFormatFlags
A flag that indicates whether the samples for each channel or frame are continguously
located, and whether the layout of the channels or frames is end-to-end.
var kAudioFormatFlagIsNonMixable: AudioFormatFlags
A flag that indicates the format is nonmixable.
var kAudioFormatFlagIsPacked: AudioFormatFlags
A flag that indicates whether placement of the sample bits occupy the entire available bits of
the channel.
var kAudioFormatFlagIsSignedInteger: AudioFormatFlags
A flag that indicates whether the format is signed or unsigned integer.
var kAudioFormatFlagsAreAllClear: AudioFormatFlags
A flag that indicates whether all the flags are clear.
var kAudioFormatFlagsNativeEndian: AudioFormatFlags
A flag that specifies whether the format is big endian, depending on the endianness of the
processor at build time.
var kAudioFormatFlagsNativeFloatPacked: AudioFormatFlags
The flags for the canonical format of fully packed, native endian floating-point data.
var kLinearPCMFormatFlagIsAlignedHigh: AudioFormatFlags
A flag that indicates whether placement of the sample bits is with the high or low bits of the
channel.
var kLinearPCMFormatFlagIsBigEndian: AudioFormatFlags
A flag that indicates whether the format is big or little endian.
var kLinearPCMFormatFlagIsFloat: AudioFormatFlags
A flag that indicates whether the format is floating point or integer.
var kLinearPCMFormatFlagIsNonInterleaved: AudioFormatFlags


## Page 12

A flag that indicates whether the samples for each channel or frame are continguously
located, and whether the layout of the channels or frames is end-to-end.
var kLinearPCMFormatFlagIsNonMixable: AudioFormatFlags
A flag that indicates the format is nonmixable.
var kLinearPCMFormatFlagIsPacked: AudioFormatFlags
A flag that indicates whether placement of the sample bits occupy the entire available bits of
the channel.
var kLinearPCMFormatFlagIsSignedInteger: AudioFormatFlags
A flag that indicates whether the format is signed or unsigned integer.
var kLinearPCMFormatFlagsAreAllClear: AudioFormatFlags
A flag that indicates whether all the flags are clear.
var kLinearPCMFormatFlagsSampleFractionMask: AudioFormatFlags
A flag that indicates the sample fraction mask.
var kLinearPCMFormatFlagsSampleFractionShift: AudioFormatFlags
A flag that indicates the bit position of the PCM flag’s 6-bit bitfield.
var kAudioFormatFlagsAudioUnitCanonical: AudioFormatFlags
The flags for the canonical audio unit and processing sample type.
Deprecated
var kAudioFormatFlagsCanonical: AudioFormatFlags
The set of flags for the canonical input-output audio sample type.
Deprecated
struct AudioStreamBasicDescription
A format specification for an audio stream.
struct AudioStreamPacketDescription
A value that describes a packet in a buffer of audio data.
See Also
Streams


## Page 13

typealias AudioFormatFlags
A type definition for audio format flags.
typealias AudioFormatID
A type definition for audio format identifiers.
Audio Format Identifiers
Identifiers for supported audio formats.
let kAudioStreamAnyRate: Float64
A value that indicates that an audio stream can use any sample rate.
enum MPEG4ObjectID
Constants that define the type of MPEG-4 audio data.
Deprecated


## Page 14

struct AudioStreamBasicDescription
A format specification for an audio stream.
struct AudioStreamPacketDescription
A value that describes a packet in a buffer of audio data.
typealias AudioFormatFlags
A type definition for audio format flags.
Audio Format Flags
Commonly used combinations of data format flags for an audio stream description.
Audio Format Identifiers
Identifiers for supported audio formats.
let kAudioStreamAnyRate: Float64
A value that indicates that an audio stream can use any sample rate.
enum MPEG4ObjectID
Constants that define the type of MPEG-4 audio data.
See Also
Streams
Core Audio Types / AudioFormatID
Type Alias
AudioFormatID
A type definition for audio format identifiers.
iOS 8.0+
iPadOS 8.0+
macOS 10.10+
tvOS 9.0+
visionOS 1.0+
watchOS 3.0+


## Page 15

Deprecated


## Page 16

Use these identifiers to test for the presence of audio codecs on a system. If a given codec is
present, you can use its identifier to specify that codec for data encoding or decoding, according
to the capabilities of the codec. For more information, see Core Audio.
var kAudioFormat60958AC3: AudioFormatID
A key that specifies the AC-3 codec, which provides data packaged for transport over an IEC
60958-compliant digital audio interface, and uses standard flags.
var kAudioFormatAC3: AudioFormatID
A key that specifies the AC-3 codec, and uses no flags.
var kAudioFormatAES3: AudioFormatID
A key that specifies the codec defined by the AES3-2003 standard, and uses no flags.
var kAudioFormatALaw: AudioFormatID
A key that specifies the A-law 2:1 codec, and uses no flags.
var kAudioFormatAMR: AudioFormatID
A key that specifies the Adaptive Multi-Rate (AMR) narrow band speech codec, and uses no
flags.
Overview
Topics
Format identifiers
Core Audio Types / Audio Format Identifiers
API Collection
Audio Format Identifiers
Identifiers for supported audio formats.


## Page 17

var kAudioFormatAMR_WB: AudioFormatID
A key that specifies the AMR Wideband speech codec, and uses no flags.
var kAudioFormatAppleIMA4: AudioFormatID
A key that specifies Apple’s implementation of the IMA 4:1 ADPCM codec, and uses no flags
var kAudioFormatAppleLossless: AudioFormatID
A key that specifies the Apple Lossless codec, and uses flags to indicate the bit depth of the
source material.
var kAudioFormatAudible: AudioFormatID
A key that specifies the codec for Audible audio books, and uses no flags.
var kAudioFormatDVIIntelIMA: AudioFormatID
A key that specifies the codec defined by DVI/Intel IMA ADPCM - ACM code 17, and uses no
flags.
var kAudioFormatEnhancedAC3: AudioFormatID
A key that specifies the Enhanced AC-3 codec, and uses no flags.
var kAudioFormatFLAC: AudioFormatID
A key that specifies the Free Lossless Audio Codec (FLAC), and uses flags to indicate the bit
depth of the source material.
var kAudioFormatLinearPCM: AudioFormatID
A key that specifies the linear PCM codec, and uses the standard flags.
var kAudioFormatMACE3: AudioFormatID
A key that specifies the MACE 3:1 codec, and uses no flags.
var kAudioFormatMACE6: AudioFormatID
A key that specifies the MACE C:1 codec, and uses no flags.
var kAudioFormatMIDIStream: AudioFormatID
A key that specifies the MIDI stream codec, and uses no flags.
var kAudioFormatMPEG4AAC: AudioFormatID
A key that specifies the MPEG-4 AAC Low Complexity codec, and uses no flags.
var kAudioFormatMPEG4AAC_ELD: AudioFormatID
A key that specifies the MPEG-4 Enhanced Low Delay AAC codec, and uses no flags.
var kAudioFormatMPEG4AAC_ELD_SBR: AudioFormatID


## Page 18

A key that specifies the MPEG-4 Enhanced Low Delay AAC codec with a spectral band
replication (SBR) extension layer, and uses no flags.
var kAudioFormatMPEG4AAC_ELD_V2: AudioFormatID
A key that specifies the MPEG-4 Enhanced Low Delay AAC version 2 codec, and uses no
flags.
var kAudioFormatMPEG4AAC_HE: AudioFormatID
A key that specifies the MPEG-4 High-Efficiency AAC codec, and uses no flags.
var kAudioFormatMPEG4AAC_HE_V2: AudioFormatID
A key that specifies the MPEG-4 High-Efficiency AAC version 2 codec, and uses no flags.
var kAudioFormatMPEG4AAC_LD: AudioFormatID
A key that specifies the MPEG-4 Low Delay AAC codec, and uses no flags.
var kAudioFormatMPEG4AAC_Spatial: AudioFormatID
A key that specifies the MPEG-4 Spatial Audio Coding codec, and uses no flags.
var kAudioFormatMPEG4CELP: AudioFormatID
A key that specifies the MPEG-4 CELP codec, and uses flags to indicate the specific kind of
data.
var kAudioFormatMPEG4HVXC: AudioFormatID
A key that specifies the MPEG-4 HVXC codec, and uses no flags.
var kAudioFormatMPEG4TwinVQ: AudioFormatID
A key that specifies the MPEG-4 TwinVQ codec, and uses no flags.
var kAudioFormatMPEGD_USAC: AudioFormatID
A key that specifies the MPEG-D Unified Speech and Audio Coding codec, and uses no flags
var kAudioFormatMPEGLayer1: AudioFormatID
A key that specifies the MPEG-1/2, Layer I audio codec, and uses no flags.
var kAudioFormatMPEGLayer2: AudioFormatID
A key that specifies the MPEG-1/2, Layer II audio codec, and uses no flags.
var kAudioFormatMPEGLayer3: AudioFormatID
A key that specifies the MPEG-1/2, Layer III audio codec, and uses no flags.
var kAudioFormatMicrosoftGSM: AudioFormatID
A key that specifies the Microsoft GSM 6.10 - ACM code 49 codec, and uses no flags.


## Page 19

var kAudioFormatOpus: AudioFormatID
A key that specifies the Opus codec, and uses no flags.
var kAudioFormatParameterValueStream: AudioFormatID
A key that specifies the A side-chain of float 32 data that an audio unit provides for sending
high-density parameter value control information, and uses no flags.
var kAudioFormatQDesign: AudioFormatID
A key that specifies the QDesign music codec, and uses no flags.
var kAudioFormatQDesign2: AudioFormatID
A key that specifies the QDesign 2 music codec, and uses no flags.
var kAudioFormatQUALCOMM: AudioFormatID
A key that specifies the Qualcomm PureVoice codec, and uses no flags.
var kAudioFormatTimeCode: AudioFormatID
A key that specifies the A stream of audio timestamp structures, and uses audio timestamp
flags.
var kAudioFormatULaw: AudioFormatID
A key that specifies the μ-Law 2:1 codec, and uses no flags.
var kAudioFormatiLBC: AudioFormatID
A key that specifies the internet Low Bitrate Codec (iLBC) narrow band speech codec, and
uses no flags.
struct AudioStreamBasicDescription
A format specification for an audio stream.
struct AudioStreamPacketDescription
A value that describes a packet in a buffer of audio data.
typealias AudioFormatFlags
A type definition for audio format flags.
See Also
Streams


## Page 20

Audio Format Flags
Commonly used combinations of data format flags for an audio stream description.
typealias AudioFormatID
A type definition for audio format identifiers.
let kAudioStreamAnyRate: Float64
A value that indicates that an audio stream can use any sample rate.
enum MPEG4ObjectID
Constants that define the type of MPEG-4 audio data.
Deprecated


## Page 21

struct AudioStreamBasicDescription
A format specification for an audio stream.
struct AudioStreamPacketDescription
A value that describes a packet in a buffer of audio data.
typealias AudioFormatFlags
A type definition for audio format flags.
Audio Format Flags
Commonly used combinations of data format flags for an audio stream description.
typealias AudioFormatID
A type definition for audio format identifiers.
Audio Format Identifiers
Identifiers for supported audio formats.
enum MPEG4ObjectID
Constants that define the type of MPEG-4 audio data.
See Also
Streams
Core Audio Types / kAudioStreamAnyRate
Global Variable
kAudioStreamAnyRate
A value that indicates that an audio stream can use any sample rate.
iOS 9.0+
iPadOS 9.0+
macOS 10.11+
tvOS 9.0+
visionOS 1.0+
watchOS 3.0+


## Page 22

Deprecated


## Page 23

Deprecated
Deprecated in Mac OS X 10.5.
case AAC_LC
A constant that specifies lossless coding, which provides compression with no loss of quality
case AAC_LTP
A constant that specifies long-term prediction, which reduces redundancy in a coded signal
case aac_Main
A constant that specifies advanced audio coding, which is the basic MPEG-4 technology.
case AAC_SBR
A constant that specifies spectral band replication, which reconstructs high-frequency
content from lower frequencies and side information.
case AAC_SSR
Topics
Constants
Core Audio Types / MPEG4ObjectID Deprecated
Enumeration
MPEG4ObjectID Deprecated
Constants that define the type of MPEG-4 audio data.
iOS 9.0+
iPadOS 9.0+
macOS 10.11+
tvOS 9.0+
visionOS 1.0+
watchOS 3.0+


## Page 24

A constant that specifies scalable sampling rate, which provides different sampling
frequencies for different targets.
case aac_Scalable
A constant that specifies scalable lossless coding.
case CELP
A constant that specifies code-excited linear prediction, which is a narrow-band/wide-band
speech codec.
case HVXC
A constant that specifies harmonic vector excitation coding, which is a very-low bit-rate
parametric speech codec.
case twinVQ
A constant that specifies transform-domain weighted interleaved vector quantization.
init?(rawValue: Int)
BitwiseCopyable
Equatable
Hashable
RawRepresentable
Sendable
SendableMetatype
struct AudioStreamBasicDescription
Initializers
Relationships
Conforms To
See Also
Streams


## Page 25

A format specification for an audio stream.
struct AudioStreamPacketDescription
A value that describes a packet in a buffer of audio data.
typealias AudioFormatFlags
A type definition for audio format flags.
Audio Format Flags
Commonly used combinations of data format flags for an audio stream description.
typealias AudioFormatID
A type definition for audio format identifiers.
Audio Format Identifiers
Identifiers for supported audio formats.
let kAudioStreamAnyRate: Float64
A value that indicates that an audio stream can use any sample rate.


