# 003_Enhancing your app_s privacy and security with quantum-secure workflows.pdf

## Page 1

Quantum attacks represent a threat to the security of widely-deployed cryptographic methods,
which assume that attackers use classical, non-quantum computers. Cryptographers have create
new algorithms that are secure against quantum attacks, known as quantum-secure cryptography
Quantum-secure algorithms remain secure from attacks by both classical and quantum computer
Even if an attacker doesn’t currently have access to a quantum computer, they can store any
ciphertext they gain access to, and attack the encryption with a quantum computer later to recov
the cleartext. You can help protect your data against these attacks by adopting quantum-secure
cryptographic mechanisms and algorithms in your app now.
Instead of switching to a cryptographic mechanism that only uses a quantum-secure algorithm,
you can use a hybrid mechanism, which combines the strengths of both a classical and a quantum
secure algorithm. A hybrid scheme remains secure if an attacker breaks either one of the
algorithms the scheme uses. For more information, see Get ahead with quantum-secure
cryptography.
This sample uses round-trip processes — encrypting then decrypting data, or generating a
signature then verifying it — to demonstrate how to adopt quantum-secure cryptographic
algorithms using Apple CryptoKit. In your app, implement the two stages separately; for example,
one person might encrypt a message and send it to another person who decrypts it. The sample
demonstrates how to use quantum-secure hybrid public-key encryption (HPKE) to securely share
secret between two people.
Overview
Apple CryptoKit / Enhancing your app’s privacy and security with quantum-secure workflows
Sample Code
Enhancing your app’s privacy and security
with quantum-secure workflows
Use quantum-secure cryptography to protect your app from quantum attacks.
Download
iOS 26.0+
iPadOS 26.0+
Mac Catalyst 26.0+
macOS 26.0+
Xcode 26.0+


## Page 2

The function KeyTest/check(_:ciphersuite:) in the file KeyTest+PQHPKE.swift
performs a full round-trip using HPKE, encrypting a cleartext message using the encapsulated ke
and verifying that the recipient recovers the same cleartext when they use the encapsulated key t
decrypt the ciphertext they receive. It does this by following these steps:
1. It creates an HPKE.Sender using the recipient’s public key, the specified ciphersuite, and
additional key-derivation information:
2. It retrieves the sender’s encapsulated key:
3. It creates an HPKE.Recipient using the recipient’s private key, the ciphersuite, additional ke
derivation information, and the encapsulated key:
4. It encrypts a message, passing additional metadata that the Sender signs:
5. Finally, it passes the ciphertext to the Recipient to recover the cleartext:
The function testPQHPKE(type:) in the same file calls the check(_:ciphersuite:)
function using the quantum-secure XWingMLKEM768X25519_SHA256_AES_GCM_256
ciphersuite:
Exchange cryptographic keys


## Page 3

The function KeyTest/check(_:) in the file KeyTest+MLKEM.swift generates, encapsulate
and decapsulates a shared secret using the quantum-secure Module-Lattice Key Encapsulation
Mechanism (ML-KEM). It first generates and encapsulates the shared secret using the public key:
The result of this operation is a KEM.EncapsulationResult that contains both the shared
secret and the encapsulated version. The function passes the encapsulated version to the private
key’s decapsulate(_:) method to recover the shared secret:
The function testMLKEM(type:useSecureEnclave:) in the same file calls the check(_:)
function using two different ML-KEM key lengths, either using keys in memory or stored in the
Secure Enclave depending on the value of useSecureEnclave:
The two check(_:) functions in the file KeyTest+MLDSA.swift generate and validate digital
signatures using the quantum-secure Module-Lattice Digital Signature Algorithm (ML-DSA), by
calling methods on the MLDSA65 and MLDSA87 types. Each function accepts a private key, which
uses to sign a test message:
Encapsulate cryptographic keys
Create digital signatures


## Page 4

It then uses the corresponding public key to validate the signature:
The function testMLDSA(type:) in the same file calls the check(_:) function using two
different ML-DSA key lengths, either using keys in memory or stored in the Secure Enclave
depending on the value of useSecureEnclave:
The two check(_:_:) functions in the file KeyTest+HybridSig.swift generate and validate
hybrid digital signatures that use both the quantum-secure ML-DSA, and classic elliptic curve (EC
methods. Each function accepts both an ML-DSA and EC private key, uses both keys to sign a tes
message, and then concatenates the two signatures:
It then extracts the two signatures from the concatenated data, and uses the corresponding publ
keys to validate both:
Create hybrid signatures


## Page 5

The function testHybridSig(type:) in the same file calls the check(_:_:) function using
two different ML-DSA key lengths and two different EC key lengths, either using keys in memory o
stored in the Secure Enclave, depending on the value of useSecureEnclave:
These workflows store the CryptoKit keys in the keychain by converting between strongly typed
cryptographic keys and native Keychain types. Where applicable, they also show how to protect
keys with the Secure Enclave. For more information, see Storing CryptoKit Keys in the Keychain.
Complying with Encryption Export Regulations
Declare the use of encryption in your app to streamline the app submission process.
Performing Common Cryptographic Operations
Use CryptoKit to carry out operations like hashing, key generation, and encryption.
Storing CryptoKit Keys in the Keychain
Convert between strongly typed cryptographic keys and native keychain types.
Store cryptographic keys in the keychain or in the
Secure Enclave
See Also
Essentials


## Page 6



