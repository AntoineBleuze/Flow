# 000_IOUserAudioObject.pdf

## Page 1

All classes in the framework subclass IOUserAudioObject, except for IOUserAudioDriver,
which subclasses IOService from DriverKit.
Don’t subclass or instantiate IOUserAudioObject directly.
init
Initializes an instance of the audio object base class.
init
Initializes an empty object.
free
Frees the audio object.
Overview
Topics
Creating an Audio Object
Freeing an Audio Object
AudioDriverKit / IOUserAudioObject
Class
IOUserAudioObject
The base class for most classes in the framework.
DriverKit 21.0+


## Page 2

GetClassID
Gets the audio class identifier of the object.
GetBaseClassID
Gets the audio class identifier of the base class object.
IOUserAudioClassID
An identifier for the type of audio object.
GetObjectID
Gets the object’s identifier.
IOUserAudioObjectID
An identifier that provides a handle on a specific audio object.
GetWorkQueue
Gets the work queue created by the audio object, as a pointer to a dispatch queue.
GetName
Gets the name of the object.
SetName
Sets the name of the object.
AddCustomProperty
Adds a custom property to the audio object.
RemoveCustomProperty
Removes a previously-added custom property object from the audio object.
IOUserAudioCustomProperty
A custom property to associate with audio objects.
Getting Information About the Class
Working with Object Names
Using Custom Properties
Instance Methods


## Page 3

GetElementCategoryName
GetElementName
GetElementNumberName
GetOwnerObjectID
SetElementCategoryName
SetElementName
SetElementNumberName
OSObject
IOUserAudioBox
IOUserAudioClockDevice
IOUserAudioControl
IOUserAudioCustomProperty
IOUserAudioStream
IOUserAudioDriver
A DriverKit provider object that manages communications with an audio device.
DriverKit Audio Family
A Boolean value that indicates whether the device supports audio functionality.
Creating an audio device driver
Relationships
Inherits From
Inherited By
See Also
Essentials


## Page 4

Implement a configurable audio input source as a driver extension that runs in user space in
macOS and iPadOS.


