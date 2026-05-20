# 001_AudioChannelLayout.pdf

## Page 1

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


## Page 2

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


## Page 3

struct AudioChannelDescription
A structure that describes a channel of audio data.
Channels


