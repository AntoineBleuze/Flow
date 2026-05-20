# 006_Integrating a Text-Based Schema into Your Workflow.pdf

## Page 1

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


## Page 2

Additional details and guidelines for creating roles, record types, type names, field names, data
types and permissions are listed below.
create-role
Creates a new role and grants create, read, or write permissions on record types.
record-type
Creates a new record, composed of fields and their types, and grants permissions to roles.


## Page 3

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


## Page 4

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


## Page 5

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


## Page 6

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


## Page 7



