# 003_CMStepCounter.pdf

## Page 1

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


## Page 2

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


## Page 3

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


