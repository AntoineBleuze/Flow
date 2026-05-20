# 004_FileEntityIdentifier.pdf

## Page 1

var draftIdentifier: String?
The document draft identifier, if the document hasn’t been materialized on disk yet.
var fileURL: URL?
A URL that locates a file saved to disk.
var isDraft: Bool
Indicates whether this identifier represents a document draft.
static func draft(identifier: String) -> FileEntityIdentifier
Creates and returns an identifier for a draft document.
static func file(url: URL) throws -> FileEntityIdentifier
Creates and returns an identifier with the provided URL to the file on disk.
Topics
Instance Properties
Type Methods
App Intents / FileEntityIdentifier
Structure
FileEntityIdentifier
An identifier for an app entity that refers to a document or other file.
iOS 18.0+
iPadOS 18.0+
Mac Catalyst
macOS 15.0+
tvOS 18.0+
visionOS 2.0+
watchOS 11.0+


## Page 2

Copyable
Decodable
Encodable
EntityIdentifierConvertible
Equatable
Hashable
Sendable
SendableMetatype
Relationships
Conforms To


