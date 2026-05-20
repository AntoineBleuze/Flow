# Essentials.pdf

## Page 1

When you submit your app to TestFlight or the App Store, you upload your app to a server in the
United States. If you distribute your app outside the U.S. or Canada, your app is subject to U.S.
export laws, regardless of where your legal entity is based. If your app uses, accesses, contains,
implements, or incorporates encryption, this is considered an export of encryption software, whic
means your app is subject to U.S. export compliance requirements, as well as the import
compliance requirements of the countries where you distribute your app.
Every time you submit a new version of your app, App Store Connect asks you questions to guide
you through a compliance review. You can bypass these questions and streamline the submission
process by providing the required information in your app’s Information Property List file
For more information about export compliance, read Export compliance overview.
Add the ITSAppUsesNonExemptEncryption key to your app’s information property list with a
Boolean value that indicates whether your app uses encryption. Set the value to NO if your app—
including any third-party libraries it links against—doesn’t use encryption, or if it only uses forms o
encryption that are exempt from export compliance documentation requirements. Otherwise, set 
to YES.
Overview
Declare Your App’s Use of Encryption
Security / Complying with Encryption Export Regulations
Complying with Encryption Export
Regulations
Declare the use of encryption in your app to streamline the app submission
process.


## Page 2

Typically, the use of encryption that’s built into the operating system—for example, when your app
makes HTTPS connections using URLSession—is exempt from export documentation upload
requirements, whereas the use of proprietary encryption is not. To determine whether your use of
encryption is considered exempt, see Determine and upload app encryption documentation.
Important
If your app uses exempt forms of encryption, you might alternatively be required to submit a
year-end self-classification report to the U.S. government. (If you use non-exempt encryption
and provide documentation to Apple, the self-classification report isn’t necessary.) To learn
more, see How to file an Annual Self Classification Report.
If your app requires export compliance documentation, upload the required items to App Store
Connect, as described in Determine and upload app encryption documentation. After successfull
reviewing the documents, Apple provides you with a code. Add this string as the value for the
ITSEncryptionExportComplianceCode key in your app’s information property list.
Provide Compliance Documentation


## Page 3

ITSAppUsesNonExemptEncryption
A Boolean value indicating whether the app uses encryption.
ITSEncryptionExportComplianceCode
The export compliance code provided by App Store Connect for apps that require it.
Topics
Encryption Export Compliance Keys


## Page 4

Note
This sample code project is associated with WWDC 2019 session 709: Cryptography and Your
Apps.
Complying with Encryption Export Regulations
Declare the use of encryption in your app to streamline the app submission process.
Storing CryptoKit Keys in the Keychain
Convert between strongly typed cryptographic keys and native keychain types.
Enhancing your app’s privacy and security with quantum-secure workflows
Overview
See Also
Essentials
Apple CryptoKit / Performing Common Cryptographic Operations
Sample Code
Performing Common Cryptographic
Operations
Use CryptoKit to carry out operations like hashing, key generation, and encryption
Download
Xcode 15.0+


## Page 5

Use quantum-secure cryptography to protect your app from quantum attacks.


## Page 6

CryptoKit defines highly specific key types that embody a particular cryptographic algorithm and
purpose. Some of these key types, like P256.Signing.PrivateKey, correspond to items that
the Keychain Services API stores natively as SecKey instances. Other key types, like Curve2551
.Signing.PrivateKey, have no direct keychain corollary. To store these kinds of keys, you
package them as generic passwords.
This sample code project demonstrates the conversions needed to store all the CryptoKit key typ
in the keychain.
The sample provides targets for both iOS and macOS. For both platforms, specify your developer
team in the Xcode Signing & Capabilities tab before building. The macOS target also sets the
Keychain Access Groups Entitlement, to enable access to the keychain on that platform.
Keychain Services lets you convert between SecKey instances and data in the X9.63 data format
For NIST keys that support that representation, like P256, P382, and P521, CryptoKit defines a
property that you use to get the X9.63 data. The framework also provides a complementary
initializer that creates a new key from data in that format.
Define a protocol called SecKeyConvertible to express this interface:
Overview
Configure the Sample Code Project
Declare the Convertibility of NIST Keys
Apple CryptoKit / Storing CryptoKit Keys in the Keychain
Sample Code
Storing CryptoKit Keys in the Keychain
Convert between strongly typed cryptographic keys and native keychain types.
Download
iOS 13.0+
iPadOS 13.0+
Mac Catalyst 13.0+
macOS 10.15+
Xcode 11.0+


## Page 7

Then assert that all the NIST private keys adopt this protocol:
Keychain Services also lets you securely store small chunks of data as a generic password keycha
item. For any CryptoKit key without a X9.63 representation, CryptoKit provides a means to obtain
data representation of the key, enabling generic password storage. Define the GenericPasswor
Convertible protocol to establish an interface for these items:
Some keys, like Curve25519, adopt this interface directly, and you simply assert that they do:
Declare the Convertibility of Other Key Types


## Page 8

Other keys offer similar functionality, but require modest adjustments to their interface. For
example, you provide a secure conversion for instances of SymmetricKey:
Keys that you store in the Secure Enclave expose a raw representation as well, but in this case the
data isn’t the raw key. Instead, the Secure Enclave exports an encrypted block that only the same
Secure Enclave can later use to restore the key. You can adopt the same convertibility protocol to
store the Secure Enclave’s encrypted data in the keychain as a generic password, and later allow
the Secure Enclave to reconstruct the key on the same device:


## Page 9

To store a NIST key in the keychain, create a storage method that constrains input keys to be of
type SecKeyConvertible:
Then call the SecKeyCreateWithData(_:_:_:) function with the X9.63 representation of the
key to create a SecKey instance. Include attributes that describe the key as a private, elliptic-cur
key.
Store the SecKey representation in the keychain by placing it in an add query and calling the Sec
ItemAdd(_:_:) function. Give the key a label to make it easier to find later.
Store a NIST Key


## Page 10

To store other kinds of keys, create a different storage method that constrains input keys to be of
type GenericPasswordConvertible:
In this case, you provide the raw representation as the data for the password item, and store that
with a call to the SecItemAdd(_:_:) function:
You retrieve a key from the keychain using a call to the SecItemCopyMatching(_:_:) functio
Construct a query dictionary that pinpoints the particular key that you want to find. After your
search returns the desired key—stored as a SecKeychainItem instance—you cast it as a SecKe
instance.
Store Other Key Types in the Keychain
Retrieve a NIST Key as a Native Keychain Key


## Page 11

Note
The above query returns the first elliptic-curve key with the given label found in the user’s
keychain. You might need to perform a more sophisticated search if more than one key might
match, as described in Storing Keys in the Keychain.
After you get the SecKey reference, initialize a CryptoKit key using the X9.63 representation
returned by the SecKeyCopyExternalRepresentation(_:_:) function.
Make sure that the type of the key that you initialize using the data matches the type of the origin
key. For example, initializing a P256 key from the data corresponding to a keychain item that you
created using a P384 key produces undefined results.
You also retrieve generic passwords using the SecItemCopyMatching(_:_:) function, in this
case using kSecClassGenericPassword for the item’s class. You convert the returned item to
data, and use it directly to instantiate a key of the corresponding type:
Retrieve Keys Stored as Generic Passwords


## Page 12

As long as the type you initialize matches the type that you previously used to store the item in th
keychain, the initialization correctly reconstructs the key.
Complying with Encryption Export Regulations
Declare the use of encryption in your app to streamline the app submission process.
Performing Common Cryptographic Operations
Use CryptoKit to carry out operations like hashing, key generation, and encryption.
Enhancing your app’s privacy and security with quantum-secure workflows
Use quantum-secure cryptography to protect your app from quantum attacks.
See Also
Essentials


## Page 13

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


## Page 14

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


## Page 15

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


## Page 16

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


## Page 17

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


## Page 18



