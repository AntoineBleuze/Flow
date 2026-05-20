# 002_IOUserAudioStereoPanControl.pdf

## Page 1

Create
Allocates and initializes an instance of the stereo pan control class.
init
Initializes an instance of a stereo pan control.
IOUserAudioDriver
A DriverKit provider object that manages communications with an audio device.
IOUserAudioObjectPropertyElement
A four character code which, along with the selector and scope, identify a specific piece of
information about an audio object.
IOUserAudioObjectPropertyScope
A four character code which, along with the selector and element, identify a specific piece o
information about an audio object.
Topics
Creating a Stereo Pan Control
Freeing a Stereo Pan Control
AudioDriverKit / IOUserAudioStereoPanControl
Class
IOUserAudioStereoPanControl
A control object that supports panning between stereo channels.
DriverKit 21.0+


## Page 2

free
Frees the stereo pan control.
GetClassID
Gets the audio class identifier of the object.
GetBaseClassID
Gets the audio class identifier of the base class object.
IOUserAudioClassID
An identifier for the type of audio object.
HandleChangeControlValue
Tells the stereo pan control the value is changing.
SetControlValue
Sets the stereo pan value of the control.
GetControlValue
Gets the floating-point stereo pan value of the control.
SetPanningChannels
Sets the current stereo panning channels.
GetPanningChannels
Gets the current stereo panning channels.
Getting Information About the Class
Supporting Value Changes
Accessing the Value
Relationships
Inherits From


## Page 3

IOUserAudioControl
IOUserAudioControl
The base class for audio control objects.
IOUserAudioBooleanControl
A control object that supports setting a Boolean value.
IOUserAudioSliderControl
A control object that supports setting a 32-bit integer value.
IOUserAudioSelectorControl
A control object that supports selecting from a set of values.
IOUserAudioLevelControl
A control object that supports setting an audio level, with either scalar or decibel values.
See Also
Using Audio Controls


