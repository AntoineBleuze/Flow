# Extension management.pdf

## Page 1

Signaling Changes for User-Driven Actions
Synchronizing the File Provider Extension
class var `default`: NSFileProviderManager
A property that returns the shared file provider manager object.
var documentStorageURL: URL
The root URL for all shared documents.
var providerIdentifier: String
A purpose identifier for coordinated reads and writes.
Mentioned in
Topics
Accessing File Provider data
Translating user-visible URLs
File Provider / NSFileProviderManager
Class
NSFileProviderManager
A manager object that you use to communicate with the file provider from either
your app or your File Provider extension.
iOS 11.0+
iPadOS 11.0+
macOS 11.0+
visionOS 1.0+


## Page 2

func getUserVisibleURL(for: NSFileProviderItemIdentifier, completion
Handler: (URL?, (any Error)?) -> Void)
Returns the user-visible URL for an item.
class func getIdentifierForUserVisibleFile(at: URL, completionHandler: 
NSFileProviderItemIdentifier?, NSFileProviderDomainIdentifier?, (any
Error)?) -> Void)
Returns the identifier and domain for a user-visible URL.
func reimportItems(below: NSFileProviderItemIdentifier, completion
Handler: ((any Error)?) -> Void)
Tells the system to reimport the item and its content recursively.
func evictItem(identifier: NSFileProviderItemIdentifier, completion
Handler: ((any Error)?) -> Void)
Asks the system to remove an item from its cache.
func requestDownloadForItem(withIdentifier: NSFileProviderItemIdentifie
, requestedRange: NSRange?) async throws
func requestDownloadForItem(withIdentifier: NSFileProviderItemIdentifie
, requestedRange: NSRange?, completionHandler: ((any Error)?) -> Void)
func requestModification(of: NSFileProviderItemFields, forItemWith
Identifier: NSFileProviderItemIdentifier, options: NSFileProviderModify
ItemOptions, completionHandler: ((any Error)?) -> Void)
func enumeratorForMaterializedItems() -> any NSFileProviderEnumerator
Returns an enumerator for all the items the system currently stores on disk.
func enumeratorForPendingItems() -> any NSFileProviderPendingSet
Enumerator
Returns an enumerator for the set of pending items.
class func placeholderURL(for: URL) -> URL
Returns a placeholder URL for a given document URL.
class func writePlaceholder(at: URL, withMetadata: NSFileProviderItem)
throws
Working with items
Performing actions


## Page 3

Writes a document placeholder with the provided metadata.
func register(URLSessionTask, forItemWithIdentifier: NSFileProviderItem
Identifier, completionHandler: ((any Error)?) -> Void)
Registers the URL session task responsible for the specified item.
func signalEnumerator(for: NSFileProviderItemIdentifier, completion
Handler: ((any Error)?) -> Void)
Alerts the system to changes in the specified folder’s content.
func waitForChanges(below: NSFileProviderItemIdentifier, completion
Handler: ((any Error)?) -> Void)
Requests a notification after the system completes all the specified changes.
func globalProgress(for: Progress.FileOperationKind) -> Progress
Returns a progress object that tracks either the uploading or downloading of items from the
File Provider extension’s remote storage.
convenience init?(for: NSFileProviderDomain)
Returns a newly created file provider manager for the specified domain.
class func `import`(NSFileProviderDomain, fromDirectoryAt: URL,
completionHandler: ((any Error)?) -> Void)
Creates a new domain that takes ownership of on-disk data that your app previously manage
without a file provider.
class func add(NSFileProviderDomain, completionHandler: ((any Error)?) 
> Void)
Adds a domain to the File Provider extension.
class func getDomainsWithCompletionHandler(([NSFileProviderDomain], (an
Error)?) -> Void)
Returns all of the File Provider extension’s domains.
class func remove(NSFileProviderDomain, completionHandler: ((any Error
)?) -> Void)
Removes a domain from the File Provider extension.
class func remove(NSFileProviderDomain, mode: NSFileProviderManager.
DomainRemovalMode, completionHandler: (URL?, (any Error)?) -> Void)
Removes a domain from the File Provider extension using the specified options.
Working with domains


## Page 4

class func removeAllDomains(completionHandler: ((any Error)?) -> Void)
Removes all domains from the File Provider extension.
enum DomainRemovalMode
A mode indicating how the system handles user data when removing a domain.
func disconnect(reason: String, options: NSFileProviderManager.
DisconnectionOptions, completionHandler: ((any Error)?) -> Void)
Disconnects the domain from the extension.
struct DisconnectionOptions
Options for disconnecting a domain from the extension.
func reconnect(completionHandler: ((any Error)?) -> Void)
Reconnects the domain with the extension.
func waitForStabilization(completionHandler: ((any Error)?) -> Void)
Requests a notification after the domain stabilizes.
func temporaryDirectoryURL() throws -> URL
Returns the URL of a directory that the File Provider extension can use to temporarily store
files before passing them to the system.
func claimKnownFolders(NSFileProviderKnownFolderLocations, localized
Reason: String, completionHandler: ((any Error)?) -> Void)
Asks the domain to sync the specified known folders.
func releaseKnownFolders(NSFileProviderKnownFolders, localizedReason:
String, completionHandler: ((any Error)?) -> Void)
Asks the system to stop replicating the specified known folders in the domain.
struct NSFileProviderKnownFolders
Constants that identify known folders.
class NSFileProviderKnownFolderLocations
A class for working with known-folder locations.
protocol NSFileProviderKnownFolderSupporting
A protocol that defines the interface for sharing known-folder locations with the system.
Syncing Desktop and Documents folders


## Page 5

func stateDirectoryURL() throws -> URL
Returns a URL for a directory for storing state information for the domain.
class func checkDomainsCanBeStoredOnVolume(at: URL) throws -> NSFile
ProviderManager.EligibilityResult
Checks whether the specified URL is eligible for storing a domain.
enum EligibilityResult
Constants that specify whether a URL is eligible for storing a domain.
protocol NSFileProviderExternalVolumeHandling
A protocol that defines the interface for handling external volumes.
func getService(named: NSFileProviderServiceName, for: NSFileProvider
ItemIdentifier, completionHandler: (NSFileProviderService?, (any Error
)?) -> Void)
func listAvailableTestingOperations() throws -> [any NSFileProvider
TestingOperation]
Lists all the operations that are ready for scheduling.
func run([any NSFileProviderTestingOperation]) throws -> [AnyHashable :
any Error]
Asks the system to schedule and execute the specified operations.
func signalErrorResolved(any Error, completionHandler: ((any Error)?) -
Void)
Indicates a resolved error.
Working with external volumes
Using services
Testing
Handling errors
Collecting diagnostic reports


## Page 6

func requestDiagnosticCollection(for: NSFileProviderItemIdentifier,
errorReason: any Error, completionHandler: ((any Error)?) -> Void)
Requests a diagnostics collection for use when working directly with Apple to improve sync
behavior.
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


