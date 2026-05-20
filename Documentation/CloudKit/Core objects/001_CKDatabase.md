# 001_CKDatabase.pdf

## Page 1

Deciding whether CloudKit is right for your app
A database takes requests and operations and applies them to the objects it contains, whether
that’s record zones, records, or subscriptions. Each of your app’s users has access to the three
separate databases:
A public database that’s accessible to all users of your app.
A private database that’s accessible only to the user of the current device.
A shared database that’s accessible only to the user of the current device, which contains
records that other iCloud users share with them.
The public database is always available, even when the device doesn’t have an active iCloud
account. In this scenario, your app can fetch specific records and perform searches, but it can’t
create or modify records. CloudKit requires an iCloud account for writing to the public database s
it can identify the authors of any changes. All access to the private and shared databases require
an iCloud account.
You don’t create instances of CKDatabase, nor do you subclass it. Instead, you access the
required database using one of your app’s containers. For more information, see CKContainer.
Mentioned in
Overview
CloudKit / CKDatabase
Class
CKDatabase
An object that represents a collection of record zones and subscriptions.
iOS 8.0+
iPadOS 8.0+
Mac Catalyst 13.1+
macOS 10.10+
tvOS
visionOS 1.0+
watchOS 3.0+


## Page 2

By default, CloudKit executes the methods in this class with a low-priority quality of service (QoS
To use a higher-priority QoS, perform the following:
1. Create an instance of CKOperation.Configuration and set its qualityOfService
property to the preferred value.
2. Call the databaseʼs configuredWith(configuration:group:body:) method and provi
the configuration and a trailing closure.
3. In the closure, use the provided database to execute the relevant methods at the preferred QoS
func configuredWith<R>(configuration: CKOperation.Configuration?, group
CKOperationGroup?, body: (CKDatabase) async throws -> R) async rethrows
-> R
Applies a temporary configuration to the database within the scope of a closure that suppor
concurrency.
func configuredWith<R>(configuration: CKOperation.Configuration?, group
CKOperationGroup?, body: (CKDatabase) throws -> R) rethrows -> R
Applies a temporary configuration to the database within the scope of a closure.
Topics
Configuring Database Requests
Fetching Records


## Page 3

func records(for: [CKRecord.ID], desiredKeys: [CKRecord.FieldKey]?)
async throws -> [CKRecord.ID : Result<CKRecord, any Error>]
Fetches the specified records and returns them to an awaiting caller.
func fetch(withRecordIDs: [CKRecord.ID], desiredKeys: [CKRecord.FieldKe
]?, completionHandler: (Result<[CKRecord.ID : Result<CKRecord, any Erro
>], any Error>) -> Void)
Fetches the specified records and delivers them to a completion handler.
func fetch(withRecordID: CKRecord.ID, completionHandler: (CKRecord?,
(any Error)?) -> Void)
Fetches a specific record.
func records(matching: CKQuery, inZoneWith: CKRecordZone.ID?, desired
Keys: [CKRecord.FieldKey]?, resultsLimit: Int) async throws -> (match
Results: [(CKRecord.ID, Result<CKRecord, any Error>)], queryCursor:
CKQueryOperation.Cursor?)
Searches for records that match a predicate and returns them to an awaiting caller.
func records(continuingMatchFrom: CKQueryOperation.Cursor, desiredKeys:
[CKRecord.FieldKey]?, resultsLimit: Int) async throws -> (matchResults:
[(CKRecord.ID, Result<CKRecord, any Error>)], queryCursor: CKQuery
Operation.Cursor?)
Retrieves the next batch of records from an existing search and returns them to an awaiting
caller.
func fetch(withQuery: CKQuery, inZoneWith: CKRecordZone.ID?, desiredKey
: [CKRecord.FieldKey]?, resultsLimit: Int, completionHandler: (Result
<(matchResults: [(CKRecord.ID, Result<CKRecord, any Error>)], query
Cursor: CKQueryOperation.Cursor?), any Error>) -> Void)
Searches for records that match a predicate and delivers them to a completion handler.
func fetch(withCursor: CKQueryOperation.Cursor, desiredKeys: [CKRecord.
FieldKey]?, resultsLimit: Int, completionHandler: (Result<(matchResults
[(CKRecord.ID, Result<CKRecord, any Error>)], queryCursor: CKQuery
Operation.Cursor?), any Error>) -> Void)
Retrieves the next batch of records from an existing search and delivers them to a completio
handler.
func perform(CKQuery, inZoneWith: CKRecordZone.ID?, completionHandler:
([CKRecord]?, (any Error)?) -> Void)
Querying Records


## Page 4

Searches for records matching a predicate in the specified record zone.
Deprecated
func records(matching: CKQuery, inZoneWith: CKRecordZone.ID?) async 
throws -> [CKRecord]
Searches for records in the specified record zone and returns them to an awaiting caller.
Deprecated
func modifyRecords(saving: [CKRecord], deleting: [CKRecord.ID], save
Policy: CKModifyRecordsOperation.RecordSavePolicy, atomically: Bool)
async throws -> (saveResults: [CKRecord.ID : Result<CKRecord, any Error
>], deleteResults: [CKRecord.ID : Result<Void, any Error>])
Modifies the specified records and returns the results to an awaiting caller.
func modifyRecords(saving: [CKRecord], deleting: [CKRecord.ID], save
Policy: CKModifyRecordsOperation.RecordSavePolicy, atomically: Bool,
completionHandler: (Result<(saveResults: [CKRecord.ID : Result<CKRecord
any Error>], deleteResults: [CKRecord.ID : Result<Void, any Error>]),
any Error>) -> Void)
Modifies the specified records and delivers the results to a completion hander.
enum RecordSavePolicy
Constants that indicate which policy to apply when saving records.
func save(CKRecord, completionHandler: (CKRecord?, (any Error)?) -> Voi
)
Saves a specific record.
func delete(withRecordID: CKRecord.ID, completionHandler: (CKRecord.ID?
(any Error)?) -> Void)
Deletes a specific record.
func recordZones(for: [CKRecordZone.ID]) async throws -> [CKRecordZone.
ID : Result<CKRecordZone, any Error>]
Fetches the specified record zones and returns them to an awaiting caller.
Modifying Records
Fetching Record Zones


## Page 5

func fetch(withRecordZoneIDs: [CKRecordZone.ID], completionHandler: (
Result<[CKRecordZone.ID : Result<CKRecordZone, any Error>], any Error>)
-> Void)
Fetches the specified record zones and delivers them to a completion handler.
func fetchAllRecordZones(completionHandler: ([CKRecordZone]?, (any Erro
)?) -> Void)
Fetches all record zones from the current database.
func fetch(withRecordZoneID: CKRecordZone.ID, completionHandler: (
CKRecordZone?, (any Error)?) -> Void)
Fetches a specific record zone.
func modifyRecordZones(saving: [CKRecordZone], deleting: [CKRecordZone.
ID]) async throws -> (saveResults: [CKRecordZone.ID : Result<CKRecord
Zone, any Error>], deleteResults: [CKRecordZone.ID : Result<Void, any
Error>])
Modifies the specified record zones and returns the results to an awaiting caller.
func modifyRecordZones(saving: [CKRecordZone], deleting: [CKRecordZone.
ID], completionHandler: (Result<(saveResults: [CKRecordZone.ID : Result
CKRecordZone, any Error>], deleteResults: [CKRecordZone.ID : Result<Voi
, any Error>]), any Error>) -> Void)
Modifies the specified record zones and delivers the results to a completion handler.
func save(CKRecordZone, completionHandler: (CKRecordZone?, (any Error)?
-> Void)
Saves a specific record zone.
func delete(withRecordZoneID: CKRecordZone.ID, completionHandler: (
CKRecordZone.ID?, (any Error)?) -> Void)
Deletes a specific record zone.
func subscriptions(for: [CKSubscription.ID]) async throws -> [
CKSubscription.ID : Result<CKSubscription, any Error>]
Fetches the specified subscriptions and returns them to an awaiting caller.
Modifying Record Zones
Fetching Subscriptions


## Page 6

func fetch(withSubscriptionIDs: [CKSubscription.ID], completionHandler:
(Result<[CKSubscription.ID : Result<CKSubscription, any Error>], any
Error>) -> Void)
Fetches the specified subscriptions and delivers them to a completion handler.
func subscription(for: CKSubscription.ID) async throws -> CKSubscriptio
Fetches a specific subscription and returns it to an awaiting caller.
func fetch(withSubscriptionID: CKSubscription.ID, completionHandler: (
CKSubscription?, (any Error)?) -> Void)
Fetches a specific subscription and delivers it to a completion handler.
func fetchAllSubscriptions(completionHandler: ([CKSubscription]?, (any
Error)?) -> Void)
Fetches all subscriptions from the current database.
func modifySubscriptions(saving: [CKSubscription], deleting: [
CKSubscription.ID]) async throws -> (saveResults: [CKSubscription.ID :
Result<CKSubscription, any Error>], deleteResults: [CKSubscription.ID :
Result<Void, any Error>])
Modifies the specified subscriptions and returns the results to an awaiting caller.
func modifySubscriptions(saving: [CKSubscription], deleting: [
CKSubscription.ID], completionHandler: (Result<(saveResults: [
CKSubscription.ID : Result<CKSubscription, any Error>], deleteResults: 
CKSubscription.ID : Result<Void, any Error>]), any Error>) -> Void)
Modifies the specified subscriptions and delivers the results to a completion handler.
func save(CKSubscription, completionHandler: (CKSubscription?, (any
Error)?) -> Void)
Saves a specific subscription.
func deleteSubscription(withID: CKSubscription.ID) async throws ->
CKSubscription.ID
Deletes a specific subscription and returns the deleted subscription’s identifier to an awaitin
caller.
func delete(withSubscriptionID: CKSubscription.ID, completionHandler: (
String?, (any Error)?) -> Void)
Deletes a specific subscription and delivers the deleted subscription’s identifier to a
completion handler.
Modifying Subscriptions


## Page 7

func databaseChanges(since: CKServerChangeToken?, resultsLimit: Int?)
async throws -> (modifications: [CKDatabase.DatabaseChange.Modification
], deletions: [CKDatabase.DatabaseChange.Deletion], changeToken:
CKServerChangeToken, moreComing: Bool)
Fetches all modified record zones and returns them to an awaiting caller.
func fetchDatabaseChanges(since: CKServerChangeToken?, resultsLimit: In
?, completionHandler: (Result<(modifications: [CKDatabase.DatabaseChang
.Modification], deletions: [CKDatabase.DatabaseChange.Deletion], change
Token: CKServerChangeToken, moreComing: Bool), any Error>) -> Void)
Fetches all modified record zones and delivers them to a completion handler.
enum DatabaseChange
Objects that indicate the type of database change.
func recordZoneChanges(inZoneWith: CKRecordZone.ID, since: CKServer
ChangeToken?, desiredKeys: [CKRecord.FieldKey]?, resultsLimit: Int?)
async throws -> (modificationResultsByID: [CKRecord.ID : Result<
CKDatabase.RecordZoneChange.Modification, any Error>], deletions: [
CKDatabase.RecordZoneChange.Deletion], changeToken: CKServerChangeToken
moreComing: Bool)
Fetches all modified records from a specific record zone and returns them to an awaiting
caller.
func fetchRecordZoneChanges(inZoneWith: CKRecordZone.ID, since: CKServe
ChangeToken?, desiredKeys: [CKRecord.FieldKey]?, resultsLimit: Int?,
completionHandler: (Result<(modificationResultsByID: [CKRecord.ID :
Result<CKDatabase.RecordZoneChange.Modification, any Error>], deletions
[CKDatabase.RecordZoneChange.Deletion], changeToken: CKServerChangeToke
, moreComing: Bool), any Error>) -> Void)
Fetches all modified records from a specific record zone and delivers them to a completion
handler.
enum RecordZoneChange
Objects that indicate the type of record zone change.
func add(CKDatabaseOperation)
Fetching Changes
Running Operations


## Page 8

Executes the specified operation in the current database.
var databaseScope: CKDatabase.Scope
The type of database.
enum Scope
Constants that represent the scope of a database.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Sendable
SendableMetatype
class CKContainer
A conduit to your app’s databases.
class CKOperationGroup
Getting the Database Type
Relationships
Inherits From
Conforms To
See Also
Core objects


## Page 9

An explicit association between two or more operations.


