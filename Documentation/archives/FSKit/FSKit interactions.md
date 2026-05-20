# FSKit interactions.pdf

## Page 1

FSClient is the primary management interface for FSKit. Use this class to discover FSKit extension
installed on the system, including your own.
Important
Don’t subclass FSClient.
class var shared: FSClient
The shared instance of the FSKit client class.
func fetchInstalledExtensions(completionHandler: ([FSModuleIdentity]?,
(any Error)?) -> Void)
Overview
Topics
Obtaining the shared instance
Discovering installed extensions
FSKit / FSClient
Class
FSClient
An interface for apps and daemons to interact with FSKit.
macOS 15.4+


## Page 2

Asynchronously retrieves an list of installed file system modules.
class FSModuleIdentity
An installed file system module.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Relationships
Inherits From
Conforms To


