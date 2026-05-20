# Common Types.pdf

## Page 1

typealias AVAudioUInteger
An unsigned integer type for audio operations.
typealias AudioSessionID
A unique identifier of an audio session.
var kAudioUnitSampleFractionBits: Int32
The number of fractional bits in fixed-point samples.
var COREAUDIOTYPES_VERSION: Int32
A value that represents the Core Audio Types version.
typealias AudioSampleType
The canonical audio data sample type for input and output.
Deprecated
typealias AudioUnitSampleType
The canonical audio data sample type for audio processing.
Deprecated
See Also
Common Types
Core Audio Types / AVAudioInteger
Type Alias
AVAudioInteger
An integer type for audio operations.
iOS 13.0+
iPadOS 13.0+
Mac Catalyst 13.0+
macOS 10.15+
tvOS 13.0+
visionOS 1.0+
watchOS 6.0+


## Page 2

struct AudioFormatListItem


## Page 3

typealias AVAudioInteger
An integer type for audio operations.
typealias AudioSessionID
A unique identifier of an audio session.
var kAudioUnitSampleFractionBits: Int32
The number of fractional bits in fixed-point samples.
var COREAUDIOTYPES_VERSION: Int32
A value that represents the Core Audio Types version.
typealias AudioSampleType
The canonical audio data sample type for input and output.
Deprecated
typealias AudioUnitSampleType
The canonical audio data sample type for audio processing.
Deprecated
See Also
Common Types
Core Audio Types / AVAudioUInteger
Type Alias
AVAudioUInteger
An unsigned integer type for audio operations.
iOS 13.0+
iPadOS 13.0+
Mac Catalyst 13.0+
macOS 10.15+
tvOS 13.0+
visionOS 1.0+
watchOS 6.0+


## Page 4

struct AudioFormatListItem


## Page 5

typealias AVAudioInteger
An integer type for audio operations.
typealias AVAudioUInteger
An unsigned integer type for audio operations.
var kAudioUnitSampleFractionBits: Int32
The number of fractional bits in fixed-point samples.
var COREAUDIOTYPES_VERSION: Int32
A value that represents the Core Audio Types version.
typealias AudioSampleType
The canonical audio data sample type for input and output.
Deprecated
typealias AudioUnitSampleType
The canonical audio data sample type for audio processing.
Deprecated
See Also
Common Types
Core Audio Types / AudioSessionID
Type Alias
AudioSessionID
A unique identifier of an audio session.
iOS 14.0+
iPadOS 14.0+
macOS 11.0+
tvOS 14.0+
visionOS 1.0+
watchOS 7.0+


## Page 6

struct AudioFormatListItem


## Page 7

typealias AVAudioInteger
An integer type for audio operations.
typealias AVAudioUInteger
An unsigned integer type for audio operations.
typealias AudioSessionID
A unique identifier of an audio session.
var COREAUDIOTYPES_VERSION: Int32
A value that represents the Core Audio Types version.
typealias AudioSampleType
The canonical audio data sample type for input and output.
Deprecated
typealias AudioUnitSampleType
The canonical audio data sample type for audio processing.
Deprecated
See Also
Common Types
Core Audio Types / kAudioUnitSampleFractionBits
Global Variable
kAudioUnitSampleFractionBits
The number of fractional bits in fixed-point samples.
iOS 2.0+
iPadOS 2.0+
tvOS 9.0+
visionOS 1.0+
watchOS 3.0+


## Page 8

struct AudioFormatListItem


## Page 9

typealias AVAudioInteger
An integer type for audio operations.
typealias AVAudioUInteger
An unsigned integer type for audio operations.
typealias AudioSessionID
A unique identifier of an audio session.
var kAudioUnitSampleFractionBits: Int32
The number of fractional bits in fixed-point samples.
typealias AudioSampleType
The canonical audio data sample type for input and output.
Deprecated
typealias AudioUnitSampleType
The canonical audio data sample type for audio processing.
Deprecated
See Also
Common Types
Core Audio Types / COREAUDIOTYPES_VERSION
Global Variable
COREAUDIOTYPES_VERSION
A value that represents the Core Audio Types version.
iOS 2.0+
iPadOS 2.0+
macOS 10.5+
tvOS 9.0+
visionOS 1.0+
watchOS 3.0+


## Page 10

struct AudioFormatListItem


## Page 11

Deprecated
The concept of canonical formats is deprecated
The canonical audio sample type for input and output in iPhone OS is linear PCM with 16-bit integ
samples.
typealias AVAudioInteger
An integer type for audio operations.
Discussion
See Also
Common Types
Core Audio Types / AudioSampleType Deprecated
Type Alias
AudioSampleType Deprecated
The canonical audio data sample type for input and output.
iOS 2.0+
iPadOS 2.0+
macOS 10.5+
tvOS 9.0+
visionOS 1.0+
watchOS 3.0+
iOS, iPadOS, Mac Catalyst, tvOS, visionOS, watchOS
Mac Catalyst, macOS


## Page 12

typealias AVAudioUInteger
An unsigned integer type for audio operations.
typealias AudioSessionID
A unique identifier of an audio session.
var kAudioUnitSampleFractionBits: Int32
The number of fractional bits in fixed-point samples.
var COREAUDIOTYPES_VERSION: Int32
A value that represents the Core Audio Types version.
typealias AudioUnitSampleType
The canonical audio data sample type for audio processing.
Deprecated
struct AudioFormatListItem


## Page 13

Deprecated
The concept of canonical formats is deprecated
The canonical audio sample type for audio units and other audio processing in iPhone OS is
noninterleaved linear PCM with 8.24-bit fixed-point samples.
typealias AVAudioInteger
An integer type for audio operations.
Discussion
See Also
Common Types
Core Audio Types / AudioUnitSampleType Deprecated
Type Alias
AudioUnitSampleType Deprecated
The canonical audio data sample type for audio processing.
iOS 2.0+
iPadOS 2.0+
macOS 10.6+
tvOS 9.0+
visionOS 1.0+
watchOS 3.0+
iOS, iPadOS, Mac Catalyst, tvOS, visionOS, watchOS
Mac Catalyst, macOS


## Page 14

typealias AVAudioUInteger
An unsigned integer type for audio operations.
typealias AudioSessionID
A unique identifier of an audio session.
var kAudioUnitSampleFractionBits: Int32
The number of fractional bits in fixed-point samples.
var COREAUDIOTYPES_VERSION: Int32
A value that represents the Core Audio Types version.
typealias AudioSampleType
The canonical audio data sample type for input and output.
Deprecated
struct AudioFormatListItem


## Page 15

This struct is used as output from the kAudioFormatProperty_FormatList property
init()
init(mASBD: AudioStreamBasicDescription, mChannelLayoutTag: AudioChanne
LayoutTag)
var mASBD: AudioStreamBasicDescription
Overview
Topics
Initializers
Instance Properties
Core Audio Types / AudioFormatListItem
Structure
AudioFormatListItem
iOS 13.0+
iPadOS 13.0+
Mac Catalyst 13.0+
macOS 10.15+
tvOS 13.0+
visionOS 1.0+
watchOS 6.0+


## Page 16

var mChannelLayoutTag: AudioChannelLayoutTag
BitwiseCopyable, Sendable
typealias AVAudioInteger
An integer type for audio operations.
typealias AVAudioUInteger
An unsigned integer type for audio operations.
typealias AudioSessionID
A unique identifier of an audio session.
var kAudioUnitSampleFractionBits: Int32
The number of fractional bits in fixed-point samples.
var COREAUDIOTYPES_VERSION: Int32
A value that represents the Core Audio Types version.
typealias AudioSampleType
The canonical audio data sample type for input and output.
Deprecated
typealias AudioUnitSampleType
The canonical audio data sample type for audio processing.
Deprecated
Relationships
Conforms To
See Also
Common Types


