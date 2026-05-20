# File transfer.pdf

## Page 1

Choosing a transfer representation for a model type
Use a FileRepresentation for transferring types that involve a large amount of data. For
example, if your app defines a Movie type that could represent a lengthy video, use a File
Representation instance to transfer the video data to another app or process.
Mentioned in
Overview
Core Transferable / FileRepresentation
Structure
FileRepresentation
A transfer representation for types that transfer as a file URL.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 9.0+


## Page 2

Note that the overall recommendation is to specify the content type that describes the file conten
as close as possible. For example, if you are sharing a PDF file, declare a FileRepresentation
of a UTType.pdf content type, instead of UTType.fileURL or UTType.content so the data
can be dragged, shared, or imported to apps that support that data type:
It’s efficient to pass data around as a file and the receiver loads it into memory only if it’s required
init(contentType: UTType, shouldAttemptToOpenInPlace: Bool, exporting: 
Item) async throws -> SentTransferredFile, importing: (Received
TransferredFile) async throws -> Item)
Creates a transfer representation for importing and exporting transferable items as files.
init(importedContentType: UTType, shouldAttemptToOpenInPlace: Bool,
importing: (ReceivedTransferredFile) async throws -> Item)
Creates a transfer representation for importing transferable items as files.
init(exportedContentType: UTType, shouldAllowToOpenInPlace: Bool,
exporting: (Item) async throws -> SentTransferredFile)
Creates a transfer representation for exporting transferable items as files.
Topics
Creating a transfer representation
Relationships
Conforms To


## Page 3

Sendable, SendableMetatype, TransferRepresentation
struct SentTransferredFile
A description of a file from the perspective of the sender.
struct ReceivedTransferredFile
A description of a file from the perspective of the receiver.
See Also
File transfer


## Page 4

init(URL, allowAccessingOriginalFile: Bool)
Creates a description of a file from the perspective of the sender.
let file: URL
A URL that describes the location of the file.
let allowAccessingOriginalFile: Bool
A Boolean value that indicates whether the receiver can read and write the original file. When
set to false, the receiver can only gain access to a copy of the file.
Sendable, SendableMetatype
Topics
Configuring a file transfer
Relationships
Conforms To
Core Transferable / SentTransferredFile
Structure
SentTransferredFile
A description of a file from the perspective of the sender.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 9.0+


## Page 5

struct FileRepresentation
A transfer representation for types that transfer as a file URL.
struct ReceivedTransferredFile
A description of a file from the perspective of the receiver.
See Also
File transfer


## Page 6

let file: URL
The received file on disk.
let isOriginalFile: Bool
A Boolean value that indicates whether the file’s URL points to the original file provided by th
sender or to a copy.
Sendable, SendableMetatype
Topics
Configuring a file transfer
Relationships
Conforms To
See Also
Core Transferable / ReceivedTransferredFile
Structure
ReceivedTransferredFile
A description of a file from the perspective of the receiver.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 9.0+


## Page 7

struct FileRepresentation
A transfer representation for types that transfer as a file URL.
struct SentTransferredFile
A description of a file from the perspective of the sender.
File transfer


