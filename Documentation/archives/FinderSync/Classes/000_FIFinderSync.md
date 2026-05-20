# 000_FIFinderSync.pdf

## Page 1

Subclass the FIFinderSync class when you want to customize the appearance of the Finder.
Although the FIFinderSync class doesn’t provide any developer accessible API, it does adopt the
FIFinderSyncProtocol protocol. This protocol declares methods you can implement to modi
the appearance of the Finder. For more information on these methods, see FIFinderSync
Protocol. To learn more about creating a Finder Sync extension, see Finder Sync in App
Extension Programming Guide.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Overview
Relationships
Inherits From
Conforms To
Finder Sync / FIFinderSync
Class
FIFinderSync
A type to subclass to add badges, custom shortcut menus, and toolbar buttons to
the Finder.
macOS 10.10+


## Page 2

FIFinderSyncProtocol
Hashable
NSExtensionRequestHandling
NSObjectProtocol
protocol FIFinderSyncProtocol
The group of methods to implement for modifying the Finder user interface to express file
synchronization status and control.
class FIFinderSyncController
A controller that acts as a bridge between your Finder Sync extension and the Finder itself.
See Also
Related Documentation
Classes


