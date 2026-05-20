# 001_CMPedometerData.pdf

## Page 1

You do not create instances of this class yourself. Instead, you use a CMPedometer object to
request pedometer data from the system. The data for each request is packaged into an instance
of this class and delivered to the handlers you registered with the pedometer object.
var startDate: Date
The start time for the pedometer data.
var endDate: Date
The end time for the pedometer data.
var numberOfSteps: NSNumber
The number of steps taken by the user.
Overview
Topics
Getting the Dates
Getting the Pedestrian Data
Core Motion / CMPedometerData
Class
CMPedometerData
Information about the distance traveled by a user on foot.
iOS 8.0+
iPadOS 8.0+
Mac Catalyst 13.1+
macOS 10.15+
watchOS 2.0+


## Page 2

var distance: NSNumber?
The estimated distance (in meters) traveled by the user.
var averageActivePace: NSNumber?
The average pace of the user, measured in seconds per meter.
var currentPace: NSNumber?
The current pace of the user, measured in seconds per meter.
var currentCadence: NSNumber?
The rate at which steps are taken, measured in steps per second.
var floorsAscended: NSNumber?
The approximate number of floors ascended by walking.
var floorsDescended: NSNumber?
The approximate number of floors descended by walking.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCoding
NSCopying
NSObjectProtocol
NSSecureCoding
Getting the Floor Counts
Relationships
Inherits From
Conforms To


## Page 3

class CMPedometer
An object for fetching the system-generated live walking data.
class CMPedometerEvent
A change in the user’s pedestrian activity.
class CMStepCounter
The number of steps the user has taken with the device.
Deprecated
class CMOdometerData
A class that represents odometer data for workouts.
class CMHighFrequencyHeartRateData
A class that represents heart rate data collected at 1 Hz.
See Also
Pedometer and fitness


