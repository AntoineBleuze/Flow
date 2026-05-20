# Providing contacts.pdf

## Page 1

Your app creates instances of this type in your implementations of ContactItemEnumerator,
delivering arrays of contact items to ContactItemContentObserver and ContactItem
ChangeObserver instances.
case contact(CNMutableContact, ContactItem.Identifier)
An item that represents a person or organization.
struct Identifier
The app’s identifier for an item in the contact database.
Overview
Topics
Handling item type
Identifying the item
ContactProvider / ContactItem
Enumeration
ContactItem
An item in the contact database.
iOS 18.0+
iPadOS 18.0+


## Page 2

Equatable, Hashable
protocol ContactItemEnumerating
A protocol to provide enumerators for collections of contact items.
protocol ContactItemEnumerator
A protocol to provide enumerations of all contact items and changed contact items.
Relationships
Conforms To
See Also
Providing contacts


## Page 3

You typically implement this protocol in your app extension, since ContactProviderExtensio
inherits this protocol.
func enumerator(for: ContactItem.Identifier) -> any ContactItem
Enumerator
Provide an enumerator for the contact items collection.
Required
struct Identifier
The app’s identifier for an item in the contact database.
protocol ContactItemEnumerator
A protocol to provide enumerations of all contact items and changed contact items.
Overview
Topics
Providing an enumeration
ContactProvider / ContactItemEnumerating
Protocol
ContactItemEnumerating
A protocol to provide enumerators for collections of contact items.
iOS 18.0+
iPadOS 18.0+


## Page 4

ContactProviderExtension
enum ContactItem
An item in the contact database.
protocol ContactItemEnumerator
A protocol to provide enumerations of all contact items and changed contact items.
Relationships
Inherited By
See Also
Providing contacts


## Page 5

Implement this protocol to fetch contact items from your data store in a consistent, predictable
order when the system requests contact item enumeration. The ContactItemEnumerating
protocol, typically implemented by the app extension, returns an instance of this type when the
system requests contacts.
The enumerator has two main methods to implement:
enumerateContent(in:for:) – Enumerates all of your contacts that you want to provide t
the system-wide Contacts ecosystem, sending arrays of ContactItem instances to a Contac
ItemContentObserver.
enumerateChanges(startingAt:for:) – Enumerates changed contacts, sending update
and deletions to a ContactItemChangeObserver, as arrays of ContactItem and Contac
Item.Identifier instances, respectively.
The following RootContainerEnumerator outlines how to implement a ContactItem
Enumerator. The listing shows TODO in places where the implementation depends on the
specifics of your app’s data store.
Overview
ContactProvider / ContactItemEnumerator
Protocol
ContactItemEnumerator
A protocol to provide enumerations of all contact items and changed contact
items.
iOS 18.0+
iPadOS 18.0+


## Page 6



## Page 7



## Page 8

func enumerateContent(in: ContactItemPage, for: any ContactItemContent
Observer) async
Enumerates all items, batched in pages.
Required
struct ContactItemPage
A fixed offset into enumerating all contact items.
protocol ContactItemContentObserver
Topics
Enumerating contact items


## Page 9

A protocol that defines a system observer that receives a resumable enumeration of all items
func enumerateChanges(startingAt: ContactItemSyncAnchor, for: any
ContactItemChangeObserver) async
Enumerates items changed since the last sync.
Required
struct ContactItemSyncAnchor
A snapshot point into enumerating changed contact items.
protocol ContactItemChangeObserver
A protocol that defines a system observer that receives a resumable enumeration of change
contact items.
func invalidate() async
Invalidates the enumerator.
Required
enum ContactItem
An item in the contact database.
protocol ContactItemEnumerating
A protocol to provide enumerators for collections of contact items.
Enumerating item changes
Managing enumerator life cycle
See Also
Providing contacts


