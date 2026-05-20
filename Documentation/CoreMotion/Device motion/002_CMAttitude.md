# 002_CMAttitude.pdf

## Page 1

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


## Page 2

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


## Page 3

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


