# Using Audio Controls.pdf

## Page 1

Don’t subclass or allocate this class directly.
init
Initializes an instance of an audio control.
IOUserAudioDriver
A DriverKit provider object that manages communications with an audio device.
IOUserAudioObjectPropertyElement
A four character code which, along with the selector and scope, identify a specific piece of
information about an audio object.
IOUserAudioObjectPropertyScope
A four character code which, along with the selector and element, identify a specific piece o
information about an audio object.
Overview
Topics
Creating a Control
AudioDriverKit / IOUserAudioControl
Class
IOUserAudioControl
The base class for audio control objects.
DriverKit 21.0+


## Page 2

free
Frees the audio control.
GetClassID
Gets the audio class identifier of the object.
GetBaseClassID
Gets the audio class identifier of the base class object.
IOUserAudioClassID
An identifier for the type of audio object.
GetControlScope
Returns the control’s scope: input, output, global, or play-through.
IOUserAudioObjectPropertyScope
A four character code which, along with the selector and element, identify a specific piece o
information about an audio object.
GetControlElement
Returns the control’s identifying element.
IOUserAudioObjectPropertyElement
A four character code which, along with the selector and scope, identify a specific piece of
information about an audio object.
IOUserAudioObjectPropertyElementMain
The identifier for an audio object’s main element.
GetIsSettable
Returns a Boolean value that idicates if the control can be set.
Freeing a Control
Getting Information About the Class
Working with Control Properties


## Page 3

IOUserAudioObject
IOUserAudioBooleanControl
IOUserAudioLevelControl
IOUserAudioSelectorControl
IOUserAudioSliderControl
IOUserAudioStereoPanControl
IOUserAudioBooleanControl
A control object that supports setting a Boolean value.
IOUserAudioStereoPanControl
A control object that supports panning between stereo channels.
IOUserAudioSliderControl
A control object that supports setting a 32-bit integer value.
IOUserAudioSelectorControl
A control object that supports selecting from a set of values.
IOUserAudioLevelControl
A control object that supports setting an audio level, with either scalar or decibel values.
Relationships
Inherits From
Inherited By
See Also
Using Audio Controls


## Page 4

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


## Page 5

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


## Page 6

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


## Page 7

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


## Page 8

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


## Page 9

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


## Page 10

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


## Page 11

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


## Page 12

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


## Page 13

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


## Page 14

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


## Page 15

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


## Page 16

Create
Allocates and initializes an instance of the level control class.
init
Initializes an instance of a level control.
IOUserAudioDriver
A DriverKit provider object that manages communications with an audio device.
IOUserAudioLevelControlRange
A type that indicates minimum and maximum values for level controls.
IOUserAudioObjectPropertyElement
A four character code which, along with the selector and scope, identify a specific piece of
information about an audio object.
IOUserAudioObjectPropertyScope
A four character code which, along with the selector and element, identify a specific piece o
information about an audio object.
Topics
Creating a Level Control
AudioDriverKit / IOUserAudioLevelControl
Class
IOUserAudioLevelControl
A control object that supports setting an audio level, with either scalar or decibel
values.
DriverKit 21.0+


## Page 17

free
Frees the level control.
GetClassID
Gets the audio class identifier of the object.
GetBaseClassID
Gets the audio class identifier of the base class object.
IOUserAudioClassID
An identifier for the type of audio object.
HandleChangeScalarValue
Tells the slider control the scalar value is changing.
HandleChangeDecibelValue
Tells the slider control the decibel value is changing.
SetScalarValue
Sets the scalar value of the level control.
GetScalarValue
Gets the scalar value of the level control.
SetDecibelValue
Sets the decibel value of the level control.
GetDecibelValue
Gets the decibel value of the level control.
Freeing a Level Control
Getting Information About the Class
Supporting Value Changes
Accessing the Value


## Page 18

IOUserAudioControl
IOUserAudioControl
The base class for audio control objects.
IOUserAudioBooleanControl
A control object that supports setting a Boolean value.
IOUserAudioStereoPanControl
A control object that supports panning between stereo channels.
IOUserAudioSliderControl
A control object that supports setting a 32-bit integer value.
IOUserAudioSelectorControl
A control object that supports selecting from a set of values.
Relationships
Inherits From
See Also
Using Audio Controls


