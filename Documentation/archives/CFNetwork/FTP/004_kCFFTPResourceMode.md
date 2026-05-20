# 004_kCFFTPResourceMode.pdf

## Page 1

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


## Page 2

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


