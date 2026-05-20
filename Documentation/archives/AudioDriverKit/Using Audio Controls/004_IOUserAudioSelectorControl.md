# 004_IOUserAudioSelectorControl.pdf

## Page 1

Create
Allocates and initializes an instance of the selector control class.
init
Initializes an instance of a selector control.
IOUserAudioDriver
A DriverKit provider object that manages communications with an audio device.
IOUserAudioObjectPropertyElement
A four character code which, along with the selector and scope, identify a specific piece of
information about an audio object.
IOUserAudioObjectPropertyScope
A four character code which, along with the selector and element, identify a specific piece o
information about an audio object.
Topics
Creating a Selector Control
Freeing a Selector Control
AudioDriverKit / IOUserAudioSelectorControl
Class
IOUserAudioSelectorControl
A control object that supports selecting from a set of values.
DriverKit 21.0+


## Page 2

free
Frees the selector control.
GetClassID
Gets the audio class identifier of the object.
GetBaseClassID
Gets the audio class identifier of the base class object.
IOUserAudioClassID
An identifier for the type of audio object.
HandleChangeSelectedValues
Tells the selection control the value is changing.
SetCurrentSelectedValues
Sets the current selections of the selector.
GetCurrentSelectedValues
Gets the current selections of the selector.
GetControlValuesCount
Gets the number of available selector values.
IOUserAudioSelectorValue
The type of values managed by a selector control.
AddControlValueDescriptions
Add value descriptions to the selector control.
RemoveControlValueDescriptions
Removes value descriptions from the selector control.
GetControlValueDescriptions
Gets value descriptions used by the selector control.
Getting Information About the Class
Supporting Value Changes
Accessing the Selected Values


## Page 3

IOUserAudioSelectorValueDescription
A type that describes a value in a selection control.
IOUserAudioControl
IOUserAudioControl
The base class for audio control objects.
IOUserAudioBooleanControl
A control object that supports setting a Boolean value.
IOUserAudioStereoPanControl
A control object that supports panning between stereo channels.
IOUserAudioSliderControl
A control object that supports setting a 32-bit integer value.
IOUserAudioLevelControl
A control object that supports setting an audio level, with either scalar or decibel values.
Relationships
Inherits From
See Also
Using Audio Controls


