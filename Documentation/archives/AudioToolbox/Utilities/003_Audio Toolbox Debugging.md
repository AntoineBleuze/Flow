# 003_Audio Toolbox Debugging.pdf

## Page 1

The AudioToolbox.h header file provides auxiliary functions for obtaining the internal state of a
Core Audio object. Use these functions during development and debugging.
func CAShow(UnsafeMutableRawPointer)
Prints the internal state of an object to stdio.
func CAShowFile(UnsafeMutableRawPointer, UnsafeMutablePointer<FILE>)
Prints the internal state of an object to a file.
func CopyNameFromSoundBank(CFURL, UnsafeMutablePointer<Unmanaged<
CFString>?>) -> OSStatus
Copies the name of a sound bank from a sound bank file at a specified URL.
func CopyInstrumentInfoFromSoundBank(CFURL, UnsafeMutablePointer<
Unmanaged<CFArray>?>) -> OSStatus
var kInstrumentInfoKey_LSB: String
Overview
Topics
Audio Toolbox Debugging Functions
Instrument Functions
Audio Toolbox / Audio Toolbox Debugging
API Collection
Audio Toolbox Debugging
Obtain the internal state of Core Audio objects during the development and
debugging of your code.


## Page 2

var kInstrumentInfoKey_MSB: String
var kInstrumentInfoKey_Name: String
var kInstrumentInfoKey_Program: String
var AUDIO_TOOLBOX_VERSION: Int32
Analyzing audio performance with Instruments
Ensure a smooth and immersive audio experience in your apps using Audio System Trace.
Audio Converter Services
Convert between linear PCM audio formats, and between linear PCM and compressed
formats.
Audio Session Support
Describe the properties that you associate with audio sessions and audio routes.
Workgroup Management
Coordinate the activity of custom real-time audio threads with those of the system and othe
processes.
Audio Codec
Translate audio data from one format to another.
Clock Utilities
Manage time-related information associated with audio playback.
Constants
See Also
Utilities


