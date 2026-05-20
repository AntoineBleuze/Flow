# 001_AudioConverterFillComplexBufferWithPacketDependencies________________.pdf

## Page 1

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


## Page 2

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


