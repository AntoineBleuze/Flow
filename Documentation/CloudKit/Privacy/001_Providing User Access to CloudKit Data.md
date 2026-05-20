# 001_Providing User Access to CloudKit Data.pdf

## Page 1

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


## Page 2

Store user data in a container’s private database. Use the containers in the example above to find
all record zones in the private database for each container that your app uses.
The example below shows how to iterate over the containers, record zones, and records. It also
shows how to list the fields for each record, which you use to show the data in those records:
Find and List All Records


## Page 3

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


