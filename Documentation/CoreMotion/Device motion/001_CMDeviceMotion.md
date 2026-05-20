# 001_CMDeviceMotion.pdf

## Page 1

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


## Page 2

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


## Page 3

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


