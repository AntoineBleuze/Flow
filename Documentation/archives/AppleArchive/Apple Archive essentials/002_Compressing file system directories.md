# 002_Compressing file system directories.pdf

## Page 1

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


## Page 2

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


## Page 3

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


