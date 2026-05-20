# 003_Decompressing and extracting an archived directory.pdf

## Page 1

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


## Page 2

Create the decompression stream. Specify the file-reading stream as the input stream that
provides the compressed data:
Create a decoding stream that provides archive elements from the raw, decompressed data:
Specify a destination path for the decompressed directory contents. The following code checks
that the destination directory exists and creates the destination if neccessary:
Create the decompression stream
Create the decoding stream
Specify the destination


## Page 3

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


## Page 4

Compressing and saving a string to the file system
Compress the contents of a Unicode string and store the result on the file system.
Decompressing and parsing an archived string
Recreate a string from an archive file.


