# App Attest.pdf

## Page 1

You can’t rely on your app’s logic to perform security checks on itself because a compromised ap
can falsify the results. Instead, you use the shared instance of the DCAppAttestService clas
in your app to create a hardware-based, cryptographic key that uses Apple servers to certify that
the key belongs to a valid instance of your app. Then you use the service to cryptographically sig
server requests using the certified key. Your app uses these measures to assert its legitimacy with
any server requests for sensitive or premium content.
This article describes how to modify your app to use the App Attest service. For a description of
the complementary logic that you add to your server, see Validating apps that connect to your
server.
Overview
DeviceCheck / Establishing your app’s integrity
Article
Establishing your app’s integrity
Ensure that requests your server receives come from legitimate instances of your
app.


## Page 2

Note
To use the App Attest service, your app must have an App ID that you register on the Apple
Developer website.
Not all devices can use the App Attest service, so it’s important to have your app run a
compatibility check before accessing the service. If the user’s app doesn’t pass the compatibility
check, gracefully bypass the service. You check for availability by reading the isSupported
property.
You change the behavior of both your app, as the example above shows, and your server — which
can no longer require assertions — when you find that the device doesn’t support the service.
Important
Action, extensible SSO, and watchOS extensions are supported. All other extension types are
not supported, even if the isSupported method property is true.
For each user account on each device running your app, generate a unique, hardware-based,
cryptographic key pair by calling the generateKey(completionHandler:) method.
On success, the method’s completion handler returns a key identifier that you use later to access
the key. Record the identifier in persistent storage — for example, by writing it to a file — because
there’s no way to use the key without the identifier, and no way to get the identifier later. The devi
Check for availability
Create a key pair


## Page 3

automatically stores the associated private key in the Secure Enclave, from where the App Attest
service can use it to create signatures, but from where no process can ever directly read or modif
it, ensuring its security.
Important
If you create a key pair in an App Clip, use the same key pair in the corresponding app. To
support this, be sure to store the identifier in a shared container accessible from your full app.
For more information about sharing data between your App Clip and your full app, see Sharing
data between your App Clip and your full app.
Don’t reuse a key among multiple users on a device because this weakens security protections. In
particular, it becomes hard to detect an attack that uses a single compromised device to serve
multiple remote users running a compromised version of your app. For more information, see
Assessing fraud risk.
Before using a key pair, ask Apple to attest to its origin on Apple hardware running an
uncompromised version of your app. Because you can’t trust your app’s logic to verify the
attestation result, you send the result to your server. To reduce the risk of replay attacks during th
procedure, attestation embeds the hash of a unique, one-time challenge from your server. You ca
create a suitable value using the SHA256 implementation in CryptoKit. The challenge should be a
least 16 bytes in length to ensure sufficient entropy to ensure guessing them is infeasible.
Using the hash, along with the key pair you create in the previous section, call the attestKey(_
clientDataHash:completionHandler:) method to initiate attestation.
If the method, which accesses a remote Apple server, returns the serverUnavailable error, tr
attestation again later with the same key. For any other error, discard the key identifier and create
Certify the key pairs as valid


## Page 4

new key when you want to try again. Otherwise, send the completion handler’s attestation object
and the keyId to your server for processing.
Important
If your app already has millions of daily active users and you want to start calling the attest
Key(_:clientDataHash:completionHandler:) method to initiate attestation from your
app, please review Preparing to use the app attest service for guidance on safely ramping your
users.
If you use the URL Loading System to communicate with your server, you can send an unmodified
attestation object. If you communicate with your server by generating text-based HTTPS queries,
convert the attestation object to a Base64-encoded string first.
Your server deems the app instance to be valid if it can successfully verify the attestation object. 
this case, be sure to persistently store the key identifier — not the attestation object — in your app
for future use in signing server requests.
After successfully verifying a key’s attestation, your server can require the app to assert its
legitimacy for any or all future server requests. The app does this by signing the request. In the
app, first obtain a unique, one-time challenge from the server. You use a challenge here, like for
attestation, to avoid replay attacks. Then combine the challenge with the server request to create
hash.
Use this hash and the key identifier that you generate above to create an assertion object by callin
the generateAssertion(_:clientDataHash:completionHandler:) method.
Assert your app’s validity as necessary


## Page 5

On success, pass the completion handler’s assertion object, along with the client data, to the
server. If the assertion object fails verification, it’s your responsibility to decide how to handle the
request.
There’s no restriction on the number of assertions that you can make with a key. Nevertheless, yo
typically reserve assertions for requests made at sensitive moments in your app’s life cycle, like
when the app downloads premium content.
The keys that you generate remain valid through regular app updates, but don’t survive app
reinstallation, device migration, or restoration of a device from a backup. In these cases, you need
to start the process from the beginning and generate a new key. Try to limit new key generation to
only these events, or to the addition of new users. Keeping the key count low on a device helps
when trying to detect certain kinds of fraud.
Validating apps that connect to your server
Verify that connections to your server come from legitimate instances of your app.
Assessing fraud risk
Request and analyze risk data using server-to-server calls.
Preparing to use the app attest service
Test your implementation in a development environment and onboard users gradually.
Attestation Object Validation Guide
Use this guide to validate your implementation of verifying the attestation object verification
process.
class DCAppAttestService
A service that you use to validate the instance of your app running on a device.
App Attest Environment
Start over on reinstallation
See Also
App Attest


## Page 6

The environment for an app that uses the App Attest service to validate itself.


## Page 7

Adopt App Attest to check whether clients connecting to your server are valid instances of your
app. Your app uses the shared instance of the DCAppAttestService to create a cryptograph
key on a device, and then attest to the key’s validity. This produces an attestation object that your
app passes to your server, along with the corresponding key identifier. Your server verifies the
attestation object, and then extracts the embedded public key and other information. Later, your
server uses the key to verify assertion objects that your app sends at critical points in the app’s lif
cycle, like when users try to download premium content.
This article describes how to integrate App Attest into your server logic. For more information
about the activites you perform in your app to support App Attest, see Establishing your app’s
integrity.
Overview
Provide a challenge
DeviceCheck / Validating apps that connect to your server
Article
Validating apps that connect to your serve
Verify that connections to your server come from legitimate instances of your app


## Page 8

Every time your app needs to communicate attestation data to your server, the app first asks the
server for a unique, one-time challenge. App Attest integrates this challenge into the objects that 
provides, and that your app sends back to your server for validation. This makes it harder for an
attacker to implement a replay attack.
When the app asks for a challenge, provide a randomized data value, and remember the value for
use when verifying the corresponding attestation or assertion objects the client sends. How you
use the challenge data depends on the kind of object that you need to validate.
The App Attest service creates an attestation object that consists of authenticator data and an
attestation statement according to the Web Authentication specification. The following
authenticator fields are of particular interest for App Attest:
RP ID (32 bytes) — A hash of your app’s App ID, which is the concatenation of your app’s App
ID prefix, a period, and your app’s CFBundleIdentifier value. The App ID prefix is usually
automatically set to be your 10-digit team identifier, and can be found by inspecting the Identif
entry for your app in the Certificates, Identifiers & Profiles section of your Apple Developer
Account.
counter (4 bytes) — A value that reports the number of times your app has used the attested
key to sign an assertion.
aaguid (16 bytes) — An App Attest–specific constant that indicates whether the attested key
belongs to the development or production environment. Apps generate keys using the former
during development, and the latter after distribution, as App Attest Environment
describes.
credentialId (32 bytes) — A hash of the public key part of the attested cryptographic key
pair.
Note
An attestation RP ID that an App Clip generates uses the full app’s identifier, not the App
Clip’s identifier. For information about the difference between the two, see Creating an App
Clip with Xcode.
The attestation statement uses a custom Apple attestation statement format with the following
syntax:
Verify the attestation


## Page 9

To verify and decode the attestation object, check that it has the Concise Binary Object
Representation (CBOR) data format with the expected syntax. The decoded object looks like this:
Use the decoded object, along with the key identifier that your app sends, to perform the followin
steps:
1. Verify that the x5c array contains the intermediate and leaf certificates for App Attest, starting
from the credential certificate in the first data buffer in the array (credcert). Verify the validit
of the certificates using Apple’s App Attest root certificate.
2. Create clientDataHash as the SHA256 hash of the one-time challenge your server sends to
your app before performing the attestation, and append that hash to the end of the authenticat
data (authData from the decoded object).
3. Generate a new SHA256 hash of the composite item to create nonce.
4. Obtain the value of the credCert extension with OID 1.2.840.113635.100.8.2, which is 
DER-encoded ASN.1 sequence. Decode the sequence and extract the single octet string that it
contains. Verify that the string equals nonce.
5. Create the SHA256 hash of the public key in credCert with X9.62 uncompressed point forma
and verify that it matches the key identifier from your app.
6. Compute the SHA256 hash of your app’s App ID, and verify that it’s the same as the
authenticator data’s RP ID hash.
7. Verify that the authenticator data’s counter field equals 0.


## Page 10

8. Verify that the authenticator data’s aaguid field is either appattestdevelop if operating in
the development environment, or appattest followed by seven 0x00 bytes if operating in the
production environment.
9. Verify that the authenticator data’s credentialId field is the same as the key identifier.
After successfully completing these steps, you can trust the attestation object.
Note
Follow the Attestation Object Validation Guide to ensure your implementation for the steps
above is correct.
Store the verified public key from credCert on your server and associate it with the user for the
specific device. You use this key to check assertions later. As an added protection against replay
attacks, make sure that the public key doesn’t already have an association with another user.
The attestation statement also contains a receipt that you can use later in a server-to-server call t
request a fraud assessment metric from Apple. You use the metric to examine the number of
attested keys for a specific device. This helps you to assess the risk that an attacker is using a
compromised device to serve assertions to many compromised versions of your app.
When attestation succeeds, independently verify and store the receipt immediately. For more
information about how to interpret the receipt, and how to use a receipt to obtain or refresh the
metric, see Assessing fraud risk.
Important
Be prepared to store multiple (key, receipt) pairs for each user. Store one pair for each device
the user uses to access your services. Also, keep development pairs separate from production
pairs because you can’t use one set in the other’s environment.
After successful attestation, your server can require the associated client to accompany server
requests with an assertion object. Each verified assertion reestablishes the legitimacy of the clien
You typically require this for requests that access sensitive or premium content.
The client creates the assertion by packaging the request as clientData, and asking the App
Attest service to sign the data with the attested private key. Along with the signature, App Attest
Store the public key and receipt
Verify the assertion


## Page 11

includes a simplified authenticator data instance in the assertion object, similar to the one in the
attestation object, but containing only the first few fields, including RP ID and counter.
After receiving the client data and the assertion, you need to verify and decode the assertion to
ensure it uses the CBOR data format and has the expected contents. The decoded object looks li
this:
To verify the assertion, use the decoded assertion, the client data, and the previously stored publ
key, and follow these steps:
1. Compute clientDataHash as the SHA256 hash of clientData.
2. Concatenate authenticatorData and clientDataHash, and apply a SHA256 hash over t
result to form nonce.
3. Use the public key that you store from the attestation object to verify that the assertion’s
signature is valid for nonce.
4. Compute the SHA256 hash of the client’s App ID, and verify that it matches the RP ID in the
authenticator data.
5. Verify that the authenticator data’s counter value is greater than the value from the previous
assertion, or greater than 0 on the first assertion.
6. Verify that the embedded challenge in the client data matches the earlier challenge to the clien
When the assertion meets all of these conditions, you can trust it. Store counter to use in step 5
when verifying the next assertion.
Establishing your app’s integrity
Ensure that requests your server receives come from legitimate instances of your app.
Assessing fraud risk
Request and analyze risk data using server-to-server calls.
Preparing to use the app attest service
See Also
App Attest


## Page 12

Test your implementation in a development environment and onboard users gradually.
Attestation Object Validation Guide
Use this guide to validate your implementation of verifying the attestation object verification
process.
class DCAppAttestService
A service that you use to validate the instance of your app running on a device.
App Attest Environment
The environment for an app that uses the App Attest service to validate itself.


## Page 13

Your app uses the App Attest service to assert its authenticity. A compromised version of your ap
running on a genuine, unmodified Apple device can’t create valid assertions. However, an attacke
that modifies the device’s operating system might bypass restrictions. Although modifying the
operating system is difficult and an unlikely source of widespread fraud, you might need to guard
against an attack that uses a single compromised device to serve assertions to many subscribers
While it isn’t possible to detect fraudulent activity with absolute certainty, App Attest does provid
a metric to assess its likelihood. Specifically, you can get an approximate count of unique
attestations for your app on a particular device. A count that’s higher than expected might be an
indication of a compromised device that’s serving multiple compromised instances of your app.
You can use this information to assess your risk.
To get the metric, use the receipt that your server extracts from the attestation object, as
described in Validating apps that connect to your server. Send the receipt from your server to an
Apple server using an HTTP POST request. The Apple server returns a new receipt that includes
the metric. You can also use the new receipt to refresh the metric later, but be sure to do that
before the receipt expires.
You request a new receipt by sending an HTTP POST to an Apple server with a body composed
entirely of the Base64-encoded receipt you extracted from an attestation object. Add a header th
Overview
Create a request
DeviceCheck / Assessing fraud risk
Article
Assessing fraud risk
Request and analyze risk data using server-to-server calls.


## Page 14

includes an authentication key in the form of a generated JSON Web Token (JWT):
Generate the token using the same procedure you use to create a provider authentication token f
the Apple Push Notification service (APNs), as described in Establishing a token-based connectio
to APNs. Be sure to enable the DeviceCheck service when requesting the cryptographic key that
you use to encrypt the App Attest token.
Send the request to the attestationData endpoint. For example, a curl command that does
this using a receipt stored in a file called receipt.bin might look like:
Use the base URL of https://data-development.appattest.apple.com shown in the
example above for testing. This URL accesses the sandbox environment that your app uses durin
development. To work with apps that you’ve distributed through the App Store, TestFlight, or with
an Enterprise Developer certificate, use a base URL of https://data.appattest.apple.co
instead. You can’t use a receipt generated in one environment to request a new receipt in the othe
If your request succeeds, the Apple server sends back a response with code 200 and a body that
consist of a new, Base64-encoded receipt. Store this receipt in place of the one used to generate
the request, because you’ll use it the next time you make a request to refresh the metric. For a list
of other response codes you might receive instead, like 401 for a missing or malformed token, se
Understand HTTP response codes.
The App Attest receipt has a structure similar to an App Store receipt, with a PKCS #7 container
that contains a signature, certificate chain, and an ASN.1–encoded payload. For information abou
App Store receipts, see Validating Receipts Locally.
App Attest receipts use the following fields:
Field
Value
Example
2
App ID
A1B2C3D4E5.com.example.appname
Parse the response


## Page 15

Field
Value
Example
3
Attested
Public
Key
MIICxTCCAkugAwIBAgIGAXD4YkDCM...odjJY76fyArAeunX3FO7w=
4
Client
Hash
4f0e5a36eedd8009f25529ec10770512ddc0ba261bf439c276f0c06
5
Token
NojAMV3DBZGAqbUyKSGUvrK5fcd2mkDa/6oSigTP7c8=
6
Receipt
Type
ATTEST or RECEIPT
12
Creation
Time
2020-06-22T14:40:08.819Z
17
Risk
Metric
5
19
Not
Before
2020-07-22T14:40:38.819Z
21
Expiration
Time
2020-08-22T14:40:38.819Z
When you receive a receipt (including the one that accompanies an attestation object) — but
before trusting it — check its validity:
1. Verify the signature.
2. Evalutate the trustworthiness of the signing certificate up to the Apple public root certificate fo
App Attest.
3. Parse the ASN.1 structure that makes up the payload.
4. Verify that the receipt contains the App ID of your app in field 2. Your app’s App ID is the
concatenation of your 10-digit Team ID, a period, and the app’s bundle ID.
5. Verify that the receipt’s creation time, given in field 12, is no more than five minutes old. This
helps to thwart replay attacks.
6. Verify that the attested public key in field 3, encoded as a DER ASN.1 object, matches the one
you stored after initial attestation.
Verify the receipt


## Page 16

Field 6 of the receipt contains either the string ATTEST for the receipt that comes with an
attestation object, or the string RECEIPT for receipts that you request using your server. Only the
latter provide the risk metric in field 17. The receipt represents the metric as a string that indicates
the number of attested keys associated with a given device over the past 30 days. Look for this
value to be a low number.
Note that the metric can grow if a user reinstalls your app, restores from a backup, or transfers a
device to another user. For privacy reasons, App Attest keys stored on device don’t survive these
events, forcing your app to generate a new key on the same device. This growth should be modes
but you’ll have to tune your risk assessment logic based on the typical numbers that you see over
time. You can help to keep the number small by only generating new keys when absolutely
necessary.
When you want to read the latest value for the metric, create a new request using the most recen
received receipt as the HTTP POST body, just like you did with the attestation receipt. Be sure to
wait until after the date found in field 19. If you try to refresh too soon, the Apple server sends an
error response with code 304.
On the other hand, do use the receipt before the receipt’s expiration date, found in field 21. After
that date, the Apple server might not honor the request. Therefore, if you want to receive metrics 
all, you need to do so periodically.
When you communicate with the server, you may receive one of the following response codes:
Code
Descriptive String
Meaning
200
The transaction was successful.
304
Not Modified
You made the request before the previous receipt’s “Not Before”
date.
400
Incorrect
Environment
You used a development receipt in production, or vice versa.
400
Bad Payload
Your request has a missing or badly formatted payload.
401
Unauthorized
You used an authentication token that the Apple server can’t verify
or that doesn’t match the receipt.
Interpret the metric
Refresh the metric
Understand HTTP response codes


## Page 17

Code
Descriptive String
Meaning
404
No Data Found
No data available for the supplied receipt.
429
Too Many
Requests
You sent too many requests to the server.
500
Server Error
An error occurred on the server.
503
Service
Unavailable
The service is unavailable.
Establishing your app’s integrity
Ensure that requests your server receives come from legitimate instances of your app.
Validating apps that connect to your server
Verify that connections to your server come from legitimate instances of your app.
Preparing to use the app attest service
Test your implementation in a development environment and onboard users gradually.
Attestation Object Validation Guide
Use this guide to validate your implementation of verifying the attestation object verification
process.
class DCAppAttestService
A service that you use to validate the instance of your app running on a device.
App Attest Environment
The environment for an app that uses the App Attest service to validate itself.
See Also
App Attest


## Page 18

The App Attest service records device metrics that you can’t reset. To avoid affecting the real
metrics for devices that you use for development, you test your implementation in a sandbox
environment. When you do start using App Attest in a production environment, use care not to
overwhelm Apple’s servers with requests from too many devices at once.
During development, you use a sandbox environment to test your adoption of App Attest. The Ap
Attest service tracks the keys that you generate in this mode separately from the keys generated 
production mode. This allows you to generate and attest any number of keys on a given device
without polluting that device’s production key count.
If instead you want to use the App Attest production servers during development, add the App
Attest Environment entitlement to your app’s entitlements file, and set the associated value 
production. Regardless of how you set the entitlement, your app always operates in production
mode after distribution, whether through TestFlight, the App Store, or the Apple Developer
Enterprise Program.
When sending a sandbox-generated attestation object to your server, the verification procedure
changes slightly. Specifically, expect to find the value appattestsandbox in the authenticator
data’s aaguid field. Also, when using a sandbox-generated receipt to make the server-to-server
call that obtains the fraud metric, use https://data-development.appattest.apple.co
as the base URL.
Overview
Test Your implementation
DeviceCheck / Preparing to use the app attest service
Article
Preparing to use the app attest service
Test your implementation in a development environment and onboard users
gradually.


## Page 19

Important
You can’t use a key or receipt from the sandbox environment in the production environment, or
vice versa.
If you have a large user base, consider enabling App Attest in stages. When your app calls attes
Key(_:clientDataHash:completionHandler:) — which you typically do once per user pe
device — the DeviceCheck framework makes a call to an Apple server to perform the attestation.
Apple servers might throttle attestation traffic from a particular app to avoid becoming
overwhelmed if too many instances of your app make this call simultaneously. That could happen 
you have a lot of users that simultaneously receive an app update enabling App Attest.
Instead, activate the feature for smaller groups of users over a period of time. As a rule of thumb,
we suggest gradually and uniformly ramping up no more than 10 million users per day per app.
After the initial rollout, your app makes requests only for new users, new devices, and
reinstallations. This kind of traffic shouldn’t result in any throttling.
Important
To avoid encountering attestKey(_:clientDataHash:completionHandler:) rate
limits, we generally recommend that your apps call this method fewer than 100 request per
second across all installations of your apps. The rate limit threshold may fluctuate dynamically
to protect Apple’s certificate signing infrastructure. Be prepared to handle these errors and to
have a mechanism to pull back on requests from your apps if this occurs.
Establishing your app’s integrity
Ensure that requests your server receives come from legitimate instances of your app.
Validating apps that connect to your server
Verify that connections to your server come from legitimate instances of your app.
Assessing fraud risk
Request and analyze risk data using server-to-server calls.
Onboard users gradually
See Also
App Attest


## Page 20

Attestation Object Validation Guide
Use this guide to validate your implementation of verifying the attestation object verification
process.
class DCAppAttestService
A service that you use to validate the instance of your app running on a device.
App Attest Environment
The environment for an app that uses the App Attest service to validate itself.


## Page 21

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


## Page 22

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


## Page 23

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


## Page 24

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


## Page 25

Establishing your app’s integrity
Validating apps that connect to your server
Use the shared instance of the DCAppAttestService class to assert the legitimacy of a
particular instance of your app to your server. After ensuring service availability by reading the is
Supported property, you use the service to:
Create a cryptographic key in the Secure Enclave by calling the generateKey(completion
Handler:) method.
Ask Apple to certify the key by calling the attestKey(_:clientDataHash:completion
Handler:) method. - Prepare an assertion of your app’s integrity to accompany any or all
server requests using the generateAssertion(_:clientDataHash:completion
Handler:) method.
For more information about how to support App Attest in your app, see Establishing your app’s
integrity. For information about the complementary procedures you implement on your server, see
Validating apps that connect to your server.
Mentioned in
Overview
DeviceCheck / DCAppAttestService
Class
DCAppAttestService
A service that you use to validate the instance of your app running on a device.
iOS 14.0+
iPadOS 14.0+
Mac Catalyst 14.0+
macOS 11.0+
tvOS 15.0+
visionOS 1.0+
watchOS 9.0+


## Page 26

Note
To use the App Attest service, your app must have an app ID that you register on the Apple
Developer website.
class var shared: DCAppAttestService
The shared App Attest service that you use to validate your app.
var isSupported: Bool
A Boolean value that indicates whether a particular device provides the App Attest service.
func generateKey(completionHandler: (String?, (any Error)?) -> Void)
Creates a new cryptographic key for use with the App Attest service.
func attestKey(String, clientDataHash: Data, completionHandler: (Data?,
(any Error)?) -> Void)
Asks Apple to attest to the validity of a generated cryptographic key.
func generateAssertion(String, clientDataHash: Data, completionHandler:
(Data?, (any Error)?) -> Void)
Creates a block of data that demonstrates the legitimacy of an instance of your app running
on a device.
NSObject
Topics
Accessing the service
Preparing a key
Validating the app instance
Relationships
Inherits From


## Page 27

CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Establishing your app’s integrity
Ensure that requests your server receives come from legitimate instances of your app.
Validating apps that connect to your server
Verify that connections to your server come from legitimate instances of your app.
Assessing fraud risk
Request and analyze risk data using server-to-server calls.
Preparing to use the app attest service
Test your implementation in a development environment and onboard users gradually.
Attestation Object Validation Guide
Use this guide to validate your implementation of verifying the attestation object verification
process.
App Attest Environment
The environment for an app that uses the App Attest service to validate itself.
Conforms To
See Also
App Attest


## Page 28

Key
com.apple.developer.devicecheck.appattest-environment
Type
String
development
The App Attest sandbox environment that you use to test a device without affecting its risk
metrics. Keys you create in the sandbox environment don’t work in the production
environment.
production
The App Attest production environment. Keys you create in the production environment don’
work in the sandbox environment.
To add this entitlement to your app, add the key to your app’s entitlements file manually, choose
the String type, and set the associated value to either development or production.
Alternatively, add the App Attest capability to your app target. This adds the entry to the app’s
entitlements file with development as the associated value. If you omit the entitlement during
development, your app uses the App Attest sandbox servers by default. You can test your app
Details
Possible Values
Discussion
Bundle Resources / Entitlements / App Attest Environment
Property List Key
App Attest Environment
The environment for an app that uses the App Attest service to validate itself.
iOS 14.0+
iPadOS 14.0+
tvOS 15.0+
visionOS 1.0+


## Page 29

during development against the App Attest production servers by setting the entitlement to
production.
After distributing your app through TestFlight, the App Store, or the Apple Developer Enterprise
Program, your app ignores the entitlement you set and uses the production environment.
Important
If you use the App Attest service in an App Clip, be sure to add the App Attest capability and
the corresponding entry for both your app and your App Clip. Similarly, if you use the App
Attest service in your app and an app extension, make sure to configure the capability and the
App Attest sandbox environment for both your app and your extension.
com.apple.security.network.server
A Boolean value indicating whether your app may listen for incoming network connections.
com.apple.security.network.client
A Boolean value indicating whether your app may open outgoing network connections.
See Also
Networking


