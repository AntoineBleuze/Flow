# Receiving contacts.pdf

## Page 1

Your implementation of enumerateContent(in:for:) receives an observer that conforms to
this type. As you enumerate over your contact items, you provide them to the observer with the
didEnumerate(_:) method.
func didEnumerate([ContactItem])
Provides an array of contact items to the observer.
Required
enum ContactItem
An item in the contact database.
func didFinishEnumeratingContent(upTo: Data)
Overview
Topics
Providing contact items
Ending enumeration
ContactProvider / ContactItemContentObserver
Protocol
ContactItemContentObserver
A protocol that defines a system observer that receives a resumable enumeration
of all items.
iOS 18.0+
iPadOS 18.0+


## Page 2

Finishes the content enumeration to the observer.
Required
func didFinishEnumeratingPage(upTo: ContactItemPage)
Marks a page of items as completed.
Required
struct ContactItemPage
A fixed offset into enumerating all contact items.
func didFinishEnumeratingContentWithError(any Error)
Finishes the content enumeration with an error, indicating failure, to the observer.
Required
var suggestedPageSize: Int
Retrieves the suggested number of items to include in a page.
Required
protocol ContactItemChangeObserver
A protocol that defines a system observer that receives a resumable enumeration of change
contact items.
Optimizing enumeration
See Also
Receiving contacts


## Page 3

Your implementation of enumerateChanges(startingAt:for:) receives an observer that
conforms to this type. As you enumerate over your contacts, you provide them to the observer wi
the didUpdate(_:) and didDelete(_:) methods.
func didUpdate([ContactItem])
Provides an array of new and updated contact items to the observer.
Required
enum ContactItem
An item in the contact database.
func didDelete([ContactItem.Identifier])
Provides an array of deleted contact item identifiers to the observer.
Required
Overview
Topics
Providing change data
ContactProvider / ContactItemChangeObserver
Protocol
ContactItemChangeObserver
A protocol that defines a system observer that receives a resumable enumeration
of changed contact items.
iOS 18.0+
iPadOS 18.0+


## Page 4

struct Identifier
The app’s identifier for an item in the contact database.
func didFinishEnumeratingChanges(upTo: ContactItemSyncAnchor, moreComin
: Bool)
Marks a sync anchor of changed contact items as completed.
Required
struct ContactItemSyncAnchor
A snapshot point into enumerating changed contact items.
func didFinishEnumeratingChangesWithError(any Error)
Finishes the change enumeration with an error, indicating failure, to the observer.
Required
var suggestedBatchSize: Int
Retrieves the suggested number of changed contact items to include in a batch.
Required
protocol ContactItemContentObserver
A protocol that defines a system observer that receives a resumable enumeration of all items
Ending enumeration
Optimizing observer batching
See Also
Receiving contacts


