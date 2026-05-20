# 004_CBATTErrorDomain.pdf

## Page 1

This value identifies Core Bluetooth Attribute Protocol (ATT) errors when used as the domain of a
NSError instance.
struct CBError
An error that Core Bluetooth returns during Bluetooth transactions.
let CBErrorDomain: String
The domain for Core Bluetooth errors.
enum Code
The codes for errors that Core Bluetooth returns during Bluetooth transactions.
struct CBATTError
An error that Core Bluetooth returns while using Attribute Protocol (ATT).
enum Code
Discussion
See Also
Errors
Core Bluetooth / CBATTErrorDomain
Global Variable
CBATTErrorDomain
The domain for Core Bluetooth ATT errors.
iOS 5.0+
iPadOS 5.0+
Mac Catalyst 13.0+
macOS 10.10+
tvOS 9.0+
visionOS 1.0+
watchOS 4.0+


## Page 2

The possible errors returned by a GATT server (a remote peripheral) during Bluetooth low
energy ATT transactions.
struct CBATTError
An error that Core Bluetooth returns while using Attribute Protocol (ATT).


