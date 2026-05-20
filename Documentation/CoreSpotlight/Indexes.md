# Indexes.pdf

## Page 1

Adding your app’s content to Spotlight indexes
A CSSearchableIndex object manages an on-device index for your app’s searchable content. 
make your app’s content searchable, package it in one or more CSSearchableItem objects and
add them to the index. You can create as many searchable indexes as you need to manage your
content, and you can apply different levels of encryption to protect the content in each index.
When you execute a query, Core Spotlight searches your app’s indexes for the requested
information and returns the results to your code.
Note
If your app creates NSUserActivity objects, set the isEligibleForSearch property of
those objects to true to ensure they appear in search results.
Put your content into a custom CSSearchableIndex that you create. Custom indexes support
batch operations and additional levels of data protection. Place sensitive personal information in
protected indexes to encrypt that content, and prevent its disclosure without proper authorization
from the owner of the device. Although you can put content into the default index, you can’t
encrypt the content in that index or perform batch operations to add content to it.
Mentioned in
Overview
Core Spotlight / CSSearchableIndex
Class
CSSearchableIndex
An on-device index for your app’s searchable content.
iOS 9.0+
iPadOS 9.0+
Mac Catalyst 13.1+
macOS 10.11+
visionOS 1.0+


## Page 2

When adding large amounts of data to the index, consider adding it in batches to minimize risk.
Batch-based updates make it easier to handle errors that might occur during the indexing proces
For each batch, you provide client-state information to identify the current batch. If your app or
extension crashes while a batch operation is in progress, you can use that state information to
determine where to start indexing again later.
Modify custom CSSearchableIndex objects only on one thread or task at a time. It’s a
programming error to access a custom index from multiple threads simultaneously. When
performing batch updates on an index, start each new batch operation only after calling the end
Batch(withClientState:completionHandler:) or endIndexBatch(expectedClien
State:newClientState:completionHandler:) method of the previous batch operation.
class func `default`() -> Self
Returns the default on-device index.
init(name: String)
Returns an on-device index with the specified name.
init(name: String, protectionClass: FileProtectionType?)
Returns an on-device index with the specified name and data protection class.
class func isIndexingAvailable() -> Bool
Returns a Boolean value that indicates whether indexing is available on the current device.
protocol CSSearchableIndexDelegate
A protocol that defines methods a delegate object or app extension uses to handle
communication from the on-device index.
var indexDelegate: (any CSSearchableIndexDelegate)?
The delegate object that can handle index-management tasks.
Topics
Creating an index
Determining if indexing is available
Responding to index-related changes
Managing items in an index


## Page 3

func indexSearchableItems([CSSearchableItem], completionHandler: (((any
Error)?) -> Void)?)
Adds or updates items in the index.
func deleteAllSearchableItems(completionHandler: (((any Error)?) -> Voi
)?)
Deletes all searchable items from the index.
func deleteSearchableItems(withDomainIdentifiers: [String], completion
Handler: (((any Error)?) -> Void)?)
Removes from the index all searchable items associated with the specified domain.
func deleteSearchableItems(withIdentifiers: [String], completionHandler
(((any Error)?) -> Void)?)
Removes from the index all items with the specified identifiers.
func beginBatch()
Begins a batch of updates to an index.
func endBatch(withClientState: Data, completionHandler: (((any Error)?)
-> Void)?)
Ends a batch of index updates and stores the specified state information.
func endIndexBatch(expectedClientState: Data?, newClientState: Data,
completionHandler: (((any Error)?) -> Void)?)
Ends a batch of index updates and stores the specified state information.
func fetchLastClientState(completionHandler: (Data?, (any Error)?) ->
Void)
Fetches the app’s most recent client state information asynchronously.
func fetchData(forBundleIdentifier: String, itemIdentifier: String,
contentType: UTType, completionHandler: (Data?, (any Error)?) -> Void)
Fetches data from an external provider.
Batching index updates
Handling drag and drop content
Instance Methods


## Page 4

func deleteAppEntities<Entity>(identifiedBy: [Entity.ID], ofType: Entit
.Type) async throws
Deletes specific app entities from the system’s index.
func deleteAppEntities<Entity>(ofType: Entity.Type) async throws
Deletes all app entities of the given type from the system indices.
func indexAppEntities([some IndexedEntity], priority: Int) async throws
Indexes the provided entities into the system.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
protocol CSSearchableIndexDelegate
A protocol that defines methods a delegate object or app extension uses to handle
communication from the on-device index.
Relationships
Inherits From
Conforms To
See Also
Indexes


## Page 5

Regenerating your app’s indexes on demand
The CSSearchableIndexDelegate protocol defines methods that a delegate object or an app
extension can use to handle communication from the on-device index. Apps that are long-running
or that perform batch updates to the index should implement the required methods of this protoc
in either a delegate object or an app extension.
The index delegate methods are called when there is an issue with the index and more informatio
is needed from an app. For example, the methods can be called when the entire index is lost or
there was a failure to process data for some identifiers.
func data(for: CSSearchableIndex, itemIdentifier: String, typeIdentifie
: String) throws -> Data
Mentioned in
Overview
Topics
Getting item-related details
Core Spotlight / CSSearchableIndexDelegate
Protocol
CSSearchableIndexDelegate
A protocol that defines methods a delegate object or app extension uses to hand
communication from the on-device index.
iOS 9.0+
iPadOS 9.0+
Mac Catalyst 13.1+
macOS 10.11+
visionOS 1.0+


## Page 6

func fileURL(for: CSSearchableIndex, itemIdentifier: String, type
Identifier: String, inPlace: Bool) throws -> URL
func searchableIndex(CSSearchableIndex, reindexAllSearchableItemsWith
AcknowledgementHandler: () -> Void)
Tells the delegate to reindex all searchable data and clear all local state information.
Required
func searchableIndex(CSSearchableIndex, reindexSearchableItemsWith
Identifiers: [String], acknowledgementHandler: () -> Void)
Tells the delegate to reindex the searchable items associated with the specified identifiers.
Required
func searchableIndexDidThrottle(CSSearchableIndex)
Tells the delegate that indexing is being throttled.
func searchableIndexDidFinishThrottle(CSSearchableIndex)
Tells the delegate that the index throttling has finished.
func searchableItems(forIdentifiers: [String], searchableItemsHandler:
([CSSearchableItem]) -> Void)
Requests that the delegate provide searchable items for the provided identifiers.
func searchableItemsDidUpdate([CSSearchableItem])
Tells the delegate that the framework updated the list of searchable items.
NSObjectProtocol
Updating the index
Getting information about indexing
Instance Methods
Relationships
Inherits From


## Page 7

CSIndexExtensionRequestHandler
class CSSearchableIndex
An on-device index for your app’s searchable content.
Conforming Types
See Also
Indexes


