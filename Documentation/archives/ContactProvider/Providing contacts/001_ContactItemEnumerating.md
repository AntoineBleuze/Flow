# 001_ContactItemEnumerating.pdf

## Page 1

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


## Page 2

ContactProviderExtension
enum ContactItem
An item in the contact database.
protocol ContactItemEnumerator
A protocol to provide enumerations of all contact items and changed contact items.
Relationships
Inherited By
See Also
Providing contacts


