# 004_CXCallDirectoryManager.pdf

## Page 1

class var sharedInstance: CXCallDirectoryManager
Returns the shared call directory manager instance for the app.
func getEnabledStatusForExtension(withIdentifier: String, completion
Handler: (CXCallDirectoryManager.EnabledStatus, (any Error)?) -> Void)
Asynchronously returns the enabled status of the extension with the specified identifier.
func reloadExtension(withIdentifier: String, completionHandler: (((any
Error)?) -> Void)?)
Asynchronously reloads the extension with the specified identifier.
enum EnabledStatus
The enabled status of a Call Directory app extension, as reported by the getEnabled
StatusForExtension(withIdentifier:completionHandler:) method.
Topics
Accessing the Shared Instance
Working with a Call Directory App Extension
CallKit / CXCallDirectoryManager
Class
CXCallDirectoryManager
The programmatic interface to an object that manages a Call Directory app
extension.
iOS 10.0+
iPadOS 10.0+
Mac Catalyst 10.0+
visionOS 1.0+


## Page 2

func openSettings(completionHandler: (((any Error)?) -> Void)?)
Opens the iOS Settings app and shows the Call Blocking & Identification settings.
enum EnabledStatus
The enabled status of a Call Directory app extension, as reported by the getEnabled
StatusForExtension(withIdentifier:completionHandler:) method.
struct CXErrorCodeCallDirectoryManagerError
Errors when interacting with a call directory manager.
enum Code
Error codes the CallKit framework returns.
let CXErrorDomainCallDirectoryManager: String
Domain for errors when interacting with a call directory manager.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Opening the Settings App
Errors
Relationships
Inherits From
Conforms To


## Page 3

Identifying and blocking calls
Create a Call Directory app extension to identify and block incoming callers by their phone
number.
class CXCallDirectoryProvider
The principal object for a Call Directory app extension for a host app.
class CXCallDirectoryExtensionContext
A programmatic interface for adding identification and blocking entries to a Call Directory ap
extension.
protocol CXCallDirectoryExtensionContextDelegate
A collection of methods a Call Directory extension context object calls when a request fails.
See Also
Caller ID


