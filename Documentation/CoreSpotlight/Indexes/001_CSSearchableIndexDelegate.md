# 001_CSSearchableIndexDelegate.pdf

## Page 1

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


## Page 2

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


## Page 3

CSIndexExtensionRequestHandler
class CSSearchableIndex
An on-device index for your app’s searchable content.
Conforming Types
See Also
Indexes


