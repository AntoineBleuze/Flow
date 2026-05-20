# Provisioning.pdf

## Page 1

The bundleIds resource represents the app’s unique identifier that you can register, modify, and
delete. You need a bundle ID before you can assign capabilities with the Bundle ID Capabilities
resource or create a provisioning profile with the Profiles resource.
Register a New Bundle ID
Register a new bundle ID for app development.
Modify a Bundle ID
Update a specific bundle ID’s name.
Delete a Bundle ID
List Bundle IDs
Find and list bundle IDs that are registered to your team.
Overview
Topics
Registering Bundle IDs
Modifying and Removing Bundle IDs
Getting Bundle ID Information
App Store Connect API / Bundle IDs
API Collection
Bundle IDs
Manage the bundle IDs that uniquely identify your apps.


## Page 2

Read Bundle ID Information
Get information about a specific bundle ID.
Read the App Information of a Bundle ID
List All Profiles for a Bundle ID
Get a list of all profiles for a specific bundle ID.
List All Capabilities for a Bundle ID
Get a list of all capabilities for a specific bundle ID.
GET /v1/bundleIds/{id}/relationships/app
GET /v1/bundleIds/{id}/relationships/bundleIdCapabilities
GET /v1/bundleIds/{id}/relationships/profiles
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
object BundleIdsResponse
A response that contains a list of Bundle ID resources.
object BundleIdAppLinkageResponse
object BundleIdBundleIdCapabilitiesLinkagesResponse
Getting Related Data
Objects and Types


## Page 3

object BundleIdProfilesLinkagesResponse
Bundle ID Capabilities
Manage the app capabilities for a bundle ID.
Certificates
Create, download, and revoke signing certificates for app development and distribution.
Devices
Register devices for development and testing.
Profiles
Create, delete, and download provisioning profiles that enable app installations for
development and distribution.
Merchant ID
Manage your merchant ID for Apple Pay.
Pass type Ids
Create, download, and revoke pass type ids for app development and distribution.
See Also
Provisioning


## Page 4

The bundleIdCapabilities resource represents capabilities that you can enable or disable fo
a bundle ID. To learn about capabilities, see Advanced App Capabilities.
Enable a Capability
Enable a capability for a bundle ID.
Disable a Capability
Disable a capability for a bundle ID.
Modify a Capability Configuration
Update the configuration of a specific capability.
object BundleIdCapability
The data structure that represents a Bundle ID Capabilities resource.
Overview
Topics
Enabling and Disabling Capabilities
Updating Capabiities
Object and Data Types
App Store Connect API / Bundle ID Capabilities
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
Profiles
Create, delete, and download provisioning profiles that enable app installations for
development and distribution.
See Also
Provisioning


## Page 6

Merchant ID
Manage your merchant ID for Apple Pay.
Pass type Ids
Create, download, and revoke pass type ids for app development and distribution.


## Page 7

The certificates resource represents the digital certificates you use to sign your iOS or Mac
apps for development and distribution. You can create new certificates, revoke existing certificate
and download certificates.
Note
You can only create Developer ID certificates for macOS through the Apple Developer website
or Xcode. For more information, see Security.
Create a Certificate
Create a new certificate using a certificate signing request.
Modify a certificate
Update the activation status for a specific certificate.
List and Download Certificates
Overview
Topics
Creating and modifying certificates
Getting certificate infomation and data
App Store Connect API / Certificates
API Collection
Certificates
Create, download, and revoke signing certificates for app development and
distribution.


## Page 8

Find and list certificates and download their data.
Read and Download Certificate Information
Get information about a certificate and download the certificate data.
List PassTypeID Ids for a certificate
List all PassTypeID Ids for a specific certificate.
GET /v1/certificates/{id}/relationships/passTypeId
Revoke a Certificate
Revoke a lost, stolen, compromised, or expiring signing certificate.
object Certificate
The data structure that represents a Certificates resource.
object CertificatesWithoutIncludesResponse
object CertificateCreateRequest
The request body you use to create a Certificate.
object CertificateResponse
A response that contains a single Certificates resource.
object CertificatesResponse
A response that contains a list of Certificates resources.
object CertificateUpdateRequest
The request body you use to update a certificate activation status.
type CertificateType
Literal values that represent types of signing certificates.
object CertificatePassTypeIdLinkageResponse
A response body that contains the ID of a single related resource.
Revoking certificates
Object and data types
See Also


## Page 9

Bundle IDs
Manage the bundle IDs that uniquely identify your apps.
Bundle ID Capabilities
Manage the app capabilities for a bundle ID.
Devices
Register devices for development and testing.
Profiles
Create, delete, and download provisioning profiles that enable app installations for
development and distribution.
Merchant ID
Manage your merchant ID for Apple Pay.
Pass type Ids
Create, download, and revoke pass type ids for app development and distribution.
Provisioning


## Page 10

A devices resource represents the iOS, Apple TV, Apple Watch, and Mac devices that you regist
to use for development and testing. You can register a limited number of new devices and get
information about them.
Note
You can only remove registered devices through the Apple Developer website.
Register a New Device
Register a new device for app development.
List Devices
Find and list devices registered to your team.
Read Device Information
Get information for a specific device registered to your team.
Overview
Topics
Registering a Device
Getting Device Information
App Store Connect API / Devices
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
Profiles
Modifying Device Metadata
Objects
See Also
Provisioning


## Page 12

Create, delete, and download provisioning profiles that enable app installations for
development and distribution.
Merchant ID
Manage your merchant ID for Apple Pay.
Pass type Ids
Create, download, and revoke pass type ids for app development and distribution.


## Page 13

The profiles resource represents the provisioning profiles that allow you to install apps on you
iOS devices or Mac. You can create and delete provisioning profiles, and download them to sign
your code.
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
App Store Connect API / Profiles
API Collection
Profiles
Create, delete, and download provisioning profiles that enable app installations fo
development and distribution.


## Page 14

Read the Bundle ID in a Profile
Get the bundle ID information for a specific provisioning profile.
GET /v1/profiles/{id}/relationships/bundleId
List All Certificates in a Profile
Get a list of all certificates and their data for a specific provisioning profile.
GET /v1/profiles/{id}/relationships/certificates
List All Devices in a Profile
Get a list of all devices for a specific provisioning profile.
GET /v1/profiles/{id}/relationships/devices
object Profile
The data structure that represents a Profiles resource.
object ProfileCreateRequest
The request body you use to create a Profile.
object ProfileResponse
A response that contains a single Profiles resource.
object ProfilesResponse
A response that contains a list of Profiles resources.
object ProfilesWithoutIncludesResponse
object ProfileBundleIdLinkageResponse
object ProfileCertificatesLinkagesResponse
object ProfileDevicesLinkagesResponse
Getting Related Data
Objects
See Also


## Page 15

Bundle IDs
Manage the bundle IDs that uniquely identify your apps.
Bundle ID Capabilities
Manage the app capabilities for a bundle ID.
Certificates
Create, download, and revoke signing certificates for app development and distribution.
Devices
Register devices for development and testing.
Merchant ID
Manage your merchant ID for Apple Pay.
Pass type Ids
Create, download, and revoke pass type ids for app development and distribution.
Provisioning


## Page 16

Apple Pay developers and merchants can use this resource to automate registering both merchan
ID and merchant name for interacting with Apple Pay services, and rotate required certificates to
keep the service active. To learn more about developing and configuring Apple Pay, see Configure
Apple Pay.
To learn more about setting up your Apple developer account and implementing Apple Pay in you
apps, see Managing merchant IDs and Payment Processing certificates and Setting up Apple Pay
Note
Apple Pay is not available for Enterprise teams.
Managing merchant IDs and Payment Processing certificates
Create and update certificates so your app uses Apple Pay and Wallet.
List merchant IDs
List all merchant Ids for your team.
Read details for a merchant ID
Get information for a merchant ID.
Overview
Topics
Managing merchant IDs
App Store Connect API / Merchant ID
API Collection
Merchant ID
Manage your merchant ID for Apple Pay.


## Page 17

List certificates for a merchant ID
Get a list of all certificates for a specific merchant ID.
GET /v1/merchantIds/{id}/relationships/certificates
Modify merchant IDs
Update a specific merchant ID.
Create a merchant ID
Add a new merchant ID to your team.
Delete a merchant ID
Delete a specific merchant ID.
object MerchantId
The data structure that represents a merchant ID resource.
object MerchantIdResponse
A response that contains a single merchant ID resource.
object MerchantIdsResponse
A response that contains a list of merchant ID resources.
object MerchantIdCreateRequest
The request body you use to create a merchant ID.
object MerchantIdUpdateRequest
The request body you use to update a merchant ID.
object MerchantIdCertificatesLinkagesResponse
Bundle IDs
Manage the bundle IDs that uniquely identify your apps.
Objects
See Also
Provisioning


## Page 18

Bundle ID Capabilities
Manage the app capabilities for a bundle ID.
Certificates
Create, download, and revoke signing certificates for app development and distribution.
Devices
Register devices for development and testing.
Profiles
Create, delete, and download provisioning profiles that enable app installations for
development and distribution.
Pass type Ids
Create, download, and revoke pass type ids for app development and distribution.


## Page 19

The passTypeId resource represents a pass type certificates unique identifier that you can
register, modify, and delete. You need a pass type ID before you can create a pass type certificate
with the Certificates resource.
List PassTypeID Ids for a certificate
List all PassTypeID Ids for a specific certificate.
GET /v1/certificates/{id}/relationships/passTypeId
List Pass Type Ids
Find and list pass type IDs that are registered to your team.
Read PassTypeId Information
Get information about a specific pass type ID.
List All Certificates for a PassTypeId
List all certificates for a specific pass type ID.
GET /v1/passTypeIds/{id}/relationships/certificates
Modify a PassTypeId
Overview
Topics
Managing pass type Ids
App Store Connect API / Pass type Ids
API Collection
Pass type Ids
Create, download, and revoke pass type ids for app development and distribution


## Page 20

Update a specific pass type ID’s name.
Create a PassTypeId
Create a new identifier for use with a pass type ID certificate using a certificate signing
request.
Delete a PassTypeId
Delete a pass type ID that is used for app distribution.
object CertificatePassTypeIdLinkageResponse
A response body that contains the ID of a single related resource.
object PassTypeId
The data structure that represents a pass type id resource.
object PassTypeIdCertificatesLinkagesResponse
A response that contains a list of pass type id certificates linkages response resources.
object PassTypeIdCreateRequest
The request body you use to create a pass type id create request resource.
object PassTypeIdResponse
A response that contains a single pass type id response resource.
object PassTypeIdUpdateRequest
The request body you use to update a pass type id update request.
object PassTypeIdsResponse
A response that contains a list of pass type ids response resources.
Bundle IDs
Manage the bundle IDs that uniquely identify your apps.
Bundle ID Capabilities
Object and data types
See Also
Provisioning


## Page 21

Manage the app capabilities for a bundle ID.
Certificates
Create, download, and revoke signing certificates for app development and distribution.
Devices
Register devices for development and testing.
Profiles
Create, delete, and download provisioning profiles that enable app installations for
development and distribution.
Merchant ID
Manage your merchant ID for Apple Pay.


