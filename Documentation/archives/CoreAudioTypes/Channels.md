# Channels.pdf

## Page 1

init()
Creates an empty channel description.
init(mChannelLabel: AudioChannelLabel, mChannelFlags: AudioChannelFlags
mCoordinates: (Float32, Float32, Float32))
Creates a channel description with a label, flags, and coordinates.
var mChannelFlags: AudioChannelFlags
The audio channel flags that indicate how to interpret the channel coordinates.
var mChannelLabel: AudioChannelLabel
A label that describes the audio channel.
var mCoordinates: (Float32, Float32, Float32)
The coordinates that specify a precise speaker location.
typealias AudioChannelLabel
Topics
Creating a Channel Description
Accessing the Data
Core Audio Types / AudioChannelDescription
Structure
AudioChannelDescription
A structure that describes a channel of audio data.
iOS 2.0+
iPadOS 2.0+
macOS 10.2+
tvOS 9.0+
visionOS 1.0+
watchOS 3.0+


## Page 2

Identifies how an audio data channel is to be used.
Audio Channel Coordinates
Used in the mChannelFlags field of an AudioChannelDescription structure.
struct AudioChannelFlags
Constants that define the audio channel flags of an audio channel description.
Audio Channel Labels
Channel labels for use in the mChannelLabel field of an AudioChannelDescription
structure.
static func == (AudioChannelDescription, AudioChannelDescription) ->
Bool
BitwiseCopyable, Sendable
struct AudioChannelLayout
A structure that specifies a channel layout in a file or in hardware.
Operators
Relationships
Conforms To
See Also
Channels


## Page 3

var mChannelBitmap: AudioChannelBitmap
If mChannelLayoutTag is set to kAudioChannelLayoutTag_UseChannelBitmap, thi
field is the channel-use bitmap.
struct AudioChannelBitmap
The supported channel bitmaps to use when defining channel layouts.
var mChannelDescriptions: AudioChannelDescription
A variable length array of mNumberChannelDescription elements that describes a layou
If the mChannelLayoutTag field is set to kAudioChannelLayoutTag_UseChannel
Descriptions, use this field to describe the layout.
var mChannelLayoutTag: AudioChannelLayoutTag
The AudioChannelLayoutTag value that indicates the layout. See Audio Channel Layout
Tags for possible values.
typealias AudioChannelLayoutTag
Identifies a previously-defined channel layout.
Audio Channel Layout Tags
Topics
Accessing the Data
Core Audio Types / AudioChannelLayout
Structure
AudioChannelLayout
A structure that specifies a channel layout in a file or in hardware.
iOS 2.0+
iPadOS 2.0+
macOS 10.2+
tvOS 9.0+
visionOS 1.0+
watchOS 3.0+


## Page 4

The identifiers that represent audio channel layouts.
var mNumberChannelDescriptions: UInt32
The number of items in the mChannelDescriptions array.
func AudioChannelLayoutTag_GetNumberOfChannels(AudioChannelLayoutTag) -
UInt32
Retrieves the number of channels from an audio channel layout tag.
init()
init(mChannelLayoutTag: AudioChannelLayoutTag, mChannelBitmap: Audio
ChannelBitmap, mNumberChannelDescriptions: UInt32, mChannelDescriptions
AudioChannelDescription)
struct UnsafeMutablePointer
struct UnsafePointer
static func allocate(maximumDescriptions: Int) -> AudioChannelLayout.
UnsafeMutablePointer
static func sizeInBytes(maximumDescriptions: Int) -> Int
BitwiseCopyable, Sendable
Initializers
Structures
Type Methods
Relationships
Conforms To
See Also


## Page 5

struct AudioChannelDescription
A structure that describes a channel of audio data.
Channels


