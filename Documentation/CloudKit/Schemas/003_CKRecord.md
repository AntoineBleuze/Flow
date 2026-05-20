# 003_CKRecord.pdf

## Page 1

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


## Page 2

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


## Page 3

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


## Page 4

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


## Page 5

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


## Page 6

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


## Page 7

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


## Page 8

Define and update your schema with the CloudKit Schema Language.


