# 001_CMGyroData.pdf

## Page 1

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


## Page 2

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


