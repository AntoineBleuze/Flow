# 002_CMPedometerEvent.pdf

## Page 1

var date: Date
The date on which the pedometer event was recorded.
var type: CMPedometerEventType
The type of change that occurred.
enum CMPedometerEventType
Constants indicating the change that occurred to the user’s pedestrian activity.
NSObject
Topics
Pedometer Data
Relationships
Inherits From
Conforms To
Core Motion / CMPedometerEvent
Class
CMPedometerEvent
A change in the user’s pedestrian activity.
iOS 10.0+
iPadOS 10.0+
Mac Catalyst 13.1+
macOS 10.15+
visionOS 1.0+
watchOS 3.0+


## Page 2

CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCoding
NSCopying
NSObjectProtocol
NSSecureCoding
class CMPedometer
An object for fetching the system-generated live walking data.
class CMPedometerData
Information about the distance traveled by a user on foot.
class CMStepCounter
The number of steps the user has taken with the device.
Deprecated
class CMOdometerData
A class that represents odometer data for workouts.
class CMHighFrequencyHeartRateData
A class that represents heart rate data collected at 1 Hz.
See Also
Pedometer and fitness


