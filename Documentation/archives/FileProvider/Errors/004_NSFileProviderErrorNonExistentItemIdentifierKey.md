# 004_NSFileProviderErrorNonExistentItemIdentifierKey.pdf

## Page 1

Use this key to access the item’s identifier from a noSuchItem error’s userInfo dictionary.
struct NSFileProviderError
A structure that contains information about File Provider extension errors.
enum Code
The error codes for the File Provider extension.
let NSFileProviderErrorDomain: String
The error domain for the File Provider extension.
let NSFileProviderErrorItemKey: String
The key for accessing information about sync-related errors.
Discussion
See Also
Errors
File Provider / NSFileProviderErrorNonExistentItemIdentifierKey
Global Variable
NSFileProviderErrorNonExistentItem
IdentifierKey
The key for accessing the specified item’s identifier when the item doesn’t exist.
iOS 11.0+
iPadOS 11.0+
macOS 11.0+
visionOS 1.0+


## Page 2

let NSFileProviderErrorCollidingItemKey: String
The key for accessing the existing item from a filename collision error’s user info dictionary.
Deprecated


