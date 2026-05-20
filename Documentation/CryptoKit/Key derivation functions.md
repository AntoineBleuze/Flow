# Key derivation functions.pdf

## Page 1

The key derivation functions allow you to derive one or more secrets of the size of your choice fro
a main key or passcode. The key derivation function is compliant with IETF RFC 5869. Use one of
the deriveKey functions, such as deriveKey(inputKeyMaterial:outputByteCount:) o
deriveKey(inputKeyMaterial:salt:info:outputByteCount:), to derive a key from a
main secret or passcode in a single function.
To derive a key with more fine-grained control, use extract(inputKeyMaterial:salt:) to
create cryptographically strong key material in the form of a hashed authentication code, then ca
expand(pseudoRandomKey:info:outputByteCount:) using that key material to generate
symmetric key of the length you specify.
static func deriveKey(inputKeyMaterial: SymmetricKey, outputByteCount:
Int) -> SymmetricKey
Derives a symmetric encryption key from a main key or passcode using HKDF key derivation
Overview
Topics
Deriving a key
Apple CryptoKit / HKDF
Structure
HKDF
A standards-based implementation of an HMAC-based Key Derivation Function
(HKDF).
iOS 14.0+
iPadOS 14.0+
Mac Catalyst 14.0+
macOS 11.0+
tvOS 14.0+
visionOS 1.0+
watchOS 7.0+


## Page 2

static func deriveKey<Info>(inputKeyMaterial: SymmetricKey, info: Info,
outputByteCount: Int) -> SymmetricKey
Derives a symmetric encryption key from a main key or passcode using HKDF key derivation
with information you specify.
static func deriveKey<Salt>(inputKeyMaterial: SymmetricKey, salt: Salt,
outputByteCount: Int) -> SymmetricKey
Derives a symmetric encryption key from a main key or passcode using HKDF key derivation
with salt that you specify.
static func deriveKey<Salt, Info>(inputKeyMaterial: SymmetricKey, salt:
Salt, info: Info, outputByteCount: Int) -> SymmetricKey
Derives a symmetric encryption key from a main key or passcode using HKDF key derivation
with information and salt you specify.
static func extract<Salt>(inputKeyMaterial: SymmetricKey, salt: Salt?) 
> HashedAuthenticationCode<H>
Creates cryptographically strong key material from a main key or passcode that you specify.
static func expand<PRK, Info>(pseudoRandomKey: PRK, info: Info?, output
ByteCount: Int) -> SymmetricKey
Expands cryptographically strong key material into a derived symmetric key.
Sendable, SendableMetatype
Controlling key derivation
Relationships
Conforms To


