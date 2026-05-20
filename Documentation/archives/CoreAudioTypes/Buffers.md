# Buffers.pdf

## Page 1

An audio buffer holds a single buffer of audio data in its mData field. The buffer can represent tw
types of audio:
A single, monophonic, noninterleaved channel of audio
Interleaved audio with the number of channels set by the mNumberChannels field
Note
The mDataByteSize and mNumberChannels parameters needs to match the memory
layout of mData, so update the size and number of channels when you update the data field.
init()
Creates an empty audio buffer.
Overview
Topics
Creating a Buffer
Core Audio Types / AudioBuffer
Structure
AudioBuffer
A structure that holds a buffer of audio data.
iOS 2.0+
iPadOS 2.0+
macOS 10.0+
tvOS 9.0+
visionOS 1.0+
watchOS 3.0+


## Page 2

init(mNumberChannels: UInt32, mDataByteSize: UInt32, mData: Unsafe
MutableRawPointer?)
Creates an audio buffer with audio data.
var mNumberChannels: UInt32
The number of interleaved channels in the buffer.
var mDataByteSize: UInt32
The number of bytes in the buffer.
var mData: UnsafeMutableRawPointer?
A pointer to a buffer of audio data.
init<Element>(UnsafeMutableBufferPointer<Element>, numberOfChannels: In
)
Initialize an AudioBuffer from an UnsafeMutableBufferPointer<Element>.
BitwiseCopyable
struct AudioBufferList
A structure that stores a variable-length array of audio buffers.
Accessing the Audio
Initializers
Relationships
Conforms To
See Also
Buffers


## Page 3

init()
Creates an empty audio buffer list.
init(mNumberBuffers: UInt32, mBuffers: AudioBuffer)
Creates an audio buffer list with audio buffers.
var mNumberBuffers: UInt32
The number of audio buffers in the list.
var mBuffers: AudioBuffer
A variable-length array of audio buffers.
static func allocate(maximumBuffers: Int) -> UnsafeMutableAudioBuffer
ListPointer
Allocate an AudioBufferList with a capacity for the specified number of AudioBuffers
Topics
Creating a Buffer List
Accessing the Data
Type Methods
Core Audio Types / AudioBufferList
Structure
AudioBufferList
A structure that stores a variable-length array of audio buffers.
iOS 2.0+
iPadOS 2.0+
macOS 10.0+
tvOS 9.0+
visionOS 1.0+
watchOS 3.0+


## Page 4

static func sizeInBytes(maximumBuffers: Int) -> Int
BitwiseCopyable
struct AudioBuffer
A structure that holds a buffer of audio data.
Relationships
Conforms To
See Also
Buffers


