# 000_ResourcesImporting.pdf

## Page 1

Conform to this protocol in your app extension to import transportable resources: files on disk tha
can you can copy as-is from the source device without converting to an intermediate transport
format.
Important
In the event of an error, the migration system clears the data container of the containing app to
prevent apps receiving only partially imported state. However, the system doesn’t clear app
group containers. To handle this situation, have your app handle errors by clearing any app
group containers prior to importing your content.
func importResources(at: URL, request: ResourcesImportRequest) async 
throws
Imports resources to the app, in response to a request from the migration system.
Required
Overview
Topics
Importing resources
AppMigrationKit / ResourcesImporting
Protocol
ResourcesImporting
A protocol for exporting transportable resources in a streaming archive format.
iOS 26.0+
iPadOS 26.0+


## Page 2

struct ResourcesImportRequest
A type that exposes properties of the resources import request.
var resourcesImportProgress: Progress
A value to indicate the extension’s progress as it imports resources.
Required
AppExtension
AppMigrationExtension
Sendable
SendableMetatype
Expressing progress
Relationships
Inherits From


