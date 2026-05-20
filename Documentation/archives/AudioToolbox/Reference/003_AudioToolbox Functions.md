# 003_AudioToolbox Functions.pdf

## Page 1

func AudioComponentValidateWithResults(AudioComponent, CFDictionary?, (
AudioComponentValidationResult, CFDictionary) -> Void) -> OSStatus
func AudioConverterNewWithOptions(UnsafePointer<AudioStreamBasic
Description>, UnsafePointer<AudioStreamBasicDescription>, AudioConverte
Options, UnsafeMutablePointer<AudioConverterRef?>) -> OSStatus
func AudioConverterPrepare(UInt32, UnsafeMutableRawPointer?, ((OSStatus
-> Void)?)
func AudioFileComponentGetUserDataAtOffset(AudioFileComponent, UInt32,
UInt32, Int64, UnsafeMutablePointer<UInt32>, UnsafeMutableRawPointer) -
OSStatus
func AudioFileComponentGetUserDataSize64(AudioFileComponent, UInt32,
UInt32, UnsafeMutablePointer<UInt64>) -> OSStatus
AudioToolbox Structures
AudioToolbox Enumerations
AudioToolbox Constants
Topics
Functions
See Also
Reference
Audio Toolbox / AudioToolbox Functions
API Collection
AudioToolbox Functions


## Page 2

AudioToolbox Data Types


