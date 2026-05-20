# 000_CMPedometer.pdf

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


