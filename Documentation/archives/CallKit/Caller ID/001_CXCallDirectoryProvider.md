# 001_CXCallDirectoryProvider.pdf

## Page 1

Identifying and blocking calls
func beginRequest(with: CXCallDirectoryExtensionContext)
Tells the extension to prepare for a host app’s request.
NSObject
Mentioned in
Topics
Beginning a Request
Relationships
Inherits From
Conforms To
CallKit / CXCallDirectoryProvider
Class
CXCallDirectoryProvider
The principal object for a Call Directory app extension for a host app.
iOS 10.0+
iPadOS 10.0+
Mac Catalyst 10.0+
visionOS 1.0+


## Page 2

CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSExtensionRequestHandling
NSObjectProtocol
Identifying and blocking calls
Create a Call Directory app extension to identify and block incoming callers by their phone
number.
class CXCallDirectoryExtensionContext
A programmatic interface for adding identification and blocking entries to a Call Directory ap
extension.
protocol CXCallDirectoryExtensionContextDelegate
A collection of methods a Call Directory extension context object calls when a request fails.
class CXCallDirectoryManager
The programmatic interface to an object that manages a Call Directory app extension.
See Also
Caller ID


