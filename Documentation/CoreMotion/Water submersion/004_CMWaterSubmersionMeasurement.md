# 004_CMWaterSubmersionMeasurement.pdf

## Page 1

var date: Date
The time and date when the system recorded the measurements.
var depth: Measurement<UnitLength>?
The depth under water.
var pressure: Measurement<UnitPressure>?
The water pressure.
var surfacePressure: Measurement<UnitPressure>
The surface air pressure.
var submersionState: CMWaterSubmersionMeasurement.DepthState
The depth state.
enum DepthState
A state based on the device’s depth under water.
Topics
Accessing the data
Core Motion / CMWaterSubmersionMeasurement
Class
CMWaterSubmersionMeasurement
An update that contains data about the pressure and depth.
iOS 16.0+
iPadOS 16.0+
visionOS 1.0+
watchOS 9.0+


## Page 2

NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCoding
NSCopying
NSObjectProtocol
NSSecureCoding
Accessing submersion data
Use a water-submersion manager to receive water pressure, temperature, and depth data on
Apple Watch Ultra.
class CMWaterSubmersionManager
An object for managing the collection of pressure and temperature data during submersion.
protocol CMWaterSubmersionManagerDelegate
A delegate that receives updates about ambient pressure, water pressure, water temperatur
and submersion events.
class CMWaterSubmersionEvent
An event indicating that the device’s submersion state has changed.
class CMWaterTemperature
Relationships
Inherits From
Conforms To
See Also
Water submersion


## Page 3

An update that contains data about the water temperature.


