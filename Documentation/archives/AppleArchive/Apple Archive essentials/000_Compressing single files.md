# 000_Compressing single files.pdf

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


