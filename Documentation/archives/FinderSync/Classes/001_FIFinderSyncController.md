# 001_FIFinderSyncController.pdf

## Page 1

Use the Finder Sync controller to configure your extension, to set badges on items in the Finder’s
window, and to get a list of selected and targeted items.
class func `default`() -> Self
Returns the shared Finder Sync controller object.
var directoryURLs: Set<URL>!
The directories managed by this extension.
func selectedItemURLs() -> [URL]?
Returns an array of selected items.
func setBadgeIdentifier(String, for: URL)
Sets the badge for a file or directory.
Overview
Topics
Managing the Finder Sync Controller
Finder Sync / FIFinderSyncController
Class
FIFinderSyncController
A controller that acts as a bridge between your Finder Sync extension and the
Finder itself.
macOS 10.10+


## Page 2

func setBadgeImage(NSImage, label: String?, forBadgeIdentifier: String)
Sets the badge image and label for the given ID.
func targetedURL() -> URL?
Returns the URL of the Finder’s current target.
func lastUsedDateForItem(with: URL) -> Date?
func setLastUsedDate(Date, forItemWith: URL, completion: (any Error) ->
Void)
func setTagData(Data?, forItemWith: URL, completion: (any Error) -> Voi
)
func tagDataForItem(with: URL) -> Data?
class var isExtensionEnabled: Bool
class func showExtensionManagementInterface()
NSExtensionContext
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Instance Methods
Type Properties
Type Methods
Relationships
Inherits From
Conforms To


## Page 3

Sendable
SendableMetatype
class FIFinderSync
A type to subclass to add badges, custom shortcut menus, and toolbar buttons to the Finde
See Also
Classes


