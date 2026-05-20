# 005_Identifying an App_s Containers.pdf

## Page 1

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


## Page 2

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


