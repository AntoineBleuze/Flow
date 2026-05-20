# Message authentication codes.pdf

## Page 1

Use hash-based message authentication to create a code with a value that’s dependent on both a
block of data and a symmetric cryptographic key. Another party with access to the data and the
same secret key can compute the code again and compare it to the original to detect whether the
data changed. This serves a purpose similar to digital signing and verification, but depends on a
shared symmetric key instead of public-key cryptography.
As with digital signing, the data isn’t hidden by this process. When you need to encrypt the data a
well as authenticate it, use a cipher like AES or ChaChaPoly to put the data into a sealed box (an
instance of AES.GCM.SealedBox or ChaChaPoly.SealedBox).
typealias Key
An alias for the symmetric key type used to compute or verify a message authentication cod
struct SymmetricKey
A symmetric cryptographic key.
Overview
Topics
Getting a key
Apple CryptoKit / HMAC
Structure
HMAC
A hash-based message authentication algorithm.
iOS 13.0+
iPadOS 13.0+
Mac Catalyst 13.0+
macOS 10.15+
tvOS 13.0+
visionOS 1.0+
watchOS 6.0+


## Page 2

typealias MAC
An alias for a hash-based message authentication code.
struct HashedAuthenticationCode
A hash-based message authentication code.
protocol MessageAuthenticationCode
A type that represents a message authentication code.
static func authenticationCode<D>(for: D, using: SymmetricKey) -> HMAC<
>.MAC
Computes a message authentication code for the given data.
init(key: SymmetricKey)
Creates a message authentication code generator.
func update<D>(data: D)
Updates the message authentication code computation with a block of data.
func finalize() -> HMAC<H>.MAC
Finalizes the message authentication computation and returns the computed code.
static func isValidAuthenticationCode<D>(HMAC<H>.MAC, authenticating: D
using: SymmetricKey) -> Bool
Returns a Boolean value indicating whether the given message authentication code is valid f
a block of data.
static func isValidAuthenticationCode(HMAC<H>.MAC, authenticating:
UnsafeRawBufferPointer, using: SymmetricKey) -> Bool
Returns a Boolean value indicating whether the given message authentication code is valid f
a block of data stored in a buffer.
Working with codes
Creating an authentication code with one call
Creating an authentication code iteratively
Checking an authentication code


## Page 3

static func isValidAuthenticationCode<C, D>(C, authenticating: D, using
SymmetricKey) -> Bool
Returns a Boolean value indicating whether the given message authentication code
represented as contiguous bytes is valid for a block of data.
Sendable, SendableMetatype
struct SymmetricKey
A symmetric cryptographic key.
struct SymmetricKeySize
The sizes that a symmetric cryptographic key can take.
Relationships
Conforms To
See Also
Message authentication codes


## Page 4

You typically derive a symmetric key from an instance of a shared secret (SharedSecret) that
you obtain through key agreement. You use a symmetric key to compute a message authenticatio
code like HMAC, or to open and close a sealed box (ChaChaPoly.SealedBox or AES.GCM
.SealedBox) using a cipher like ChaChaPoly or AES.
init<D>(data: D)
Creates a key from the given data.
init(size: SymmetricKeySize)
Generates a new random key of the given size.
var bitCount: Int
Overview
Topics
Creating a key
Getting the key length
Apple CryptoKit / SymmetricKey
Structure
SymmetricKey
A symmetric cryptographic key.
iOS 13.0+
iPadOS 13.0+
Mac Catalyst 13.0+
macOS 10.15+
tvOS 13.0+
visionOS 1.0+
watchOS 6.0+


## Page 5

The number of bits in the key.
ContiguousBytes
Copyable
Equatable
Sendable
SendableMetatype
struct HMAC
A hash-based message authentication algorithm.
struct SymmetricKeySize
The sizes that a symmetric cryptographic key can take.
Relationships
Conforms To
See Also
Message authentication codes


## Page 6

When creating a new SymmetricKey instance with a call to its init(size:) initializer, you
typically use one of the standard key sizes, like bits128, bits192, or bits256. When you nee
a key with a non-standard length, use the init(bitCount:) initializer to create a Symmetric
KeySize instance with a custom bit count.
static var bits128: SymmetricKeySize
A size of 128 bits.
static var bits192: SymmetricKeySize
A size of 192 bits.
static var bits256: SymmetricKeySize
A size of 256 bits.
Overview
Topics
Using standard key lengths
Creating a nonstandard key length
Apple CryptoKit / SymmetricKeySize
Structure
SymmetricKeySize
The sizes that a symmetric cryptographic key can take.
iOS 13.0+
iPadOS 13.0+
Mac Catalyst 13.0+
macOS 10.15+
tvOS 13.0+
visionOS 1.0+
watchOS 6.0+


## Page 7

init(bitCount: Int)
Creates a new key size of the given length.
let bitCount: Int
The number of bits in the key.
Sendable, SendableMetatype
struct HMAC
A hash-based message authentication algorithm.
struct SymmetricKey
A symmetric cryptographic key.
Getting the length
Relationships
Conforms To
See Also
Message authentication codes


