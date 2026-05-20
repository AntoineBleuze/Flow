# 004_Compressing and saving a string to the file system.pdf

## Page 1

In this article, you’ll learn how to use AppleArchive to compress a String structure, and write the
compressed data to a file in macOS.
The code below compresses a string using the Algorithm.lzfse algorithm, and stores the
result as lorem.txt in an AppleArchive file named lorem.aar. The code writes lorem.aar to
the user’s Downloads directory.
Create a string that contains the data the code compresses.
In a real-world app, you’ll most likely generate the string from a source such as user input. For thi
example, specify the string as a literal:
Create a FilePath structure that specifies the file name and location of the AppleArchive file tha
stores the compressed data. You must add read and write file access to the Downloads folder in
the Signing and Capabilities pane. To learn more about configuring the App Sandbox, see App
Sandbox.
Overview
Create the source string
Specify the compressed file path
Accelerate / Compressing and saving a string to the file system
Article
Compressing and saving a string to the file
system
Compress the contents of a Unicode string and store the result on the file system


## Page 2

The following code creates a file path to lorem.aar:
Use fileStream(path:mode:options:permissions:) to create the file stream that writes
the compressed file to the file system. In this case, use the writeOnly mode. Set the options as
create
To specify that the byte stream creates the file if it doesn’t already exist.
truncate
To specify that if the file exists, the byte stream truncates it to zero bytes before it performs
any operations.
Create the compression stream, and specify the compression algorithm as lzfse. Specify the file
writing stream as the stream that receives the compressed data:
Create the file stream to write the compressed File
Create the compression stream


## Page 3

Create the encoding stream. The encoding stream encodes its data as a byte stream, and sends
the encoded data to the compression stream:
Define the header for the archive file. The header contains three fields:
The PAT field contains the file path. Specify the unarchived file name for the PAT field:
The TYP field contains the compressed file type. Specify regularFile for the TYP field:
The DAT field contains the compressed file payload. Specify the size of the uncompressed data, i
bytes, for the DAT field:
Create the encoding stream
Define the archive header


## Page 4

For more information about three-letter keys, see init(_:).
Finally, write the header to the encode stream:
Use writeBlob(key:from:) to write the contents of the string as a blob to the encode stream
In turn, the encode stream writes to the compression stream and then, the compression stream
writes to the file stream. Finally, the file stream writes the archive file to the file system:
On return, lorem.aar exists as an AppleArchive file in the user’s Downloads directory and
contains a single compressed text file, lorem.txt. The content of this text file is loremString
Compressing single files
Compress a single file and store the result on the file system.
Write the string to the encode stream
See Also
Directories, Files, and Data Archives


## Page 5

Decompressing single files
Recreate a single file from a compressed file.
Compressing file system directories
Compress the contents of an entire directory and store the result on the file system.
Decompressing and extracting an archived directory
Recreate an entire file system directory from an archive file.
Decompressing and parsing an archived string
Recreate a string from an archive file.


