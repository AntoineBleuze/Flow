# Public key cryptography.pdf

## Page 1

enum KeyAgreement
A mechanism used to create a shared secret between two users by performing X25519 key
agreement.
enum Signing
A mechanism used to create or verify a cryptographic signature using Ed25519.
Sendable, SendableMetatype
Topics
Performing operations
Relationships
Conforms To
See Also
Apple CryptoKit / Curve25519
Enumeration
Curve25519
An elliptic curve that enables X25519 key agreement and Ed25519 signatures.
iOS 13.0+
iPadOS 13.0+
Mac Catalyst 13.0+
macOS 10.15+
tvOS 13.0+
visionOS 1.0+
watchOS 6.0+


## Page 2

enum P521
An elliptic curve that enables NIST P-521 signatures and key agreement.
enum P384
An elliptic curve that enables NIST P-384 signatures and key agreement.
enum P256
An elliptic curve that enables NIST P-256 signatures and key agreement.
struct SharedSecret
A key agreement result from which you can derive a symmetric cryptographic key.
enum SecureEnclave
A representation of a device’s hardware-based key manager.
enum HPKE
A container for hybrid public key encryption (HPKE) operations.
Public key cryptography


## Page 3

enum KeyAgreement
A mechanism used to create a shared secret between two users by performing NIST P-521
elliptic curve Diffie Hellman (ECDH) key exchange.
enum Signing
A mechanism used to create or verify a cryptographic signature using the NIST P-521 elliptic
curve digital signature algorithm (ECDSA).
Sendable, SendableMetatype
Topics
Performing operations
Relationships
Conforms To
Apple CryptoKit / P521
Enumeration
P521
An elliptic curve that enables NIST P-521 signatures and key agreement.
iOS 13.0+
iPadOS 13.0+
Mac Catalyst 13.0+
macOS 10.15+
tvOS 13.0+
visionOS 1.0+
watchOS 6.0+


## Page 4

enum Curve25519
An elliptic curve that enables X25519 key agreement and Ed25519 signatures.
enum P384
An elliptic curve that enables NIST P-384 signatures and key agreement.
enum P256
An elliptic curve that enables NIST P-256 signatures and key agreement.
struct SharedSecret
A key agreement result from which you can derive a symmetric cryptographic key.
enum SecureEnclave
A representation of a device’s hardware-based key manager.
enum HPKE
A container for hybrid public key encryption (HPKE) operations.
See Also
Public key cryptography


## Page 5

enum KeyAgreement
A mechanism used to create a shared secret between two users by performing NIST P-384
elliptic curve Diffie Hellman (ECDH) key exchange.
enum Signing
A mechanism used to create or verify a cryptographic signature using the NIST P-384 ellipti
curve digital signature algorithm (ECDSA).
Sendable, SendableMetatype
Topics
Performing operations
Relationships
Conforms To
Apple CryptoKit / P384
Enumeration
P384
An elliptic curve that enables NIST P-384 signatures and key agreement.
iOS 13.0+
iPadOS 13.0+
Mac Catalyst 13.0+
macOS 10.15+
tvOS 13.0+
visionOS 1.0+
watchOS 6.0+


## Page 6

enum Curve25519
An elliptic curve that enables X25519 key agreement and Ed25519 signatures.
enum P521
An elliptic curve that enables NIST P-521 signatures and key agreement.
enum P256
An elliptic curve that enables NIST P-256 signatures and key agreement.
struct SharedSecret
A key agreement result from which you can derive a symmetric cryptographic key.
enum SecureEnclave
A representation of a device’s hardware-based key manager.
enum HPKE
A container for hybrid public key encryption (HPKE) operations.
See Also
Public key cryptography


## Page 7

enum KeyAgreement
A mechanism used to create a shared secret between two users by performing NIST P-256
elliptic curve Diffie Hellman (ECDH) key exchange.
enum Signing
A mechanism used to create or verify a cryptographic signature using the NIST P-256 ellipti
curve digital signature algorithm (ECDSA).
Sendable, SendableMetatype
Topics
Performing operations
Relationships
Conforms To
Apple CryptoKit / P256
Enumeration
P256
An elliptic curve that enables NIST P-256 signatures and key agreement.
iOS 13.0+
iPadOS 13.0+
Mac Catalyst 13.0+
macOS 10.15+
tvOS 13.0+
visionOS 1.0+
watchOS 6.0+


## Page 8

enum Curve25519
An elliptic curve that enables X25519 key agreement and Ed25519 signatures.
enum P521
An elliptic curve that enables NIST P-521 signatures and key agreement.
enum P384
An elliptic curve that enables NIST P-384 signatures and key agreement.
struct SharedSecret
A key agreement result from which you can derive a symmetric cryptographic key.
enum SecureEnclave
A representation of a device’s hardware-based key manager.
enum HPKE
A container for hybrid public key encryption (HPKE) operations.
See Also
Public key cryptography


## Page 9

Generate a shared secret by calling your private key’s sharedSecretFromKey
Agreement(publicKeyShare:) method with the public key from another party. The other par
computes the same secret by passing your public key to the the equivalent method on their own
private key.
The shared secret isn’t suitable as a symmetric cryptographic key (SymmetricKey) by itself.
However, you use it to generate a key by calling either the hkdfDerivedSymmetricKey(using
salt:sharedInfo:outputByteCount:) or x963DerivedSymmetricKey(using:share
Info:outputByteCount:) method of the shared secret. After the other party does the same,
then you both share a symmetric key suitable for creating a message authentication code like
HMAC, or for opening and closing a sealed box with a cipher like ChaChaPoly or AES.
func hkdfDerivedSymmetricKey<H, Salt, SI>(using: H.Type, salt: Salt,
sharedInfo: SI, outputByteCount: Int) -> SymmetricKey
Derives a symmetric encryption key from the secret using HKDF key derivation.
Overview
Topics
Deriving keys
Apple CryptoKit / SharedSecret
Structure
SharedSecret
A key agreement result from which you can derive a symmetric cryptographic key
iOS 13.0+
iPadOS 13.0+
Mac Catalyst 13.0+
macOS 10.15+
tvOS 13.0+
visionOS 1.0+
watchOS 6.0+


## Page 10

func x963DerivedSymmetricKey<H, SI>(using: H.Type, sharedInfo: SI,
outputByteCount: Int) -> SymmetricKey
Derives a symmetric encryption key from the secret using x9.63 key derivation.
static func == <D>(SharedSecret, D) -> Bool
Determines whether a shared secret is equivalent to a collection of contiguous bytes.
ContiguousBytes
Copyable
CustomStringConvertible
Equatable
Hashable
Sendable
SendableMetatype
enum Curve25519
An elliptic curve that enables X25519 key agreement and Ed25519 signatures.
enum P521
An elliptic curve that enables NIST P-521 signatures and key agreement.
enum P384
An elliptic curve that enables NIST P-384 signatures and key agreement.
enum P256
An elliptic curve that enables NIST P-256 signatures and key agreement.
Comparing shared secrets
Relationships
Conforms To
See Also
Public key cryptography


## Page 11

enum SecureEnclave
A representation of a device’s hardware-based key manager.
enum HPKE
A container for hybrid public key encryption (HPKE) operations.


## Page 12

static var isAvailable: Bool
A Boolean value that indicates if the device supports Secure Enclave access.
enum P256
An elliptic curve that enables NIST P-256 signatures and key agreement within the Secure
Enclave.
enum MLKEM1024
An implementation of the MLKEM1024 key encapsulation mechanism that operates within th
Secure Enclave.
enum MLKEM768
An implementation of the MLKEM768 key encapsulation mechanism that operates within the
Secure Enclave.
Topics
Checking availability
Using the secure enclave
Enumerations
Apple CryptoKit / SecureEnclave
Enumeration
SecureEnclave
A representation of a device’s hardware-based key manager.
iOS 13.0+
iPadOS 13.0+
Mac Catalyst 13.0+
macOS 10.15+
tvOS 13.0+
visionOS 1.0+
watchOS 6.0+


## Page 13

enum MLDSA65
enum MLDSA87
Sendable, SendableMetatype
enum Curve25519
An elliptic curve that enables X25519 key agreement and Ed25519 signatures.
enum P521
An elliptic curve that enables NIST P-521 signatures and key agreement.
enum P384
An elliptic curve that enables NIST P-384 signatures and key agreement.
enum P256
An elliptic curve that enables NIST P-256 signatures and key agreement.
struct SharedSecret
A key agreement result from which you can derive a symmetric cryptographic key.
enum HPKE
A container for hybrid public key encryption (HPKE) operations.
Relationships
Conforms To
See Also
Public key cryptography


## Page 14

Hybrid public key encryption (HPKE) uses a symmetric encryption algorithm to encrypt data, and
encapsulates the symmetric encryption material using a public key encryption algorithm.
HPKE ensures that the ciphertext wasn’t tampered with after its creation. It can also check the
validity of additional cleartext data in apps where you need to send headers or other metadata as
cleartext.
HPKE optionally incorporates sender authentication, allowing the recipient to validate the
authenticity of messages using the sender’s public key.
HPKE is described in the Internet Research Task Force (IRTF) document RFC 9180.
struct Sender
A type that represents the sending side of an HPKE message exchange.
struct Recipient
A type that represents the receiving side of an HPKE message exchange.
Overview
Topics
Sending and receiving messages
Apple CryptoKit / HPKE
Enumeration
HPKE
A container for hybrid public key encryption (HPKE) operations.
iOS 17.0+
iPadOS 17.0+
Mac Catalyst 17.0+
macOS 14.0+
tvOS 17.0+
visionOS 1.0+
watchOS 10.0+


## Page 15

struct Ciphersuite
Cipher suites to use in hybrid public key encryption (HPKE).
enum AEAD
The authenticated encryption with associated data (AEAD) algorithms to use in HPKE.
enum KDF
The key derivation functions to use in HPKE.
enum KEM
The key encapsulation mechanisms to use in HPKE.
enum DHKEM
A container for Diffie-Hellman key encapsulation mechanisms (KEMs).
enum Errors
Hybrid public key encryption (HPKE) errors that CryptoKit uses.
Sendable, SendableMetatype
enum Curve25519
An elliptic curve that enables X25519 key agreement and Ed25519 signatures.
Choosing cryptographic algorithms
Handling errors
Relationships
Conforms To
See Also
Public key cryptography


## Page 16

enum P521
An elliptic curve that enables NIST P-521 signatures and key agreement.
enum P384
An elliptic curve that enables NIST P-384 signatures and key agreement.
enum P256
An elliptic curve that enables NIST P-256 signatures and key agreement.
struct SharedSecret
A key agreement result from which you can derive a symmetric cryptographic key.
enum SecureEnclave
A representation of a device’s hardware-based key manager.


