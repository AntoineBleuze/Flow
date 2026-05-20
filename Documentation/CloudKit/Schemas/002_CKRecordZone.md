# 002_CKRecordZone.pdf

## Page 1

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


## Page 2

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


## Page 3

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


## Page 4

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


