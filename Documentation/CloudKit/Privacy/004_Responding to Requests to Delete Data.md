# 004_Responding to Requests to Delete Data.pdf

## Page 1

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


## Page 2

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


## Page 3



