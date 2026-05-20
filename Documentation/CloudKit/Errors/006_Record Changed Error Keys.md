# 006_Record Changed Error Keys.pdf

## Page 1

If the version of a record on the server is newer than the version you try to save, the server return
a CKError.Code.serverRecordChanged error. The error’s userInfo dictionary contains th
different versions of the conflicting records. Use these keys to retrieve the records, and to perform
any resolution logic necessary to resolve the conflict.
let CKRecordChangedErrorAncestorRecordKey: String
The key to retrieve the original version of the record.
let CKRecordChangedErrorClientRecordKey: String
The key to retrieve the local version of the record.
let CKRecordChangedErrorServerRecordKey: String
The key to retrieve the server’s version of the record.
Overview
Topics
Record Changed Error Keys
See Also
Errors
CloudKit / Record Changed Error Keys
API Collection
Record Changed Error Keys
Constants that represent conflicting records in a save operation.


## Page 2

let CKErrorDomain: String
The error domain for CloudKit errors.
struct CKError
A type that describes a CloudKit error.
enum Code
The error codes that CloudKit returns.
let CKErrorRetryAfterKey: String
The key to retrieve the number of seconds to wait before you retry a request.
let CKErrorUserDidResetEncryptedDataKey: String
The key that determines whether CloudKit deletes a record zone because of a user action.
let CKPartialErrorsByItemIDKey: String
The key to retrieve partial errors.


