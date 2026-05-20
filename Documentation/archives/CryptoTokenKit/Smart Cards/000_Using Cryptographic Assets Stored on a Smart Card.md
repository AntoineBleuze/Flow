# 000_Using Cryptographic Assets Stored on a Smart Card.pdf

## Page 1

A token is a storage repository for cryptographic items. When a token is present in the system—
such as when the user physically inserts a smart card into a USB slot—the CryptoTokenKit
framework exposes the token’s items to your app as standard keychain items. It does this by
copying the items to the keychain when the token is inserted, and deleting them from the keychai
when the token is removed.
Because the items appear to your app as standard keychain items, you use Keychain services to
access them. All the usual rules for building a search query and parsing the search results apply.
For an example of storing and retrieving keychain items, see Storing Keys in the Keychain. When
Overview
CryptoTokenKit / Using Cryptographic Assets Stored on a Smart Card
Article
Using Cryptographic Assets Stored on a
Smart Card
Access certificates, keys, and identities stored on a smart card as if they were par
of the keychain.


## Page 2

you work with tokens, the CryptoTokenKit framework handles the storage. You only have to perfor
item retrieval.
When the framework copies an item from a token to the keychain, it records the associated token
identifier, or token ID, as part of the keychain item. If you know the token ID, you can use it to very
precisely filter the keychain search. Do this by including the kSecAttrTokenID key in the query
dictionary. For example, to get a reference to a key that comes from a token with token ID com
.example.piv:0123456789, use the search query:
To identify token IDs that are currently available in the system, use an instance of the TKToken
Watcher class. This object has a tokenIDs property that’s a list of all the token IDs present in t
system. You can read this at any time:
Alternatively, use the setInsertionHandler(_:) method to register for a callback when a
token is inserted into the system. Register to be notified of a particular token’s removal using the
addRemovalHandler(_:forTokenID:) method. You typically use these methods together,
registering for removal at the time the insertion handler is called:
Narrow the Keychain Search with a Token ID
Use a Persistent Reference to Record a Token Item


## Page 3

When you want to keep a record of a token item or pass it to another process, you can get a
persistent reference to the associated keychain item. Do this by setting the kSecReturn
PersistentRef key’s value to true in the keychain search query. For example, the earlier quer
becomes:
However, if you perform any operation with the persistent reference after the token is removed
from the system, Keychain Services returns the errSecItemNotFound status. Handle this by
prompting the user to reinsert the token, after which you can try the operation again.
class TKSmartCardSlotManager
An interface to all available smart card reader slots.
class TKSmartCardSlot
A single smart card reader slot in the system.
class TKSmartCard
A representation of a smart card.
See Also
Smart Cards


