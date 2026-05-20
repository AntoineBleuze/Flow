# Magnetometer.pdf

## Page 1

Your application can obtain samples of magnetometer measurements, as represented by instance
of this class, from the block handler of the startMagnetometerUpdates(to:withHandler
method or from the magnetometerData property of the CMMotionManager class.
Note
The magnetometerData property of CMMotionManager provides a non-nil value only if
you have called the startMagnetometerUpdates() method or the startMagnetometer
Updates(to:withHandler:) method to start magnetometer updates.
var magneticField: CMMagneticField
Returns the magnetic field measured by the magnetometer.
struct CMMagneticField
Overview
Topics
Getting the Field Strength
Core Motion / CMMagnetometerData
Class
CMMagnetometerData
Measurements of the Earth’s magnetic field relative to the device.
iOS 5.0+
iPadOS 5.0+
Mac Catalyst 13.1+
macOS 10.15+
watchOS 2.0+


## Page 2

A structure containing 3-axis magnetometer data
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
Relationships
Inherits From
Conforms To


