# Promises API.pdf

## Page 1

Integrating CloudKit access into your JavaScript automation scripts
You use an instance of PromisesApi to interact with the API. Methods on this class return
promises that complete with a response object.
acceptRecord
Accepts a share on behalf of the current user.
createRecord
Creates a new record.
deleteRecord
Deletes a single record.
Mentioned in
Overview
Topics
Record Management
CKTool JS / PromisesApi
Class
PromisesApi
A class that exposes promise-based functions for interacting with the API.
CKTool JS 1.2.15+


## Page 2

deleteRecordsByQuery
Deletes records matching the provided query.
getRecord
Returns a record’s details.
lookupRecords
Fetches multiple records by record name.
queryRecordChanges
Returns records that changed since a specified sync token or since a zone was created.
queryRecords
Returns a collection of records matching the provided query.
resolveRecord
Fetches information about records given their shortGuid properties.
updateRecord
Updates an existing record.
createZone
Creates a new zone.
deleteZone
Deletes a zone.
getZone
Returns details for a zone.
getZones
Returns a collection of zones.
exportSchema
Downloads the container’s schema.
getContainers
Fetches containers for a team.
Zone Management
Database Management


## Page 3

importSchema
Uploads a file that defines the new schema for the container.
resetConfigToProduction
Resets the container configuration to production.
resetToProduction
Resets the schema of the environment to production.
validateSchema
Validates the uploaded schema file for the container.
Field Values
Database Structures and Enumerations
createAssetUploadUrl
Creates a new URL for uploading assets.
getSessionUser
Returns details for the user in current session.
getTeams
Fetches a list of teams the current user is in.
Team
Details of a developer team.
TeamsResponse
Response object for a list of teams.
PromisesApi
Creates a PromisesApi object.
Database Field Values, Structures and Enumerations
Asset Creation
User and Team
Initialization


## Page 4

PromisesApiOptions
A dictionary of options for promises API classes.
Security
A dictionary of your authorization tokens.
CancellablePromise
A promise that has a function to cancel its operation.
CKToolDatabaseModule
The imported package that provides access to CloudKit containers and databases.
See Also
Promises API


## Page 5

This class wraps an ordinary promise, but also provides a method that can be used to cancel the
promise. The cancel function throws CancelledError if called.
API object methods return a promise of this type. For example, PromisesApi has a create
Record method that returns a CancellablePromise.
CancellablePromise
inner
The wrapped promise.
Overview
Topics
Initializers
Instance Properties
Instance Methods
CKTool JS / CancellablePromise
Class
CancellablePromise
A promise that has a function to cancel its operation.
CKTool JS 1.2.15+


## Page 6

cancel
Stops any work the promise is doing.
catch
Tells CancellablePromise what callback to call on failure of the inner promise.
finally
Tells CancellablePromise what callback to call when the inner promise either succeeds 
fails.
then
Tells CancellablePromise what callbacks to call on success or failure of the inner promis
PromisesApi
A class that exposes promise-based functions for interacting with the API.
CKToolDatabaseModule
The imported package that provides access to CloudKit containers and databases.
See Also
Promises API


## Page 7

This is the import of all exported content from the @apple/cktool.database package.
To access members of CKToolDatabaseModule import the @apple/cktool.database
package the following way:
Alternatively, you can import the package symbols directly:
Importing package symbols this way supports tree-shaking.
Overview
Topics
CKTool JS / CKToolDatabaseModule
Class
CKToolDatabaseModule
The imported package that provides access to CloudKit containers and database
CKTool JS 1.2.15+


## Page 8

createUuid
Creates a new Uuid.
toBase64String
Converts a regular string to a Base64String.
toByte
Converts a numeric value to a Byte.
toByteArray
Converts a numeric array to a ByteArray.
toDouble
Converts a number or numeric string to a Double.
toFloat
Converts a number or numeric string to a Float.
toInt32
Converts a number to an Int32.
toInt64
Converts a number or numeric string to a Int64.
toNumber
Converts a supported numeric type to a JavaScript number.
toUuid
Converts a string to a Uuid.
PromisesApi
A class that exposes promise-based functions for interacting with the API.
Instance Methods
See Also
Promises API


## Page 9

CancellablePromise
A promise that has a function to cancel its operation.


