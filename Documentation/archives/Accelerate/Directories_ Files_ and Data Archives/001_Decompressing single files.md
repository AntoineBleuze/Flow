# 001_Decompressing single files.pdf

## Page 1

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


## Page 2

You also use fileStream(path:mode:options:permissions:) to create the file stream
that writes the decompressed file to the file system. In this case, use the writeOnly mode:
Create the decompression stream. Specify the file-reading stream as the input stream that
provides the compressed data:
Finally, call process(readingFrom:writingTo:) to write the output of the decompression
stream to the file-writing stream:
Create the decompression stream
Decompress the source archive


## Page 3

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


