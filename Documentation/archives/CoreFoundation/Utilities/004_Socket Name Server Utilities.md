# 004_Socket Name Server Utilities.pdf

## Page 1

Name server functionality is currently inoperable in macOS.
func CFSocketCopyRegisteredSocketSignature(UnsafePointer<CFSocket
Signature>!, CFTimeInterval, CFString!, UnsafeMutablePointer<CFSocket
Signature>!, UnsafeMutablePointer<Unmanaged<CFData>?>!) -> CFSocketErro
Returns a socket signature registered with a CFSocket name server.
func CFSocketCopyRegisteredValue(UnsafePointer<CFSocketSignature>!,
CFTimeInterval, CFString!, UnsafeMutablePointer<Unmanaged<CFPropertyLis
>?>!, UnsafeMutablePointer<Unmanaged<CFData>?>!) -> CFSocketError
Returns a value registered with a CFSocket name server.
func CFSocketGetDefaultNameRegistryPortNumber() -> UInt16
Returns the default port number with which to connect to a CFSocket name server.
func CFSocketRegisterSocketSignature(UnsafePointer<CFSocketSignature>!,
CFTimeInterval, CFString!, UnsafePointer<CFSocketSignature>!) ->
CFSocketError
Registers a socket signature with a CFSocket name server.
Overview
Topics
Core Foundation Socket Name Server Utilities Miscellaneous
Functions
Core Foundation / Socket Name Server Utilities
API Collection
Socket Name Server Utilities


## Page 2

func CFSocketRegisterValue(UnsafePointer<CFSocketSignature>!, CFTime
Interval, CFString!, CFPropertyList!) -> CFSocketError
Registers a property-list value with a CFSocket name server.
func CFSocketSetDefaultNameRegistryPortNumber(UInt16)
Sets the default port number with which to connect to a CFSocket name server.
func CFSocketUnregister(UnsafePointer<CFSocketSignature>!, CFTime
Interval, CFString!) -> CFSocketError
Unregisters a value or socket signature with a CFSocket name server.
CFSocket Name Server Keys
Not used.
Base Utilities
Byte-Order Utilities
Core Foundation URL Access Utilities
Preferences Utilities
Time Utilities
Constants
See Also
Utilities


