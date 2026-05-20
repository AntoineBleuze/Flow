# 005_Decompressing and parsing an archived string.pdf

## Page 1

In this article, you’ll learn how to use AppleArchive to decompress and parse a previously
compressed string.
The code below decompresses and parses the file generated using the steps explained in
Compressing and saving a string to the file system. The operation obtains the contents of the DAT
blob for the first file in the archive and creates a string from that data.
Create a FilePath structure that specifies the file name and location of the AppleArchive file tha
stores the compressed data. You must add read and write file access to the Downloads folder in
the Signing and Capabilities pane. To learn more about configuring the App Sandbox, see
Configure App Sandbox.
The following code creates a file path to lorem.aar:
Overview
Specify the compressed file path
Accelerate / Decompressing and parsing an archived string
Article
Decompressing and parsing an archived
string
Recreate a string from an archive file.


## Page 2

The ArchiveByteStream class provides static factory methods that create streams for differen
functions. In this case, use fileStream(path:mode:options:permissions:) to create a
byte stream that reads the source file:
Create the decompression stream. Specify the file-reading stream as the input stream that
provides the compressed data:
Create a decoding stream that provides archive elements from the raw, decompressed data:
Create the file stream to read the source archive
Create the decompression stream
Create the decoding stream


## Page 3

Use the size of the DAT blob field that you specified in Compressing and saving a string to the file
system to create a buffer to receive the uncompressed data. To access the size, read the DAT fiel
of the decode stream’s header:
Create an UnsafeMutableRawBufferPointer structure and allocate to it it the size of the
original string to receive the decompressed data:
Derive the size of the uncompressed string
Decompress the archived string


## Page 4

Call readBlob(key:into:) to read the decompressed data from the DAT field and write it to t
raw buffer pointer. The decode stream parses its input from the decompression stream that, in
turn, decompresses its input from the AppleArchive file supplied by the file stream.
Create a string from the raw buffer pointer by creating a typed pointer that’s bound to CChar, and
use init(cString:) to initialize the new string:
Compressing single files
Compress a single file and store the result on the file system.
Decompressing single files
Recreate a single file from a compressed file.
Compressing file system directories
Compress the contents of an entire directory and store the result on the file system.
Decompressing and extracting an archived directory
Create a string from the raw buffer pointer
See Also
Directories, Files, and Data Archives


## Page 5

Recreate an entire file system directory from an archive file.
Compressing and saving a string to the file system
Compress the contents of a Unicode string and store the result on the file system.


