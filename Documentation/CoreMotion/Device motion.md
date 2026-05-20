# Device motion.pdf

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


## Page 6

An application receives or samples CMDeviceMotion objects at regular intervals after calling the
startDeviceMotionUpdates(using:to:withHandler:) method, the startDevice
MotionUpdates(to:withHandler:) method, the startDeviceMotionUpdates(using:
method, or the startDeviceMotionUpdates() method of the CMMotionManager class.
The accelerometer measures the sum of two acceleration vectors: gravity and user acceleration.
User acceleration is the acceleration that the user imparts to the device. Because Core Motion is
able to track a device’s attitude using both the gyroscope and the accelerometer, it can
differentiate between gravity and user acceleration. A CMDeviceMotion object provides both
measurements in the gravity and userAcceleration properties.
var attitude: CMAttitude
The attitude of the device.
var rotationRate: CMRotationRate
Overview
Topics
Getting Attitude and Rotation Rate
Core Motion / CMDeviceMotion
Class
CMDeviceMotion
Encapsulated measurements of the attitude, rotation rate, and acceleration of a
device.
iOS 4.0+
iPadOS 4.0+
Mac Catalyst 13.1+
macOS 10.15+
visionOS 1.0+
watchOS 2.0+


## Page 7

The rotation rate of the device.
var gravity: CMAcceleration
The gravity acceleration vector expressed in the device’s reference frame.
var userAcceleration: CMAcceleration
The acceleration that the user is giving to the device.
var magneticField: CMCalibratedMagneticField
Returns the magnetic field vector with respect to the device.
struct CMCalibratedMagneticField
Calibrated magnetic field data and an estimate of the accuracy of the calibration.
enum CMMagneticFieldCalibrationAccuracy
Indicates the calibration accuracy of a magnetic field estimate
var heading: Double
The heading angle (measured in degrees) relative to the current reference frame.
var sensorLocation: CMDeviceMotion.SensorLocation
The location of the sensors that compute the device-motion data.
enum SensorLocation
Defines the device’s sensor locations.
Getting Acceleration Data
Getting the Calibrated Magnetic Field
Getting the Heading
Getting the Sensor Location
Relationships
Inherits From


## Page 8

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
Getting processed device-motion data
Retrieve motion data that the system processed to remove environmental bias, such as the
effects of gravity.
class CMAttitude
The device’s orientation relative to a known frame of reference at a point in time.
struct CMAttitudeReferenceFrame
Constants that indicate the frame of reference for attitude-related motion data.
class CMHeadphoneMotionManager
An object that starts and manages headphone motion services.
Conforms To
See Also
Device motion


## Page 9

The CMAttitude class offers three different mathematical representations of attitude: a rotation
matrix, a quaternion, and Euler angles (roll, pitch, and yaw values). You access CMAttitude
objects through the attitude property of each CMDeviceMotion objects passed to an application
An application starts receiving these device-motion objects as a result of calling the startDevi
MotionUpdates(using:to:withHandler:) method, the startDeviceMotion
Updates(to:withHandler:) method, the startDeviceMotionUpdates(using:) metho
or the startDeviceMotionUpdates() method of the CMMotionManager class.
Note
Core Motion outputs a direction cosine matrix (DCM)—basically a rotation from the last “old”
orientation to the new orientation of the device.
var roll: Double
The roll of the device, in radians.
Overview
Topics
Getting a Mathematical Representation of Attitude as Euler Angles
Core Motion / CMAttitude
Class
CMAttitude
The device’s orientation relative to a known frame of reference at a point in time.
iOS 4.0+
iPadOS 4.0+
Mac Catalyst 13.1+
macOS 10.15+
visionOS 1.0+
watchOS 2.0+


## Page 10

var pitch: Double
The pitch of the device, in radians.
var yaw: Double
The yaw of the device, in radians.
var rotationMatrix: CMRotationMatrix
Returns a rotation matrix representing the device’s attitude.
struct CMRotationMatrix
The type of a structure representing a rotation matrix.
var quaternion: CMQuaternion
Returns a quaternion representing the device’s attitude.
struct CMQuaternion
The type for a quaternion representing a measurement of attitude.
func multiply(byInverseOf: CMAttitude)
Yields the change in attitude given a specific attitude.
NSObject
CVarArg
CustomDebugStringConvertible
Getting a Mathematical Representation of Attitude as a Rotation
Matrix
Getting a Mathematical Representation of Attitude as a Quaternion
Obtaining the Change in Attitude
Relationships
Inherits From
Conforms To


## Page 11

CustomStringConvertible
Equatable
Hashable
NSCoding
NSCopying
NSObjectProtocol
NSSecureCoding
Getting processed device-motion data
Retrieve motion data that the system processed to remove environmental bias, such as the
effects of gravity.
class CMDeviceMotion
Encapsulated measurements of the attitude, rotation rate, and acceleration of a device.
struct CMAttitudeReferenceFrame
Constants that indicate the frame of reference for attitude-related motion data.
class CMHeadphoneMotionManager
An object that starts and manages headphone motion services.
See Also
Device motion


## Page 12

When you start a service that reports the device’s attitude in three-dimensional space, Core Moti
establishes a frame of reference for reporting pitch, roll, and yaw values. All subsequent data
values specify the device attitude relative to this frame of reference. To get a list of the currently
available reference frames for the current device, call the availableAttitudeReference
Frames() class method.
When starting services, it’s your responsibility to specify a reference frame that’s available on the
current device. Services that don’t let you specify a reference frame explicitly rely on the value in
the attitudeReferenceFrame property of CMMotionManager.
static var xArbitraryZVertical: CMAttitudeReferenceFrame
A reference frame where the Z axis is vertical and the X axis points in an arbitrary direction in
the horizontal plane.
static var xArbitraryCorrectedZVertical: CMAttitudeReferenceFrame
Overview
Topics
Getting the reference frames
Core Motion / CMAttitudeReferenceFrame
Structure
CMAttitudeReferenceFrame
Constants that indicate the frame of reference for attitude-related motion data.
iOS 4.0+
iPadOS 4.0+
Mac Catalyst 13.0+
macOS 10.15+
visionOS 1.0+
watchOS 2.0+


## Page 13

A reference frame where the Z axis is vertical and has improved rotation accuracy, and the X
axis points in an arbitrary direction in the horizontal plane.
static var xMagneticNorthZVertical: CMAttitudeReferenceFrame
A reference frame where the Z axis is vertical and the X axis points to the magnetic north po
static var xTrueNorthZVertical: CMAttitudeReferenceFrame
A reference frame where the Z axis is vertical and the X axis points to the geographic north
pole.
init(rawValue: UInt)
BitwiseCopyable
Equatable
ExpressibleByArrayLiteral
OptionSet
RawRepresentable
Sendable
SendableMetatype
SetAlgebra
Getting processed device-motion data
Retrieve motion data that the system processed to remove environmental bias, such as the
effects of gravity.
class CMDeviceMotion
Encapsulated measurements of the attitude, rotation rate, and acceleration of a device.
Initializers
Relationships
Conforms To
See Also
Device motion


## Page 14

class CMAttitude
The device’s orientation relative to a known frame of reference at a point in time.
class CMHeadphoneMotionManager
An object that starts and manages headphone motion services.


## Page 15

Getting processed device-motion data
This class delivers headphone motion updates to your app. Use an instance of the manager to
determine if the device supports motion, and to start and stop updates. Adopt the CMHeadphone
MotionManagerDelegate protocol to receive and respond to motion updates. Before using thi
class, check isDeviceMotionAvailable to make sure the feature is available.
Important
In iOS and macOS, include the NSMotionUsageDescription key in your app’s Info
.plist file. If this key is absent, the system crashes your app when you start device-motion
updates.
To interpret attitude data, you need to know the orientation of the device’s coordinate axes. The
following illustration shows the positive x-axis, positive y-axis, and positive z-axis for motion-
capable Apple headphones.
Mentioned in
Overview
Identify the coordinate axes
Core Motion / CMHeadphoneMotionManager
Class
CMHeadphoneMotionManager
An object that starts and manages headphone motion services.
iOS 14.0+
iPadOS 14.0+
Mac Catalyst 14.0+
macOS 14.0+
watchOS 7.0+


## Page 16

var isDeviceMotionAvailable: Bool
A Boolean value that indicates whether the current device supports the headphone motion
manager.
var isDeviceMotionActive: Bool
A Boolean value that indicates whether the headphone motion manager is active.
var isConnectionStatusActive: Bool
class func authorizationStatus() -> CMAuthorizationStatus
Returns the authorization status for monitoring headphone motion.
func startDeviceMotionUpdates()
Starts device-motion updates.
func startDeviceMotionUpdates(to: OperationQueue, withHandler:
CMHeadphoneMotionManager.DeviceMotionHandler)
Starts device-motion updates with a handler.
func startConnectionStatusUpdates()
func stopDeviceMotionUpdates()
Stops device-motion updates.
func stopConnectionStatusUpdates()
Topics
Checking Availability
Starting and Stopping Updates
Getting the Delegate


## Page 17

var delegate: (any CMHeadphoneMotionManagerDelegate)?
The object that receives headphone motion manager events.
protocol CMHeadphoneMotionManagerDelegate
A set of methods that defines an interface for connecting and disconnecting headphones.
var deviceMotion: CMDeviceMotion?
The latest device-motion data.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Getting processed device-motion data
Retrieve motion data that the system processed to remove environmental bias, such as the
effects of gravity.
class CMDeviceMotion
Encapsulated measurements of the attitude, rotation rate, and acceleration of a device.
Getting Device-Motion Information
Relationships
Inherits From
Conforms To
See Also
Device motion


## Page 18

class CMAttitude
The device’s orientation relative to a known frame of reference at a point in time.
struct CMAttitudeReferenceFrame
Constants that indicate the frame of reference for attitude-related motion data.


