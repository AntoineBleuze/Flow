# 001_AudioBufferList.pdf

## Page 1

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


## Page 2

static func sizeInBytes(maximumBuffers: Int) -> Int
BitwiseCopyable
struct AudioBuffer
A structure that holds a buffer of audio data.
Relationships
Conforms To
See Also
Buffers


