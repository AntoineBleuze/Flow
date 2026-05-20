# 001_IOUserAudioBooleanControl.pdf

## Page 1

Create
Allocates and initializes an instance of the Boolean control class.
init
Initializes an instance of a Boolean control.
IOUserAudioObjectPropertyElement
A four character code which, along with the selector and scope, identify a specific piece of
information about an audio object.
IOUserAudioObjectPropertyScope
A four character code which, along with the selector and element, identify a specific piece o
information about an audio object.
free
Frees the audio Boolean control.
Topics
Creating a Boolean Control
Freeing a Boolean Control
AudioDriverKit / IOUserAudioBooleanControl
Class
IOUserAudioBooleanControl
A control object that supports setting a Boolean value.
DriverKit 21.0+


## Page 2

GetClassID
Gets the audio class identifier of the object.
GetBaseClassID
Gets the audio class identifier of the base class object.
IOUserAudioClassID
An identifier for the type of audio object.
HandleChangeControlValue
Tells the Boolean control the value is changing.
SetControlValue
Sets the Boolean value of the control.
GetControlValue
Gets the Boolean value of the control.
IOUserAudioControl
Getting Information About the Class
Supporting Value Changes
Accessing the Value
Relationships
Inherits From
See Also
Using Audio Controls


## Page 3

IOUserAudioControl
The base class for audio control objects.
IOUserAudioStereoPanControl
A control object that supports panning between stereo channels.
IOUserAudioSliderControl
A control object that supports setting a 32-bit integer value.
IOUserAudioSelectorControl
A control object that supports selecting from a set of values.
IOUserAudioLevelControl
A control object that supports setting an audio level, with either scalar or decibel values.


