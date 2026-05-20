# Accelerometers.pdf

## Page 1

An accelerometer measures changes in velocity along one axis. All iOS devices have a three-axis
accelerometer, which delivers acceleration values in each of the three axes shown in the next
illustration. The values reported by the accelerometers are measured in increments of the
gravitational acceleration, with the value 1.0 representing an acceleration of 9.8 meters per
second (per second) in the given direction. Acceleration values may be positive or negative
depending on the direction of the acceleration.
You access the raw accelerometer data using the classes of the Core Motion framework.
Specifically, the CMMotionManager class provides the interfaces for enabling the accelerometer
Overview
Core Motion / Getting raw accelerometer events
Article
Getting raw accelerometer events
Retrieve data from the onboard accelerometers.


## Page 2

hardware. When enabling the hardware, choose the interfaces that are best suited for your app.
You can pull the accelerometer data only when you need it, or you can ask the framework to push
updates to your app at regular intervals. Each technique involves different configuration steps and
has a different use case.
Important
If your app relies on the presence of accelerometer hardware, configure the UIRequired
DeviceCapabilities key of its Info.plist file with the accelerometer value. For
more information about the meaning of this key, see Information Property List Key Reference.
For information about the coordinate axes of different device types, see CMMotionManager.
Accelerometer data might be unavailable for a variety of reasons, so verify that the data is availab
before you try to obtain it. Check the value of the isAccelerometerAvailable property of
CMMotionManager and make sure it’s true. If it’s false, starting updates doesn’t deliver any
data to your app.
Important
In visionOS, accelerometer data is available only when your app has an open immersive space.
For more information, see ImmersiveSpace.
For apps that process accelerometer data on their own schedule, such as games, use the start
AccelerometerUpdates() method of CMMotionManager to start the delivery of
accelerometer data. When you call this method, the system enables the accelerometer hardware
and begins updating the accelerometerData property of your CMMotionManager object.
However, the system does not notify you when it updates that property. You must explicitly check
the value of the property when you need the accelerometer data.
Before you start the delivery of accelerometer updates, specify an update frequency by assigning
value to the accelerometerUpdateInterval property. The maximum frequency at which you
can request updates is hardware-dependent but is usually at least 100 Hz. If you request a
frequency that is greater than what the hardware supports, Core Motion uses the supported
maximum instead.
The example below shows a method that configures accelerometer updates to occur 50 times pe
second. The method then configures a timer to fetch those updates at the same frequency and d
Check for the availability of accelerometer data
Get accelerometer data only when you need it


## Page 3

something with the data. You could configure the timer to fire at a lower frequency, but doing so
would waste power by causing the hardware to generate more updates than were actually used.
When you want to capture all of the incoming accelerometer data, perhaps so you can analyze it f
movement patterns, use the startAccelerometerUpdates(to:withHandler:) method of
CMMotionManager. This method pushes each new set of accelerometer values to your app by
executing your handler block on the specified queue. The queueing of these blocks ensures that
your app receives all of the accelerometer data, even if your app becomes busy and is unable to
process updates for a brief period of time.
Before you start the delivery of accelerometer updates, specify an update frequency by assigning
value to the accelerometerUpdateInterval property. The maximum frequency at which you
can request updates is hardware-dependent but is usually at least 100 Hz. If you request a
frequency that is greater than what the hardware supports, Core Motion uses the supported
maximum instead.
Process a steady stream of accelerometer data


## Page 4

The following example shows a method from the MotionGraphs sample code project, which you
can examine for more context. The app displays a real-time graph of accelerometer data. The use
configures the update frequency for the accelerometers using a slider, the changing of which
results in a call to the startUpdatesWithSliderValue: method shown in the example. This
method restarts the accelerometer updates with the new frequency. Each time a new sample is
received, the specified block is queued on the main thread. That block updates the app’s graph
view and labels with the new accelerometer values.
See Also


## Page 5

class CMAccelerometerData
A data sample from the device’s three accelerometers.
class CMRecordedAccelerometerData
A single piece of accelerometer data that was recorded by the device.
class CMSensorRecorder
An object that gathers and retrieves accelerometer data from a device.
class CMSensorDataList
A list of the accelerometer data recorded by the system.
Accelerometers


## Page 6

An application accesses CMAccelerometerData objects through the block handler specified as
the last parameter of the startAccelerometerUpdates(to:withHandler:) method and
through the accelerometerData property, both declared by the CMMotionManager class. Th
superclass of CMAccelerometerData, CMLogItem, defines a timestamp property that record
when the acceleration measurement was taken.
var acceleration: CMAcceleration
The acceleration measured by the accelerometer.
struct CMAcceleration
The type of a structure containing 3-axis acceleration values.
Overview
Topics
Accessing Accelerometer Data
Relationships
Core Motion / CMAccelerometerData
Class
CMAccelerometerData
A data sample from the device’s three accelerometers.
iOS 4.0+
iPadOS 4.0+
Mac Catalyst 13.1+
macOS 10.15+
visionOS 1.0+
watchOS 2.0+


## Page 7

CMLogItem
CMRecordedAccelerometerData
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
class CMRecordedAccelerometerData
A single piece of accelerometer data that was recorded by the device.
class CMSensorRecorder
An object that gathers and retrieves accelerometer data from a device.
class CMSensorDataList
A list of the accelerometer data recorded by the system.
Inherits From
Inherited By
Conforms To
See Also
Accelerometers


## Page 8

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


## Page 9

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


## Page 10

Getting movement disorder symptom data
Use a sensor recorder to initiate the gathering of accelerometer data. Later, use the sensor
recorder to fetch the recorded data so you can analyze it. You might use the recorded data to
assess specific types of motion and incorporate the results into your app.
To use a sensor recorder, create an instance of this class and call the record
Accelerometer(forDuration:) method to begin recording data. You do not need to stop th
recording process explicitly. The system stops recording automatically when the specified time
expires and no other apps extend the recording time. The following example shows how to record
20 minutes worth of accelerometer data:
Mentioned in
Overview
Objective-C
Core Motion / CMSensorRecorder
Class
CMSensorRecorder
An object that gathers and retrieves accelerometer data from a device.
iOS 9.0+
iPadOS 9.0+
Mac Catalyst 13.1+
watchOS 2.0+
Swift


## Page 11

Important
To use this API, you must include the NSMotionUsageDescription key in your app’s Info
.plist file and provide a usage description string for this key. The usage description appears
in the prompt that the user must accept the first time the system asks the user to access
motion data for your app. If you don’t include a usage description string, your app crashes
when you call this API.
class func isAccelerometerRecordingAvailable() -> Bool
Returns a Boolean value indicating whether accelerometer recording is supported on the
current device.
class func authorizationStatus() -> CMAuthorizationStatus
Returns a value indicating whether the app is authorized to record sensor data.
enum CMAuthorizationStatus
The authorization status for motion-related features.
class func isAuthorizedForRecording() -> Bool
Returns a Boolean value indicating whether the app is authorized to record sensor data.
Deprecated
func recordAccelerometer(forDuration: TimeInterval)
Begins recording accelerometer data for the specified period of time.
func accelerometerData(from: Date, to: Date) -> CMSensorDataList?
Retrieves the accelerometer data collected between the specified dates.
Topics
Checking the Availability of Sensor Recording
Recording Accelerometer Data
Retrieving Past Accelerometer Data
Relationships


## Page 12

NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Getting raw accelerometer events
Retrieve data from the onboard accelerometers.
class CMAccelerometerData
A data sample from the device’s three accelerometers.
class CMRecordedAccelerometerData
A single piece of accelerometer data that was recorded by the device.
class CMSensorDataList
A list of the accelerometer data recorded by the system.
Inherits From
Conforms To
See Also
Accelerometers


## Page 13

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


## Page 14

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


