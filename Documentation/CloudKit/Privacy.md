# Privacy.pdf

## Page 1

The CloudKit framework enforces strict policies and adopts privacy-preserving technologies to
help you encrypt your users’ data. CloudKit stores data and protects data through account
authentication using secure tokens. iCloud servers use encryption to ensure that only authorized
users can access their data.
Encryption adds another layer of protection on top of account-based access control, and is
available for data that’s sensitive or private to the user. CloudKit’s encrypted fields allow you to
optionally add that second layer of cryptographic protection by choosing which fields the system
encrypts within a CKRecord.
Use encrypted fields to offer data encryption to your users in your CloudKit-based apps, such as
Photos, Notes, Health, Home, and so forth. See the iCloud security overview for more information
CloudKit offers multiple database types, but not all databases support encryption.
Private database
Stores data that belongs to a specific iCloud account, so iCloud supports account-based dat
encryption.
Shared database
Stores data that the data owner shares with the current user as a shared participant, so iClou
supports account-based data encryption.
Public database
Stores data that all users of your app can see, so account-based data encryption isn’t
necessary.
Overview
Review Supported Database Types
CloudKit / Encrypting User Data
Article
Encrypting User Data
Deploy industry-standard security technologies using CloudKit encryption.


## Page 2

CloudKit encrypts data with the key material in the user’s iCloud Keychain. If the user loses acces
to iCloud Keychain, CloudKit can’t access the key material that it previously used to encrypt the
data, so iCloud can’t decrypt it.
Apple provides functionality to help users avoid this situation. However, there’s always a risk that 
user might lose access to their iCloud keychain, and subsequently, can choose to start over by
resetting to a new keychain. This may lead to a CKError.Code.zoneNotFound error from
CloudKit that your app needs to handle. See the “Handle a User Keychain Reset” section below fo
more information.
Use the encryptedValues property to set a field on a CKRecord that instructs CloudKit to
automatically encrypt data while writing, and decrypt it while reading. This method of encryption
and decryption applies to most of the Record value types, including NSString, NSNumber,
NSDate, NSData, CLLocation, and NSArray. However, there’s no encryption support for
CKRecord.Reference objects because they need to be visible to the server. CloudKit encrypts
CKAsset by default so you can’t set it as a value for the encryptedValues property.
Below is an example of the encrypted values property setting and getting NSData:
Protect Users
Encrypt Fields in CloudKit


## Page 3

Your CloudKit database schema needs to reflect which fields on specific record types require
encryption. Update your schema in one of the following ways:
Write a new field to a new or existing CKRecord through the encryptedValues property in
the development environment of your container. This triggers a schema update to your
development environment, which reflects in CloudKit console.
Using CloudKit console, add a new field to a new record type in your development environment
schema. Set the field type to the desired encrypted data type, such as Encrypted Double or
Encrypted String.
Promote this schema change to your production environment before deploying any app changes 
the App Store that rely on the new schema.
Note
The encrypted fields can’t have indexes because the server can’t read the fields. The
encrypted fields also have to be newly introduced to an existing record or a new record. You
can’t convert existing unencrypted fields in the CloudKit schema.
Use Assets


## Page 4

When creating or updating a CKRecord that contains a CKAsset, CloudKit breaks up the asset’s
contents into chunks, and encrypts each chunk before storing it in the third-party services.
CloudKit then encrypts the key for each chunk, which Apple maintains, with an asset key and
stores the asset key on the relevant record.
CloudKit automatically stores the asset key in an encrypted field on the record in the private
database, and by proxy, in the shared database. This means that CloudKit ultimately encrypts the
asset data to a key in the user’s iCloud Keychain.
CloudKit doesn’t store the asset key in an encrypted field on the record in the public database
because the record is accessible to anyone with access to that database.
For more information about security, see CloudKit security.
When CloudKit is unable to decrypt the encrypted data, it returns a CKError.Code.zoneNot
Found with an entry of CKErrorUserDidResetEncryptedDataKey in its userInfo
dictionary. This error can occur in any CKOperation that involves reading existing zones or
records, such as:
CKFetchRecordsOperation
CKFetchRecordZonesOperation
CKFetchRecordZoneChangesOperation
CKModifyRecordZonesOperation
CKModifyRecordsOperation
When this error occurs, the data becomes permanently lost. Your app needs to handle this
situation in the following manner:
Delete the relevant zones.
Recreate the relevant zones.
Upload the locally cached data from the device to those zones. CloudKit encrypts the new data
using new key material from the user’s iCloud Keychain.
Note
Users can also choose to manually delete their zones, resulting in data loss that isn’t related to
resetting the keychain. In this case, any CKOperation that involves reading zones or records
might encounter a CKError.Code.userDeletedZone error. For this error, prompt for the
user’s confirmation to purge the associated local records or zones.
Handle a User Keychain Reset


## Page 5

When making requests through the CloudKit web services interface with an authenticated user
against compatible databases, you can:
Save data in an encrypted field
Pass an isEncrypted flag along with the payload in a CKModifyRecordsOperation recor
request
The web services handle the encryption and decryption for you. The rules regarding CloudKit
database schema promotion remain the same for web services as they are for native CloudKit.
The following shows an example request for creating records with the encrypted fields:
Use CloudKit Web Services
See Also
Privacy


## Page 6

Providing User Access to CloudKit Data
Provide users access to the data your app stores on their behalf.
Changing Access Controls on User Data
Restrict access to or remove restrictions from a user’s data at their request.
class CKFetchWebAuthTokenOperation
An operation that creates an authentication token for use with CloudKit web services.
Responding to Requests to Delete Data
Provide options for users to delete their CloudKit data from your app.
Identifying an App’s Containers
Use Xcode’s Project navigator to find the identifiers of active CloudKit containers.


## Page 7

User data in CloudKit belongs to the user. For this reason, apps that integrate with CloudKit need 
provide users with a way to view and export their data.
To be sure that you’re querying all of the data that your app stores, cross-reference the list of
containers your app has access to in Xcode, and assemble a list of those containers’ identifiers.
The CloudKit Dashboard lists the different record types you define for each container in your app
Assemble a list of these types and make sure that each type has a queryable index on its record
Name field.
Associate the record types with the container they appear in. The example below uses a dictionar
to represent the relationship between containers and the record types they contain:
Overview
Identify Containers and Record Types
Associate Record Types with Containers
CloudKit / Providing User Access to CloudKit Data
Article
Providing User Access to CloudKit Data
Provide users access to the data your app stores on their behalf.


## Page 8

Store user data in a container’s private database. Use the containers in the example above to find
all record zones in the private database for each container that your app uses.
The example below shows how to iterate over the containers, record zones, and records. It also
shows how to list the fields for each record, which you use to show the data in those records:
Find and List All Records


## Page 9

Use each field’s keys and values to give users an accessible report of the data your app stores in
CloudKit.
Note
If your app uses CloudKit subscriptions to maintain an on-device copy of user data, you can
use that copy to generate the report rather than querying CloudKit.
Encrypting User Data
Deploy industry-standard security technologies using CloudKit encryption.
Changing Access Controls on User Data
Restrict access to or remove restrictions from a user’s data at their request.
class CKFetchWebAuthTokenOperation
An operation that creates an authentication token for use with CloudKit web services.
Responding to Requests to Delete Data
Provide options for users to delete their CloudKit data from your app.
Identifying an App’s Containers
Use Xcode’s Project navigator to find the identifiers of active CloudKit containers.
See Also
Privacy


## Page 10

Users can ask you to prevent any further changes to their data that your app stores in CloudKit.
Use the restrict API that CloudKit Web Services provides to honor those requests. You can
remove restrictions at the user’s request by calling the unrestrict API.
To be sure that you restrict changes and access to all of a user’s data that your app stores, cross-
reference the list of containers your app has access to in Xcode and assemble a list of those
containers’ identifiers. Identifying an App’s Containers describes this process.
The example below stores containers in constants to use later:
The restrict API call requires a token each time you call the API. You create an API token once
for each container in your app using the CloudKit Dashboard, and reuse it in each API call to a
specific container.
Generate a token in the CloudKit Dashboard by visiting the page for each container, then selectin
API Access > New Token > Create Token. Tokens are specific to a deployment environment, so yo
need separate tokens for the production and development environments.
The example below stores tokens in a dictionary for each container to use later:
Overview
Identify Containers
Create Reusable API Tokens
CloudKit / Changing Access Controls on User Data
Article
Changing Access Controls on User Data
Restrict access to or remove restrictions from a user’s data at their request.


## Page 11

The restrict API call requires a new authentication token each time you call the API, in addition
to the reusable API token. The example below shows how to create that token using an instance o
CKFetchWebAuthTokenOperation:
After you receive the authentication token, you can immediately call the restrict API once for
each container.
Create Web Authentication Tokens
Restrict Data Access in Each Container


## Page 12

The example below defines the restrict(container:apiToken:webToken:completion
Handler:) and requestRestriction(url:completionHandler:) methods for the
example above to build the network request for the restrict API:


## Page 13

When a user requests that you remove restrictions, you use the unrestrict API, which perform
the opposite operation that the restrict API performs.
The example below shows a modified version of the restrict(container:apiToken:web
Token:completionHandler:) method from the previous example that removes restrictions
instead of enabling them:
A successful call to the unrestrict(container:apiToken:webToken: completion
Handler:) function (a nil error parameter in the completion handler indicates success) means
that your app can access and modify user data.
Remove Restrictions
See Also
Privacy


## Page 14

Encrypting User Data
Deploy industry-standard security technologies using CloudKit encryption.
Providing User Access to CloudKit Data
Provide users access to the data your app stores on their behalf.
class CKFetchWebAuthTokenOperation
An operation that creates an authentication token for use with CloudKit web services.
Responding to Requests to Delete Data
Provide options for users to delete their CloudKit data from your app.
Identifying an App’s Containers
Use Xcode’s Project navigator to find the identifiers of active CloudKit containers.


## Page 15

Changing Access Controls on User Data
CloudKit web services provides an HTTP interface to fetch, create, update, and delete records,
zones, and subscriptions. Each request you send requires an API token, which you configure in
CloudKit Dashboard. You must create an API token for each container in each environment.
If you want to send a request to an endpoint that requires an authenticated user, use this operatio
to fetch an authentication token. Append the authentication token, along with the API token, to th
endpoint’s URL. That request then acts on behalf of the current user. Authentication tokens are
short-lived and expire after a single use.
For an example of using a web authentication token with a CloudKit web service, see Changing
Access Controls on User Data.
This operation executes the handlers you provide on an internal queue it manages. Your handlers
must be capable of executing on a background queue. Tasks that need access to the main queue
must redirect as appropriate.
The operation calls fetchWebAuthTokenCompletionBlock after it executes to provide the
fetched token. Use the completion handler to perform housekeeping tasks for the operation. It
should also manage any failures, whether due to an error or an explicit cancellation.
Mentioned in
Overview
CloudKit / CKFetchWebAuthTokenOperation
Class
CKFetchWebAuthTokenOperation
An operation that creates an authentication token for use with CloudKit web
services.
iOS 9.2+
iPadOS 9.2+
Mac Catalyst 13.1+
macOS 10.11+
tvOS 9.1+
visionOS 1.0+
watchOS 3.0+


## Page 16

Note
Because this class inherits from Operation, you can also set the completionBlock
property. The operation calls both completion handlers if they’re both set.
CloudKit operations have a default QoS of QualityOfService.default. Operations with this
service level are discretionary. The system schedules their execution at an optimal time according
to battery level and network conditions, among other factors. Use the qualityOfService
property to set a more appropriate QoS for the operation.
The following example shows how to create the operation, configure its callbacks, and execute it 
the user’s private database:
convenience init(apiToken: String)
Topics
Creating a Fetch Token Operation


## Page 17

Creates a fetch operation for the specified API token.
init()
Creates an empty fetch operation.
var apiToken: String?
The API token that allows access to an app’s container.
var fetchWebAuthTokenCompletionBlock: ((String?, (any Error)?) -> Void)
The block to execute when the operation finishes.
Deprecated
var fetchWebAuthTokenResultBlock: ((Result<String, any Error>) -> Void)
CKDatabaseOperation
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Sendable
SendableMetatype
Managing the Operation’s Configuration
Instance Properties
Relationships
Inherits From
Conforms To
See Also


## Page 18

Encrypting User Data
Deploy industry-standard security technologies using CloudKit encryption.
Providing User Access to CloudKit Data
Provide users access to the data your app stores on their behalf.
Changing Access Controls on User Data
Restrict access to or remove restrictions from a user’s data at their request.
Responding to Requests to Delete Data
Provide options for users to delete their CloudKit data from your app.
Identifying an App’s Containers
Use Xcode’s Project navigator to find the identifiers of active CloudKit containers.
Privacy


## Page 19

If your app stores data in CloudKit on behalf of your users, give them a simple way to delete their
data.
To be sure that you delete all of a user’s data that your app stores in CloudKit, cross-reference th
list of containers your app has access to in Xcode and assemble a list of those containers’
identifiers. Identifying an App’s Containers describes this process.
The example below stores containers in an array to use later for enumeration:
The example below uses an instance of CKModifyRecordZonesOperation to delete all record
in each container’s private database:
Overview
Identify Containers
Delete Records
CloudKit / Responding to Requests to Delete Data
Article
Responding to Requests to Delete Data
Provide options for users to delete their CloudKit data from your app.


## Page 20

Encrypting User Data
Deploy industry-standard security technologies using CloudKit encryption.
Providing User Access to CloudKit Data
Provide users access to the data your app stores on their behalf.
Changing Access Controls on User Data
Restrict access to or remove restrictions from a user’s data at their request.
class CKFetchWebAuthTokenOperation
An operation that creates an authentication token for use with CloudKit web services.
Identifying an App’s Containers
Use Xcode’s Project navigator to find the identifiers of active CloudKit containers.
See Also
Privacy


## Page 21



## Page 22

An app’s Xcode project manages which CloudKit containers are available to that app. When you
write code that needs to provide container identifiers for all of the containers your app uses,
reference the list of active containers in Xcode.
In your app’s Xcode project, select Signing & Capabilities > iCloud in the Project navigator.
Overview
Identify the Containers Your App Uses
CloudKit / Identifying an App’s Containers
Article
Identifying an App’s Containers
Use Xcode’s Project navigator to find the identifiers of active CloudKit containers


## Page 23

After you identify the containers that your app uses, you can create instances of CKContainer i
your app and interact with CloudKit data.
Encrypting User Data
Deploy industry-standard security technologies using CloudKit encryption.
Providing User Access to CloudKit Data
Provide users access to the data your app stores on their behalf.
Changing Access Controls on User Data
Restrict access to or remove restrictions from a user’s data at their request.
class CKFetchWebAuthTokenOperation
An operation that creates an authentication token for use with CloudKit web services.
Responding to Requests to Delete Data
Provide options for users to delete their CloudKit data from your app.
See Also
Privacy


