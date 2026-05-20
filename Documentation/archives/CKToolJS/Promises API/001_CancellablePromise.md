# 001_CancellablePromise.pdf

## Page 1

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


## Page 2

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


