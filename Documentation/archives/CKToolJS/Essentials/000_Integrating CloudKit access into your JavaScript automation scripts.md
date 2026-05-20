# 000_Integrating CloudKit access into your JavaScript automation scripts.pdf

## Page 1

Include CKTool JS in your JavaScript automation testing and continuous integration tasks to
manipulate the schema and the data in your database. To start using CKTool JS in your scripts, yo
need to:
Generate a CloudKit management token
Install CKTool JS and configure it for your environment
Initialize the database API for your scripts to use
CKTool JS requires a CloudKit management token from the CloudKit Console within the Apple
Developer Portal. Generate the token from the CloudKit Console by choosing the Settings section
for your account. Save this token, because it won’t be visible again.
If you’ll be accessing with data in a container, then you’ll also require a user token. You can obtain
user token from CloudKit Console.
To install the CKTool JS client library, you need to have the npm package management tool alread
installed on your machine. The client library suite includes a main database package and a packag
used to target Node.js.
Overview
Obtain a CloudKit management token
Specify and install the CKTool JS packages
CKTool JS / Integrating CloudKit access into your JavaScript automation scripts
Article
Integrating CloudKit access into your
JavaScript automation scripts
Configure your JavaScript project to use CKTool JS.


## Page 2

Note
Each package includes TypeScript type definitions, which enable static type checking and
code completion while editing your code.
Add the CKTool JS database package to your package.json, alongside any other runtime
dependencies that you may have.
Now that you’ve specified your additional package.json dependencies, install them. Run the
following command in your project directory.
This command downloads the CKTool JS packages specified in your dependencies.
In your code, import the configuration factory function for Node.js. This prepares a configuration
object for your target platform that the client library requires for initialization.
After importing the createConfiguration function, you instantiate PromisesApi, passing th
configuration instance along with the management token that you generated from CloudKit
Console.
Prepare the client library for use in your scripts


## Page 3

Use the PromisesApi instance to access your containers from your scripts.
Most methods on the API object require teamId, containerId, and environment. Each
method on the API object takes a single parameters dictionary to pass required and optional value
to the method.
If you create a plain JavaScript object to hold these frequently required parameters, you can use
the JavaScript object spread operator to create a parameter dictionary to pass to a method.
The following code shows how you call an API object method with your parameters object.
In the above example, importSchema requires a file value as well as the values held in
defaultParams. Using the object spread syntax copies all of the values from defaultParams
along with the file parameter for you to pass it to importSchema.
Note
You can add additional values to your parameters object. If the method doesn’t use them, it
ignores those values.
Create a default parameters object to provide required
parameters
Convert value types into the library’s expected types


## Page 4

In order to pass values to CKTool JS functions that expect Float, Double, Int32, Int64, Byte
ByteArray, or UUID values, you must convert the parameters into the appropriate type.
For example, createCKDBRecordFieldInt64Value expects a value that’s an Int64. To use
that function, first convert the value to the expected type using the toInt64 function.
In TypeScript, the compiler catches attempts to pass values of the wrong type. If the value types
are mismatched, JavaScript throws a runtime error.


