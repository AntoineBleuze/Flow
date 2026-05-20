# 003_IOUserAudioSliderControl.pdf

## Page 1

Create
Allocates and initializes an instance of the slider control class.
init
Initializes an instance of a slider control.
IOUserAudioObjectPropertyElement
A four character code which, along with the selector and scope, identify a specific piece of
information about an audio object.
IOUserAudioObjectPropertyScope
A four character code which, along with the selector and element, identify a specific piece o
information about an audio object.
IOUserAudioDriver
A DriverKit provider object that manages communications with an audio device.
Topics
Creating a Slider Control
Freeing a Slider Control
AudioDriverKit / IOUserAudioSliderControl
Class
IOUserAudioSliderControl
A control object that supports setting a 32-bit integer value.
DriverKit 21.0+


## Page 2

free
Frees the slider control.
GetClassID
Gets the audio class identifier of the object.
GetBaseClassID
Gets the audio class identifier of the base class object.
IOUserAudioClassID
An identifier for the type of audio object.
HandleChangeControlValue
Tells the slider control the value is changing.
SetControlValue
Sets the value of the slider control.
GetControlValue
Gets the value of the slider control.
SetRange
Sets the range of possible values for the slider.
GetRange
Gets the range of possible values for the slider.
IOUserAudioSliderRange
A type that indicates minimum and maximum values for slider controls.
Getting Information About the Class
Supporting Value Changes
Accessing the Value
Relationships


## Page 3

IOUserAudioControl
IOUserAudioControl
The base class for audio control objects.
IOUserAudioBooleanControl
A control object that supports setting a Boolean value.
IOUserAudioStereoPanControl
A control object that supports panning between stereo channels.
IOUserAudioSelectorControl
A control object that supports selecting from a set of values.
IOUserAudioLevelControl
A control object that supports setting an audio level, with either scalar or decibel values.
Inherits From
See Also
Using Audio Controls


