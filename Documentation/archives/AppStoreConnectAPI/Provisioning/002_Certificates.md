# 002_Certificates.pdf

## Page 1

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


## Page 2

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


## Page 3

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


