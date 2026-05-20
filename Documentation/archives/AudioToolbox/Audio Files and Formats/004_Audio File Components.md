# 004_Audio File Components.pdf

## Page 1

func AudioFileComponentCreateURL(AudioFileComponent, CFURL, Unsafe
Pointer<AudioStreamBasicDescription>, UInt32) -> OSStatus
func AudioFileComponentOpenURL(AudioFileComponent, CFURL, Int8, Int32) 
> OSStatus
func AudioFileComponentOpenWithCallbacks(AudioFileComponent, Unsafe
MutableRawPointer, AudioFile_ReadProc, AudioFile_WriteProc, AudioFile
_GetSizeProc, AudioFile_SetSizeProc) -> OSStatus
func AudioFileComponentCloseFile(AudioFileComponent) -> OSStatus
func AudioFileComponentOptimize(AudioFileComponent) -> OSStatus
typealias AudioFileComponent
typealias AudioFileComponentPropertyID
typealias AudioFileComponentCreateURLProc
typealias AudioFileComponentOpenWithCallbacksProc
typealias AudioFileComponentOpenURLProc
typealias AudioFileComponentCloseProc
typealias AudioFileComponentOptimizeProc
Topics
Opening and Closing Audio Files
Configuring the Callbacks
Audio Toolbox / Audio File Components
API Collection
Audio File Components
Get information about audio file formats, and about files containing audio data.


## Page 2

func AudioFileComponentInitializeWithCallbacks(AudioFileComponent,
UnsafeMutableRawPointer, AudioFile_ReadProc, AudioFile_WriteProc, Audio
File_GetSizeProc, AudioFile_SetSizeProc, UInt32, UnsafePointer<Audio
StreamBasicDescription>, UInt32) -> OSStatus
Audio File Component Selectors
typealias AudioFileComponentInitializeWithCallbacksProc
func AudioFileComponentGetGlobalInfo(AudioFileComponent, AudioFile
ComponentPropertyID, UInt32, UnsafeRawPointer?, UnsafeMutablePointer<
UInt32>, UnsafeMutableRawPointer) -> OSStatus
func AudioFileComponentGetGlobalInfoSize(AudioFileComponent, AudioFile
ComponentPropertyID, UInt32, UnsafeRawPointer?, UnsafeMutablePointer<
UInt32>) -> OSStatus
typealias AudioFileComponentGetGlobalInfoProc
typealias AudioFileComponentGetGlobalInfoSizeProc
func AudioFileComponentGetUserData(AudioFileComponent, UInt32, UInt32,
UnsafeMutablePointer<UInt32>, UnsafeMutableRawPointer) -> OSStatus
func AudioFileComponentSetUserData(AudioFileComponent, UInt32, UInt32,
UInt32, UnsafeRawPointer) -> OSStatus
func AudioFileComponentCountUserData(AudioFileComponent, UInt32, Unsafe
MutablePointer<UInt32>) -> OSStatus
func AudioFileComponentGetUserDataSize(AudioFileComponent, UInt32,
UInt32, UnsafeMutablePointer<UInt32>) -> OSStatus
func AudioFileComponentRemoveUserData(AudioFileComponent, UInt32, UInt3
) -> OSStatus
typealias AudioFileComponentCountUserDataProc
typealias AudioFileComponentGetUserDataProc
typealias AudioFileComponentGetUserDataSizeProc
typealias AudioFileComponentRemoveUserDataProc
typealias AudioFileComponentSetUserDataProc
Getting the Global Information
Accessing the User Data


## Page 3

typealias CountUserDataFDF
typealias GetUserDataFDF
typealias GetUserDataSizeFDF
func AudioFileComponentGetProperty(AudioFileComponent, AudioFile
ComponentPropertyID, UnsafeMutablePointer<UInt32>, UnsafeMutableRaw
Pointer) -> OSStatus
func AudioFileComponentGetPropertyInfo(AudioFileComponent, AudioFile
ComponentPropertyID, UnsafeMutablePointer<UInt32>?, UnsafeMutablePointe
<UInt32>?) -> OSStatus
func AudioFileComponentSetProperty(AudioFileComponent, AudioFile
ComponentPropertyID, UInt32, UnsafeRawPointer) -> OSStatus
typealias AudioFileComponentGetPropertyInfoProc
typealias AudioFileComponentGetPropertyProc
typealias AudioFileComponentSetPropertyProc
Audio File Component Specific Properties
func AudioFileComponentReadBytes(AudioFileComponent, Bool, Int64, Unsaf
MutablePointer<UInt32>, UnsafeMutableRawPointer) -> OSStatus
func AudioFileComponentReadPacketData(AudioFileComponent, Bool, Unsafe
MutablePointer<UInt32>, UnsafeMutablePointer<AudioStreamPacket
Description>?, Int64, UnsafeMutablePointer<UInt32>, UnsafeMutableRaw
Pointer) -> OSStatus
func AudioFileComponentReadPackets(AudioFileComponent, Bool, Unsafe
MutablePointer<UInt32>, UnsafeMutablePointer<AudioStreamPacket
Description>?, Int64, UnsafeMutablePointer<UInt32>, UnsafeMutableRaw
Pointer) -> OSStatus
func AudioFileComponentWriteBytes(AudioFileComponent, Bool, Int64,
UnsafeMutablePointer<UInt32>, UnsafeRawPointer) -> OSStatus
func AudioFileComponentWritePackets(AudioFileComponent, Bool, UInt32,
UnsafePointer<AudioStreamPacketDescription>?, Int64, UnsafeMutable
Pointer<UInt32>, UnsafeRawPointer) -> OSStatus
Accessing Properties
Reading and Writing Data


## Page 4

typealias AudioFileComponentReadBytesProc
typealias AudioFileComponentReadPacketDataProc
typealias AudioFileComponentReadPacketsProc
typealias AudioFileComponentWriteBytesProc
typealias AudioFileComponentWritePacketsProc
func AudioFileComponentFileDataIsThisFormat(AudioFileComponent, UInt32,
UnsafeRawPointer, UnsafeMutablePointer<UInt32>) -> OSStatus
func AudioFileComponentExtensionIsThisFormat(AudioFileComponent,
CFString, UnsafeMutablePointer<UInt32>) -> OSStatus
typealias AudioFileComponentExtensionIsThisFormatProc
typealias AudioFileComponentFileDataIsThisFormatProc
typealias GetPropertyFDF
typealias GetPropertyInfoFDF
Audio Format Services
Access information about audio formats and codecs.
Audio File Services
Read or write a variety of audio data to or from disk or a memory buffer.
Extended Audio File Services
Read and write compressed files and linear PCM audio files using a simplified interface.
Audio File Stream Services
Parse streamed audio files as the data arrives on the user’s computer.
Core Audio File Format
Checking the File Format
See Also
Audio Files and Formats


## Page 5

Parse the structure of Core Audio files.


