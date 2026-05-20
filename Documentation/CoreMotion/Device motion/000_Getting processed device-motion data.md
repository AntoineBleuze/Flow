# 000_Getting processed device-motion data.pdf

## Page 1

The Core Motion framework gives you access to the raw data from many different types of
hardware sensors, including accelerometers, gyroscopes, and magnetometers. While the raw dat
is useful, it sometimes contains additional information you don’t need. For example, the raw
accelerometer data contains both the acceleration caused by gravity and by the device’s motion.
To get only the device-specific acceleration, you must remove the gravitational acceleration from
the raw data values. The removal of this data requires additional information and extra processing
time.
To make it easier to get the data you want, the device-motion service processes the raw data and
makes the following values available:
The device’s attitude (or orientation) in three-dimensional space
The unbiased rotation rate of the device
The current gravity vector
The device-specific acceleration (without gravity)
The current magnetic field vector
The device-motion service combines information from multiple sensors to provide the listed
results. Device-motion services are available from CMMotionManager, CMHeadphoneMotion
Manager, and CMBatchedSensorManager. If your app can’t function without accelerometer or
gyroscope data, update your app’s list of required device capabilities to include that hardware. Fo
more information about specifying required device capabilities, see UIRequiredDevice
Capabilities.
Overview
Check for the availability of motion data
Core Motion / Getting processed device-motion data
Article
Getting processed device-motion data
Retrieve motion data that the system processed to remove environmental bias,
such as the effects of gravity.


## Page 2

Device-motion data might be unavailable for a variety of reasons, so verify that the service is
available before you try to start it. Check the value of the isDeviceMotionAvailable propert
of CMMotionManager and make sure it’s true. If it’s false, starting the service doesn’t deliver
any data to your app.
Important
In visionOS, device-motion data is available only when your app has an open immersive space.
For more information, see ImmersiveSpace.
The attitude of a device refers to the amount of rotation around each of the device’s axes. The
device-motion service reports attitude values relative to a known orientation of the device, also
known as the device’s frame of reference. When you start the device-motion service, you specify
which frame of reference you want Core Motion to use.
The default frame of reference is xArbitraryZVertical, which places the z-axis perpendicula
to the ground and matches the x- and y-axes to the device’s current orientation in space. Use this
option or the xArbitraryCorrectedZVertical option to measure changes relative to the
device’s initial starting position. For example, a golf swing analysis app might use this frame of
reference to measure a person’s golf swing. For compass or navigation apps, choose the x
MagneticNorthZVertical or xTrueNorthZVertical frames of reference, which report the
device’s orientation relative to specific magnetic and true north, respectively.
Specify the reference frame you want when you start the device-motion service. The CMMotion
Manager object stores your chosen frame of reference in its attitudeReferenceFrame
property, and makes it the default choice.
When a device’s orientation matches the frame of reference’s orientation, the roll, pitch, and
yaw rotation values of a reported CMAttitude contain the value 0. As a person rotates the devic
the roll, pitch, and yaw values reflect the amount of rotation (in radians) relative to the frame of
reference. The following figure shows how to interpret these values around each axis. Rotation
values are in the range -π to π.
Choose a frame of reference for interpreting attitude data


## Page 3

For information about the coordinate axes of different device types, see CMMotionManager or
CMHeadphoneMotionManager.
To start collecting device-motion data, create a CMMotionManager object and call one of the
appropriate methods. Core Motion offers two options for processing device-motion updates:
Process a steady stream of updates using a closure.
Process updates when you want them.
Both options require you to specify the frequency of updates from the system using the device
MotionUpdateInterval property of your CMMotionManager type. The maximum update
frequency is hardware dependent, but is usually at least 100 Hz. If you specify an update frequen
greater than what the hardware supports, Core Motion uses the maximum frequency instead.
The following example configures the device-motion service to deliver updates 50 times per
second, and to deliver attitude data relative to magnetic north. When starting device motion
without a closure, it’s your responsibility to check the deviceMotion property of your CMMotio
Manager at regular intervals. This example sets up a timer to check the value of the property and
apply the latest data to the app’s content:
Start device-motion updates


## Page 4

To process a steady stream of events, start the device-motion services using an Operation
Queue object and a closure of type CMDeviceMotionHandler. Each time Core Motion receives
new data value, it runs your closure on the operation queue. Each new data value comes with a
timestamp value, which you can use to verify the timeliness of the data and discard data that’s
older than a certain threshold. The following example uses an operation queue to process 60
updates per second:
Stop device-motion updates


## Page 5

To minimize the impact on a device’s battery life, always call the stopDeviceMotionUpdates(
method of your CMMotionManager object when you no longer need motion data. The device-
motion service captures motion data using special hardware, and running this hardware consume
additional power. In particular, stop services:
When your app deactivates or enters the background
When the person stops interacting with the feature that requires motion data
As soon as your app has all the motion data it needs
If your app doesn’t require constant motion updates, start the device-motion service, fetch the
data you need, and stop the service immediately. Don’t leave the service running any longer than
necessary.
class CMDeviceMotion
Encapsulated measurements of the attitude, rotation rate, and acceleration of a device.
class CMAttitude
The device’s orientation relative to a known frame of reference at a point in time.
struct CMAttitudeReferenceFrame
Constants that indicate the frame of reference for attitude-related motion data.
class CMHeadphoneMotionManager
An object that starts and manages headphone motion services.
See Also
Device motion


