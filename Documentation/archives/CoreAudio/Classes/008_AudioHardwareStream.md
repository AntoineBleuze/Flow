# 008_AudioHardwareStream.pdf

## Page 1

init(id: AudioObjectID)
var availablePhysicalFormats: [AudioStreamRangedDescription]
An array of AudioStreamRangedDescriptions that describe the available data formats for the
stream. The physical format refers to the data format in which the hardware for the owning
device performs its IO transactions.
var availableVirtualFormats: [AudioStreamRangedDescription]
An array of AudioStreamRangedDescriptions that describe the available data formats for the
stream. The virtual format refers to the data format in which all IOProcs for the owning devic
will perform IO transactions.
var direction: AudioHardwareDirection
An AudioHardwareDirection indicating whether this is an input or output stream.
Topics
Initializers
Instance Properties
Core Audio / AudioHardwareStream
Class
AudioHardwareStream
Instances of the AudioHardwareStream class encapsulate a single audio stream,
which represents a single buffer of data for transferring across the user/kernel
boundary. As such, AudioStreams are the gatekeepers of format information. Each
has its own format and list of available formats.
Mac Catalyst
macOS 15.0+


## Page 2

var isActive: Bool
A Bool where a value of true indicates that the stream is enabled for IO.
var latency: Int
An Int containing the number of frames of latency in the stream.
var physicalFormat: AudioStreamBasicDescription
An AudioStreamBasicDescription that describes the current data format for the stream. The
physical format refers to the data format in which the hardware for the owning device
performs its IO transactions.
var startingChannel: Int
An Int that specifies the first element in the owning device that corresponds to element one 
this stream.
var terminalType: UInt32
A UInt32 whose value describes the general kind of functionality attached to the stream.
Constants for some of the values for this property can be found in the enum in the
AudioStream Constants section of AudioHardwareBase.h.
var virtualFormat: AudioStreamBasicDescription
An AudioStreamBasicDescription that describes the current data format for the stream. The
virtual format refers to the data format in which all IOProcs for the owning device will perform
IO transactions.
func setIsActive(Bool) throws
Set the isActive property.
func setPhysicalFormat(AudioStreamBasicDescription) throws
Set the physicalFormat property.
func setVirtualFormat(AudioStreamBasicDescription) throws
Set the virtualFormat property.
Instance Methods
Relationships
Inherits From


## Page 3

AudioHardwareObject
Sendable, SendableMetatype
Conforms To


