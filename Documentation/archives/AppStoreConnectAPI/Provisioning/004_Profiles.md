# 004_Profiles.pdf

## Page 1

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


## Page 2

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


## Page 3

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


