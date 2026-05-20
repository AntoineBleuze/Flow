# 000_ContactItem.pdf

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


