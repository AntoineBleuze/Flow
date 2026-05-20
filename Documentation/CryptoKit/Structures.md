# Structures.pdf

## Page 1

Apple CryptoKit / CorecryptoCurveType
Structure
CorecryptoCurveType
iOS 18.0+
iPadOS 18.0+
Mac Catalyst 18.0+
macOS 15.0+
tvOS 18.0+
visionOS 1.0+
watchOS 11.0+


## Page 2

The SHA3_256 hash implements the HashFunction protocol for the specific case of SHA-3
hashing with a 256-bit digest (SHA3_256Digest). Larger digests take more space but are more
secure.
Applications can compute the digest by calling the static hash(data:) method once.
Alternatively, if the data to hash is too large to fit in memory, applications can compute the digest
iteratively by creating a new hash instance, calling the update(data:) method repeatedly with
blocks of data, and then calling the finalize() method to get the result.
init()
Creates a SHA3-256 hash function.
Overview
Topics
Initializers
Instance Methods
Apple CryptoKit / SHA3_256
Structure
SHA3_256
An implementation of Secure Hashing Algorithm 3 (SHA-3) hashing with a 256-b
digest.
iOS 26.0+
iPadOS 26.0+
Mac Catalyst 26.0+
macOS 26.0+
tvOS 26.0+
visionOS 2.0+
watchOS 26.0+


## Page 3

func finalize() -> SHA3_256.Digest
Finalizes the hash function and returns the computed digest.
func update(bufferPointer: UnsafeRawBufferPointer)
Incrementally updates the hash function with the contents of the buffer.
typealias Digest
The digest type for a SHA3-256 hash function.
static let blockByteCount: Int
The number of bytes that represents the hash function’s internal state.
static let byteCount: Int
The number of bytes in a SHA3-256 digest.
Copyable
HashFunction
Sendable
SendableMetatype
Type Aliases
Type Properties
Relationships
Conforms To


## Page 4

var description: String
A human-readable description of the digest.
func hash(into: inout Hasher)
Hashes the essential components of the digest by feeding them into the given hash function
static var byteCount: Int
The number of bytes in the digest.
Topics
Instance Properties
Instance Methods
Type Properties
Relationships
Apple CryptoKit / SHA3_256Digest
Structure
SHA3_256Digest
The output of a Secure Hashing Algorithm 3 (SHA-2) hash with a 256-bit digest.
iOS 26.0+
iPadOS 26.0+
Mac Catalyst 26.0+
macOS 26.0+
tvOS 26.0+
visionOS 2.0+
watchOS 26.0+


## Page 5

ContiguousBytes
Copyable
CustomStringConvertible
Digest
Equatable
Hashable
Sendable
SendableMetatype
Sequence
Conforms To


## Page 6

The SHA3_384 hash implements the HashFunction protocol for the specific case of SHA-3
hashing with a 384-bit digest (SHA3_384Digest). Larger digests take more space but are more
secure.
Applications can compute the digest by calling the static hash(data:) method once.
Alternatively, if the data to hash is too large to fit in memory, applications can compute the digest
iteratively by creating a new hash instance, calling the update(data:) method repeatedly with
blocks of data, and then calling the finalize() method to get the result.
init()
Creates a SHA3-384 hash function.
Overview
Topics
Initializers
Instance Methods
Apple CryptoKit / SHA3_384
Structure
SHA3_384
An implementation of Secure Hashing Algorithm 3 (SHA-3) hashing with a 384-b
digest.
iOS 26.0+
iPadOS 26.0+
Mac Catalyst 26.0+
macOS 26.0+
tvOS 26.0+
visionOS 2.0+
watchOS 26.0+


## Page 7

func finalize() -> SHA3_384.Digest
Finalizes the hash function and returns the computed digest.
func update(bufferPointer: UnsafeRawBufferPointer)
Incrementally updates the hash function with the contents of the buffer.
typealias Digest
The digest type for a SHA3-384 hash function.
static let blockByteCount: Int
The number of bytes that represents the hash function’s internal state.
static let byteCount: Int
The number of bytes in a SHA3-384 digest.
Copyable
HashFunction
Sendable
SendableMetatype
Type Aliases
Type Properties
Relationships
Conforms To


## Page 8

var description: String
A human-readable description of the digest.
func hash(into: inout Hasher)
Hashes the essential components of the digest by feeding them into the given hash function
static var byteCount: Int
The number of bytes in the digest.
Topics
Instance Properties
Instance Methods
Type Properties
Relationships
Apple CryptoKit / SHA3_384Digest
Structure
SHA3_384Digest
The output of a Secure Hashing Algorithm 3 (SHA-2) hash with a 384-bit digest.
iOS 26.0+
iPadOS 26.0+
Mac Catalyst 26.0+
macOS 26.0+
tvOS 26.0+
visionOS 2.0+
watchOS 26.0+


## Page 9

ContiguousBytes
Copyable
CustomStringConvertible
Digest
Equatable
Hashable
Sendable
SendableMetatype
Sequence
Conforms To


## Page 10

The SHA3_512 hash implements the HashFunction protocol for the specific case of SHA-3
hashing with a 512-bit digest (SHA3_512Digest). Larger digests take more space but are more
secure.
Applications can compute the digest by calling the static hash(data:) method once.
Alternatively, if the data to hash is too large to fit in memory, applications can compute the digest
iteratively by creating a new hash instance, calling the update(data:) method repeatedly with
blocks of data, and then calling the finalize() method to get the result.
init()
Creates a SHA3-512 hash function.
Overview
Topics
Initializers
Instance Methods
Apple CryptoKit / SHA3_512
Structure
SHA3_512
An implementation of Secure Hashing Algorithm 3 (SHA-3) hashing with a 512-b
digest.
iOS 26.0+
iPadOS 26.0+
Mac Catalyst 26.0+
macOS 26.0+
tvOS 26.0+
visionOS 2.0+
watchOS 26.0+


## Page 11

func finalize() -> SHA3_512.Digest
Finalizes the hash function and returns the computed digest.
func update(bufferPointer: UnsafeRawBufferPointer)
Incrementally updates the hash function with the contents of the buffer.
typealias Digest
The digest type for a SHA3-512 hash function.
static let blockByteCount: Int
The number of bytes that represents the hash function’s internal state.
static let byteCount: Int
The number of bytes in a SHA3-512 digest.
Copyable
HashFunction
Sendable
SendableMetatype
Type Aliases
Type Properties
Relationships
Conforms To


## Page 12

var description: String
A human-readable description of the digest.
func hash(into: inout Hasher)
Hashes the essential components of the digest by feeding them into the given hash function
static var byteCount: Int
The number of bytes in the digest.
Topics
Instance Properties
Instance Methods
Type Properties
Relationships
Apple CryptoKit / SHA3_512Digest
Structure
SHA3_512Digest
The output of a Secure Hashing Algorithm 3 (SHA-2) hash with a 512-bit digest.
iOS 26.0+
iPadOS 26.0+
Mac Catalyst 26.0+
macOS 26.0+
tvOS 26.0+
visionOS 2.0+
watchOS 26.0+


## Page 13

ContiguousBytes
Copyable
CustomStringConvertible
Digest
Equatable
Hashable
Sendable
SendableMetatype
Sequence
Conforms To


