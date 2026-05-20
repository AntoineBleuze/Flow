# 001_SentTransferredFile.pdf

## Page 1

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


## Page 2

struct FileRepresentation
A transfer representation for types that transfer as a file URL.
struct ReceivedTransferredFile
A description of a file from the perspective of the receiver.
See Also
File transfer


