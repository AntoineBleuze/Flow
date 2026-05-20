# 001_ResourcesExporting.pdf

## Page 1

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


## Page 2

SendableMetatype
protocol ResourcesExportingWithOptions
A protocol for exporting transportable resources in an archive format.
See Also
Export operations


