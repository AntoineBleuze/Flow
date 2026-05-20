# 000_CMMetadata.pdf

## Page 1

The Core Media framework provides two services: Metadata Identifier Services and the Metadata
Data Type Registry.
Metadata Identifier Services provide a means of encoding the metadata identifying tuple (four-by
key namespace and N-byte key value) into CFString, and back again.
The Metadata Data Type Registry allows a process to register metadata data types that conform t
a base data type and (optionally) other registered data types. The registry simplifies the process 
creating format descriptions for nontrivial metadata values and allowing clients to indicate how to
interpret metadata.
func CMMetadataCreateIdentifierForKeyAndKeySpace(allocator: CFAllocator
?, key: CFTypeRef, keySpace: CFString, identifierOut: UnsafeMutable
Pointer<CFString?>) -> OSStatus
Creates a URL-like string identifier that represents a key or keyspace tuple.
func CMMetadataCreateKeyFromIdentifier(allocator: CFAllocator?,
identifier: CFString, keyOut: UnsafeMutablePointer<CFTypeRef?>) ->
OSStatus
Creates a copy of the key by using an identifier.
Overview
Topics
Creating Metadata Identifiers
Core Media / CMMetadata
API Collection
CMMetadata
The APIs for working with the framework’s Metadata Identifier Services and
Metadata Data Type Registry.


## Page 2

func CMMetadataCreateKeyFromIdentifierAsCFData(allocator: CFAllocator?,
identifier: CFString, keyOut: UnsafeMutablePointer<CFData?>) -> OSStatu
Creates a copy of the key by using an identifier, and results in a core foundation data object.
func CMMetadataCreateKeySpaceFromIdentifier(allocator: CFAllocator?,
identifier: CFString, keySpaceOut: UnsafeMutablePointer<CFString?>) ->
OSStatus
Creates a copy of the keyspace by using an identifier.
func CMMetadataDataTypeRegistryRegisterDataType(CFString, description:
CFString, conformingDataTypes: CFArray) -> OSStatus
Register a data type with the data type registry.
func CMMetadataDataTypeRegistryDataTypeIsRegistered(CFString) -> Bool
Returns a Boolean value that indicates the registration status of a data type identifier.
func CMMetadataDataTypeRegistryGetDataTypeDescription(CFString) ->
CFString
Returns the data type description if it exists.
func CMMetadataDataTypeRegistryGetConformingDataTypes(CFString) ->
CFArray
Returns the conforming data types for the data type, if any.
func CMMetadataDataTypeRegistryDataTypeConformsToDataType(CFString,
conformsTo: CFString) -> Bool
Returns a Boolean value that indicates whether a data type conforms to another data type.
func CMMetadataDataTypeRegistryDataTypeIsBaseDataType(CFString) -> Bool
Returns a Boolean value that indicates whether a data type identifier represents a base data
type.
func CMMetadataDataTypeRegistryGetBaseDataTypeForConformingDataType(
CFString) -> CFString
Returns the base data type identifier that a data type conforms to.
func CMMetadataDataTypeRegistryGetBaseDataTypes() -> CFArray?
Returns an array of base data type identifiers.
Registering Metadata
Inspecting Metadata


## Page 3

Metadata Identifier Error Codes
Error codes that indicate metadata identifier errors.
Metadata Registry Error Codes
Error codes that indicate metadata registry errors.
Metadata Identifier Keyspaces
Constants that describe metadata identifier keyspaces.
Metadata Identifiers
Constants that describe metadata identifiers.
Metadata Base Data Types
Constants that describe metadata base data types.
Metadata Data Types
Constants that describe metadata data types.
CMTag
Types and interfaces for working with Core Media tags.
class CMTag
A tag to set additional metadata on media buffers.
class CMTypedTag
A tag to set additional metadata on media buffers, with an associated Swift type for its value
CMTagCollection
Objective-C types and interfaces for working with Core Media tag collections.
enum CMProjectionType
Constants describing the projection surface information in a 3D video buffer or channel.
Constants
See Also
Metadata


## Page 4

struct CMStereoViewComponents
Constants describing the stereo views contained within a buffer or channel.
struct CMStereoViewInterpretationOptions
Create a set of stereo view interpretation options from a constant.
enum CMPackingType
The type of packing within each video frame, if any.


