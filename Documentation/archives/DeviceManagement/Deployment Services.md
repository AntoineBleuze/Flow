# Deployment Services.pdf

## Page 1

Authenticating with a Device Enrollment Program (DEP) Server
Communicate securely with a DEP web service, using a server token.
Authenticating Through Web Views
Use your own custom web interfaces to authenticate users.
Activation Lock a Device
Enable activation lock on a remote device.
Get Device Details
Get the details on a set of devices.
Get a List of Devices
Get a list of devices that are managed by the server.
Sync the List of Devices
Get updates about the list of devices the server manages.
Disown Devices
Notify Apple’s servers that your organization no longer owns the specified devices.
Get Beta Enrollment Tokens
Topics
Authentication
Device Management
Device Management / Device Assignment
API Collection
Device Assignment
Manage devices for your students and employees.


## Page 2

Retrieves the beta enrollment tokens available for the organization.
Define a Profile
Define a profile that can be distributed to the devices in your organization.
Get a Profile
Get details about a profile.
Assign a Profile
Assign a profile to a list of devices.
Remove a Profile
Remove a profile from a list of devices.
Assign Account-Driven Enrollment Service Discovery
The Account-Driven Enrollment profile defines key attributes related to service discovery for
account-driven enrollment by MDM.
Fetch Account-Driven Enrollment Service Discovery
Fetch the Account-Driven Enrollment profile that the MDM server sets, which includes
information about service discovery for account-driven enrollment.
Remove Account-Driven Enrollment Profile
Remove the Account-Driven Enrollment profile that the MDM server sets, which includes
information about service discovery for account-driven enrollment.
object Device
A device’s properties and their values.
object MachineInfo
A device’s information in response to a MDM enrollment profile request.
object Profile
A profile’s properties and their values.
object Limit
Profile Management
Account-Driven Enrollment Service Discovery
Objects and Data Types


## Page 3

A ranged limit.
object Url
A URL object.
Roster Management
Manage classes for your students and teachers.
App and Book Management
Manage apps and books for your students and employees.
See Also
Deployment Services


## Page 4

Administrators of Apple School Manager can use this API to access information about classes and
people in their organization. If you’re a developer who needs access to information about
somebody else’s organization, see the Roster API.
Note
This API isn’t supported for Apple Business Manager organizations.
Get Account Detail
Obtain the details for your account.
object RosterClass
A class’s properties and their values.
Get the List of Classes
Obtain a list of classes the server manages.
Overview
Topics
Account Management
Class Management
Device Management / Roster Management
API Collection
Roster Management
Manage classes for your students and teachers.


## Page 5

Sync the List of Classes
Get updates about the list of classes the server manages.
object RosterPerson
A person’s properties and their values.
Get the List of People
Obtain a list of people the server manages, across the organization.
Sync the List of People
Get updates about the list of people the server manages.
object BaseRosterCourse
A base course’s properties and their values.
object RosterCourse
A course’s properties and their values.
Get the List of Courses
Obtain a list of the courses the server manages.
Sync the List of Courses
Get updates about the list of courses the server manages.
object BaseRosterLocation
A base location’s properties and their values.
object RosterLocation
A location’s properties and their values.
Get the List of Locations
Obtain a list of the locations the server manages.
Sync the Locations
People Management
Course Management
Location Mangement


## Page 6

Get updates about the list of locations the server manages.
Device Assignment
Manage devices for your students and employees.
App and Book Management
Manage apps and books for your students and employees.
See Also
Deployment Services


## Page 7

Managing Apps and Books Through Web Services
Associate app and book purchases with users or devices.
Upgrading to the new App and Book Management API
Manage devices and content across your organization using the new API version.
Apps and Books for Organizations
Get details about apps and books to show to your users.
Managing Assets
Retrieve key information to effectively manage assets across an organization’s users and
devices.
Managing Users
Retrieve key information to effectively manage users across an organization.
Using Paginated Endpoints
Manage paginated endpoints to efficiently work with large record sets.
Subscribing to Notifications
Listen to notifications to keep track of the latest events for an organization.
Handling Error Responses
Investigate service request errors and troubleshoot solutions.
Topics
Essentials
Device Management / App and Book Management
API Collection
App and Book Management
Manage apps and books for your students and employees.


## Page 8

Client Config
Store client-specific information on the server.
Service Config
Provides the full list of web service URLs, notification types, request limits, and possible erro
codes.
Get Assets
Get the set of assets that your organization manages.
Associate Assets
Associate assets with client user IDs and serial numbers.
Disassociate Assets
Disassociate assets from client user IDs and serial numbers.
Revoke Assets
Revoke assets from client user IDs and serial numbers.
Get Assignments
Get the set of current assignments for users or devices.
Get Users
Get information about a set of users.
Create Users
Create users to assign apps and books to.
Update Users
Update details for existing users.
Retire Users
Retire users by client user IDs.
Configuration Management
Asset Management
User Management


## Page 9

Event Status
Retrieve the status of an asynchronous event.
object Asset
A product in the store.
object ResponseAsset
The asset that the organization owns.
object Assignment
The asset assignment for a user or device.
object RequestUser
The requested user in the organization.
object ResponseUser
The user in the organization.
App and Book Management (Legacy)
Manage apps and books for your students and employees.
Device Assignment
Manage devices for your students and employees.
Roster Management
Manage classes for your students and teachers.
Event Management
Objects and Data Types
Legacy API
See Also
Deployment Services


## Page 10



