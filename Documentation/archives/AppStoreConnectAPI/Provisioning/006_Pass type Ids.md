# 006_Pass type Ids.pdf

## Page 1

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


## Page 2

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


## Page 3

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


