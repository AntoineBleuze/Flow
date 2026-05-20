# 004_CMSensorDataList.pdf

## Page 1

You do not create instances of this class directly. Instead, you receive one as the result of a query
for accelerometer data from a CMSensorRecorder object.
You use a sensor data list object to enumerate over the accelerometer data as shown in the
following example:
Overview
Relationships
Inherits From
Core Motion / CMSensorDataList
Class
CMSensorDataList
A list of the accelerometer data recorded by the system.
iOS 9.0+
iPadOS 9.0+
Mac Catalyst 13.1+
watchOS 2.0+


## Page 2

NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSFastEnumeration
NSObjectProtocol
Getting raw accelerometer events
Retrieve data from the onboard accelerometers.
class CMAccelerometerData
A data sample from the device’s three accelerometers.
class CMRecordedAccelerometerData
A single piece of accelerometer data that was recorded by the device.
class CMSensorRecorder
An object that gathers and retrieves accelerometer data from a device.
Conforms To
See Also
Accelerometers


