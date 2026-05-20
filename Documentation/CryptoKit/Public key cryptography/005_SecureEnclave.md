# 005_SecureEnclave.pdf

## Page 1

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


## Page 2

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


