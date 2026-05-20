# 005_AudioHardwareObject.pdf

## Page 1

init(id: AudioObjectID)
var baseClassID: AudioClassID
An AudioClassID that identifies the class from which the class of the AudioObject is derived.
This value must always be one of the standard classes.
var classID: AudioClassID
An AudioClassID that identifies the class of the AudioObject.
var creatorBundleID: String
A String that contains the bundle ID of the plug-in that instantiated the object.
Topics
Initializers
Instance Properties
Core Audio / AudioHardwareObject
Class
AudioHardwareObject
The audio HAL provides an abstraction through which applications can access
audio hardware. To do this, the HAL provides a small set of audio objects that
provide access to the various pieces of the system. Audio objects all have a set of
properties that describe and manipulate their state. AudioHardwareObject is a
base class for all other audio objects. As such, all classes inherit this set of
properties.
Mac Catalyst
macOS 15.0+


## Page 2

var delegates: [any PropertyListenerDelegate]
An array of PropertyListenerDelegates used to notify property changes.
var firmwareVersion: String
A String that contains the human readable firmware version for the object.
let id: AudioObjectID
A UInt32 that provides a handle on a specific AudioObject.
var isIdentifying: Bool
A Bool where a value of true indicates that the object’s hardware is drawing attention to itsel
typically by flashing or lighting up its front panel display. A value of false indicates that this
function is turned off. This makes it easy for a user to associate the physical hardware with it
representation in an application. Typically, this property is only supported by
AudioHardwareDevices and AudioHardwareBoxes.
var manufacturer: String
A String that contains the human readable name of the manufacturer of the hardware the
object is a part of.
var modelName: String
A String that contains the human readable model name of the object. The model name differ
from name in that two objects of the same model will have the same value for this property
but may have different values for name.
var name: String
A String that contains the human readable name of the object.
var ownedObjects: [AudioHardwareObject]
An array of AudioHardwareObjects that represent all the objects owned by this object.
var owner: AudioHardwareObject?
An AudioHardwareObject that identifies this object’s owner. Note that all
AudioHardwareObject are owned by some other AudioHardwareObject. The only exception i
the AudioSystemObject, for which the value of this property is nil.
var serialNumber: String
A String that contains the human readable serial number for the object.
func addListener(forProperties: [AudioObjectPropertyAddress], dispatch
Queue: dispatch_queue_t?) throws
Instance Methods


## Page 3

Registers for notifications to be received on the property listener delegates when the given
properties change.
func hasProperty(address: AudioObjectPropertyAddress) -> Bool
Queries an AudioHardwareObject about whether or not it has the given property.
func isPropertySettable(address: AudioObjectPropertyAddress) throws ->
Bool
Queries an AudioHardwareObject about whether or not the given property can be set using
setPropertyValue.
func propertyData(address: AudioObjectPropertyAddress, qualifier: Data?
throws -> Data
Queries an AudioHardwareObject to get the data of the given property.
func propertyDataSize(address: AudioObjectPropertyAddress, qualifier:
Data?) throws -> Int
Queries an AudioHardwareObject to find the size of the data for the given property.
func removeListener(forProperties: [AudioObjectPropertyAddress],
dispatchQueue: dispatch_queue_t?) throws
Unregisters for receiving notifications when the given properties change.
func setCreatorBundleID(String) throws
Set the creatorBundleID property.
func setIsIdentifying(Bool) throws
Set the isIdentifying property.
func setName(String) throws
Set the name property.
func setPropertyData(address: AudioObjectPropertyAddress, qualifier:
Data?, data: Data) throws
Tells an AudioObject to change the value of the given property using the provided data.
func setPropertyData(address: AudioObjectPropertyAddress, qualifier:
Data?, data: inout Data) async throws
Tells an AudioObject to change the value of the given property using the provided data.
Relationships


## Page 4

AudioHardwareBox
AudioHardwareClock
AudioHardwareControl
AudioHardwarePlugin
AudioHardwareProcess
AudioHardwareStream
AudioHardwareSystem
AudioHardwareTap
Sendable, SendableMetatype
Inherited By
Conforms To


