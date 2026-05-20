# Pedometer and fitness.pdf

## Page 1

You use a pedometer object to retrieve step counts and other information about the distance
traveled and the number of floors ascended or descended. The pedometer object manages a
cache of historic data that you can query or you can ask for live updates as the data is processed
To use a pedometer object, create an instance of this class and call the appropriate methods. Use
the queryPedometerData(from:to:withHandler:) method to retrieve data that has alrea
been gathered. To get live updates, use the startUpdates(from:withHandler:) method to
start the delivery of events to the handler you provide.
Important
To use this API, you must include the NSMotionUsageDescription key in your app’s Info
.plist file and provide a usage description string for this key. The usage description appears
in the prompt that the user must accept the first time the system asks the user to access
motion data for your app. If you don’t include a usage description string, your app crashes
when you call this API.
Overview
Topics
Core Motion / CMPedometer
Class
CMPedometer
An object for fetching the system-generated live walking data.
iOS 8.0+
iPadOS 8.0+
Mac Catalyst 13.1+
macOS 10.15+
watchOS 2.0+


## Page 2

class func isStepCountingAvailable() -> Bool
Returns a Boolean value indicating whether step counting is available on the current device.
class func isDistanceAvailable() -> Bool
Returns a Boolean value indicating whether distance estimation is available on the current
device.
class func isFloorCountingAvailable() -> Bool
Returns a Boolean value indicating whether floor counting is available on the current device.
class func isPaceAvailable() -> Bool
Returns a Boolean value indicating whether pace information is available on the current
device.
class func isCadenceAvailable() -> Bool
Returns a Boolean value indicating whether cadence information is available on the current
device.
class func isPedometerEventTrackingAvailable() -> Bool
Returns a Boolean value indicating whether pedometer events are available on the current
device.
class func authorizationStatus() -> CMAuthorizationStatus
Returns a value indicating whether the app is authorized to gather pedometer data.
enum CMAuthorizationStatus
The authorization status for motion-related features.
func startUpdates(from: Date, withHandler: CMPedometerHandler)
Starts the delivery of recent pedestrian-related data to your app.
func stopUpdates()
Stops the delivery of recent pedestrian data updates to your app.
func startEventUpdates(handler: CMPedometerEventHandler)
Starts the delivery of pedometer events to your app.
Determining Pedometer Availability
Gathering Live Pedometer Data


## Page 3

func stopEventUpdates()
Stops the delivery of pedometer events to your app.
typealias CMPedometerHandler
A block for processing pedometer-related data.
typealias CMPedometerEventHandler
A block for processing pedometer events.
func queryPedometerData(from: Date, to: Date, withHandler: CMPedometer
Handler)
Retrieves the data between the specified start and end dates.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
class CMPedometerData
Information about the distance traveled by a user on foot.
Fetching Historical Pedometer Data
Relationships
Inherits From
Conforms To
See Also
Pedometer and fitness


## Page 4

class CMPedometerEvent
A change in the user’s pedestrian activity.
class CMStepCounter
The number of steps the user has taken with the device.
Deprecated
class CMOdometerData
A class that represents odometer data for workouts.
class CMHighFrequencyHeartRateData
A class that represents heart rate data collected at 1 Hz.


## Page 5

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


## Page 6

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


## Page 7

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


## Page 8

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


## Page 9

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


## Page 10

Deprecated
Use the CMPedometer class instead.
Step information is gathered on devices with the appropriate built-in hardware and stored so that
you can run queries to determine the user’s recent physical activity. You use this class to gather
both current step data and any historical data.
class func isStepCountingAvailable() -> Bool
Returns a Boolean indicating whether step-counting support is available on the current
device.
Overview
Topics
Determining Step Counting Availability
Starting and Stopping Step Counting Updates
Core Motion / CMStepCounter Deprecated
Class
CMStepCounter Deprecated
The number of steps the user has taken with the device.
iOS 7.0–8.0 Deprecated
iPadOS 7.0–8.0 Deprecated
Mac Catalyst 13.1–13.1 Deprecated
visionOS 1.0–1.0 Deprecated


## Page 11

func startStepCountingUpdates(to: OperationQueue, updateOn: Int, with
Handler: CMStepUpdateHandler)
Starts the delivery of current step-counting data to your app.
func stopStepCountingUpdates()
Stops the delivery of step-counting updates to your app.
typealias CMStepUpdateHandler
A block that reports the number of steps recorded since updates began.
func queryStepCountStarting(from: Date, to: Date, to: OperationQueue,
withHandler: CMStepQueryHandler)
Gathers and returns historical step count data for the specified time period.
typealias CMStepQueryHandler
A block that reports the number of steps for a query operation.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Getting Historical Step Counting Data
Relationships
Inherits From
Conforms To
See Also


## Page 12

class CMPedometer
An object for fetching the system-generated live walking data.
class CMPedometerData
Information about the distance traveled by a user on foot.
class CMPedometerEvent
A change in the user’s pedestrian activity.
class CMOdometerData
A class that represents odometer data for workouts.
class CMHighFrequencyHeartRateData
A class that represents heart rate data collected at 1 Hz.
Pedometer and fitness


## Page 13

To get the measurements, use the speed and slope properties. To compute distances, use the
deltaDistance and deltaAltitude properties.
var speed: CLLocationSpeed
The instantaneous velocity of the device, measured in meters per second.
var slope: Double?
The slope at the location toward the direction of travel, measured in degrees.
var maxAbsSlope: Double?
The maximum absolute slope at the location toward all directions, measured in degrees.
var startDate: Date
Overview
Topics
Getting speed and slope
Getting date and times
Core Motion / CMOdometerData
Class
CMOdometerData
A class that represents odometer data for workouts.
iOS 8.0+
iPadOS 8.0+
Mac Catalyst 13.1+
macOS 10.15+
visionOS 1.0+
watchOS 1.0+


## Page 14

The time that the device starts recording the odometer data.
var endDate: Date
The time that the device stops recording the odometer data.
var gpsDate: Date
The time of the GPS measurement associated with the location.
var deltaDistance: CLLocationDistance
The change in distance that the user travels since the last location, measured in meters.
var deltaAltitude: CLLocationDistance
The change in altitude above mean sea level associated with the location, measured in mete
var speedAccuracy: CLLocationSpeedAccuracy
The accuracy of the speed value.
var verticalAccuracy: CLLocationAccuracy
The validity of the altitude values and their estimated uncertainty, measured in meters.
var deltaDistanceAccuracy: CLLocationAccuracy
The accuracy of the change in distance value.
var originDevice: CMOdometerOriginDevice
The device that measures the data.
enum CMOdometerOriginDevice
The device that the odometer sample originates from.
Measuring distances
Getting the location accuracy
Getting the device
Relationships
Inherits From


## Page 15

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
Sendable
SendableMetatype
class CMPedometer
An object for fetching the system-generated live walking data.
class CMPedometerData
Information about the distance traveled by a user on foot.
class CMPedometerEvent
A change in the user’s pedestrian activity.
class CMStepCounter
The number of steps the user has taken with the device.
Deprecated
class CMHighFrequencyHeartRateData
A class that represents heart rate data collected at 1 Hz.
Conforms To
See Also
Pedometer and fitness


## Page 16

Use the heartRate property to get the data, and the confidence property for the accuracy.
var heartRate: Double
The heart rate value in units of beats per minute (BPM).
var confidence: CMHighFrequencyHeartRateDataConfidence
The confidence level of the heart rate value.
enum CMHighFrequencyHeartRateDataConfidence
The level of confidence in the accuracy of the heart rate data.
var date: Date?
Overview
Topics
Accessing heart rate data
Getting the sample date
Core Motion / CMHighFrequencyHeartRateData
Class
CMHighFrequencyHeartRateData
A class that represents heart rate data collected at 1 Hz.
iOS 17.0+
iPadOS 17.0+
Mac Catalyst 17.0+
watchOS 10.0+


## Page 17

The time the heart rate value occurs.
CMLogItem
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
class CMPedometerEvent
A change in the user’s pedestrian activity.
class CMStepCounter
The number of steps the user has taken with the device.
Deprecated
Relationships
Inherits From
Conforms To
See Also
Pedometer and fitness


## Page 18

class CMOdometerData
A class that represents odometer data for workouts.


