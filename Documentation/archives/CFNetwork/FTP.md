# FTP.pdf

## Page 1

Deprecated
Use NSURLSessionAPI for ftp requests
alloc
The allocator to use to allocate memory for the dictionary. Pass NULL or kCFAllocatorDefault 
use the current default allocator.
buffer
A pointer to a buffer holding zero or more lines of resource listing.
bufferLength
The length in bytes of the buffer pointed to by buffer.
Parameters
CFNetwork / CFFTPCreateParsedResourceListing(_:_:_:_:) Deprecated
Function
CFFTPCreateParsedResourceListing(_:_:
_:_:) Deprecated
Parses an FTP listing to a dictionary.
iOS 2.0–9.0 Deprecated
iPadOS 2.0–9.0 Deprecated
Mac Catalyst 13.1–13.1 Deprecated
macOS 10.3–10.11 Deprecated
tvOS 9.0–9.0 Deprecated
visionOS 1.0–1.0 Deprecated


## Page 2

parsed
Upon return, contains a dictionary containing the parsed resource information. If parsing fails
a NULL pointer is returned.
The number of bytes parsed, 0 if no bytes were available for parsing, or -1 if parsing failed.
This function examines the contents of buffer as an FTP directory listing and parses into a
CFDictionary the information for a single file or folder. The CFDictionary is returned in the parsed
parameter, and the number of bytes used from buffer is returned.
let kCFFTPResourceGroup: CFString
CFDictionary key for getting the CFString containing the name of a group that shares the FT
resource.
Deprecated
let kCFFTPResourceLink: CFString
CFDictionary key for getting the CFString containing the symbolic link information. If the item
is a symbolic link, the CFString contains the path to the item that the link references.
Deprecated
let kCFFTPResourceModDate: CFString
CFDictionary key for getting the CFDate containing the last date and time the FTP resource
was modified.
Deprecated
let kCFFTPResourceMode: CFString
CFDictionary key for getting the CFNumber containing the access permissions, defined in
sys/types.h, of the FTP resource.
Deprecated
let kCFFTPResourceName: CFString
Return Value
Discussion
See Also
FTP


## Page 3

CFDictionary key for getting the CFString containing the name of the FTP resource.
Deprecated
let kCFFTPResourceOwner: CFString
CFDictionary key for getting the CFString containing the name of the owner of the FTP
resource.
Deprecated
let kCFFTPResourceSize: CFString
CFDictionary key for getting the CFNumber containing the size in bytes of the FTP resource.
Deprecated
let kCFFTPResourceType: CFString
CFDictionary key for getting the CFNumber containing the type of the FTP resource as
defined in sys/dirent.h.
Deprecated


## Page 4

Deprecated
Use NSURLSessionAPI for ftp requests
func CFFTPCreateParsedResourceListing(CFAllocator?, UnsafePointer<UInt8
>, CFIndex, UnsafeMutablePointer<Unmanaged<CFDictionary>?>?) -> CFIndex
Parses an FTP listing to a dictionary.
Deprecated
let kCFFTPResourceLink: CFString
CFDictionary key for getting the CFString containing the symbolic link information. If the item
is a symbolic link, the CFString contains the path to the item that the link references.
Deprecated
let kCFFTPResourceModDate: CFString
See Also
FTP
CFNetwork / kCFFTPResourceGroup Deprecated
Global Variable
kCFFTPResourceGroup Deprecated
CFDictionary key for getting the CFString containing the name of a group that
shares the FTP resource.
iOS 2.0–9.0 Deprecated
iPadOS 2.0–9.0 Deprecated
Mac Catalyst 13.1–13.1 Deprecated
macOS 10.3–10.11 Deprecated
tvOS 9.0–9.0 Deprecated
visionOS 1.0–1.0 Deprecated


## Page 5

CFDictionary key for getting the CFDate containing the last date and time the FTP resource
was modified.
Deprecated
let kCFFTPResourceMode: CFString
CFDictionary key for getting the CFNumber containing the access permissions, defined in
sys/types.h, of the FTP resource.
Deprecated
let kCFFTPResourceName: CFString
CFDictionary key for getting the CFString containing the name of the FTP resource.
Deprecated
let kCFFTPResourceOwner: CFString
CFDictionary key for getting the CFString containing the name of the owner of the FTP
resource.
Deprecated
let kCFFTPResourceSize: CFString
CFDictionary key for getting the CFNumber containing the size in bytes of the FTP resource.
Deprecated
let kCFFTPResourceType: CFString
CFDictionary key for getting the CFNumber containing the type of the FTP resource as
defined in sys/dirent.h.
Deprecated


## Page 6

Deprecated
Use NSURLSessionAPI for ftp requests
func CFFTPCreateParsedResourceListing(CFAllocator?, UnsafePointer<UInt8
>, CFIndex, UnsafeMutablePointer<Unmanaged<CFDictionary>?>?) -> CFIndex
Parses an FTP listing to a dictionary.
Deprecated
let kCFFTPResourceGroup: CFString
CFDictionary key for getting the CFString containing the name of a group that shares the FT
resource.
Deprecated
let kCFFTPResourceModDate: CFString
See Also
FTP
CFNetwork / kCFFTPResourceLink Deprecated
Global Variable
kCFFTPResourceLink Deprecated
CFDictionary key for getting the CFString containing the symbolic link information
If the item is a symbolic link, the CFString contains the path to the item that the lin
references.
iOS 2.0–9.0 Deprecated
iPadOS 2.0–9.0 Deprecated
Mac Catalyst 13.1–13.1 Deprecated
macOS 10.3–10.11 Deprecated
tvOS 9.0–9.0 Deprecated
visionOS 1.0–1.0 Deprecated


## Page 7

CFDictionary key for getting the CFDate containing the last date and time the FTP resource
was modified.
Deprecated
let kCFFTPResourceMode: CFString
CFDictionary key for getting the CFNumber containing the access permissions, defined in
sys/types.h, of the FTP resource.
Deprecated
let kCFFTPResourceName: CFString
CFDictionary key for getting the CFString containing the name of the FTP resource.
Deprecated
let kCFFTPResourceOwner: CFString
CFDictionary key for getting the CFString containing the name of the owner of the FTP
resource.
Deprecated
let kCFFTPResourceSize: CFString
CFDictionary key for getting the CFNumber containing the size in bytes of the FTP resource.
Deprecated
let kCFFTPResourceType: CFString
CFDictionary key for getting the CFNumber containing the type of the FTP resource as
defined in sys/dirent.h.
Deprecated


## Page 8

Deprecated
Use NSURLSessionAPI for ftp requests
func CFFTPCreateParsedResourceListing(CFAllocator?, UnsafePointer<UInt8
>, CFIndex, UnsafeMutablePointer<Unmanaged<CFDictionary>?>?) -> CFIndex
Parses an FTP listing to a dictionary.
Deprecated
let kCFFTPResourceGroup: CFString
CFDictionary key for getting the CFString containing the name of a group that shares the FT
resource.
Deprecated
let kCFFTPResourceLink: CFString
See Also
FTP
CFNetwork / kCFFTPResourceModDate Deprecated
Global Variable
kCFFTPResourceModDate Deprecated
CFDictionary key for getting the CFDate containing the last date and time the FTP
resource was modified.
iOS 2.0–9.0 Deprecated
iPadOS 2.0–9.0 Deprecated
Mac Catalyst 13.1–13.1 Deprecated
macOS 10.3–10.11 Deprecated
tvOS 9.0–9.0 Deprecated
visionOS 1.0–1.0 Deprecated


## Page 9

CFDictionary key for getting the CFString containing the symbolic link information. If the item
is a symbolic link, the CFString contains the path to the item that the link references.
Deprecated
let kCFFTPResourceMode: CFString
CFDictionary key for getting the CFNumber containing the access permissions, defined in
sys/types.h, of the FTP resource.
Deprecated
let kCFFTPResourceName: CFString
CFDictionary key for getting the CFString containing the name of the FTP resource.
Deprecated
let kCFFTPResourceOwner: CFString
CFDictionary key for getting the CFString containing the name of the owner of the FTP
resource.
Deprecated
let kCFFTPResourceSize: CFString
CFDictionary key for getting the CFNumber containing the size in bytes of the FTP resource.
Deprecated
let kCFFTPResourceType: CFString
CFDictionary key for getting the CFNumber containing the type of the FTP resource as
defined in sys/dirent.h.
Deprecated


## Page 10

Deprecated
Use NSURLSessionAPI for ftp requests
func CFFTPCreateParsedResourceListing(CFAllocator?, UnsafePointer<UInt8
>, CFIndex, UnsafeMutablePointer<Unmanaged<CFDictionary>?>?) -> CFIndex
Parses an FTP listing to a dictionary.
Deprecated
let kCFFTPResourceGroup: CFString
CFDictionary key for getting the CFString containing the name of a group that shares the FT
resource.
Deprecated
let kCFFTPResourceLink: CFString
See Also
FTP
CFNetwork / kCFFTPResourceMode Deprecated
Global Variable
kCFFTPResourceMode Deprecated
CFDictionary key for getting the CFNumber containing the access permissions,
defined in sys/types.h, of the FTP resource.
iOS 2.0–9.0 Deprecated
iPadOS 2.0–9.0 Deprecated
Mac Catalyst 13.1–13.1 Deprecated
macOS 10.3–10.11 Deprecated
tvOS 9.0–9.0 Deprecated
visionOS 1.0–1.0 Deprecated


## Page 11

CFDictionary key for getting the CFString containing the symbolic link information. If the item
is a symbolic link, the CFString contains the path to the item that the link references.
Deprecated
let kCFFTPResourceModDate: CFString
CFDictionary key for getting the CFDate containing the last date and time the FTP resource
was modified.
Deprecated
let kCFFTPResourceName: CFString
CFDictionary key for getting the CFString containing the name of the FTP resource.
Deprecated
let kCFFTPResourceOwner: CFString
CFDictionary key for getting the CFString containing the name of the owner of the FTP
resource.
Deprecated
let kCFFTPResourceSize: CFString
CFDictionary key for getting the CFNumber containing the size in bytes of the FTP resource.
Deprecated
let kCFFTPResourceType: CFString
CFDictionary key for getting the CFNumber containing the type of the FTP resource as
defined in sys/dirent.h.
Deprecated


## Page 12

Deprecated
Use NSURLSessionAPI for ftp requests
func CFFTPCreateParsedResourceListing(CFAllocator?, UnsafePointer<UInt8
>, CFIndex, UnsafeMutablePointer<Unmanaged<CFDictionary>?>?) -> CFIndex
Parses an FTP listing to a dictionary.
Deprecated
let kCFFTPResourceGroup: CFString
CFDictionary key for getting the CFString containing the name of a group that shares the FT
resource.
Deprecated
let kCFFTPResourceLink: CFString
See Also
FTP
CFNetwork / kCFFTPResourceName Deprecated
Global Variable
kCFFTPResourceName Deprecated
CFDictionary key for getting the CFString containing the name of the FTP
resource.
iOS 2.0–9.0 Deprecated
iPadOS 2.0–9.0 Deprecated
Mac Catalyst 13.1–13.1 Deprecated
macOS 10.3–10.11 Deprecated
tvOS 9.0–9.0 Deprecated
visionOS 1.0–1.0 Deprecated


## Page 13

CFDictionary key for getting the CFString containing the symbolic link information. If the item
is a symbolic link, the CFString contains the path to the item that the link references.
Deprecated
let kCFFTPResourceModDate: CFString
CFDictionary key for getting the CFDate containing the last date and time the FTP resource
was modified.
Deprecated
let kCFFTPResourceMode: CFString
CFDictionary key for getting the CFNumber containing the access permissions, defined in
sys/types.h, of the FTP resource.
Deprecated
let kCFFTPResourceOwner: CFString
CFDictionary key for getting the CFString containing the name of the owner of the FTP
resource.
Deprecated
let kCFFTPResourceSize: CFString
CFDictionary key for getting the CFNumber containing the size in bytes of the FTP resource.
Deprecated
let kCFFTPResourceType: CFString
CFDictionary key for getting the CFNumber containing the type of the FTP resource as
defined in sys/dirent.h.
Deprecated


## Page 14

Deprecated
Use NSURLSessionAPI for ftp requests
func CFFTPCreateParsedResourceListing(CFAllocator?, UnsafePointer<UInt8
>, CFIndex, UnsafeMutablePointer<Unmanaged<CFDictionary>?>?) -> CFIndex
Parses an FTP listing to a dictionary.
Deprecated
let kCFFTPResourceGroup: CFString
CFDictionary key for getting the CFString containing the name of a group that shares the FT
resource.
Deprecated
let kCFFTPResourceLink: CFString
See Also
FTP
CFNetwork / kCFFTPResourceOwner Deprecated
Global Variable
kCFFTPResourceOwner Deprecated
CFDictionary key for getting the CFString containing the name of the owner of the
FTP resource.
iOS 2.0–9.0 Deprecated
iPadOS 2.0–9.0 Deprecated
Mac Catalyst 13.1–13.1 Deprecated
macOS 10.3–10.11 Deprecated
tvOS 9.0–9.0 Deprecated
visionOS 1.0–1.0 Deprecated


## Page 15

CFDictionary key for getting the CFString containing the symbolic link information. If the item
is a symbolic link, the CFString contains the path to the item that the link references.
Deprecated
let kCFFTPResourceModDate: CFString
CFDictionary key for getting the CFDate containing the last date and time the FTP resource
was modified.
Deprecated
let kCFFTPResourceMode: CFString
CFDictionary key for getting the CFNumber containing the access permissions, defined in
sys/types.h, of the FTP resource.
Deprecated
let kCFFTPResourceName: CFString
CFDictionary key for getting the CFString containing the name of the FTP resource.
Deprecated
let kCFFTPResourceSize: CFString
CFDictionary key for getting the CFNumber containing the size in bytes of the FTP resource.
Deprecated
let kCFFTPResourceType: CFString
CFDictionary key for getting the CFNumber containing the type of the FTP resource as
defined in sys/dirent.h.
Deprecated


## Page 16

Deprecated
Use NSURLSessionAPI for ftp requests
func CFFTPCreateParsedResourceListing(CFAllocator?, UnsafePointer<UInt8
>, CFIndex, UnsafeMutablePointer<Unmanaged<CFDictionary>?>?) -> CFIndex
Parses an FTP listing to a dictionary.
Deprecated
let kCFFTPResourceGroup: CFString
CFDictionary key for getting the CFString containing the name of a group that shares the FT
resource.
Deprecated
let kCFFTPResourceLink: CFString
See Also
FTP
CFNetwork / kCFFTPResourceSize Deprecated
Global Variable
kCFFTPResourceSize Deprecated
CFDictionary key for getting the CFNumber containing the size in bytes of the FTP
resource.
iOS 2.0–9.0 Deprecated
iPadOS 2.0–9.0 Deprecated
Mac Catalyst 13.1–13.1 Deprecated
macOS 10.3–10.11 Deprecated
tvOS 9.0–9.0 Deprecated
visionOS 1.0–1.0 Deprecated


## Page 17

CFDictionary key for getting the CFString containing the symbolic link information. If the item
is a symbolic link, the CFString contains the path to the item that the link references.
Deprecated
let kCFFTPResourceModDate: CFString
CFDictionary key for getting the CFDate containing the last date and time the FTP resource
was modified.
Deprecated
let kCFFTPResourceMode: CFString
CFDictionary key for getting the CFNumber containing the access permissions, defined in
sys/types.h, of the FTP resource.
Deprecated
let kCFFTPResourceName: CFString
CFDictionary key for getting the CFString containing the name of the FTP resource.
Deprecated
let kCFFTPResourceOwner: CFString
CFDictionary key for getting the CFString containing the name of the owner of the FTP
resource.
Deprecated
let kCFFTPResourceType: CFString
CFDictionary key for getting the CFNumber containing the type of the FTP resource as
defined in sys/dirent.h.
Deprecated


## Page 18

Deprecated
Use NSURLSessionAPI for ftp requests
func CFFTPCreateParsedResourceListing(CFAllocator?, UnsafePointer<UInt8
>, CFIndex, UnsafeMutablePointer<Unmanaged<CFDictionary>?>?) -> CFIndex
Parses an FTP listing to a dictionary.
Deprecated
let kCFFTPResourceGroup: CFString
CFDictionary key for getting the CFString containing the name of a group that shares the FT
resource.
Deprecated
let kCFFTPResourceLink: CFString
See Also
FTP
CFNetwork / kCFFTPResourceType Deprecated
Global Variable
kCFFTPResourceType Deprecated
CFDictionary key for getting the CFNumber containing the type of the FTP
resource as defined in sys/dirent.h.
iOS 2.0–9.0 Deprecated
iPadOS 2.0–9.0 Deprecated
Mac Catalyst 13.1–13.1 Deprecated
macOS 10.3–10.11 Deprecated
tvOS 9.0–9.0 Deprecated
visionOS 1.0–1.0 Deprecated


## Page 19

CFDictionary key for getting the CFString containing the symbolic link information. If the item
is a symbolic link, the CFString contains the path to the item that the link references.
Deprecated
let kCFFTPResourceModDate: CFString
CFDictionary key for getting the CFDate containing the last date and time the FTP resource
was modified.
Deprecated
let kCFFTPResourceMode: CFString
CFDictionary key for getting the CFNumber containing the access permissions, defined in
sys/types.h, of the FTP resource.
Deprecated
let kCFFTPResourceName: CFString
CFDictionary key for getting the CFString containing the name of the FTP resource.
Deprecated
let kCFFTPResourceOwner: CFString
CFDictionary key for getting the CFString containing the name of the owner of the FTP
resource.
Deprecated
let kCFFTPResourceSize: CFString
CFDictionary key for getting the CFNumber containing the size in bytes of the FTP resource.
Deprecated


