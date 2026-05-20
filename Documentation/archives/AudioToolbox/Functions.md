# Functions.pdf

## Page 1

Identical to AudioConverterFillComplexBuffer, with the addition of a realtime-safety guarantee.
Conversions involving only PCM formats – interleaving, deinterleaving, channel count changes,
sample rate conversions – are realtime-safe. Such conversions may use this API in order to obtain
compiler checks involving the CA_REALTIME_API attributes.
At runtime, this function returns kAudioConverterErr_OperationNotSupported if the
conversion requires non-realtime-safe functionality.
Discussion
Audio Toolbox / AudioConverterFillComplexBufferRealtimeSafe(_:_:_:_:_:_:)
Function
AudioConverterFillComplexBuffer
RealtimeSafe(_:_:_:_:_:_:)
iOS 26.0+
iPadOS 26.0+
Mac Catalyst 26.0+
macOS 26.0+
tvOS 26.0+
visionOS 26.0+


## Page 2

inAudioConverter
The audio converter to use for format conversion.
inInputDataProc
A callback function that supplies audio data to convert. This callback is invoked repeatedly as
the converter is ready for new input data.
inInputDataProcUserData
Custom data for use by your application when receiving a callback invocation.
ioOutputDataPacketSize
On input, the size of the output buffer (in the outOutputData parameter), expressed in
number packets in the audio converter’s output format. On output, the number of packets of
Parameters
Audio Toolbox / AudioConverterFillComplexBufferWithPacketDependencies(_:_:_:_:_:_:_:)
Function
AudioConverterFillComplexBufferWith
PacketDependencies(_:_:_:_:_:_:_:)
iOS 26.0+
iPadOS 26.0+
Mac Catalyst 26.0+
macOS 26.0+
tvOS 26.0+
visionOS 26.0+


## Page 3

converted data that were written to the output buffer.
outOutputData
The converted output data is written to this buffer. On entry, the buffers’ mDataByteSize
fields (which must all be the same) reflect buffer capacity. On exit, mDataByteSize is set to
the number of bytes written.
outPacketDescriptions
If not NULL, and if the audio converter’s output format uses packet descriptions, this must
point to a block of memory capable of holding the number of packet descriptions specified in
the ioOutputDataPacketSize parameter. (See Audio Format Services Reference for
functions that let you determine whether an audio format uses packet descriptions). If not
NULL on output and if the audio converter’s output format uses packet descriptions, then thi
parameter contains an array of packet descriptions.
outPacketDependencies
Should point to a memory block capable of holding the number of packet dependency
description structures specified in the ioOutputDataPacketSize parameter. Must not be
NULL. This array will be filled out only by encoders that produce a format which has a non-ze
value for kAudioFormatProperty_FormatEmploysDependentPackets.
A result code.
Converts audio data supplied by a callback function, supporting non-interleaved and packetized
formats, and also supporting packet dependency descriptions.
For output formats that use packet dependency descriptions, this must be used instead of
AudioConverterFillComplexBuffer, which will return an error for such formats.
Return Value
Discussion


## Page 4

inAudioFile
The audio file to write to.
inUseCache
Set to true if you want to cache the data. Otherwise, set to false.
inNumBytes
The number of bytes of audio data being written.
inPacketDescriptions
A pointer to an array of packet descriptions for the audio data. Not all formats require packet
descriptions. If no packet descriptions are required, for instance, if you are writing CBR data,
pass NULL.
Parameters
Audio Toolbox / AudioFileWritePacketsWithDependencies(_:_:_:_:_:_:_:_:)
Function
AudioFileWritePacketsWith
Dependencies(_:_:_:_:_:_:_:_:)
iOS 26.0+
iPadOS 26.0+
Mac Catalyst 26.0+
macOS 26.0+
tvOS 26.0+
visionOS 26.0+


## Page 5

inPacketDependencies
A pointer to an array of packet dependencies for the audio data. This must not be NULL. To
write packets without dependencies, use AudioFileWritePackets(_:_:_:_:_:_:_:)
instead.
inStartingPacket
The packet index for the placement of the first provided packet.
ioNumPackets
On input, a pointer to the number of packets to write. On output, a pointer to the number of
packets actually written.
inBuffer
A pointer to user-allocated memory containing the new audio data to write to the audio data
file.
A result code. See Result Codes.
Write packets of audio data with corresponding packet dependencies to an audio data file.
For all uncompressed formats, packets == frames.
Return Value
Discussion


## Page 6

Anchoring sound to a window or volume
The alert sound has this spatial experience for the duration of its playback and cannot change mid
playback.
Mentioned in
Discussion
Audio Toolbox / AudioServicesPlayAlertSound(_:spatialExperience:)
Function
AudioServicesPlayAlertSound(_:spatial
Experience:)
Play an alert sound with the provided spatial audio experience.
visionOS 26.0+


## Page 7

Anchoring sound to a window or volume
The system sound has this spatial experience for the duration of its playback and cannot change
mid-playback.
Mentioned in
Discussion
Audio Toolbox / AudioServicesPlaySystemSound(_:spatialExperience:)
Function
AudioServicesPlaySystemSound(_:spatia
Experience:)
Play a system sound with the provided spatial audio experience.
visionOS 26.0+


