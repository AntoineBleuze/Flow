# Gyroscopes.pdf

## Page 1

A gyroscope measures the rate at which a device rotates around a spatial axis. Many iOS devices
have a three-axis gyroscope, which delivers rotation values in each of the three axes shown in the
next illustration. Rotation values are measured in radians per second around the given axis.
Rotation values may be positive or negative depending on the direction of rotation.
You access the raw gyroscope data using the classes of the Core Motion framework. Specifically,
the CMMotionManager class provides the interfaces for enabling the gyroscope hardware. Whe
enabling the hardware, choose the interfaces that are best suited for your app. You can pull the
Overview
Core Motion / Getting raw gyroscope events
Article
Getting raw gyroscope events
Retrieve data from the onboard gyroscopes.


## Page 2

gyroscope data only when you need it, or you can ask the framework to push updates to your app
at regular intervals. Each technique involves different configuration steps and has a different use
case.
Important
If your app relies on the presence of gyroscope hardware, configure the UIRequiredDevice
Capabilities key of its Info.plist file with the gyroscope value. For more information
about the meaning of this key, see Information Property List Key Reference.
The raw rotation rate data delivered by the gyroscope interfaces may be biased by other factors
such as temperature. If your app requires unbiased rotation values, use the device-motion
interfaces instead. The device-motion interfaces use special algorithms to remove any bias and
deliver more precise rotation values. For more information, see Getting processed device-motion
data.
For information about the coordinate axes of different device types, see CMMotionManager.
Gyroscope data might be unavailable for a variety of reasons, so verify that the data is available
before you try to obtain it. Check the value of the isGyroAvailable property of CMMotion
Manager and make sure it’s true. If it’s false, starting updates doesn’t deliver any data to you
app.
Important
In visionOS, gyroscope data is available only when your app has an open immersive space. For
more information, see ImmersiveSpace.
For apps that process gyroscope data on their own schedule, such as games, use the startGyr
Updates() method of CMMotionManager to start the delivery of rotation data. When you call
this method, the system enables the gyroscope hardware and begins updating the gyroData
property of your CMMotionManager object. However, the system does not notify you when it
updates that property. You must explicitly check the value of the property when you need the
rotation data.
Before you start the delivery of gyroscope updates, specify an update frequency by assigning a
value to the gyroUpdateInterval property. The maximum frequency at which you can reques
Check for the availability of gyroscope data
Get gyroscope data only when you need it


## Page 3

updates is hardware-dependent but is usually at least 100 Hz. If you request a frequency that is
greater than what the hardware supports, Core Motion uses the supported maximum instead.
The next example shows a method that configures gyroscope updates to occur 50 times per
second. The method then configures a timer to fetch those updates at the same frequency and d
something with the data. You could configure the timer to fire at a lower frequency, but doing so
would waste power by causing the hardware to generate more updates than were actually used.
Process a steady stream of gyroscope updates


## Page 4

When you want to capture all of the gyroscope data, perhaps so you can analyze it for movement
patterns, use the startGyroUpdates(to:withHandler:) method of CMMotionManager.
This method pushes each new set of rotation values to your app by executing your handler block
on the specified queue. The queueing of these blocks ensures that your app receives all of the
gyroscope data, even if your app becomes busy and is unable to process updates for a brief perio
of time.
Before you start the delivery of gyroscope updates, specify an update frequency by assigning a
value to the gyroUpdateInterval property. The maximum frequency at which you can reques
updates is hardware-dependent but is usually at least 100 Hz. If you request a frequency that is
greater than what the hardware supports, Core Motion uses the supported maximum instead.
The next example shows a method from the MotionGraphs sample code project, which you can
examine for more context. The app displays a real-time graph of rotation data from the onboard
gyroscopes. The user configures the update frequency for the gyroscopes using a slider, the
changing of which results in a call to the startUpdatesWithSliderValue: method shown in
the example. This method restarts the gyroscope updates with the new frequency. Each time a ne
sample is received, the specified block is queued on the main thread. That block updates the app
graph view and labels with the new rotation values.


## Page 5

class CMGyroData
A single measurement of the device’s rotation rate.
See Also
Gyroscopes


## Page 6

An application receives or samples CMGyroData objects at regular intervals after calling the
startGyroUpdates(to:withHandler:) method or the startGyroUpdates() method of
the CMMotionManager class.
var rotationRate: CMRotationRate
The rotation rate as measured by the device’s gyroscope.
struct CMRotationRate
The type of structures representing a measurement of rotation rate.
class CMRotationRateData
A data object that contains a single rotation-rate measurement.
class CMRecordedRotationRateData
Overview
Topics
Getting the Rotation Rate
Core Motion / CMGyroData
Class
CMGyroData
A single measurement of the device’s rotation rate.
iOS 4.0+
iPadOS 4.0+
Mac Catalyst 13.1+
macOS 10.15+
visionOS 1.0+
watchOS 2.0+


## Page 7

A data object that contains a single rotation-rate measurement at a specific time.
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
Getting raw gyroscope events
Retrieve data from the onboard gyroscopes.
Relationships
Inherits From
Conforms To
See Also
Gyroscopes


