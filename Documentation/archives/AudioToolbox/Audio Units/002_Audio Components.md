# 002_Audio Components.pdf

## Page 1

Use the Audio Components API to register and discover audio units, codecs, and other loadable
code modules. This API replaces the Component Manager API used prior to macOS 10.6. The
system searches for loadable bundles with a .audiocomp or .component filename extension in
the following locations:
~/Library/Audio/Plug-Ins/Components
/Library/Audio/Plug-Ins/Components
/System/Library/Components
The bundle Info.plist file needs to contain an AudioComponents item whose value is an arr
of dictionaries. For example:
Overview
Audio Toolbox / Audio Components
API Collection
Audio Components
Find, load, and configure audio components, such as Audio Units and audio
codecs.


## Page 2

Topics
Creating an Audio Component Instance


## Page 3

func AudioComponentInstanceNew(AudioComponent, UnsafeMutablePointer<
AudioComponentInstance?>) -> OSStatus
Creates a new instance of an audio component.
func AudioComponentInstantiate(AudioComponent, AudioComponent
InstantiationOptions, (AudioComponentInstance?, OSStatus) -> Void)
func AudioComponentInstanceDispose(AudioComponentInstance) -> OSStatus
Disposes of an audio component instance.
typealias AudioComponent
An audio component.
struct AudioComponentInstantiationOptions
Audio Component Errors
func AudioComponentRegister(UnsafePointer<AudioComponentDescription>,
CFString, UInt32, AudioComponentFactoryFunction) -> AudioComponent
func AudioComponentCount(UnsafePointer<AudioComponentDescription>) ->
UInt32
Returns the number of audio components that match a specified AudioComponent
Description structure.
func AudioComponentFindNext(AudioComponent?, UnsafePointer<Audio
ComponentDescription>) -> AudioComponent?
Finds the next component that matches a specified AudioComponentDescription
structure after a specified audio component.
func AudioComponentInstanceGetComponent(AudioComponentInstance) -> Audi
Component
Retrieves a reference to an audio component from an instance of that audio component.
struct AudioComponentDescription
Identifying information for an audio component.
typealias AudioComponentInstance
A component instance, or object, is an audio unit or audio codec.
struct AudioComponentFlags
typealias AudioComponentFactoryFunction
Creating an Audio Component Dynamically


## Page 4

func AudioComponentInstanceCanDo(AudioComponentInstance, Int16) -> Bool
Determines if an audio component instance implements a particular function.
func AudioComponentGetDescription(AudioComponent, UnsafeMutablePointer<
AudioComponentDescription>) -> OSStatus
Gets the class description, as an AudioComponentDescription structure, of an audio
component.
func AudioComponentCopyName(AudioComponent, UnsafeMutablePointer<
Unmanaged<CFString>?>) -> OSStatus
Returns the generic name of an audio component.
func AudioComponentGetVersion(AudioComponent, UnsafeMutablePointer<
UInt32>) -> OSStatus
Gets the version of an audio component in hexadecimal form as 0xMMMMmmDD (major, minor,
dot).
func AudioComponentCopyIcon(AudioComponent) -> UIImage?
func AudioComponentCopyConfigurationInfo(AudioComponent, UnsafeMutable
Pointer<Unmanaged<CFDictionary>?>) -> OSStatus
struct AudioComponentPlugInInterface
typealias AudioComponentMethod
func AudioComponentValidate(AudioComponent, CFDictionary?, UnsafeMutabl
Pointer<AudioComponentValidationResult>) -> OSStatus
var kAudioComponentValidationParameter_LoadOutOfProcess: String
enum AudioComponentValidationResult
var kAudioComponentConfigurationInfo_ValidationResult: String
let kAudioComponentInstanceInvalidationNotification: CFString
let kAudioComponentRegistrationsChangedNotification: CFString
Getting Information About a Component
Validating an Audio Component
Constants


## Page 5

var kAudioComponentValidationParameter_ForceValidation: String
var kAudioComponentValidationParameter_TimeOut: String
Generating spatial audio from a multichannel audio stream
Convert 8-channel audio to 2-channel spatial audio by using a spatial mixer audio unit.
Audio Unit v3 Plug-Ins
Deliver custom audio effects, instruments, and other audio behaviors using an Audio Unit v3
app extension.
Audio Unit v2 (C) API
Configure an Audio Unit and prepare it to render audio.
Audio Unit Properties
Obtain information about the built-in mixers, equalizers, filters, effects, and other Audio Unit
app extensions.
Audio Unit Voice I/O
Configure system voice processing and respond to speech events.
See Also
Audio Units


