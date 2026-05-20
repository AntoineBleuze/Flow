# 004_Attestation Object Validation Guide.pdf

## Page 1

Consider we have an example iOS Application with the following properties:
After calling generateKey(completionHandler:), this example produces the following key
Id:
Note
The keyId from the generateKey(completionHandler:) API is already in Base64
encoded format.
After calling attestKey(_:clientDataHash:completionHandler:), this example
produces the following attestationObject, as a Base64 encoded string:
You may use this guide as a reference to cross-check your attestation object validation operation
against this sample attestation object, to ensure you are producing the correct results at each ste
in your use case.
Example setup
DeviceCheck / Attestation Object Validation Guide
Article
Attestation Object Validation Guide
Use this guide to validate your implementation of verifying the attestation object
verification process.


## Page 2

1. Verify that the x5c array contains the intermediate and leaf certificates for App Attest, starting
from the credential certificate in the first data buffer in the array (credcert). Verify the validit
of the certificates using Apple’s App Attest root certificate.
Expected leaf certificate, as a Base64 encoded string:
Expected intermediate certificate, as a Base64 encoded string:
2. Create clientDataHash as the SHA256 hash of the one-time challenge your server sends to
your app before performing the attestation, and append that hash to the end of the authenticat
data (authData from the decoded object).
Expected clientDataHash, as a Base64 encoded string:
3. Generate a new SHA256 hash of the composite item to create nonce.
Expected nonce, as Base64 encoded string:
4. Obtain the value of the credCert extension with OID 1.2.840.113635.100.8.2, which is 
DER-encoded ASN.1 sequence. Decode the sequence and extract the single octet string that it
contains. Verify that the string equals nonce.
Expected octet string from credCert, as a Base64 encoded string:
5. Create the SHA256 hash of the public key in credCert with X9.62 uncompressed point forma
and verify that it matches the key identifier from your app.
Expected public key SHA256 hash from credCert, as a Base64 encoded string:
Walking through the validation steps


## Page 3

6. Compute the SHA256 hash of your app’s App ID, and verify that it’s the same as the
authenticator data’s RP ID hash.
Expected SHA256 hash of App ID, as a Base64 encoded string:
Expected hash of RP_ID from the authenticator data field:
7. Verify that the authenticator data’s counter field equals 0.
Expected counter field:
Note
The counter is incremented on each subsequent call to generateAssertion(_:client
DataHash:completionHandler:), following the call to attestKey(_:clientData
Hash:completionHandler:).
8. Verify that the authenticator data’s aaguid field is either appattestdevelop if operating in
the development environment, or appattest followed by seven 0x00 bytes if operating in the
production environment.
Expected aaguid field for production:
9. Verify that the authenticator data’s credentialId field is the same as the key identifier.
Expected credentialId:
See Also


## Page 4

Establishing your app’s integrity
Ensure that requests your server receives come from legitimate instances of your app.
Validating apps that connect to your server
Verify that connections to your server come from legitimate instances of your app.
Assessing fraud risk
Request and analyze risk data using server-to-server calls.
Preparing to use the app attest service
Test your implementation in a development environment and onboard users gradually.
class DCAppAttestService
A service that you use to validate the instance of your app running on a device.
App Attest Environment
The environment for an app that uses the App Attest service to validate itself.
App Attest


