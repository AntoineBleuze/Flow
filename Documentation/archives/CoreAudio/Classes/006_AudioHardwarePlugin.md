# 006_AudioHardwarePlugin.pdf

## Page 1

init(id: AudioObjectID)
var boxes: [AudioHardwareBox]
An array of AudioHardwareBoxes that represent all the box objects currently provided by the
plugin.
var bundleID: String
A String that contains the bundle identifier for the plugin.
var clocks: [AudioHardwareClock]
An array of AudioHardwareClocks that represent all the clock objects currently provided by
the plugin.
var devices: [AudioHardwareDevice]
Topics
Initializers
Instance Properties
Core Audio / AudioHardwarePlugin
Class
AudioHardwarePlugin
Instances of the AudioHardwarePlugin class encapsulate a single audio HAL
plugin, which is a CFBundle loaded by the HAL as a driver to implement device-
specific properties and routines.
Mac Catalyst
macOS 15.0+


## Page 2

An array of AudioHardwareDevices that represent all the devices currently provided by the
plugin.
func box(forUID: String) throws -> AudioHardwareBox?
func clock(forUID: String) throws -> AudioHardwareClock?
func device(forUID: String) throws -> AudioHardwareDevice?
AudioHardwareObject
Sendable, SendableMetatype
Instance Methods
Relationships
Inherits From
Conforms To


