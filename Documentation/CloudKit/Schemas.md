# Schemas.pdf

## Page 1

After you enable CloudKit in your app, you create a schema for your container that describes how
to store your objects. A schema defines record types and the possible relationships between them
A record type is a template for the allowed keys and values of a record. This relationship is
analogous to how a class (record type) defines the properties an instance (record) can have.
CloudKit allows you to store your data as CKRecord objects, and relationships between those
objects as CKRecord.Reference associations. Separate your data into record types by groupin
objects of the same type together. If you’ve already separated your model data into classes, these
classes might have the same record type in iCloud. Choose which objects and which of their
properties and relationships you want to persist to iCloud.
Each object property that you persist maps to a key-value pair, known as a field, within a
CKRecord. CKRecord supports value types for your fields, such as String, or more complex
types, such as Data.
For example, a “to-do item” might have the following record type:
Key
Type
Example value
title
String
“Get apples”
dueDate
Date
October 28, 2019
isCompleted
Bool
false
Overview
Design your objects as records
CloudKit / Designing and Creating a CloudKit Database
Article
Designing and Creating a CloudKit
Database
Create a schema to store your app’s objects as records in iCloud using CloudKit.


## Page 2

For information on additional supported value types, see CKRecord.
Create a CKRecord object with a string representing the type of record you want to store, using
initWithRecordType:. Every record type must have a unique string name.
Then set the record’s fields. Because CKRecord is key-value coding compliant, you can use set
ValuesForKeys(_:). The values you set could be from a details sheet that the user fills out.
You can create a schema using CloudKit Dashboard, or you can create a just-in-time schema by
writing records programmatically.
To save a record to your container, you must pick a database to save the record to. Each containe
has a single public database accessible to all app users, and private databases for each user of
your app. Also, a user may have a shared database if that user is accessing another user’s shared
private data. Note that every database within your app’s container shares the same schema.
Although an app can have multiple containers or can share a container, each app has one default
container. You access the default container using default() on CKContainer. The following
example uses the current user’s private database within the app’s default container and exists in a
action handler for a Save button.
Save the record to the user’s private database in the app’s container.
Create records programmatically
Save initial records to iCloud


## Page 3

When you run your app, it adds that record type to the schema and saves the record. If the record
type already exists in the schema, iCloud uses the existing type. Saving a record works only if the
user has signed into their iCloud account on their device.
If saving the record to iCloud succeeds, error is nil. (If error is non-nil, see CKError for
possible values of error.)
Important
During development, you can change your schema as much as you want, but once it’s
deployed to production, you can’t delete any part of it. You can only make additive changes,
such as adding a new field to a record type, or adding new record types.
When designing your app, consider how to handle or prevent error conditions. For example, an
error occurs if your app attempts to save a record to a user’s private database and the user hasn’
yet signed in to iCloud. You might handle this scenario by checking whether the user has signed i
before the app saves the record. If the user hasn’t signed in, present an alert. If they’re signed in,
save the record.
The following example demonstrates preventing the error condition in this manner.
Handle or prevent errors gracefully


## Page 4

In Xcode, run your app to execute the code that saves records and creates the schema in the
database. To verify success, see Inspecting and Editing an iCloud Container’s Schema.
Managing iCloud Containers with CloudKit Database App
Inspect and modify the schema and data for your app’s iCloud container.
class CKRecordZone
A database partition that contains related records.
class CKRecord
A collection of key-value pairs that store your app’s data.
class Reference
A relationship between two records in a record zone.
class CKAsset
An external file that belongs to a record.
Integrating a Text-Based Schema into Your Workflow
Define and update your schema with the CloudKit Schema Language.
Run your app
See Also
Schemas


## Page 5

The CloudKit Database app is a web-based tool for developers to manage their iCloud containers
You can sign in to the CloudKit Database app through the Apple Developer web portal or through
the CloudKit Console at https://icloud.developer.apple.com/.
With the CloudKit Database app, you can:
See all the containers for your account.
View and edit your development schema, and view your production schema.
View and edit your test data during development or debugging.
View logs and metrics for your containers.
Deploy your schema to production. See Deploying an iCloud Container’s Schema.
Obtain API tokens for use with CloudKit web services and CloudKit JS. See Obtaining an API
Token for an iCloud Container.
A schema defines record types and the possible relationships between them. You can use CloudK
Database Console or code to create your app’s schema. If you use code to create a just-in-time
schema, the CloudKit Database app can help you verify the schema is correct.
To navigate to the iCloud container’s schema management page:
1. Sign in to CloudKit Console at https://icloud.developer.apple.com/.
2. Select the CloudKit Database from the app list.
Overview
Navigate to an iCloud Container’s Schema Management
Page
CloudKit / Managing iCloud Containers with CloudKit Database App
Managing iCloud Containers with CloudKit
Database App
Inspect and modify the schema and data for your app’s iCloud container.


## Page 6

3. From the container selection drop-down at the top of the page, choose your app’s container.
4. Click the Record Types menu item in the Schema section to open the container’s schema
management page.
After you select the container you want to manage, you can access information about the schema
quickly by using the menu items. See Inspecting and Editing an iCloud Container’s Schema for
more details.
You can use the CloudKit Database app to inspect data within the public database of an iCloud
container. If you develop using the same iCloud account to store private data, you can also use th
CloudKit Database app to inspect and edit private data.
Don’t use the CloudKit Database app as a general data editor. Although you can create, modify, a
delete records using CloudKit Dashboard, the intent of this functionality is to help you debug you
schema during the design phase.
To navigate to the iCloud container’s data management page:
1. Sign in to CloudKit Console at https://icloud.developer.apple.com/.
2. Select the CloudKit Database from the app list.
3. From the container selection drop-down at the top of the page, choose your app’s container.
Navigate to an iCloud container’s data management page


## Page 7

4. Click the Records menu item in the Data section to open the container’s data management pag
For more information about inspecting a container’s data, see Handling an iCloud Container’s Dat
Inspecting and Editing an iCloud Container’s Schema
Review and edit the schema for your app’s container using the CloudKit Database app.
Handling an iCloud Container’s Data
Inspect and manage your app’s iCloud container data using the CloudKit Database app.
Deploying an iCloud Container’s Schema
Reset your container’s state during development and deploy your container’s schema to
production.
Obtaining an API Token for an iCloud Container
Generate an API token to access CloudKit web services or use CloudKit JS.
Topics
Container Management


## Page 8

Designing and Creating a CloudKit Database
Create a schema to store your app’s objects as records in iCloud using CloudKit.
class CKRecordZone
A database partition that contains related records.
class CKRecord
A collection of key-value pairs that store your app’s data.
class Reference
A relationship between two records in a record zone.
class CKAsset
An external file that belongs to a record.
Integrating a Text-Based Schema into Your Workflow
Define and update your schema with the CloudKit Schema Language.
See Also
Schemas


## Page 9

Zones are an important part of how you organize your data. The public and private databases eac
have a single default zone. In the private database, you can use CKRecordZone objects to create
additional custom zones as necessary. Use custom zones to arrange and encapsulate groups of
related records in the private database. Custom zones support other capabilities too, such as the
ability to write multiple records as a single atomic transaction.
Treat each custom zone as a single unit of data that is separate from every other zone in the
database. Inside the zone, you add records as you would anywhere else. You can also create links
between the records inside a zone by using the CKRecord.Reference class. However, the
CKRecord.Reference class doesn’t support cross-zone linking, so each reference object must
point to a record in the same zone as the current record.
Use the CKRecordZone class as-is and don’t subclass it.
Generally, you use instances of this class to create and manage custom zones. Although you can
use this class to retrieve a database’s default zone, most operations act on records in the default
zone by default, so you rarely need to specify it explicitly.
To create a custom zone, use CKRecordZone to create the zone object, and then save that zone
to the user’s private database using a CKModifyRecordZonesOperation object. You can’t sa
any records in the zone until you save it to the database. When creating records, explicitly specify
Overview
Creating a Custom Record Zone
CloudKit / CKRecordZone
Class
CKRecordZone
A database partition that contains related records.
iOS 8.0+
iPadOS 8.0+
Mac Catalyst 13.1+
macOS 10.10+
tvOS
visionOS 1.0+
watchOS 3.0+


## Page 10

the zone ID if you want the records to reside in a specific zone; otherwise, they save to the defaul
zone. You can’t create custom zones in a public database.
After creating a CKRecordZone object and saving it to the database, you don’t interact with the
object much. Instead, most interactions occur with its corresponding CKRecordZone.ID object
which you use to refer to the zone when creating records.
init(zoneName: String)
Creates a record zone object with the specified zone name.
init(zoneID: CKRecordZone.ID)
Creates a record zone object with the specified zone ID.
class ID
An object that uniquely identifies a record zone in a database.
class func `default`() -> CKRecordZone
Returns the default record zone.
var zoneID: CKRecordZone.ID
The unique ID of the zone.
var capabilities: CKRecordZone.Capabilities
The capabilities that the zone supports.
struct Capabilities
The capabilities that a record zone supports.
var share: CKRecord.Reference?
A reference to the record zone’s share record.
Topics
Creating a Record Zone
Getting the Default Record Zone
Getting the Zone Attributes
Sharing Records


## Page 11

var encryptionScope: CKRecordZone.EncryptionScope
The encryption scope determines the granularity at which encryption keys are stored within
the zone.
enum EncryptionScope
NSObject
CVarArg
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
Instance Properties
Enumerations
Relationships
Inherits From
Conforms To
See Also
Schemas


## Page 12

Create a schema to store your app’s objects as records in iCloud using CloudKit.
Managing iCloud Containers with CloudKit Database App
Inspect and modify the schema and data for your app’s iCloud container.
class CKRecord
A collection of key-value pairs that store your app’s data.
class Reference
A relationship between two records in a record zone.
class CKAsset
An external file that belongs to a record.
Integrating a Text-Based Schema into Your Workflow
Define and update your schema with the CloudKit Schema Language.


## Page 13

Designing and Creating a CloudKit Database
Encrypting User Data
Records are the fundamental objects that manage data in CloudKit. You can define any number of
record types for your app, with each record type corresponding to a different type of information.
Within a record type, you then define one or more fields, each with a name and a value. Records
can contain simple data types, such as strings and numbers, or more complex types, such as
geographic locations or pointers to other records.
An important step in using CloudKit is defining the record types your app supports. A new record
object doesn’t contain any keys or values. During development, you can add new keys and values
at any time. The first time you set a value for a key and save the record, the server associates that
type with the key for all records of the same type. The CKRecord class doesn’t impose these typ
constraints or do any local validation of a record’s contents. CloudKit enforces these constraints
when you save the records.
Mentioned in
Overview
CloudKit / CKRecord
Class
CKRecord
A collection of key-value pairs that store your app’s data.
iOS 8.0+
iPadOS 8.0+
Mac Catalyst 13.1+
macOS 10.10+
tvOS
visionOS 1.0+
watchOS 3.0+


## Page 14

Note
The ability to add new keys is only possible during development. When you deploy to a
production environment, the server returns an error if you try to specify an unknown record
type or try to save a record that contains unknown keys.
Although records behave like dictionaries, there are limitations to the types of values you can
assign to keys. The following are the object types that the CKRecord class supports. Attempting 
specify objects of any other type results in failure. Fields of all types are searchable unless
otherwise noted.
CKRecord fields support the following data types:
NSString
Stores relatively small amounts of text. Although strings themselves can be any length, use a
CKAsset to store large amounts of text.
NSNumber
Stores any numerical information, including integers and floating-point numbers.
NSData
Stores arbitrary bytes of data. A typical use for data objects is to map the bytes that they
contain to a struct. Don’t use data objects for storing large binary data files; use a CKAsse
instead. Data fields aren’t searchable.
NSDate
Stores day and time information in an accessible form.
NSArray
Stores one or more objects of any other type in this table. You can store arrays of strings,
arrays of numbers, arrays of references, and so on.
CLLocation
Stores geographic coordinate data. You use locations in conjunction with the Core Location
framework and any other services that handle location information.
CKAsset
Associates a disk-based file with the record. Although assets have a close association with
records, you manage them separately. For more information about using assets, see CKAsse
CKRecord.Reference
Creates a link to a related record. A reference stores the ID of the target record. The advanta
of using a reference instead of storing the ID as a string is that references can initiate cascad
Supported Data Types


## Page 15

deletions of dependent records. The disadvantage is that references can only link between
records in the same record zone. For more information, see CKRecord.Reference.
Important
To ensure the speed of fetching and saving records, the data that a record stores must not
exceed 1 MB. Assets don’t count toward this limit, but all other data types do.
The process for defining your record types depends entirely on your app and the data you’re tryin
to represent. It’s best to design records that encapsulate data for one unit of information. For
example, you might use one record type to store an employee’s name, job title, and date of hire,
and use a separate record type to store the employee’s address information. Using different reco
types lets you manage, manipulate, and validate the two types of information separately.
Use fields that contain CKRecord.Reference objects to establish relationships between
different types of records. After you define your record types, use the iCloud Dashboard to set
them up. During development, you can also create new record types programmatically.
Indexes make it possible to search the contents of your records efficiently. During development,
the server indexes all fields with data types it can use in the predicate of a query. This automatic
indexing makes it easier to experiment with queries during development, but the indexes require
space in a database and require time to generate and maintain.
To manage the indexing behavior of your records in the production environment, use CloudKit
Dashboard. When migrating your schema from the development environment to the production
environment, enable indexing only for the fields that your app uses in queries, and disable it for al
other fields.
Use this class as-is to manage data coming from or going to the server, and don’t subclass it.
If you store records in a local database, use the encodeSystemFields(with:) method to
encode and store the record’s metadata. The metadata contains the record ID and the change tag
which you need later to sync records in a local database with those in CloudKit.
Defining Records
Indexing the Fields of a Record
Customizing Records
Storing Records Locally


## Page 16

convenience init(recordType: CKRecord.RecordType, recordID: CKRecord.ID
Creates a record using an ID that you provide.
typealias RecordType
The data type that CloudKit requires for record types.
typealias FieldKey
The data type that CloudKit requires for record field names.
convenience init(recordType: CKRecord.RecordType, zoneID: CKRecordZone.
ID)
Creates a record in the specified zone.
Deprecated
func object(forKey: CKRecord.FieldKey) -> (any __CKRecordObjCValue)?
Returns the object that the record stores for the specified key.
subscript(String) -> (any __CKRecordObjCValue)?
Returns the object that the record stores for the specified key.
subscript(CKRecord.FieldKey) -> (any __CKRecordObjCValue)?
Returns the object that the record stores for the specified key.
func setObject((any __CKRecordObjCValue)?, forKey: CKRecord.FieldKey)
Stores an object in the record using the specified key.
func allKeys() -> [CKRecord.FieldKey]
Returns an array of the record’s keys.
func changedKeys() -> [CKRecord.FieldKey]
Returns an array of keys with recent changes to their values.
struct CKRecordKeyValueIterator
An iterator of the record’s key-value pairs.
Topics
Creating a Record
Accessing the Record’s Fields


## Page 17

protocol CKRecordValueProtocol
A description of a CloudKit record value.
protocol CKRecordKeyValueSetting
A protocol for managing the key-value pairs of a CloudKit record.
typealias CKRecordValue
A data type for objects that CloudKit stores on the server.
var recordID: CKRecord.ID
The unique ID of the record.
var recordType: CKRecord.RecordType
The value that your app defines to identify the type of record.
enum SystemType
Possible values for record types of system records.
var creationDate: Date?
The time when CloudKit first saves the record to the server.
var creatorUserRecordID: CKRecord.ID?
The ID of the user who creates the record.
var modificationDate: Date?
The most recent time that CloudKit saved the record to the server.
var lastModifiedUserRecordID: CKRecord.ID?
The ID of the user who most recently modified the record.
var recordChangeTag: String?
The server change token for the record.
class ID
An object that uniquely identifies a record in a database.
var encryptedValues: any CKRecordKeyValueSetting & Sendable
An object that manages the record’s encrypted key-value pairs.
Accessing the Record’s Metadata
Encrypting the Record’s Values


## Page 18

func allTokens() -> [String]
Returns an array of strings to use for full-text searches of the field’s string-based values.
func encodeSystemFields(with: NSCoder)
Encodes the record’s system fields using the specified archiver.
var parent: CKRecord.Reference?
A reference to the record’s parent record.
var share: CKRecord.Reference?
A reference to the share object that determines the share status of the record.
class Reference
A relationship between two records in a record zone.
func setParent(CKRecord?)
Creates and sets a reference object for a parent from its record.
func setParent(CKRecord.ID?)
Creates and sets a reference object for a parent from the parent’s record ID.
enum SystemFieldKey
Possible values for types of system field keys on records.
NSObject
Getting Data for Full-Text Searches
Encoding the Record’s Metadata
Sharing Records
Relationships
Inherits From
Inherited By


## Page 19

CKShare
CKRecordKeyValueSetting
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
Sequence
Designing and Creating a CloudKit Database
Create a schema to store your app’s objects as records in iCloud using CloudKit.
Managing iCloud Containers with CloudKit Database App
Inspect and modify the schema and data for your app’s iCloud container.
class CKRecordZone
A database partition that contains related records.
class Reference
A relationship between two records in a record zone.
class CKAsset
An external file that belongs to a record.
Integrating a Text-Based Schema into Your Workflow
Conforms To
See Also
Schemas


## Page 20

Define and update your schema with the CloudKit Schema Language.


## Page 21

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


## Page 22

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


## Page 23

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


## Page 24

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


## Page 25

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


## Page 26

class CKRecord
A collection of key-value pairs that store your app’s data.
class CKAsset
An external file that belongs to a record.
Integrating a Text-Based Schema into Your Workflow
Define and update your schema with the CloudKit Schema Language.


## Page 27

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


## Page 28

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


## Page 29

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


## Page 30

CloudKit’s textual representation enables you to simultaneously manage your schema and the
application source code that depends on it. The CloudKit command line tools download, verify, an
install a schema to your container’s sandbox environment, while the CloudKit dashboard promote
a schema to the production environment.
When publishing a schema, CloudKit attempts to apply changes to the existing schema, if one
exists, to convert it to the form specifed in the new schema. If the modifications required would
result in potential data loss with respect to the current production schema (like removing a record
type or field name that exists already), then the schema isn’t valid and CloudKit makes no change
For containers with an existing schema, use the CloudKit command line tools to download the
container’s schema. Manually constructing your existing schema by hand isn’t recommended, as
any mistakes may result in your existing sandbox data becoming inaccessible. A good practice is 
integrate the schema into your source code repository.
The grammar for the CloudKit Schema Language contains all the elements to define your schema
Use the grammar to create roles, declare record types and their permissions, as well as specify
data types and options for each field in the record.
Overview
Learn the CloudKit Schema Language Grammar
CloudKit / Integrating a Text-Based Schema into Your Workflow
Article
Integrating a Text-Based Schema into You
Workflow
Define and update your schema with the CloudKit Schema Language.


## Page 31

Additional details and guidelines for creating roles, record types, type names, field names, data
types and permissions are listed below.
create-role
Creates a new role and grants create, read, or write permissions on record types.
record-type
Creates a new record, composed of fields and their types, and grants permissions to roles.


## Page 32

type-name
The identifier for the record type. Use double quotes around the name if it’s a reserved word.
field-name
The identifier for a field within a record type. Use double quotes around the name if it’s a
reserved word.
field-options
The options define additional attributes of the field.
QUERYABLE - Maintains an index to optimize equality lookups on the field.
SORTABLE - Maintains an index optimizing for range searches on the field.
SEARCHABLE - Maintains a text search index on the field.
data-type
The data type for the field in the record.
Avoid using the NUMBER type, which is only for when a field is implicitly added to a schema by a
record modification on a sandbox container. If such a field has been implicitly added to a type in
your schema, the PREFERRED AS syntax allows you to explicitly indicate which type the NUMBER
should be treated as (INT64 or DOUBLE). Once you assign NUMBER as a PREFERRED AS type,
future definitions must not change that type.
GRANT
The GRANT clause defines permission on the record type in the PUBLIC database. Unless yo
schema explicitly grants permissions, a type has no security privileges available in the PUBLI
database, making the type unusable.
The grammar uses these conventions:
Brackets indicate optional parts.
Braces and vertical bars indicate that you must choose one alternative.
An ellipsis indicates that the preceding element can be repeated.
Names surrounded by percent signs indicate identifiers.
Identifiers must follow existing CloudKit naming conventions and restrictions. User-defined
identifiers must follow these rules:
The first character must be one of a-z or A-Z.
Subsequent characters must be one of a-z, A-Z, 0-9, or _ (underscore).
Use double quotes around identifiers to include keywords and reserved words in the syntax
definition. For example, to create a type called grant, define it as “grant”. The reserved words in
the CloudKit Schema Language are: grant, preferred, queryable, sortable, and searchable.


## Page 33

Also, CloudKit reserves identifiers starting with a leading underscore as system-defined identifier
For example, all record types have an implicitly defined ___recordID field. Use double quotes
when referring to such system fields as well.
The language allows comments in these forms:
CloudKit doesn’t preserve the comments in your schema when you upload them to CloudKit.
Additionally, when you retreive the schema, the order of the elements may differ from the order
when the schema was created or updated.
All record types have the following implicitly defined fields:
“___createTime” TIMESTAMP
”___createdBy” REFERENCE
”___etag” STRING
”___modTime” TIMESTAMP
”___modifiedBy” REFERENCE
”___recordID” REFERENCE
These field names are always present within the record time so it’s not necessary to explicitly
provide them. If you wish to make any of these fields queryable, sortable, or searchable, then you
type must explicitly specify the field and the attribute. You can’t change the type of these system
fields.
Though CloudKit won’t remove the system field names, it doesn’t maintain the field options if the
field isn’t mentioned in later schema updates. For example, if the following is in your schema:
Recognize Implicit Fields and Roles


## Page 34

Then CloudKit builds an index for efficient searches on the record creation time field. Later, if you
modify the schema to no longer mention the creation time field:
Then the __createTime field remains on the record type (since it’s a required system field), but
CloudKit drops the index on the field, and the user query performance may degrade or fail as a
result.
Additionally, all record types have these implicitly defined roles:
“_creator”
The user that created a given record (“Creator” in the dashboard).
”_world”
All users (“World” in the dashboard).
”_icloud”
All authenticated users (“Authenticated” in the dashboard).
For types that you wish to use in a PUBLIC database, include the following grants:
This sample schema defines a simple company department and employee information. It
demonstrates extending the attributes of system fields and the double quotes necessary for
referring to system identifiers.
View an Example Schema


## Page 35

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
class CKAsset
An external file that belongs to a record.
See Also
Schemas


## Page 36



