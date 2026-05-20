# 002_ContactItemEnumerator.pdf

## Page 1

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


## Page 2



## Page 3



## Page 4

func enumerateContent(in: ContactItemPage, for: any ContactItemContent
Observer) async
Enumerates all items, batched in pages.
Required
struct ContactItemPage
A fixed offset into enumerating all contact items.
protocol ContactItemContentObserver
Topics
Enumerating contact items


## Page 5

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


