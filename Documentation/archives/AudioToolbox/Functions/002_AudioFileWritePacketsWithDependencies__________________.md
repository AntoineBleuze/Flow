# 002_AudioFileWritePacketsWithDependencies__________________.pdf

## Page 1

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


## Page 2

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


