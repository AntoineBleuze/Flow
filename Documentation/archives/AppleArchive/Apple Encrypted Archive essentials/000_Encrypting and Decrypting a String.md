# 000_Encrypting and Decrypting a String.pdf

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


