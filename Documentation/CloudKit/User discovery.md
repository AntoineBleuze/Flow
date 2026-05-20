# User discovery.pdf

## Page 1

A user identity provides identifiable data about an iCloud user, including their name, user record I
and an email address or phone number. CloudKit retrieves this information from the user’s iCloud
account. A user must give their consent to be discoverable before CloudKit can provide this data 
your app. For more information, see requestApplicationPermission(_:completion
Handler:).
You don’t create instances of this class. Instead, CloudKit provides them in certain contexts. A
share’s owner has a user identity, as does each of its participants. When creating participants,
CloudKit tries to find iCloud accounts it can use to populate their identities. If CloudKit doesn’t fin
an account, it sets the identity’s hasiCloudAccount property to false.
You can also discover the identities of your app’s users by executing one of the user discovery
operations: CKDiscoverAllUserIdentitiesOperation and CKDiscoverUserIdentitie
Operation. Identities that CloudKit discovers using CKDiscoverAllUserIdentities
Operation correspond to entries in the device’s Contacts database. These identities contain the
identifiers of their Contact records, which you can use to fetch those records from the Contacts
database. For more information, see contactIdentifiers.
Overview
Topics
Accessing iCloud Information
CloudKit / CKUserIdentity
Class
CKUserIdentity
The identity of a user.
iOS 10.0+
iPadOS 10.0+
Mac Catalyst 13.1+
macOS 10.12+
tvOS 10.0+
visionOS 1.0+
watchOS 3.0+


## Page 2

var hasiCloudAccount: Bool
A Boolean value that indicates whether the user has an iCloud account.
var lookupInfo: CKUserIdentity.LookupInfo?
The lookup info for retrieving the user identity.
class LookupInfo
The criteria to use when searching for discoverable iCloud users.
var userRecordID: CKRecord.ID?
The user record ID for the corresponding user record.
var contactIdentifiers: [String]
Identifiers that match contacts in the local Contacts database.
Deprecated
var nameComponents: PersonNameComponents?
The user’s name.
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
Accessing User Information
Relationships
Inherits From
Conforms To


## Page 3

SendableMetatype
class LookupInfo
The criteria to use when searching for discoverable iCloud users.
See Also
User discovery


## Page 4

Use this object when you want to discover the identities of your app’s users with CKDiscover
UserIdentitiesOperation, or to create a share’s participants with CKFetchShare
ParticipantsOperation.
You create individual instances by providing an email address, phone number, or user record ID.
Alternatively, create an array of objects all at once by using one of the convenience methods, suc
as lookupInfos(withEmails:).
init(emailAddress: String)
Creates a lookup info for the specified email address.
init(phoneNumber: String)
Creates a lookup info for the specified phone number.
init(userRecordID: CKRecord.ID)
Creates a lookup info for the specified user record ID.
Overview
Topics
Creating a Lookup Info
CloudKit / CKUserIdentity / CKUserIdentity.LookupInfo
Class
CKUserIdentity.LookupInfo
The criteria to use when searching for discoverable iCloud users.
iOS 10.0+
iPadOS 10.0+
Mac Catalyst 13.1+
macOS 10.12+
tvOS 10.0+
visionOS 1.0+
watchOS 3.0+


## Page 5

class func lookupInfos(withEmails: [String]) -> [CKUserIdentity.Lookup
Info]
Returns an array of lookup infos for the specifed email addresses.
class func lookupInfos(withPhoneNumbers: [String]) -> [CKUserIdentity.
LookupInfo]
Returns an array of lookup infos for the specifed phone numbers.
class func lookupInfos(with: [CKRecord.ID]) -> [CKUserIdentity.Lookup
Info]
Returns an array of lookup infos for the specifed user record IDs.
var emailAddress: String?
The user’s email address.
var phoneNumber: String?
The user’s phone number.
var userRecordID: CKRecord.ID?
The ID of the user record.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
Creating Multiple Lookup Infos
Accessing the Criteria
Relationships
Inherits From
Conforms To


## Page 6

NSCoding
NSCopying
NSObjectProtocol
NSSecureCoding
Sendable
SendableMetatype
class CKUserIdentity
The identity of a user.
See Also
User discovery


