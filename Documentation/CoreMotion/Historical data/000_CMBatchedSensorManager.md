# 000_CMBatchedSensorManager.pdf

## Page 1

Getting processed device-motion data
class var authorizationStatus: CMAuthorizationStatus
class var isAccelerometerSupported: Bool
class var isDeviceMotionSupported: Bool
var deviceMotionDataFrequency: Int
var accelerometerDataFrequency: Int
func startDeviceMotionUpdates()
Mentioned in
Topics
Determining authorization and availability
Configuring the update frequency
Collecting device-motion data
Core Motion / CMBatchedSensorManager
Class
CMBatchedSensorManager
iOS 4.0+
iPadOS 4.0+
Mac Catalyst 13.0+
visionOS 1.0+
watchOS 10.0+


## Page 2

func startDeviceMotionUpdates(handler: ([CMDeviceMotion]?, (any Error)?
-> Void)
func stopDeviceMotionUpdates()
var deviceMotionBatch: [CMDeviceMotion]?
func deviceMotionUpdates() -> CMBatchedSensorManager.DeviceMotionUpdate
struct DeviceMotionUpdates
var isDeviceMotionActive: Bool
func startAccelerometerUpdates()
func startAccelerometerUpdates(handler: ([CMAccelerometerData]?, (any
Error)?) -> Void)
func stopAccelerometerUpdates()
var accelerometerBatch: [CMAccelerometerData]?
func accelerometerUpdates() -> CMBatchedSensorManager.Accelerometer
Updates
struct AccelerometerUpdates
var isAccelerometerActive: Bool
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
Collecting accelerometer data
Relationships
Inherits From
Conforms To


## Page 3

NSObjectProtocol


