# 004_iCloud.pdf

## Page 1

class FileManager
A convenient interface to the contents of the file system, and the primary means of interactin
with it.
protocol FileManagerDelegate
The interface a file manager’s delegate uses to intervene during operations or if an error
occurs.
class NSUbiquitousKeyValueStore
An iCloud-based container of key-value pairs you share among instances of your app runnin
on a person’s devices.
class NSMetadataQuery
A query that you perform against Spotlight metadata.
protocol NSMetadataQueryDelegate
An interface that enables the delegate of a metadata query to provide substitute results or
attributes.
Topics
iCloud Storage
App Preferences
File Search
Foundation / iCloud
API Collection
iCloud
Manage files and key-value data that automatically synchronize among a user’s
iCloud devices.


## Page 2

class NSMetadataItem
The metadata associated with a file.
com.apple.developer.icloud-container-development-container-identifiers
The container identifiers for the iCloud development environment.
com.apple.developer.icloud-container-environment
The development or production environment to use for the iCloud containers.
iCloud Container Identifiers Entitlement
The container identifiers for the iCloud production environment.
iCloud Services Entitlement
The iCloud services used by the app.
iCloud Key-Value Store Entitlement
The container identifier to use for iCloud key-value storage.
iCloud Error Codes
Error codes to expect when an iCloud-related error occurs.
File System
Create, read, write, and examine files and folders in the file system.
Archives and Serialization
Convert objects and values to and from property list, JSON, and other flat binary
representations.
Settings
Configure your app using data you store persistently on the local disk or in iCloud.
Entitlements
Errors
See Also
Files and Data Persistence


## Page 3

Spotlight
Search for files and other items on the local device, and index your app’s content for
searching.
Optimizing Your App’s Data for iCloud Backup
Minimize the space and time that backups take to create by excluding purgeable and
nonpurgeable data from backups.


