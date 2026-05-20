# Provisioning.pdf

## Page 1

The bundleIds resource represents the app’s unique identifier that you can register, modify, and
delete. You need a bundle ID before you can assign capabilities with the Bundle ID Capabilities
resource or create a provisioning profile with the Profiles resource.
Register a New Bundle ID
Register a new bundle ID for app development.
Modify a PassTypeId
Update a specific bundle ID’s name.
Delete a BundleId
Delete a bundle ID that is used for app development.
List Bundle Ids
Find and list bundle IDs that are registered to your team.
Overview
Topics
Registering Bundle IDs
Modifying and Removing Bundle IDs
Getting Bundle ID Information
Enterprise Program API / Bundle IDs
API Collection
Bundle IDs
Manage the bundle IDs that uniquely identify your apps.


## Page 2

Read BundleId Information
Get information about a specific bundle ID.
List All Profiles for a BundleId
Get a list of all profiles for a specific bundle ID.
List All Bundle Id Capabilities for a BundleId
Get a list of all capabilities for a specific bundle ID.
object BundleId
The data structure that represents a Bundle IDs resource.
type BundleIdPlatform
Strings that represent the operating system intended for the bundle.
object BundleIdCreateRequest
The request body you use to create a Bundle ID.
object BundleIdUpdateRequest
The request body you use to update a Bundle ID.
object BundleIdResponse
A response that contains a single Bundle IDs resource.
object BundleIdWithoutIncludesResponse
A response that contains a single Bundle IDs resource without includes.
object BundleIdsResponse
A response that contains a list of Bundle ID resources.
Bundle ID Capabilities
Getting Related Data
Objects and Types
See Also
Provisioning


## Page 3

Manage the app capabilities for a bundle ID.
Certificates
Create, download, and revoke signing certificates for app development and distribution.
Devices
Register devices for development and testing.
Pass Type Ids
Create, download, and revoke pass type ids for app development and distribution.
Profiles
Create, delete, and download provisioning profiles for development and distribution.


## Page 4

The bundleIdCapabilities resource represents capabilities that you can enable or disable fo
a bundle ID. To learn about capabilities, see Advanced App Capabilities.
Modify a Capability Configuration
Enable a capability for a bundle ID.
Disable a Capability
Disable a capability for a bundle ID.
Modify a BundleIdCapability
Update the configuration of a specific capability.
object BundleIdCapability
The data structure that represents a Bundle ID Capabilities resource.
Overview
Topics
Enabling and Disabling Capabilities
Updating Capabiities
Object and Data Types
Enterprise Program API / Bundle ID Capabilities
API Collection
Bundle ID Capabilities
Manage the app capabilities for a bundle ID.


## Page 5

object BundleIdCapabilityCreateRequest
The request body you use to create a Bundle ID Capability.
object BundleIdCapabilityUpdateRequest
The request body you use to update a Bundle ID Capability.
object BundleIdCapabilityResponse
A response that contains a single Bundle ID Capabilities resource.
object BundleIdCapabilitiesResponse
A response that contains a list of Bundle ID Capability resources.
object BundleIdCapabilitiesWithoutIncludesResponse
A response that contains a single Bundle IDs capability resource without includes.
object CapabilityOption
An option within a capability setting.
object CapabilitySetting
An object that represents a capability setting for an app.
type CapabilityType
String that represents an app’s capability type.
Bundle IDs
Manage the bundle IDs that uniquely identify your apps.
Certificates
Create, download, and revoke signing certificates for app development and distribution.
Devices
Register devices for development and testing.
Pass Type Ids
Create, download, and revoke pass type ids for app development and distribution.
See Also
Provisioning


## Page 6

Profiles
Create, delete, and download provisioning profiles for development and distribution.


## Page 7

The certificates resource represents the digital certificates you use to sign your apps for
development and distribution. You can create new certificates, revoke existing certificates, and
download certificates.
Note
You can only create Developer ID certificates for macOS through the Apple Developer website
or Xcode. For more information, see Security.
Create a Certificate
Create a new certificate using a certificate signing request.
List and Download Certificates
Find and list certificates and download their data.
Read and Download Certificate Information
Overview
Topics
Creating Certificates
Getting Certificate Infomation and Data
Enterprise Program API / Certificates
API Collection
Certificates
Create, download, and revoke signing certificates for app development and
distribution.


## Page 8

Get information about a certificate and download the certificate data.
Revoke a Certificate
Revoke a lost, stolen, compromised, or expiring signing certificate.
object Certificate
The data structure that represents a Certificates resource.
object CertificatesWithoutIncludesResponse
A response that contains a single certificate resource without includes.
object CertificateCreateRequest
The request body you use to create a Certificate.
object CertificateResponse
A response that contains a single Certificates resource.
object CertificatesResponse
A response that contains a list of Certificates resources.
type CertificateType
Literal values that represent types of signing certificates.
Bundle IDs
Manage the bundle IDs that uniquely identify your apps.
Bundle ID Capabilities
Manage the app capabilities for a bundle ID.
Devices
Register devices for development and testing.
Revoking Certificates
Object and Data Types
See Also
Provisioning


## Page 9

Pass Type Ids
Create, download, and revoke pass type ids for app development and distribution.
Profiles
Create, delete, and download provisioning profiles for development and distribution.


## Page 10

A devices resource represents the Apple devices that you register to use for development and
testing. You can register a limited number of new devices and get information about them.
Note
You can only reset your device list through the Apple Developer website.
Register a New Device
Register a new device for app development.
List Devices
Find and list devices registered to your team.
Read Device Information
Overview
Topics
Registering a Device
Getting Device Information
Modifying Device Metadata
Enterprise Program API / Devices
API Collection
Devices
Register devices for development and testing.


## Page 11

Modify a Registered Device
Update the name or status of a specific device.
object Device
The data structure that represents a Devices resource.
object DevicesWithoutIncludesResponse
object DeviceCreateRequest
The request body you use to create a Device.
object DeviceUpdateRequest
The request body you use to update a Device.
object DeviceResponse
A response that contains a single Devices resource.
object DevicesResponse
A response that contains a list of Devices resources.
Bundle IDs
Manage the bundle IDs that uniquely identify your apps.
Bundle ID Capabilities
Manage the app capabilities for a bundle ID.
Certificates
Create, download, and revoke signing certificates for app development and distribution.
Pass Type Ids
Create, download, and revoke pass type ids for app development and distribution.
Profiles
Objects
See Also
Provisioning


## Page 12

Create, delete, and download provisioning profiles for development and distribution.


## Page 13

The passTypeId resource represents a pass type certificates unique identifier that you can
register, modify, and delete. You need a pass type ID before you can create a pass type certificate
with the Certificates resource.
Create a PassTypeId
Create a new identifier for use with a pass type ID certificate using a certificate signing
request.
List Pass Type Ids
Find and list pass type IDs that are registered to your team.
Read PassTypeId Information
Get information about a specific pass type ID.
List All Certificates for a PassTypeId
List all certificates for a specific pass type ID.
Modify a PassTypeId
Update a specific pass type ID’s name.
Overview
Topics
Managing Pass Type Ids
Enterprise Program API / Pass Type Ids
API Collection
Pass Type Ids
Create, download, and revoke pass type ids for app development and distribution


## Page 14

Delete a PassTypeId
Delete a pass type ID that is used for app development.
Read the Pass Type Id Information of a Certificate
object PassTypeId
The data structure that represents a pass type ID.
object PassTypeIdCreateRequest
The request body you use to create a pass type ID.
object PassTypeIdResponse
A response that contains a pass type ID resource.
object PassTypeIdsResponse
A response that contains a list of pass type ID resources.
object PassTypeIdUpdateRequest
The request body you use to update a pass type ID name.
Bundle IDs
Manage the bundle IDs that uniquely identify your apps.
Bundle ID Capabilities
Manage the app capabilities for a bundle ID.
Certificates
Create, download, and revoke signing certificates for app development and distribution.
Devices
Register devices for development and testing.
Getting Pass Type Id Infomation and Data
Object and Data Types
See Also
Provisioning


## Page 15

Profiles
Create, delete, and download provisioning profiles for development and distribution.


## Page 16

The profiles resource represents the provisioning profiles that allow you to install apps on you
devices. You can create and delete provisioning profiles.
Provisioning profiles include signing certificates, device identifiers, and a bundle ID.
Create a Profile
Create a new provisioning profile.
Delete a Profile
Delete a provisioning profile that is used for app development or distribution.
List and Download Profiles
Find and list provisioning profiles and download their data.
Read and Download Profile Information
Get information for a specific provisioning profile and download its data.
Overview
Topics
Creating and Deleting Provisioning Profiles
Getting Provisioning Profile Information
Enterprise Program API / Profiles
API Collection
Profiles
Create, delete, and download provisioning profiles for development and
distribution.


## Page 17

Read the Bundle ID in a Profile
Get the bundle ID information for a specific provisioning profile.
List All Certificates in a Profile
Get a list of all certificates and their data for a specific provisioning profile.
List All Devices in a Profile
Get a list of all devices for a specific provisioning profile.
object Profile
The data structure that represents a Profiles resource.
object ProfileCreateRequest
The request body you use to create a Profile.
object ProfileResponse
A response that contains a single Profiles resource.
object ProfilesResponse
A response that contains a list of Profiles resources.
object ProfilesWithoutIncludesResponse
Bundle IDs
Manage the bundle IDs that uniquely identify your apps.
Bundle ID Capabilities
Manage the app capabilities for a bundle ID.
Certificates
Getting Related Data
Objects
See Also
Provisioning


## Page 18

Create, download, and revoke signing certificates for app development and distribution.
Devices
Register devices for development and testing.
Pass Type Ids
Create, download, and revoke pass type ids for app development and distribution.


