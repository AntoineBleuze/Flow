# Export operations.pdf

## Page 1

Conform to this protocol in your app extension to export transportable resources: files on disk tha
can you can copy as-is to the destination device without converting to an intermediate transport
format.
Only use this approach when your app’s files require no changes before exporting. If you convert
files locally to an intermediate transport format, export might fail if there’s not enough free space
on the file system.
During export, the system prevents launching your app and any of its extensions. This ensures the
migration system has exclusive access to the app contents. The export process may also archive,
compress, or de-duplicate the files during transport.
Make continuous progress while exporting by repeatedly calling the archiver’s appendItem(at:
pathInArchive:) method as each resource is ready. If the framework determines that your
extension is hung, it may terminate the extension without migrating the app’s data to the
destination.
Overview
Topics
Exporting resources
AppMigrationKit / ResourcesExportingWithOptions
Protocol
ResourcesExportingWithOptions
A protocol for exporting transportable resources in an archive format.
iOS 26.0+
iPadOS 26.0+


## Page 2

func exportResources(to: sending ResourcesArchiver, request: Migration
RequestWithOptions<Self.OptionsType>) async throws
Exports resources from the app, in response to a request from the migration system.
Required
class ResourcesArchiver
An object your app uses to archive resources during an export operation.
struct MigrationRequestWithOptions
An object that exposes properties of the migration request.
var resourcesSizeEstimate: Int
The estimated size of all resources to export, in bytes.
Required
var resourcesVersion: String
A property that identifies the version of the format the export uses.
Required
var resourcesCompressible: Bool
A property that indicates whether the archiver attempts to compress the resources passed t
it.
Required
associatedtype OptionsType : CaseIterable, Hashable, RawRepresentable,
Sendable
A type that indicates the options supported by the destination device.
Required
AppExtension
AppMigrationExtension
Declaring resource properties
Declaring export options
Relationships
Inherits From


## Page 3

Sendable
SendableMetatype
ResourcesExporting
protocol ResourcesExporting
A protocol for exporting transportable resources in a streaming archive format when the
destination platform doesn’t require special migration options.
Inherited By
See Also
Export operations


## Page 4

This protocol extends ResourcesExportingWithOptions and sets its OptionsType to
MigrationDefaultSupportedOptions, which indicates the destination platform doesn’t
require any special options. If you know your export to the other platform doesn’t need these
options, conform to this protocol in your app exension and implement the methods and properties
defined by ResourcesExportingWithOptions.
As with ResourcesExportingWithOptions, this protocol is only appropriate for transportabl
resources, those that you can copy as-is from the current file system to the destination device.
AppExtension
AppMigrationExtension
ResourcesExportingWithOptions
Sendable
Overview
Relationships
Inherits From
AppMigrationKit / ResourcesExporting
Protocol
ResourcesExporting
A protocol for exporting transportable resources in a streaming archive format
when the destination platform doesn’t require special migration options.
iOS 26.0+
iPadOS 26.0+


## Page 5

SendableMetatype
protocol ResourcesExportingWithOptions
A protocol for exporting transportable resources in an archive format.
See Also
Export operations


