# 010_AudioHardwareTap.pdf

## Page 1

init(id: AudioObjectID)
var description: CATapDescription
The CATapDescription that describes the configuration of this tap.
var format: AudioStreamBasicDescription
An AudioStreamBasicDescription that describes the current data format for the tap. This is t
format of the data that will be accessible in any aggregate device that contains the tap.
var uid: String
A String that contains a persistent identifier for the tap. A tap’s UID persists until the tap is
destroyed.
Topics
Initializers
Instance Properties
Instance Methods
Core Audio / AudioHardwareTap
Class
AudioHardwareTap
Instances of the AudioHardwareTap class encapsulate a single audio tap, which
can capture outgoing audio from a process or group of processes, and be used as
an input stream source in an aggregate device.
macOS 15.0+


## Page 2

func setDescription(CATapDescription) throws
Set the description property.
AudioHardwareObject
Sendable, SendableMetatype
Relationships
Inherits From
Conforms To


