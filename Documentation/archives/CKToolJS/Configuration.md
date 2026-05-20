# Configuration.pdf

## Page 1

A createConfiguration function from one of the @apple/cktool.target.browser or
@apple/cktool.target.nodejs packages creates an instance of this class appropriate for
your target platform.
Note: You shouldn’t create instances of this class directly.
Configuration
Internal use only.
jsonParse
A function that a response parser uses to interpret JSON from the API server.
jsonStringify
A function that a request function uses to prepare JSON to send to the API server.
Overview
Topics
Initializers
Instance Properties
CKTool JS / Configuration
Class
Configuration
An object you use to hold options for communicating with the API server.
CKTool JS 1.2.15+


## Page 2

serverUrl
The URL of the API server.
CKToolNodeJsModule
The imported package that supports using the client library within a Node.js environment.
CKToolBrowserModule
The imported package that supports using the client library within a web browser.
See Also
Configuration


## Page 3

This is the import of all exported content from the @apple/cktool.target.nodejs package.
To configure the tool for Node.js import the createConfiguration function from the
@apple/cktool.target.nodejs package.
createConfiguration
This function creates an instance of Configuration with suitable values for use in Node.js
Overview
Topics
Instance Methods
CKTool JS / CKToolNodeJsModule
Class
CKToolNodeJsModule
The imported package that supports using the client library within a Node.js
environment.
CKTool JS 1.2.15+


## Page 4

Configuration
An object you use to hold options for communicating with the API server.
CKToolBrowserModule
The imported package that supports using the client library within a web browser.
See Also
Configuration


## Page 5

This is the import of all exported content from the @apple/cktool.target.browser package
To configure the tool for web browsers import the createConfiguration function from the
@apple/cktool.target.browser package.
createConfiguration
This function creates an instance of Configuration with suitable values for use in web
browsers.
Overview
Topics
Instance Methods
CKTool JS / CKToolBrowserModule
Class
CKToolBrowserModule
The imported package that supports using the client library within a web browser
CKTool JS 1.2.15+


## Page 6

Configuration
An object you use to hold options for communicating with the API server.
CKToolNodeJsModule
The imported package that supports using the client library within a Node.js environment.
See Also
Configuration


