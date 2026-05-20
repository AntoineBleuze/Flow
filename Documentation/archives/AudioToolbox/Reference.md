# Reference.pdf

## Page 1

struct AUMIDIEventList
struct AudioConverterOptions
AudioToolbox Enumerations
AudioToolbox Constants
AudioToolbox Functions
AudioToolbox Data Types
Topics
Structures
See Also
Reference
Audio Toolbox / AudioToolbox Structures
API Collection
AudioToolbox Structures


## Page 2

Apple Voice Processing Audio Unit Errors
Anonymous
Anonymous
Anonymous
Anonymous
Anonymous
enum AUSpatialMixerPersonalizedHRTFMode
struct AudioConverterOptions
AudioToolbox Structures
AudioToolbox Constants
AudioToolbox Functions
Topics
Enumerations
See Also
Reference
Audio Toolbox / AudioToolbox Enumerations
API Collection
AudioToolbox Enumerations


## Page 3

AudioToolbox Data Types


## Page 4

var kAudioUnitConfigurationInfo_AvailableArchitectures: String
var kAudioUnitConfigurationInfo_MIDIProtocol: String
var kAudioUnitConfigurationInfo_MigrateFromPlugin: String
AudioToolbox Structures
AudioToolbox Enumerations
AudioToolbox Functions
AudioToolbox Data Types
Topics
Constants
See Also
Reference
Audio Toolbox / AudioToolbox Constants
API Collection
AudioToolbox Constants


## Page 5

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


## Page 6

AudioToolbox Data Types


## Page 7

typealias AUMIDIEventListBlock
typealias AudioFileComponentGetUserDataAtOffsetProc
typealias AudioFileComponentGetUserDataSize64Proc
typealias CallHostBlock
AudioToolbox Structures
AudioToolbox Enumerations
AudioToolbox Constants
AudioToolbox Functions
Topics
Data Types
See Also
Reference
Audio Toolbox / AudioToolbox Data Types
API Collection
AudioToolbox Data Types


