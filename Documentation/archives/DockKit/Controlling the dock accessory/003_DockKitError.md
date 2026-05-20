# 003_DockKitError.pdf

## Page 1

case invalidParameter
The supplied parameter is invalid.
case notConnected
The dock accessory isn’t connected to a device.
case notSupported
The method isn’t supported on a specific platform.
case notSupportedByDevice
The device doesn’t support the requested operation.
case cameraTCCMissing
The camera terms and conditions are missing.
case frameRateTooHigh
The call rate for the method is too frequent.
Topics
Getting errors
Enumeration Cases
DockKit / DockKitError
Enumeration
DockKitError
A list of errors that DockKit sends.
iOS 17.0+
iPadOS 17.0+
Mac Catalyst 17.0+
macOS 14.0+


## Page 2

case frameRateTooLow
The frame rate is too low to track an object.
case noSubjectFound
There is no subject in the video frame.
Copyable
Equatable
Error
Hashable
LocalizedError
Sendable
SendableMetatype
Controlling a DockKit accessory using your camera app
Follow subjects in real time using an iPhone that you mount on a DockKit accessory.
class DockAccessoryManager
Observe the state of dock accessories and enable or disable system tracking.
class DockAccessory
Obtain accessory information and control tracking behavior.
Relationships
Conforms To
See Also
Controlling the dock accessory


