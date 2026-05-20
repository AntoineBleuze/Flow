# Apple Encrypted Archive essentials.pdf

## Page 1

This sample code project implements the Apple Encrypted Archive library to compress and encry
the contents of a String structure using a SymmetricKey. The sample saves the encrypted
string to the user’s temporary directory and then calls a second function that decrypts the
contents of the file and recreates the string.
The sample imports the Apple CryptoKit framework to create the symmetric cryptographic key.
The sample uses the same key for encryption and decryption.
An ArchiveEncryptionContext object contains the parameters, keys, and other data that th
Apple Encrypted Archive library requires to open an encrypted archive for encryption and
decryption streams. The sample initializes the context with a profile and compression algorithm,
and its symmetric key set for encryption.
Overview
Generate a Symmetric Key
Create a Context for Encryption
Apple Archive / Encrypting and Decrypting a String
Sample Code
Encrypting and Decrypting a String
Encrypt the contents of a string and save the result to the file system, then decryp
and recreate the string from the archive file using Apple Encrypted Archive.
Download
macOS 12.0+
Xcode 13.0+


## Page 2

The destination file stream writes the encrypted file to the file system. In this case, the file stream
mode is writeOnly. The options specify that the stream creates the file if it doesn’t exist, and if
the file does exist, it should be truncated to zero bytes before the stream performs any operation
The encryption stream uses the encryption context and the destination file stream to write the
encrypted string to the file system.
The encoding stream encodes its data as a byte stream and sends the encoded data to the
encryption stream.
Open the Destination File Stream
Create the Encryption Stream
Open the Encode Stream


## Page 3

The archive headers contains three fields that specify the unarchived file name, the compressed
file type, and the compressed file payload.
The sample calls ArchiveStream/writeBlob(key:from:) to write the contents of the strin
as a data buffer to the encode stream. In turn, the encode stream writes to the compression
stream, and then the encryption stream writes to the file stream. Finally, the file stream writes the
archive file to the file system:
On return, the file at encryptedFilePath exists as an AppleArchive file in the user’s temporary
directory and contains a single encrypted text file, specified by unarchivedFileName. The
Define the Archive Header
Write the String to the Encode Stream


## Page 4

content of this text file is the specified string.
The sample creates a source file stream to open the encrypted file.
The ArchiveEncryptionContext object for decryption derives its parameters, keys, and othe
data from the encrypted source file, and the sample sets the decryption context with the same
symmetric key that the sample used for encryption.
The decryption stream uses the encryption context and the source file stream to read the
encrypted string from the file system.
Open the Source File Stream
Create a Context for Decryption
Create the Decryption Stream
Open the Decode Stream


## Page 5

The decoding stream provides archive elements from the raw, decompressed data.
The sample derives the size of the decompressed and decrypted string from the DAT field of the
decode stream’s header.
The sample uses this size to alllocate the memory that receives the decoded string.
Allocate a Buffer for the Decoded Data


## Page 6

The ArchiveStream/readBlob(key:into:) function reads the decompressed data from th
DAT field and writes it to the raw buffer pointer. The decode stream parses its input from the
decryption stream that, in turn, decrypts its input from the AppleArchive file supplied by the file
stream.
The sample creates a string from the raw buffer pointer by creating a typed pointer that’s bound t
CChar, and calls init(cString:) to initialize the new string.
Encrypting and Decrypting a Single File
Encrypt a single file and save the result to the file system, then decrypt and recreate the
original file from the archive file using Apple Encrypted Archive.
Encrypting and Decrypting Directories
Compress and encrypt the contents of an entire directory or decompress and decrypt an
archived directory using Apple Encrypted Archive.
class ArchiveEncryptionContext
An object that encapsulates all parameters, keys, and data necessary to open an encrypted
archive for both encryption and decryption streams.
Populate the Buffer with Decoded Data
Initialize a String from the Raw Buffer Pointer
See Also
Apple Encrypted Archive essentials


## Page 7

This sample code project implements the Apple Encrypted Archive library to compress and encry
the contents of a single file using a SymmetricKey. The sample saves the encrypted file to the
user’s temporary directory and then calls a second function that decrypts the contents of the
archive and recreates the original file.
Before running the sample code project in Xcode, ensure you have a file in your temporary
directory (see: NSTemporaryDirectory()) named file.txt.
The sample code project defines FilePath structures that represent the locations of the source
file, the encrypted version of the source file, and the recreated, unencrypted version of the source
file.
Overview
Configure the Sample Code Project
Define File Paths
Apple Archive / Encrypting and Decrypting a Single File
Sample Code
Encrypting and Decrypting a Single File
Encrypt a single file and save the result to the file system, then decrypt and
recreate the original file from the archive file using Apple Encrypted Archive.
Download
macOS 12.0+
Xcode 13.0+


## Page 8

The sample imports the Apple CryptoKit framework to generate the symmetric cryptographic key
The sample uses the same key for encryption and decryption.
An ArchiveEncryptionContext object contains the parameters, keys, and other data that th
Apple Encrypted Archive library requires to open an encrypted archive for encryption and
decryption streams. The sample initializes the context with a profile and compression algorithm,
and its symmetric key set for encryption.
The sample creates a readOnly file stream to read the source file, and a writeOnly file stream
to write the encrypted file to the file system.
Generate a Symmetric Key
Create a Context for Encryption
Open Source and Destination File Streams


## Page 9

The encryption stream uses the encryption context and the destination file stream to write the
encrypted string to the file system.
The process(readingFrom:writingTo:) function sends the output of the file-reading
stream to the encryption stream. In turn, the compression stream sends its output to the file-
writing stream and writes the encrypted file to the file system.
The sample creates a source file stream to open the encrypted file.
Create the Encryption Stream
Encrypt the File
Open the Source File Stream
Create a Context for Decryption


## Page 10

The ArchiveEncryptionContext object for decryption derives its parameters, keys, and othe
data from the encrypted source file, and the sample sets the decryption context with the same
symmetric key that was used for encryption.
The decryption stream uses the encryption context and the source file stream to read the
encrypted string from the file system.
The destination file stream writes the encrypted file to the file system. In this case, the file stream
mode is writeOnly. The options specify that the stream creates the file if it doesn’t exist, and
that if the file does exist, it should be truncated to zero bytes before the stream performs any
operations.
Create the Decryption Stream
Open the Destination File Stream
Decrypt the Source Archive


## Page 11

The process(readingFrom:writingTo:) method writes the output of the decryption stream
to the file-writing stream.
On return, file.decrypted.txt exists in NSTemporaryDirectory() and contains the
decrypted contents of file.encrypted.
Encrypting and Decrypting a String
Encrypt the contents of a string and save the result to the file system, then decrypt and
recreate the string from the archive file using Apple Encrypted Archive.
Encrypting and Decrypting Directories
Compress and encrypt the contents of an entire directory or decompress and decrypt an
archived directory using Apple Encrypted Archive.
class ArchiveEncryptionContext
An object that encapsulates all parameters, keys, and data necessary to open an encrypted
archive for both encryption and decryption streams.
See Also
Apple Encrypted Archive essentials


## Page 12

Note
This sample code project is associated with WWDC21 session 10233: Bring Encrypted
Archives and Performance Improvements to Your App with Accelerate.
Encrypting and Decrypting a String
Encrypt the contents of a string and save the result to the file system, then decrypt and
recreate the string from the archive file using Apple Encrypted Archive.
Encrypting and Decrypting a Single File
Encrypt a single file and save the result to the file system, then decrypt and recreate the
original file from the archive file using Apple Encrypted Archive.
class ArchiveEncryptionContext
Overview
See Also
Apple Encrypted Archive essentials
Apple Archive / Encrypting and Decrypting Directories
Sample Code
Encrypting and Decrypting Directories
Compress and encrypt the contents of an entire directory or decompress and
decrypt an archived directory using Apple Encrypted Archive.
Download
macOS 12.0+
Xcode 13.0+


## Page 13

An object that encapsulates all parameters, keys, and data necessary to open an encrypted
archive for both encryption and decryption streams.


## Page 14

init?(from: ArchiveByteStream)
Returns a new encryption context from the specified encrypted stream.
init(profile: ArchiveEncryptionContext.Profile, compressionAlgorithm:
ArchiveCompression, compressionBlockSize: Int)
Returns a new encryption context from the specified profile, compression algorithm, and
block size.
var mainKey: SymmetricKey?
The main key used to append data to an existing archive.
var symmetricKey: SymmetricKey?
The symmetric encryption key used to encrypt or decrypt an archive.
func generateSymmetricKey() throws -> SymmetricKey
Generates a symmetric encryption key.
Topics
Creating an archive encryption context
Setting and retrieving keys
Apple Archive / ArchiveEncryptionContext
Class
ArchiveEncryptionContext
An object that encapsulates all parameters, keys, and data necessary to open an
encrypted archive for both encryption and decryption streams.
iOS 15.0+
iPadOS 15.0+
Mac Catalyst
macOS 12.0+
tvOS 15.0+
visionOS
watchOS 8.0+


## Page 15

func setSymmetricKey(SymmetricKey) throws
Sets the symmetric encryption key that the context requires for symmetric encryption mode
func setRecipientPrivateKey(P256.KeyAgreement.PrivateKey) throws
Sets the recipient private key that the context requires to decrypt an archive to a specific
recipient in ECDHE encryption profiles.
func setSigningPrivateKey(P256.Signing.PrivateKey) throws
Sets the signing private key that corresponds to the signing public key that you used to crea
the archive.
func setRecipientPublicKey(P256.KeyAgreement.PublicKey) throws
Sets the recipient public key that the context requires to encrypt an archive to a specific
recipient in ECDHE encryption profiles.
func setSigningPublicKey(P256.Signing.PublicKey) throws
Sets the signing public key that the context requires to unlock a signed archive.
static func sign(encryptedStream: ArchiveByteStream, encryptionContext:
ArchiveEncryptionContext) throws
Signs an encrypted archive using the credentials stored in the specified encryption context.
var signatureMode: ArchiveEncryptionContext.SignatureMode
The signature mode, such as an ECDSA Nist P-256 signature.
struct SignatureMode
Constants that describe the signature modes of an encryption context.
func decryptAttributes() -> Bool
Validates decryption keys, collects archive attributes, and updates the context with decrypte
archive attributes.
var archiveIdentifier: Data?
An optional set of data that represents the archive identifier.
var authData: Data?
An optional, unencrypted set of data that’s stored in the archive prologue.
Signing an encryption context
Getting and setting encryption context properties


## Page 16

var checksumMode: ArchiveEncryptionContext.ChecksumMode
The checksum mode, such as the 256-bit SHA-256 checksum.
struct ChecksumMode
Constants that describe the checksum modes of an encryption context.
var containerSize: Int
The size of the compressed and encrypted archive.
var encryptionMode: ArchiveEncryptionContext.EncryptionMode
The encryption mode, such as symmetric key encryption.
struct EncryptionMode
Constants that describe the checksum modes of an encryption context.
var compressionAlgorithm: ArchiveCompression
The compression algorithm, such as LZFSE.
struct ArchiveCompression
Constants that describe compression algorithms.
var compressionBlockSize: Int
The compression block size that defines the size of the blocks, in bytes, that the context spl
data into.
var paddingSize: Int
An integer value that, if not zero, specifies that the size of the final archive is a multiple of the
padding size.
var profile: ArchiveEncryptionContext.Profile
The profile of the archve.
struct Profile
Constants that describe the profile of an encryption context.
var rawSize: Int
The size of the archive raw data.
var signatureEncryptionKey: SymmetricKey?
The signature encryption key that the context requires to sign an encrypted archive.
Setting a password


## Page 17

var password: String?
The password used to encrypt or decrypt an archive.
func generatePassword() throws -> String
Generates a new password.
func setPassword(String) throws
Sets the password from the supplied string.
Encrypting and Decrypting a String
Encrypt the contents of a string and save the result to the file system, then decrypt and
recreate the string from the archive file using Apple Encrypted Archive.
Encrypting and Decrypting a Single File
Encrypt a single file and save the result to the file system, then decrypt and recreate the
original file from the archive file using Apple Encrypted Archive.
Encrypting and Decrypting Directories
Compress and encrypt the contents of an entire directory or decompress and decrypt an
archived directory using Apple Encrypted Archive.
See Also
Apple Encrypted Archive essentials


