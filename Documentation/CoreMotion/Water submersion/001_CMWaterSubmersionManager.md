# 001_CMWaterSubmersionManager.pdf

## Page 1

Accessing submersion data
Use this class to receive live depth, water pressure, and water temperature data on Apple Watch
Ultra.
Start by assigning a usage description using the NSMotionUsageDescription key in your app
target’s information property list. You also need to include an entitlement to access the live
submersion data.
To access data for dives with a maximum depth of 6 m, add the Shallow Depth and Pressure
capability to your app. For more information, see Adding capabilities to your app.
To enable a maximum depth of 40 m, you must apply for the full Submerged Depth and Pressure
entitlement. For more information, see Express interest in the Submerged Depth and Pressure AP
Mentioned in
Overview
Core Motion / CMWaterSubmersionManager
Class
CMWaterSubmersionManager
An object for managing the collection of pressure and temperature data during
submersion.
iOS 16.0+
iPadOS 16.0+
visionOS 1.0+
watchOS 9.0+


## Page 2

Note
As the wearer approaches the maximum depth, the system sends a measurement with an
CMWaterSubmersionMeasurement.DepthState.approachingMaxDepth submersion
state. When they pass the maximum depth, it sends a CMWaterSubmersionMeasurement
.DepthState.pastMaxDepth state, and if they continue to descent past the maximum
depth, it sends a CMWaterSubmersionMeasurement.DepthState.sensorDepthError
state.
Next, check whether submersion data is available.
If the waterSubmersionAvailable property is true, instantiate a CMWaterSubmersion
Manager object and assign a delegate.
Your delegate then begins receiving updates from the system. For more information, see Accessin
submersion data.
var delegate: (any CMWaterSubmersionManagerDelegate)?
The object that receives updates about submersion data and events.
class var waterSubmersionAvailable: Bool
A Boolean value indicating whether the current device supports the submersion manager.
Topics
Setting the delegate
Checking availability and authorization


## Page 3

class var authorizationStatus: CMAuthorizationStatus
A value indicating whether the app has user authorization to receive submersion data.
var maximumDepth: Measurement<UnitLength>?
The maximum depth supported by the water submersion manager.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Accessing submersion data
Use a water-submersion manager to receive water pressure, temperature, and depth data on
Apple Watch Ultra.
protocol CMWaterSubmersionManagerDelegate
A delegate that receives updates about ambient pressure, water pressure, water temperatur
and submersion events.
class CMWaterSubmersionEvent
Accessing the maximum depth
Relationships
Inherits From
Conforms To
See Also
Water submersion


## Page 4

An event indicating that the device’s submersion state has changed.
class CMWaterSubmersionMeasurement
An update that contains data about the pressure and depth.
class CMWaterTemperature
An update that contains data about the water temperature.


