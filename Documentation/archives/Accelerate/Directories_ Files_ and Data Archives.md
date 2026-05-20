# Directories_ Files_ and Data Archives.pdf

## Page 1

In this article, you’ll learn how to use AppleArchive to compress a single-source file, and write the
compressed data to a file.
The code below compresses a file named myFile.pdf using the Algorithm.lzfse algorithm
and stores the result in a file named myFile.pdf.lzfse.
The ArchiveByteStream class provides static factory methods that create streams for differen
functions. In this case, use fileStream(path:mode:options:permissions:) to create a
byte stream that reads the source file:
Overview
Create the file stream to read the source file
Create the file stream to write the compressed file
Accelerate / Compressing single files
Article
Compressing single files
Compress a single file and store the result on the file system.


## Page 2

You also use fileStream(path:mode:options:permissions:) to create the file stream
that writes the compressed file to the file system. In this case, use the writeOnly mode:
Create the compression stream, and specify the compression algorithm as lzfse. Specify the file
writing stream as the stream that receives the compressed data:
Finally, call process(readingFrom:writingTo:) to send the output of the file-reading strea
to the compression stream. In turn, the compression stream sends its output to the file-writing
stream:
Create the compression stream
Compress the source file


## Page 3

On return, myFile.pdf.lzfse exists in NSTemporaryDirectory() and contains the
compressed contents of myFile.pdf.
Decompressing single files
Recreate a single file from a compressed file.
Compressing file system directories
Compress the contents of an entire directory and store the result on the file system.
Decompressing and extracting an archived directory
Recreate an entire file system directory from an archive file.
Compressing and saving a string to the file system
Compress the contents of a Unicode string and store the result on the file system.
Decompressing and parsing an archived string
Recreate a string from an archive file.
See Also
Directories, Files, and Data Archives


## Page 4

In this article, you’ll learn how to use AppleArchive to decompress a previously compressed file,
and write the decompressed data to a file.
The code below decompresses the file generated using the steps explained in Compressing singl
files.
The ArchiveByteStream class provides static factory methods that create streams for differen
functions. In this case, use fileStream(path:mode:options:permissions:) to create a
byte stream that reads the source file:
Overview
Create the file stream to read the source archive
Create the file stream to write the decompressed file
Accelerate / Decompressing single files
Article
Decompressing single files
Recreate a single file from a compressed file.


## Page 5

You also use fileStream(path:mode:options:permissions:) to create the file stream
that writes the decompressed file to the file system. In this case, use the writeOnly mode:
Create the decompression stream. Specify the file-reading stream as the input stream that
provides the compressed data:
Finally, call process(readingFrom:writingTo:) to write the output of the decompression
stream to the file-writing stream:
Create the decompression stream
Decompress the source archive


## Page 6

On return, myFile_decompressed.pdf exists in NSTemporaryDirectory() and contains th
decompressed contents of myFile.pdf.lzfse.
Compressing single files
Compress a single file and store the result on the file system.
Compressing file system directories
Compress the contents of an entire directory and store the result on the file system.
Decompressing and extracting an archived directory
Recreate an entire file system directory from an archive file.
Compressing and saving a string to the file system
Compress the contents of a Unicode string and store the result on the file system.
Decompressing and parsing an archived string
Recreate a string from an archive file.
See Also
Directories, Files, and Data Archives


## Page 7

In this article, you’ll learn how to use AppleArchive to compress the contents of an entire directory
to a single archive file.
The code below compresses the contents of a directory name src using the Algorithm.lzfse
algorithm, and stores the result in a file named directory.aar.
Use fileStream(path:mode:options:permissions:) to create the file stream that writes
the compressed file to the file system. In this case, use the writeOnly mode:
Overview
Create the file stream to write the compressed file
Accelerate / Compressing file system directories
Article
Compressing file system directories
Compress the contents of an entire directory and store the result on the file
system.


## Page 8

Create the compression stream, and specify the compression algorithm as lzfse. Specify the file
writing stream as the stream that receives the compressed data:
Create the encoding stream. The encoding stream encodes its data as a byte stream, and sends
the encoded data to the compression stream:
Create a field key set that defines the fields in the archive header:
For more information about three-letter keys, see init(_:).
Use writeDirectoryContents(archiveFrom:path:keySet:selectUsing:flags:
threadCount:) to write the directory contents to the encode stream. In turn, the encode stream
Create the compression stream
Create the encoding stream
Define the header keys
Compress the directory contents


## Page 9

writes to the compression stream and then, the compression stream writes to the file stream.
Finally, the file stream writes the archive file to the file system:
On return, directory.aar exists in NSTemporaryDirectory() and contains the compresse
contents of src/.
Compressing single files
Compress a single file and store the result on the file system.
Decompressing single files
Recreate a single file from a compressed file.
Decompressing and extracting an archived directory
Recreate an entire file system directory from an archive file.
Compressing and saving a string to the file system
Compress the contents of a Unicode string and store the result on the file system.
Decompressing and parsing an archived string
Recreate a string from an archive file.
See Also
Directories, Files, and Data Archives


## Page 10

In this article, you’ll learn how to use AppleArchive to decompress and extract a previously
compressed file system directory.
The code below decompresses the file generated using the steps explained in Compressing file
system directories and writes the files to a directory named dest.
The ArchiveByteStream class provides static factory methods that create streams for differen
functions. In this case, use fileStream(path:mode:options:permissions:) to create a
byte stream that reads the source file:
Overview
Create the file stream to read the source archive
Accelerate / Decompressing and extracting an archived directory
Article
Decompressing and extracting an archived
directory
Recreate an entire file system directory from an archive file.


## Page 11

Create the decompression stream. Specify the file-reading stream as the input stream that
provides the compressed data:
Create a decoding stream that provides archive elements from the raw, decompressed data:
Specify a destination path for the decompressed directory contents. The following code checks
that the destination directory exists and creates the destination if neccessary:
Create the decompression stream
Create the decoding stream
Specify the destination


## Page 12

Create an extract stream that receives archive elements, and extracts to the specified directory:
Finally, call process(readingFrom:writingTo:) to write the output of the decode stream to
the extract stream. In turn, the extract stream extracts each archive element to the decompressio
destination:
On return, the operation recreates the contents of the directory previously archived in director
.aar in NSTemporaryDirectory() + “dest/”.
Compressing single files
Compress a single file and store the result on the file system.
Decompressing single files
Recreate a single file from a compressed file.
Compressing file system directories
Compress the contents of an entire directory and store the result on the file system.
Create the extract stream
Decompress and extract the archived directory
See Also
Directories, Files, and Data Archives


## Page 13

Compressing and saving a string to the file system
Compress the contents of a Unicode string and store the result on the file system.
Decompressing and parsing an archived string
Recreate a string from an archive file.


## Page 14

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


## Page 15

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


## Page 16

Create the encoding stream. The encoding stream encodes its data as a byte stream, and sends
the encoded data to the compression stream:
Define the header for the archive file. The header contains three fields:
The PAT field contains the file path. Specify the unarchived file name for the PAT field:
The TYP field contains the compressed file type. Specify regularFile for the TYP field:
The DAT field contains the compressed file payload. Specify the size of the uncompressed data, i
bytes, for the DAT field:
Create the encoding stream
Define the archive header


## Page 17

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


## Page 18

Decompressing single files
Recreate a single file from a compressed file.
Compressing file system directories
Compress the contents of an entire directory and store the result on the file system.
Decompressing and extracting an archived directory
Recreate an entire file system directory from an archive file.
Decompressing and parsing an archived string
Recreate a string from an archive file.


## Page 19

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


## Page 20

The ArchiveByteStream class provides static factory methods that create streams for differen
functions. In this case, use fileStream(path:mode:options:permissions:) to create a
byte stream that reads the source file:
Create the decompression stream. Specify the file-reading stream as the input stream that
provides the compressed data:
Create a decoding stream that provides archive elements from the raw, decompressed data:
Create the file stream to read the source archive
Create the decompression stream
Create the decoding stream


## Page 21

Use the size of the DAT blob field that you specified in Compressing and saving a string to the file
system to create a buffer to receive the uncompressed data. To access the size, read the DAT fiel
of the decode stream’s header:
Create an UnsafeMutableRawBufferPointer structure and allocate to it it the size of the
original string to receive the decompressed data:
Derive the size of the uncompressed string
Decompress the archived string


## Page 22

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


## Page 23

Recreate an entire file system directory from an archive file.
Compressing and saving a string to the file system
Compress the contents of a Unicode string and store the result on the file system.


