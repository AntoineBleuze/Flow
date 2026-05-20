# Global Structures and Enumerations.pdf

## Page 1

Your app’s data is stored in a container. For information about what containers are available to you
with CloudKit Console, see https://icloud.developer.apple.com. If you’re using Xcode,
you can find your container identifier in your project’s Capability section.
In JavaScript, this is a plain object with properties as described.
In TypeScript, this type is imported in the following way:
Overview
Topics
Instance Properties
CKTool JS / Container
Structure
Container
Details about a CloudKit container.
CKTool JS 1.2.15+


## Page 2

id
The unique identifier of the container.
imageUrl
The container’s image URL.
isHidden
Whether the container is hidden.
name
The container name.
teamId
The identifier of the developer team who owns the container.
ContainersResponse
An object that represents results of fetching multiple CloudKit containers.
CKEnvironment
An enumeration of container environments.
ContainersSortByField
An enumeration that indicates sorting options for retrieved containers.
SortDirection
An enumeration that indicates sorting direction when applying a custom sort.
See Also
Global Structures and Enumerations


## Page 3

In JavaScript, this is a plain object with properties as described.
In TypeScript, this type is imported in the following way:
containers
The list of containers.
nextKey
The record key for fetching the next page of results.
Overview
Topics
Instance Properties
CKTool JS / ContainersResponse
Structure
ContainersResponse
An object that represents results of fetching multiple CloudKit containers.
CKTool JS 1.2.15+


## Page 4

previousKey
The record key for fetching the previous page of results.
recentContainers
The list of recently accessed containers.
Container
Details about a CloudKit container.
CKEnvironment
An enumeration of container environments.
ContainersSortByField
An enumeration that indicates sorting options for retrieved containers.
SortDirection
An enumeration that indicates sorting direction when applying a custom sort.
See Also
Global Structures and Enumerations


## Page 5

During initial development of your app, you create your schema and add records for testing in the
development environment. Apps sold in the App Store can only access the production
environment. Before you publish your app, you must deploy the development schema to the
production environment to copy over its record types, fields, and indexes.
DEVELOPMENT
PRODUCTION
Overview
Topics
Enumeration Cases
CKTool JS / CKEnvironment
Enumeration
CKEnvironment
An enumeration of container environments.
CKTool JS 1.2.15+


## Page 6

Container
Details about a CloudKit container.
ContainersResponse
An object that represents results of fetching multiple CloudKit containers.
ContainersSortByField
An enumeration that indicates sorting options for retrieved containers.
SortDirection
An enumeration that indicates sorting direction when applying a custom sort.
See Also
Global Structures and Enumerations


## Page 7

ID
NAME
Overview
Topics
Enumeration Cases
See Also
Global Structures and Enumerations
CKTool JS / ContainersSortByField
Enumeration
ContainersSortByField
An enumeration that indicates sorting options for retrieved containers.
CKTool JS 1.2.15+


## Page 8

Container
Details about a CloudKit container.
ContainersResponse
An object that represents results of fetching multiple CloudKit containers.
CKEnvironment
An enumeration of container environments.
SortDirection
An enumeration that indicates sorting direction when applying a custom sort.


## Page 9

ASC
DESC
Overview
Topics
Enumeration Cases
See Also
Global Structures and Enumerations
CKTool JS / SortDirection
Enumeration
SortDirection
An enumeration that indicates sorting direction when applying a custom sort.
CKTool JS 1.2.15+


## Page 10

Container
Details about a CloudKit container.
ContainersResponse
An object that represents results of fetching multiple CloudKit containers.
CKEnvironment
An enumeration of container environments.
ContainersSortByField
An enumeration that indicates sorting options for retrieved containers.


