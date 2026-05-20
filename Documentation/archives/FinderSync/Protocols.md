# Protocols.pdf

## Page 1

func beginObservingDirectory(at: URL)
Tells the extension that the user is looking at a monitored directory or at one of its
subdirectories.
func endObservingDirectory(at: URL)
Tells the extension that the user has stopped looking at a monitored directory or at one of its
subdirectories.
func menu(for: FIMenuKind) -> NSMenu?
Requests a custom menu from the extension.
func requestBadgeIdentifier(for: URL)
Requests a badge for the given file or directory.
var toolbarItemImage: NSImage
The image for the extension’s toolbar button.
var toolbarItemName: String
The name of the extension’s toolbar button.
Topics
Managing Badges, Shortcut Menus, and Toolbar Buttons
Finder Sync / FIFinderSyncProtocol
Protocol
FIFinderSyncProtocol
The group of methods to implement for modifying the Finder user interface to
express file synchronization status and control.
macOS 10.10+


## Page 2

var toolbarItemToolTip: String
The tooltip text for the extension’s toolbar button.
enum FIMenuKind
The different kinds of custom menus that the Finder Sync extension can provide.
func makeListenerEndpoint(forServiceName: NSFileProviderServiceName,
itemURL: URL) throws -> NSXPCListenerEndpoint
func supportedServiceNamesForItem(with: URL) -> [NSFileProviderService
Name]
func values(forAttributes: [URLResourceKey], forItemWith: URL,
completion: ([URLResourceKey : Any], (any Error)?) -> Void)
FIFinderSync
Constants
Instance Methods
Relationships
Conforming Types


