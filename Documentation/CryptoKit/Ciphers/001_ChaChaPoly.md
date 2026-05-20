# 001_ChaChaPoly.pdf

## Page 1

struct SealedBox
A secure container for your data that you access using a cipher.
struct Nonce
A value used once during a cryptographic operation and then discarded.
static func seal<Plaintext>(Plaintext, using: SymmetricKey, nonce: Cha
ChaPoly.Nonce?) throws -> ChaChaPoly.SealedBox
Secures the given plaintext message with encryption and an authentication tag.
static func seal<Plaintext, AuthenticatedData>(Plaintext, using:
SymmetricKey, nonce: ChaChaPoly.Nonce?, authenticating: Authenticated
Data) throws -> ChaChaPoly.SealedBox
Secures the given plaintext message with encryption and an authentication tag that covers
both the encrypted data and additional data.
Topics
Storing the output
Getting a nonce
Securing the plaintext message
Apple CryptoKit / ChaChaPoly
Enumeration
ChaChaPoly
An implementation of the ChaCha20-Poly1305 cipher.
iOS 13.0+
iPadOS 13.0+
Mac Catalyst 13.0+
macOS 10.15+
tvOS 13.0+
visionOS 1.0+
watchOS 6.0+


## Page 2

static func open(ChaChaPoly.SealedBox, using: SymmetricKey) throws ->
Data
Decrypts the message and verifies its authenticity.
static func open<AuthenticatedData>(ChaChaPoly.SealedBox, using:
SymmetricKey, authenticating: AuthenticatedData) throws -> Data
Decrypts the message and verifies the authenticity of both the encrypted message and
additional data.
Sendable, SendableMetatype
enum AES
A container for Advanced Encryption Standard (AES) ciphers.
Decrypting and verifying the message
Relationships
Conforms To
See Also
Ciphers


