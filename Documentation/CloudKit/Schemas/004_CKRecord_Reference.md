# 004_CKRecord_Reference.pdf

## Page 1

Designing and Creating a CloudKit Database
Encrypting User Data
A CKReference object creates a many-to-one relationship between records in your database.
Each reference object stores information about the one record that is the target of the reference.
You then save the reference object in the fields of one or more records to create a link from those
records to the target. Both records must be in the same zone of the same database.
References create a stronger relationship between records than just saving the ID of a record as a
string. Specifically, you can use references to create an ownership model between two records.
When the reference object’s action is CKRecord.ReferenceAction.deleteSelf, the target
of the reference—that is, the record in the reference’s recordID property—becomes the owner o
the source record. Deleting the target (owner) record deletes all its source records. The deletion o
any owned records can trigger further deletions if those records are the owners of other records. 
a record contains two or more CKReference objects with an action of CKRecord.Reference
Action.deleteSelf, CloudKit deletes the record when it deletes any of the objects it
references.
Mentioned in
Overview
CloudKit / CKRecord / CKRecord.Reference
Class
CKRecord.Reference
A relationship between two records in a record zone.
iOS 8.0+
iPadOS 8.0+
Mac Catalyst 13.1+
macOS 10.10+
tvOS
visionOS 1.0+
watchOS 3.0+


## Page 2

Note
It is permissible to create circular owning references for a set of records.
To save multiple records that contain references between them, save the target records first or
save all the records in one batch operation using CKModifyRecordsOperation.
You use reference objects to create strong links between two records and to search for related
fields. When you create new records, you create reference objects and assign them to fields of
your records. The only other time you create reference objects is when you build a search predica
to search for related records.
To link records together and create a strong relationship between them, create a new
CKReference object, initialize it with the owner record, and assign that reference object to a fiel
of the owned record. When you design the relationships among your own records, make the owne
the more important of two related records. The owner record rarely depends on any records that
point to it. The owner record is also the one that you typically fetch first from the database.
Important
There is a hard limit to the number of references with a CKRecord.ReferenceAction
.deleteSelf action that any one record can have. This limit is 750 references, and any
attempt to exceed it results in an error from the server.
The figure below shows an example of a relationship between a to-do list record and a set of item
records that represent individual items to complete. The to-do list is the primary record, or owner
in the relationship because it represents the entire to-do list, including all items on the list. As a
result, each item record has a field that contains a CKReference object that points to the owning
to-do list record.
Interacting with Reference Objects
Linking to Another Record


## Page 3

The following code sample shows how to create the reference object for each item record and
configure it to point at the list record:
An ownership type of organization is useful even if one object doesn’t explicitly own another.
Ownership helps establish the relationships between records and how you search for them in the
database. Ownership doesn’t require the deletion of the owned records when you delete their
owner record. You can prevent such deletions by specifying the CKRecord.ReferenceAction
.none action when you create a CKReference object.
Note
When you’re creating a CKReference between two objects and you have both objects in
memory, be sure to fetch the object on the receiving end of the relationship. This is due to the
creation of the CKReference between the two objects altering the recordChangeTag of the
receiving object on the server.
When you want to find records for a single owner object, you create a CKReference object and
use it to build your search predicate. When you use reference objects in search predicates, the
search code looks only at the ID value in the reference object. It matches the ID in records of the
specified type with the ID you provide in the CKReference object.
The code sample below shows how to use a reference object to construct a query for the records
in the figure above. The listID variable is a placeholder for the record ID of the list with the item
you want to retrieve. The predicate tells the query object to search the owningList field of the
target records and compare the reference object there with the one in the recordToMatch
Objective-C
Searching for Related Records
Swift


## Page 4

variable. Executing the query operation object returns the matching records asynchronously to th
completion block you provide.
init(recordID: CKRecord.ID, action: CKRecord.ReferenceAction)
Creates a reference object that points to the record with the specified ID.
convenience init(record: CKRecord, action: CKRecord.ReferenceAction)
Creates a reference object that points to the specified record object.
typealias Action
A type that represents additional actions that occur when deleting references.
var action: CKRecord.ReferenceAction
The ownership behavior for the records.
var recordID: CKRecord.ID
The ID of the referenced record.
enum ReferenceAction
Objective-C
Topics
Creating a Reference
Getting the Reference Attributes
Swift


## Page 5

Constants that indicate the behavior when deleting a referenced record.
NSObject
CKRecordValueProtocol
CVarArg
Copyable
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCoding
NSCopying
NSObjectProtocol
NSSecureCoding
Sendable
SendableMetatype
Designing and Creating a CloudKit Database
Create a schema to store your app’s objects as records in iCloud using CloudKit.
Managing iCloud Containers with CloudKit Database App
Inspect and modify the schema and data for your app’s iCloud container.
class CKRecordZone
A database partition that contains related records.
Relationships
Inherits From
Conforms To
See Also
Schemas


## Page 6

class CKRecord
A collection of key-value pairs that store your app’s data.
class CKAsset
An external file that belongs to a record.
Integrating a Text-Based Schema into Your Workflow
Define and update your schema with the CloudKit Schema Language.


