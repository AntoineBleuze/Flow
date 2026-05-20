# 005_CKAsset.pdf

## Page 1

Encrypting User Data
Use assets to incorporate external files into your app’s records, such as photos, videos, and binar
files. Alternatively, use assets when a field’s value is more than a few kilobytes in size. To associat
an instance of CKAsset with a record, assign it to one of its fields.
Note
CloudKit stores only an asset’s data. If you require its filename, or any other file-system
metadata, use one or more separate fields on the record to store it.
CloudKit stores an asset’s data separately from a record that references it, but maintains an
association with that record. When you save a record that has an asset, CloudKit saves both the
record and the asset to the server. Similarly, when you fetch the record, the server returns the
record and the asset.
When you fetch a record that contains an asset, CloudKit stores the asset’s data in a staging area
accessible to your app. Use the asset’s fileURL property to access its staged location. The
system regularly deletes files in the staging area to reclaim disk space. To avoid this behavior, mo
the data into your app’s container as soon as you fetch it.
Mentioned in
Overview
CloudKit / CKAsset
Class
CKAsset
An external file that belongs to a record.
iOS 8.0+
iPadOS 8.0+
Mac Catalyst 13.1+
macOS 10.10+
tvOS
visionOS 1.0+
watchOS 3.0+


## Page 2

If you don’t require the asset when retrieving records, use the operation’s desiredKeys propert
to exclude the field. For more information, see CKFetchRecordsOperation, CKQuery
Operation, and CKFetchRecordZoneChangesOperation.
If you no longer require an asset that’s on the server, you don’t delete it. Instead, orphan the asse
by setting any fields that contain the asset to nil and then saving the record. CloudKit periodical
deletes orphaned assets from the server.
init(fileURL: URL)
Creates an asset that references a file.
var fileURL: URL?
The URL for accessing the asset.
NSObject
CKRecordValueProtocol
CVarArg
Copyable
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Sendable
Topics
Creating an Asset
Getting the URL of the Asset
Relationships
Inherits From
Conforms To


## Page 3

SendableMetatype
Designing and Creating a CloudKit Database
Create a schema to store your app’s objects as records in iCloud using CloudKit.
Managing iCloud Containers with CloudKit Database App
Inspect and modify the schema and data for your app’s iCloud container.
class CKRecordZone
A database partition that contains related records.
class CKRecord
A collection of key-value pairs that store your app’s data.
class Reference
A relationship between two records in a record zone.
Integrating a Text-Based Schema into Your Workflow
Define and update your schema with the CloudKit Schema Language.
See Also
Schemas


