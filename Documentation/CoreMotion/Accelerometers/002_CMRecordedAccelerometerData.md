# 002_CMRecordedAccelerometerData.pdf

## Page 1

You do not create instances of this class directly. Instead, you use a CMSensorRecorder object
to retrieve already recorded data from the system.
var startDate: Date
The wall clock time when the sensor sample was recorded.
var identifier: UInt64
The unique identifier for the accelerometer data.
Overview
Topics
Getting the Accelerometer Data
Relationships
Inherits From
Core Motion / CMRecordedAccelerometerData
Class
CMRecordedAccelerometerData
A single piece of accelerometer data that was recorded by the device.
iOS 9.0+
iPadOS 9.0+
Mac Catalyst 13.1+
visionOS 1.0+
watchOS 2.0+


## Page 2

CMAccelerometerData
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCoding
NSCopying
NSObjectProtocol
NSSecureCoding
Getting raw accelerometer events
Retrieve data from the onboard accelerometers.
class CMAccelerometerData
A data sample from the device’s three accelerometers.
class CMSensorRecorder
An object that gathers and retrieves accelerometer data from a device.
class CMSensorDataList
A list of the accelerometer data recorded by the system.
Conforms To
See Also
Accelerometers


