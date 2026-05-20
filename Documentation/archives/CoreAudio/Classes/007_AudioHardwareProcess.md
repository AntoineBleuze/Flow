# 007_AudioHardwareProcess.pdf

## Page 1

init(id: AudioObjectID)
var bundleID: String?
A String that contains the bundle ID of the process.
var devices: [AudioHardwareDevice]
An array of AudioHardwareDevices that represent the devices currently used by the process
for output.
var isRunning: Bool
A Bool where a value of true indicates that there is audio IO in progress in the process.
var isRunningInput: Bool
A Bool where a value of true indicates that the process is running IO and there is at least one
active input stream.
var isRunningOutput: Bool
Topics
Initializers
Instance Properties
Core Audio / AudioHardwareProcess
Class
AudioHardwareProcess
Instances of the AudioHardwareProcess class encapsulate a single audio process
which contains information about a client process connected to the HAL.
Mac Catalyst
macOS 15.0+


## Page 2

A Bool where a value of true indicates that the process is running IO and there is at least one
active output stream.
var pid: pid_t
A pid_t indicating the process ID associated with the process.
AudioHardwareObject
Sendable, SendableMetatype
Relationships
Inherits From
Conforms To


