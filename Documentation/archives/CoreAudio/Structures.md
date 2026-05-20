# Structures.pdf

## Page 1

init(OSStatus)
let error: OSStatus
var errorDescription: String?
Provides localized descriptions for the error constants unique to HAL . Note that the HAL’s
functions can and will return other codes that are not covered here, in which case no
description is provided.
Error
LocalizedError
Topics
Initializers
Instance Properties
Relationships
Conforms To
Core Audio / AudioHardwareError
Structure
AudioHardwareError
Represents errors returned by the HAL
Mac Catalyst
macOS 15.0+


## Page 2

Sendable
SendableMetatype


## Page 3

struct ChannelDescriptions
A collection of AudioChannelDescriptions.
init(audioChannelLayoutPointer: AudioChannelLayout.UnsafePointer,
deallocator: (AudioChannelLayout.UnsafePointer) -> Void)
Creates a new ManagedAudioChannelLayout from an existing pointer to an Audio
ChannelLayout.
init(channelDescriptions: [AudioChannelDescription])
Creates a new ManagedAudioChannelLayout from an array of AudioChannel
Description.
init(maximumDescriptions: Int)
Creates a new ManagedAudioChannelLayout that can hold up to maximum
Descriptions.
init(tag: AudioChannelLayoutTag)
Topics
Structures
Initializers
Core Audio / ManagedAudioChannelLayout
Structure
ManagedAudioChannelLayout
This structure is used to specify channel layouts in files and hardware.
iOS 13.0+
iPadOS 13.0+
Mac Catalyst
macOS 10.15+
tvOS 13.0+
visionOS
watchOS 6.0+


## Page 4

Creates a new ManagedAudioChannelLayout with a given tag.
var bitmap: AudioChannelBitmap
If tag is set to kAudioChannelLayoutTag_UseChannelBitmap, this is the channel
usage bitmap.
var channelDescriptions: ManagedAudioChannelLayout.ChannelDescriptions
The AudioChannelDescriptions that describe the layout.
var numberOfChannels: Int
The number of channels described by this ManagedAudioChannelLayout.
var sizeInBytes: Int
The size, in bytes, of the backing AudioChannelLayout.
var tag: AudioChannelLayoutTag
The AudioChannelLayoutTag that indicates the layout.
func setAllToUnknown()
Sets all AudioChannelDescriptions to kAudioChannelLabel_Unknown.
func withUnsafeMutablePointer<Result>((UnsafeMutablePointer<AudioChanne
Layout>) throws -> Result) rethrows -> Result
Calls a closure with a mutable pointer to the backing AudioChannelLayout.
func withUnsafePointer<Result>((UnsafePointer<AudioChannelLayout>)
throws -> Result) rethrows -> Result
Calls a closure with a pointer to the backing AudioChannelLayout.
Copyable, Equatable
Instance Properties
Instance Methods
Relationships
Conforms To


## Page 5



