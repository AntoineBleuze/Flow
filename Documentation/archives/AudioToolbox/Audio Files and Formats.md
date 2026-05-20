# Audio Files and Formats.pdf

## Page 1

This document describes Audio Format Services, a C interface for obtaining information about
audio formats and codecs.
func AudioFormatGetProperty(AudioFormatPropertyID, UInt32, UnsafeRaw
Pointer?, UnsafeMutablePointer<UInt32>?, UnsafeMutableRawPointer?) ->
OSStatus
Gets the value of an audio format property.
func AudioFormatGetPropertyInfo(AudioFormatPropertyID, UInt32, UnsafeRa
Pointer?, UnsafeMutablePointer<UInt32>) -> OSStatus
Gets information about an audio format property.
struct AudioBalanceFade
Describes audio left/right balance and front/back fade values.
struct AudioFormatInfo
A structure that specifies an audio format.
Overview
Topics
Audio Format Services Functions
Data Types
Audio Toolbox / Audio Format Services
API Collection
Audio Format Services
Access information about audio formats and codecs.


## Page 2

struct AudioFormatListItem
struct AudioPanningInfo
Audio panning information.
struct ExtendedAudioFormatInfo
A specifier for the kAudioFormatProperty_FormatList property, including the codec t
use.
typealias AudioFormatPropertyID
A type for four-char codes for audio format property identifiers.
enum AudioBalanceFadeType
Identifiers for audio balance fade types.
Audio Format Property Identifiers
Constants for use with the AudioFormatGetPropertyInfo(_:_:_:_:) and Audio
FormatGetProperty(_:_:_:_:_:) functions.
Audio Codec Component Constants
Audio codec component types.
Audio Codec Manufacturer and Implementation Types
Identifiers for audio codec manufacturers and implementation types.
enum AudioPanningMode
Identifiers for audio panning algorithms.
This table lists the result codes defined for Audio Format Services.
Audio Format Error Codes
var kAudioFormatUnspecifiedError: OSStatus
An unspecified error.
var kAudioFormatUnsupportedPropertyError: OSStatus
The specified property is not supported.
var kAudioFormatBadPropertySizeError: OSStatus
Constants
Result Codes


## Page 3

var kAudioFormatBadSpecifierSizeError: OSStatus
var kAudioFormatUnsupportedDataFormatError: OSStatus
The playback data format is unsupported (declared in AudioFormat.h).
var kAudioFormatUnknownFormatError: OSStatus
The specified data format is not a known format.
Audio File Services
Read or write a variety of audio data to or from disk or a memory buffer.
Extended Audio File Services
Read and write compressed files and linear PCM audio files using a simplified interface.
Audio File Stream Services
Parse streamed audio files as the data arrives on the user’s computer.
Audio File Components
Get information about audio file formats, and about files containing audio data.
Core Audio File Format
Parse the structure of Core Audio files.
See Also
Audio Files and Formats


## Page 4

This document describes Audio File Services, a C programming interface that enables you to read
or write a wide variety of audio data to or from disk or a memory buffer.
With Audio File Services you can:
Create, initialize, open, and close audio files
Read and write audio files
Optimize audio files
Work with user data and global information
func AudioFileCreateWithURL(CFURL, AudioFileTypeID, UnsafePointer<Audio
StreamBasicDescription>, AudioFileFlags, UnsafeMutablePointer<AudioFile
ID?>) -> OSStatus
Creates a new audio file, or initializes an existing file, specified by a URL.
func AudioFileInitializeWithCallbacks(UnsafeMutableRawPointer, AudioFil
_ReadProc, AudioFile_WriteProc, AudioFile_GetSizeProc, AudioFile_SetSiz
Proc, AudioFileTypeID, UnsafePointer<AudioStreamBasicDescription>, Audi
FileFlags, UnsafeMutablePointer<AudioFileID?>) -> OSStatus
Deletes the content of an existing file and assigns callbacks to the audio file object.
Overview
Topics
Creating and Initializing Audio Files
Audio Toolbox / Audio File Services
API Collection
Audio File Services
Read or write a variety of audio data to or from disk or a memory buffer.


## Page 5

func AudioFileOpenURL(CFURL, AudioFilePermissions, AudioFileTypeID,
UnsafeMutablePointer<AudioFileID?>) -> OSStatus
Open an existing audio file specified by a URL.
func AudioFileOpenWithCallbacks(UnsafeMutableRawPointer, AudioFile_Read
Proc, AudioFile_WriteProc?, AudioFile_GetSizeProc, AudioFile_SetSizePro
?, AudioFileTypeID, UnsafeMutablePointer<AudioFileID?>) -> OSStatus
Opens an existing file with callbacks you provide.
func AudioFileClose(AudioFileID) -> OSStatus
Closes an audio file.
func AudioFileReadBytes(AudioFileID, Bool, Int64, UnsafeMutablePointer<
UInt32>, UnsafeMutableRawPointer) -> OSStatus
Reads bytes of audio data from an audio file.
func AudioFileWriteBytes(AudioFileID, Bool, Int64, UnsafeMutablePointer
UInt32>, UnsafeRawPointer) -> OSStatus
Writes bytes of audio data to an audio file.
func AudioFileReadPacketData(AudioFileID, Bool, UnsafeMutablePointer<
UInt32>, UnsafeMutablePointer<AudioStreamPacketDescription>?, Int64,
UnsafeMutablePointer<UInt32>, UnsafeMutableRawPointer?) -> OSStatus
Reads packets of audio data from an audio file.
func AudioFileWritePackets(AudioFileID, Bool, UInt32, UnsafePointer<
AudioStreamPacketDescription>?, Int64, UnsafeMutablePointer<UInt32>,
UnsafeRawPointer) -> OSStatus
Writes packets of audio data to an audio data file.
func AudioFileGetProperty(AudioFileID, AudioFilePropertyID, Unsafe
MutablePointer<UInt32>, UnsafeMutableRawPointer) -> OSStatus
Gets the value of an audio file property.
Opening and Closing Audio Files
Reading and Writing Audio Files
Getting and Setting Audio File Properties


## Page 6

func AudioFileGetPropertyInfo(AudioFileID, AudioFilePropertyID, Unsafe
MutablePointer<UInt32>?, UnsafeMutablePointer<UInt32>?) -> OSStatus
Gets information about an audio file property, including the size of the property value and
whether the value is writable.
func AudioFileSetProperty(AudioFileID, AudioFilePropertyID, UInt32,
UnsafeRawPointer) -> OSStatus
Sets the value of an audio file property
func AudioFileCountUserData(AudioFileID, UInt32, UnsafeMutablePointer<
UInt32>) -> OSStatus
Gets the number of user data items with a specified ID in a file.
func AudioFileGetUserDataSize(AudioFileID, UInt32, UInt32, UnsafeMutabl
Pointer<UInt32>) -> OSStatus
Gets the size of a user data item in an audio file.
func AudioFileGetUserDataSize64(AudioFileID, UInt32, UInt32, Unsafe
MutablePointer<UInt64>) -> OSStatus
Gets the size of a user data item in an audio file.
func AudioFileGetUserData(AudioFileID, UInt32, UInt32, UnsafeMutable
Pointer<UInt32>, UnsafeMutableRawPointer) -> OSStatus
Gets a chunk from an audio file.
func AudioFileGetUserDataAtOffset(AudioFileID, UInt32, UInt32, Int64,
UnsafeMutablePointer<UInt32>, UnsafeMutableRawPointer) -> OSStatus
Gets part of the data from a chunk in an audio file.
func AudioFileSetUserData(AudioFileID, UInt32, UInt32, UInt32, UnsafeRa
Pointer) -> OSStatus
Sets a user data item in an audio file.
func AudioFileRemoveUserData(AudioFileID, UInt32, UInt32) -> OSStatus
Removes a user data item from an audio file.
func AudioFileGetGlobalInfoSize(AudioFilePropertyID, UInt32, Unsafe
MutableRawPointer?, UnsafeMutablePointer<UInt32>) -> OSStatus
Working with User Data
Working with Global Information


## Page 7

Gets the size of a global audio file property.
func AudioFileGetGlobalInfo(AudioFilePropertyID, UInt32, UnsafeMutable
RawPointer?, UnsafeMutablePointer<UInt32>, UnsafeMutableRawPointer) ->
OSStatus
Copies the value of a global property into a buffer.
func AudioFileOptimize(AudioFileID) -> OSStatus
Consolidates audio data and performs other internal optimizations of the file structure.
func NextAudioFileRegion(UnsafePointer<AudioFileRegion>) -> Unsafe
MutablePointer<AudioFileRegion>
Finds the next audio file region in a region list.
func NumAudioFileMarkersToNumBytes(Int) -> Int
Returns the number of bytes corresponding to a specified number of audio file markers.
func NumBytesToNumAudioFileMarkers(Int) -> Int
A macro that returns the number of audio file markers represented by a specified number of
bytes.
typealias AudioFile_ReadProc
Reads audio data when used in conjunction with the AudioFileOpenWithCallbacks(_:
_:_:_:_:_:_:) or AudioFileInitializeWithCallbacks(_:_:_:_:_:_:_:_:_:)
functions.)
typealias AudioFile_WriteProc
A callback for writing file data when used in conjunction with the AudioFileOpenWith
Callbacks(_:_:_:_:_:_:_:) or AudioFileCreateWithURL(_:_:_:_:_:)
functions.
typealias AudioFile_GetSizeProc
Gets file data size.
typealias AudioFile_SetSizeProc
Sets file data size.
Optimizing Audio Files
Parsing Audio File Content
Callbacks


## Page 8

struct AudioBytePacketTranslationFlags
struct AudioFileFlags
struct AudioFileRegionFlags
Flags that specify a playback direction for an audio file region structure.
struct AudioFileStreamParseFlags
struct AudioFileStreamPropertyFlags
struct AudioFileStreamSeekFlags
typealias AudioFileID
An opaque data type that represents an audio file object.
typealias AudioFilePropertyID
An audio file property identifier.
struct AudioFile_SMPTE_Time
A data structure for describing SMPTE (Society of Motion Picture and Television Engineers)
time.
struct AudioFileMarker
Annotates a position in an audio file.
struct AudioFileMarkerList
A list of markers associated with an audio file, including their SMPTE time type, the number o
markers, and the markers themselves.
struct AudioFileRegion
An audio file region specifies a segment of audio data.
struct AudioFileRegionList
A list of the audio file regions in a file.
struct AudioFramePacketTranslation
A structure that specifies frame and packet translations.
struct AudioBytePacketTranslation
A data structure used by the kAudioFilePropertyByteToPacket and kAudioFile
PropertyPacketToByte properties.
Data Types


## Page 9

struct AudioFilePacketTableInfo
Contains information about the number of valid frames in a file and where they begin and en
struct AudioFileTypeAndFormatID
A specifier for the constantkAudioFileGlobalInfo_AvailableStreamDescription
ForFormat.
struct AudioIndependentPacketTranslation
struct AudioPacketDependencyInfoTranslation
struct AudioPacketRangeByteCountTranslation
struct AudioPacketRollDistanceTranslation
struct AudioBytePacketTranslationFlags
struct AudioFileFlags
enum AudioFilePermissions
Flags for use when opening an audio file.
struct AudioFileRegionFlags
Flags that specify a playback direction for an audio file region structure.
struct AudioFileStreamParseFlags
struct AudioFileStreamPropertyFlags
struct AudioFileStreamSeekFlags
typealias AudioFileTypeID
Operating system constants that indicate the type of file to be written or a hint about what
type of file to expect from data provided.
Audio File Creation Flags
Flags to set when creating an audio file.
enum AudioFilePermissions
Flags for use when opening an audio file.
Audio File Loop Direction Constants
Enumerations
Constants


## Page 10

The playback direction of a looped segment of an audio file.
Audio File Marker Types
A type of marker within a file used in the mType field of the AudioFileMarker structure.
struct AudioFileRegionFlags
Flags that specify a playback direction for an audio file region structure.
Audio File Packet Translation Flags
Flags specified in a packet translation structure.
Info String Keys
Key values of properties to get and set using Audio File Services functions and provide a
common way to get the same information out of several different kinds of files.
Audio File Properties
Properties used by the functions described in getting and setting pieces of data in audio file
See Working with Global Information for details.
Audio File Global Info Properties
Access these properties using the functions described in Working with Global Information.
This table lists the result codes defined for Audio File Services.
var kAudioFileUnspecifiedError: OSStatus
An unspecified error has occurred.
var kAudioFileUnsupportedFileTypeError: OSStatus
The file type is not supported.
var kAudioFileUnsupportedDataFormatError: OSStatus
The data format is not supported by this file type.
var kAudioFileUnsupportedPropertyError: OSStatus
The property is not supported.
var kAudioFileBadPropertySizeError: OSStatus
The size of the property data was not correct.
var kAudioFilePermissionsError: OSStatus
The operation violated the file permissions. For example, an attempt was made to write to a
file opened with the kAudioFileReadPermission constant.
Result Codes


## Page 11

var kAudioFileNotOptimizedError: OSStatus
The chunks following the audio data chunk are preventing the extension of the audio data
chunk. To write more data, you must optimize the file.
var kAudioFileInvalidChunkError: OSStatus
Either the chunk does not exist in the file or it is not supported by the file.
var kAudioFileDoesNotAllow64BitDataSizeError: OSStatus
The file offset was too large for the file type. The AIFF and WAVE file format types have 32-b
file size limits.
var kAudioFileInvalidPacketOffsetError: OSStatus
A packet offset was past the end of the file, or not at the end of the file when a VBR format
was written, or a corrupt packet size was read when the packet table was built.
var kAudioFileInvalidFileError: OSStatus
The file is malformed, or otherwise not a valid instance of an audio file of its type.
var kAudioFileOperationNotSupportedError: OSStatus
The operation cannot be performed.
var kAudioFileNotOpenError: OSStatus
The file is closed.
var kAudioFileEndOfFileError: OSStatus
End of file.
var kAudioFilePositionError: OSStatus
Invalid file position.
var kAudioFileFileNotFoundError: OSStatus
File not found.
Audio Format Services
Access information about audio formats and codecs.
See Also
Audio Files and Formats


## Page 12

Extended Audio File Services
Read and write compressed files and linear PCM audio files using a simplified interface.
Audio File Stream Services
Parse streamed audio files as the data arrives on the user’s computer.
Audio File Components
Get information about audio file formats, and about files containing audio data.
Core Audio File Format
Parse the structure of Core Audio files.


## Page 13

Extended Audio File Services provides simplified audio file access, combining features of Audio F
Services and Audio Converter Services. It provides a unified interface for reading and writing
compressed as well as linear PCM audio files.
func ExtAudioFileCreateWithURL(CFURL, AudioFileTypeID, UnsafePointer<
AudioStreamBasicDescription>, UnsafePointer<AudioChannelLayout>?, UInt3
, UnsafeMutablePointer<ExtAudioFileRef?>) -> OSStatus
Creates a new audio file and associates it with a new extended audio file object.
func ExtAudioFileDispose(ExtAudioFileRef) -> OSStatus
Disposes of an extended audio file object and closes the associated file.
func ExtAudioFileOpenURL(CFURL, UnsafeMutablePointer<ExtAudioFileRef?>)
-> OSStatus
Opens an existing audio file for reading, and associates it with a new extended audio file
object.
func ExtAudioFileWrapAudioFileID(AudioFileID, Bool, UnsafeMutablePointe
<ExtAudioFileRef?>) -> OSStatus
Overview
Topics
Managing Extended Audio File Objects
Audio Toolbox / Extended Audio File Services
API Collection
Extended Audio File Services
Read and write compressed files and linear PCM audio files using a simplified
interface.


## Page 14

Wraps an audio file object in an extended audio file object.
func ExtAudioFileGetProperty(ExtAudioFileRef, ExtAudioFilePropertyID,
UnsafeMutablePointer<UInt32>, UnsafeMutableRawPointer) -> OSStatus
Gets a property value from an extended audio file object.
func ExtAudioFileGetPropertyInfo(ExtAudioFileRef, ExtAudioFilePropertyI
, UnsafeMutablePointer<UInt32>?, UnsafeMutablePointer<DarwinBoolean>?) 
> OSStatus
Gets information about an extended audio file object property.
func ExtAudioFileSetProperty(ExtAudioFileRef, ExtAudioFilePropertyID,
UInt32, UnsafeRawPointer) -> OSStatus
Sets a property value for an extended audio file object.
func ExtAudioFileRead(ExtAudioFileRef, UnsafeMutablePointer<UInt32>,
UnsafeMutablePointer<AudioBufferList>) -> OSStatus
Performs a synchronous, sequential read operation on an audio file.
func ExtAudioFileSeek(ExtAudioFileRef, Int64) -> OSStatus
Seeks to a specified frame in a file.
func ExtAudioFileTell(ExtAudioFileRef, UnsafeMutablePointer<Int64>) ->
OSStatus
Gets an audio file’s read/write position.
func ExtAudioFileWrite(ExtAudioFileRef, UInt32, UnsafePointer<Audio
BufferList>) -> OSStatus
Performs a synchronous, sequential write operation on an audio file.
func ExtAudioFileWriteAsync(ExtAudioFileRef, UInt32, UnsafePointer<Audi
BufferList>?) -> OSStatus
Perform an asynchronous, sequential write operation on an audio file.
typealias ExtAudioFilePacketTableInfoOverride
Configuring Properties for Extended Audio File Objects
Reading and Writing Audio Data
Data Types


## Page 15

typealias ExtAudioFileRef
An opaque structure representing an extended audio file object.
typealias ExtAudioFilePropertyID
An audio file object property identifier.
Extended Audio FIle Errors
Codec Unavailable Errors
Property Identifiers for Extended Audio File Objects
Extended Audio File Packet Overrides
This table lists result codes defined for Extended Audio File Services.
var kExtAudioFileError_CodecUnavailableInputConsumed: OSStatus
The ExtAudioFileWrite(_:_:_:) function was interrupted and the last buffer that you
provided was successfully written to disk.
var kExtAudioFileError_CodecUnavailableInputNotConsumed: OSStatus
The ExtAudioFileWrite(_:_:_:) function was interrupted and the last buffer that you
provided was not successfully written to disk.
var kExtAudioFileError_InvalidProperty: OSStatus
var kExtAudioFileError_InvalidPropertySize: OSStatus
var kExtAudioFileError_NonPCMClientFormat: OSStatus
var kExtAudioFileError_InvalidChannelMap: OSStatus
The number of channels does not match the specified format.
var kExtAudioFileError_InvalidOperationOrder: OSStatus
var kExtAudioFileError_InvalidDataFormat: OSStatus
var kExtAudioFileError_MaxPacketSizeUnknown: OSStatus
var kExtAudioFileError_InvalidSeek: OSStatus
An attempt to write, or an offset, is out of bounds.
var kExtAudioFileError_AsyncWriteTooLarge: OSStatus
Constants
Result Codes


## Page 16

var kExtAudioFileError_AsyncWriteBufferOverflow: OSStatus
An asynchronous write operation could not be completed in time.
Audio Format Services
Access information about audio formats and codecs.
Audio File Services
Read or write a variety of audio data to or from disk or a memory buffer.
Audio File Stream Services
Parse streamed audio files as the data arrives on the user’s computer.
Audio File Components
Get information about audio file formats, and about files containing audio data.
Core Audio File Format
Parse the structure of Core Audio files.
See Also
Audio Files and Formats


## Page 17

Audio File Stream Services provides the interface for parsing streamed audio files—in which only 
limited window of data is available at a time.
Audio file streams, by nature, are not random access. When you request data from a stream, earli
data might no longer be accessible and later data might not yet be available. In addition, the data
you obtain (and then provide to a parser) might include partial packets. To parse streamed audio
data, then, a parser must remember data from partially satisfied requests, and must be able to wa
for the remainder of that data. In other words, a parser must be able to suspend parsing as neede
and then resume where it left off.
To use a parser, you pass data from a streamed audio file, as you acquire it, to the parser. When t
parser has a complete packet of audio data or a complete property, it invokes a callback function.
Your callbacks then process the parsed data—such as by playing it or writing it to disk.
Here, in outline form, is a typical usage pattern for an audio file stream parser:
1. Create a new audio file stream parser by calling the AudioFileStreamOpen(_:_:_:_:_:)
function. Pass pointers to your callback functions for audio data and metadata (AudioFile
Stream_PacketsProc and AudioFileStream_PropertyListenerProc). The Audio
FileStreamOpen(_:_:_:_:_:) function gives you a reference to the new parser.
2. Acquire some streamed data. Call the AudioFileStreamParseBytes(_:_:_:_:) function
when you have data to pass to the parser. Send the data to the parser sequentially and, if
possible, without gaps.
3. When the parser acquires a usable buffer of audio data, it invokes your audio data callback. Yo
callback can then play the data, write it to a file, or otherwise process it.
4. When the parser acquires metadata, it invokes your property callback—which in turn can obtain
the property value by calling the AudioFileStreamGetPropertyInfo(_:_:_:_:) and
AudioFileStreamGetProperty(_:_:_:_:) functions.
Overview
Audio Toolbox / Audio File Stream Services
API Collection
Audio File Stream Services
Parse streamed audio files as the data arrives on the user’s computer.


## Page 18

5. When finished parsing a stream, call the AudioFileStreamClose(_:) function to close and
deallocate the parser.
Audio File Stream Services supports the following audio data types:
AIFF
AIFC
WAVE
CAF
NeXT
ADTS
MPEG Audio Layer 3
AAC
func AudioFileStreamOpen(UnsafeMutableRawPointer?, AudioFileStream
_PropertyListenerProc, AudioFileStream_PacketsProc, AudioFileTypeID,
UnsafeMutablePointer<AudioFileStreamID?>) -> OSStatus
Creates and opens a new audio file stream parser.
func AudioFileStreamParseBytes(AudioFileStreamID, UInt32, UnsafeRaw
Pointer?, AudioFileStreamParseFlags) -> OSStatus
Passes audio file stream data to the parser.
func AudioFileStreamSeek(AudioFileStreamID, Int64, UnsafeMutablePointer
Int64>, UnsafeMutablePointer<AudioFileStreamSeekFlags>) -> OSStatus
Provides a byte offset for a specified packet in the data stream.
Topics
Opening Audio File Streams
Supplying Data to the Parser
Seeking Packets in the Data Stream
Working with Data Stream Property Information


## Page 19

func AudioFileStreamGetPropertyInfo(AudioFileStreamID, AudioFileStream
PropertyID, UnsafeMutablePointer<UInt32>?, UnsafeMutablePointer<Darwin
Boolean>?) -> OSStatus
Retrieves information about a property value.
func AudioFileStreamGetProperty(AudioFileStreamID, AudioFileStream
PropertyID, UnsafeMutablePointer<UInt32>, UnsafeMutableRawPointer) ->
OSStatus
Retrieves the value of the specified property.
func AudioFileStreamSetProperty(AudioFileStreamID, AudioFileStream
PropertyID, UInt32, UnsafeRawPointer) -> OSStatus
Sets the value of the specified property.
func AudioFileStreamClose(AudioFileStreamID) -> OSStatus
Closes and deallocates the specified audio file stream parser.
typealias AudioFileStream_PropertyListenerProc
Invoked by an audio file stream parser when it finds a property value in the audio file stream.
typealias AudioFileStream_PacketsProc
Invoked by an audio file stream parser when it finds audio data in the audio file stream.
typealias AudioFileStreamPropertyID
Uniquely identifies an audio file stream property.
typealias AudioFileStreamID
Defines an opaque data type that represents an audio file stream parser.
Audio File Stream Errors
Audio File Types
Closing an Audio File Stream
Callbacks
Data Types
Enumerations


## Page 20

Audio File Stream Flags
Flags set by the property listener callback and the AudioFileStreamParseBytes(_:_:
_:_:) function.
Audio File Stream Properties
Audio file stream properties contain information that you can use to help interpret the audio
data in a stream.
This table lists the result codes defined for Audio File Stream Services.
Audio File Errors
var kAudioFileStreamError_UnsupportedFileType: OSStatus
The specified file type is not supported.
var kAudioFileStreamError_UnsupportedDataFormat: OSStatus
The data format is not supported by the specified file type.
var kAudioFileStreamError_UnsupportedProperty: OSStatus
The property is not supported.
var kAudioFileStreamError_BadPropertySize: OSStatus
The size of the buffer you provided for property data was not correct.
var kAudioFileStreamError_NotOptimized: OSStatus
It is not possible to produce output packets because the streamed audio file’s packet table o
other defining information is not present or appears after the audio data.
var kAudioFileStreamError_InvalidPacketOffset: OSStatus
A packet offset was less than 0, or past the end of the file, or a corrupt packet size was read
when building the packet table.
var kAudioFileStreamError_InvalidFile: OSStatus
The file is malformed, not a valid instance of an audio file of its type, or not recognized as an
audio file.
var kAudioFileStreamError_ValueUnknown: OSStatus
The property value is not present in this file before the audio data.
Constants
Result Codes


## Page 21

var kAudioFileStreamError_DataUnavailable: OSStatus
The amount of data provided to the parser was insufficient to produce any result.
var kAudioFileStreamError_IllegalOperation: OSStatus
An illegal operation was attempted.
var kAudioFileStreamError_UnspecifiedError: OSStatus
An unspecified error has occurred.
var kAudioFileStreamError_DiscontinuityCantRecover: OSStatus
A discontinuity has occurred in the audio data, and Audio File Stream Services cannot recove
Audio Format Services
Access information about audio formats and codecs.
Audio File Services
Read or write a variety of audio data to or from disk or a memory buffer.
Extended Audio File Services
Read and write compressed files and linear PCM audio files using a simplified interface.
Audio File Components
Get information about audio file formats, and about files containing audio data.
Core Audio File Format
Parse the structure of Core Audio files.
See Also
Audio Files and Formats


## Page 22

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


## Page 23

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


## Page 24

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


## Page 25

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


## Page 26

Parse the structure of Core Audio files.


## Page 27

struct CAFAudioDescription
struct CAFAudioFormatListItem
struct CAFChunkHeader
struct CAFDataChunk
struct CAFFileHeader
struct CAFFormatFlags
struct CAFInfoStrings
struct CAFInstrumentChunk
struct CAFMarker
struct CAFMarkerChunk
struct CAFOverviewChunk
struct CAFOverviewSample
struct CAFPacketTableHeader
struct CAFPeakChunk
struct CAFPositionPeak
struct CAFRegion
Topics
File Structure
Audio Toolbox / Core Audio File Format
API Collection
Core Audio File Format
Parse the structure of Core Audio files.


## Page 28

struct CAFRegionChunk
struct CAFRegionFlags
struct CAFStringID
struct CAFStrings
struct CAFUMIDChunk
struct CAF_SMPTE_Time
struct CAF_UUID_ChunkHeader
struct CAFFormatFlags
struct CAFRegionFlags
CAF File Chunk Types
CAF File Marker Types
CAF File SMPTE Time Types
CAF File Header
Audio Format Services
Access information about audio formats and codecs.
Audio File Services
Read or write a variety of audio data to or from disk or a memory buffer.
Extended Audio File Services
Read and write compressed files and linear PCM audio files using a simplified interface.
Audio File Stream Services
Parse streamed audio files as the data arrives on the user’s computer.
Audio File Components
Types
See Also
Audio Files and Formats


## Page 29

Get information about audio file formats, and about files containing audio data.


