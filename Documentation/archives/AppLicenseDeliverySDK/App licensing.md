# App licensing.pdf

## Page 1

iOS and iPadOS require each app that installs outside of the App Store to have a license issued by
the developer. As the developer of an alternative app marketplace or other app that installs over t
web, you use the App License Delivery SDK to generate a license for each download request for
your app. Alternative app marketplaces also create a license for each download request for the
apps that they distribute.
Before continuing, ensure you complete the steps in either Creating an alternative app marketplac
or Distributing your app from your website.
The MarketplaceKit installation methods trigger the device’s operating system to request a licens
from your web server before installing a particular app. To support installation of your app or the
apps on your marketplace, implement a license server to process the requests. Your license serve
consists of two endpoints that use this SDK: one that creates licenses for new installations and
another that updates the licenses of existing installations.
Important
Prepare your App License Delivery (ALD) encryption assets and development environment for
use with the licensing workflow. For more information, see Configuring your app licensing
environment.
To inform the system of the details of your license server, publish a marketplace-kit
configuration file in the standard location. The system checks for the file at the following relative
path:
Overview
Publish your licensing endpoint details
App License Delivery SDK / Licensing alternative distribution apps
Article
Licensing alternative distribution apps
Build a license server that supports the installation of your apps and the apps
available in your marketplace.


## Page 2

The base domain, <fully qualified domain>, of the above URL is from the app’s domain
that you add to App Store Connect. For more information about adding and managing domains in
App Store Connect, see Alternative Distribution Domains.
This URL is your licensing endpoint, so your web server needs to serve a JSON configuration file
that identifies your license server details:
The system requires that the “license” key specifies the following properties:
license key
Property
dynamicLicense
URL
An endpoint that generates licenses for apps and app versions new to a
device.
licenseRenewal
URL
An endpoint that generates updated licenses for apps and app versions
already installed on the device. For more information, see Renewing and
revoking app licenses.
license
ResolutionURL
A webpage that gives a person more information about an expired app
license or the opportunity to renew the license. For more information,
see Renewing and revoking app licenses.
signing
CertificateURL
A certificate that signs liceneses you create.
encryption
CertificateURL
A certificate that the system uses to encrypt license requests.


## Page 3

Note
The “restore” and “updates” keys configuration require you to set a value. For more
information, see Installing your app from your website for alternative marketplace apps, and
Installing apps from an alternative marketplace for other apps.
Host the file using the https:// URL scheme with a valid certificate, and don’t use redirects. Th
configuration publication follows the same pattern as the apple-app-site-association file
For more information, see Supporting associated domains.
For more information about the signing and encryption certificates, see Configuring your app
licensing environment.
A license request consists of a single POST to your licensing endpoint. Each POST can contain a
request for a license for one or more apps. Your license server sends a single response to the POS
which typically includes one license for each requested app. The license request is dynamic,
meaning that your license server provides a new license for each install request.
If you limit app licenses to authenticated devices, check the POST header for an access token tha
links the license request to an account. The following is an example header:
Your token endpoint issues the bearer token to the signed-in person at the start of the app
download request and the system adds it to all further communication with your server for their
account. Use your rules to decide whether to issue the licenses in the request for the account. Fo
more information about authorization, see Installing your app from your website.
The following example reflects the body of a dynamic license request the system makes to your
licensing endpoint:
Handle a dynamic license request


## Page 4

The license request payload contains the following data:
License request pay‐
load key
Value
licenseRequest
A base64 encoded license request that’s AES CBC encrypted.
licenseKey
An AES key/IV that’s base64 encoded and RSA-OAEP encrypted. This
key encrypts the license request.
appsById
A set of one or more identifiers (AppleItemID) that refer to an app
that your marketplace distributes.
Each item in appsById describes the following data:
appsById key
Value
appleVersionID
The app version (AppleVersionID) that the device requests.
assetPublicId
The app variant that the system chooses for the device.
To begin processing the request, parse the payload using a JSONDecoder:


## Page 5

Organize the payload components in the right format. Decode the licenseRequest and
licenseKey (which are both base64 encoded) to reveal their raw, encrypted representations:
Validate that encryptedRequestKey is RSA3072 by ensuring count is the expected number o
bytes:
Then, load your encryption certificate private key (in PEM or DER format) as necessary to decrypt
the license request:
The system encrypts the payload licenseRequest and sends the request to your server. Then,
your license server uses your App License Delivery assets in combination with the payload
licenseKey to decrypt the licenseRequest payload and create a license. To assist with
decryption, use swift-crypto:
Extract the AES key/IV by decrypting the AES key with the encryption certificate’s private key. Use
.PKCS1_OAEP_SHA256, as RSA decryption specifies a padding mode of OAEP and a SHA256
hash function with MGF1 and OAEP:
Decrypt the request payload


## Page 6

In the 32-byte decryption as a UInt8 array, access the AES key in the byte range [0-15], and th
IV in byte range [16-31]:
Next, decrypt the encrypted license request with the extracted AES key and IV using the CBC
decryption mode. The encrypted request uses PKCS #7 padding:
The decrypted payload includes details about the apps for which the system requests a license. T
assist with creating licenses for the apps, the framework needs your ALD encryption assets.
The PASK, which you can find at Certificates, Identifiers & Profiles, is a JSON file with a base64
encoded authorization key inside (authorizationKey). Extract the authorizationKey value
to its own file on disk. The following code decodes the base64 contents of the value for use with
the framework:
Start a license session


## Page 7

Load the ALD encryption and signing certificates from disk:
Prepare a .DER file with ASN.1 encoding for your signing certificate private key and load it as
follows:
Create an ALDProvider instance by calling the init(encryptionCert:signingCert:
PASK:signingKey:) initializer, passing your ALD encryption assets:
Then, hand the decrypted payload to the framework through a session object. Create a session b
calling the provider’s createSession(clientRequest:) method, which returns an
ALDSession instance:
Review the session’s requestedAppleItemIDList list to confirm which of the requested apps
you approve for download. If the device isn’t eligible for a particular app — for example, if a requir
subscription lapsed — you can omit a license for that app in the response.
With the session object, generate a license for each app that you approve for download.
Generate a dynamic license


## Page 8

1. Choose a value for the license ID. Ensure the ID is unique across all the licenses your license
server distributes.
2. Create a license attribute for the license ID by calling init(licenseID:).
3. Set the issuedTime and a duration, in seconds, that determines when the license expires.
For example, setting duration to 86400 prevents the licensed app from launching after a day
4. Set the appKey for the app, or key blob, which is unique per app variant. Refer to appsById in
the request payload for the app ID, and assetPublicId for the variant that iOS needs for tha
app. App Store Connect provides the key blob during app ingestion. For more information, see
Ingesting an alternative distribution package.
5. Create the license by calling the generateLicense(attr:) method with the license
attribute.
If the system requests a license for multiple apps in its POST, repeat this process for each app.
Every time you call generateLicense(attr:), the framework queues an additional license fo
the response.
Important
In iOS 17.4, set a value less than Int64.max; see iOS & iPadOS 17.4 Release Notes.
The framework assists you with preparing a response to the original POST. Call generate
LicenseResponse() begin the response:
Respond with the generated licenses


## Page 9

Then, call finalizeLicenseResponse(licenseResponse:signature:) to retrieve the
response data.
The response data contains the license(s), signing, and encryption certificates. To prepare for
transit over the network, validate the data and encode it in base64:
The format of the license response payload is:
License response
payload key
Value
license
The finalizeLicenseResponse return result that you encode in
base64. This value contains the license(s) that you added to the
session.
unlicensedApps
An array that contains an AppleItemID for each app from the request
for which you choose not to provide a license.


## Page 10

Important
To complete an installation, the system requires a response from your server within 60
seconds of making the request. If you use a web debugging proxy tool to test license
generation, make sure it doesn’t interfere with your server’s ability to respond promptly.
When the system receives the license response, it validates the licenses contained within
according to the signing and encryption certificates in your JSON configuration file (specifically,
signingCertificateURL and encryptionCertificateURL).
Then, the system downloads the licensed app(s) from your app web server. For more information
about serving app downloads, see:
Installing your app from your website for alternative marketplace apps or other apps that instal
from your website.
Installing apps from an alternative marketplace for other apps.
When the system sends a request to your license server, it includes the authentication token in th
header. Use the token to associate the request with a specific person’s account.
The ALDSession object’s requestDeviceID property represents a unique ID for the device on
which the person requests to install the app.
You can determine the number of active installs of a particular app for an account by counting the
unique device IDs your license server encounters minus any unique device IDs associated with
revoked or expired licenses.
Renewing and revoking app licenses
Determine whether an app for which you issue a license launches.
struct ALDAppKey
A structure that identifies an app and a key that’s required to decrypt the app’s license
request.
Track the number of simultaneous app installs for an
account
See Also
App licensing


## Page 11

struct ALDLicenseAttribute
A structure that defines the requested license type for the session.
class ALDProvider
An object that creates a session with the alternative app marketplace’s signing assets.
class ALDSession
A structure that contains the details of a license request and methods to generate license
responses.


## Page 12

An app license expires when its expiry date passes. The expiry date is the duration after the
issuedTime. Your license server determines the value of those properties at the time of issuing 
license (see Licensing alternative distribution apps).
When an app’s license expires, the device’s operating system doesn’t allow the app to launch. Yo
determine the criteria for renewal, expiration, and revocation of licenses for apps that you
distribute. Depending on the circumstances, you can renew a license before it expires, let it expire
or revoke the license deliberately in advance.
For app license renewal or revocation, the system checks with your server by sending a request.
The communication is similar to a dynamic license request for licenses for new app versions,
except that the system calls a different endpoint on your server — the licenseRenewalURL in
your marketplace-kit configuration file:
Once a day, the system checks for app licenses set to expire within the next 24 hours and include
each in a license renewal request. Depending on how your license server responds, the system
Overview
Handle a license renewal request from the system
App License Delivery SDK / Renewing and revoking app licenses
Article
Renewing and revoking app licenses
Determine whether an app for which you issue a license launches.


## Page 13

either allows the app to continue to run or prevents it from running after expiration.
The renewal request is a POST with the following payload:
To handle the request, decode the "renewalRequest" value using the "licenseKey" as
shown in Licensing alternative distribution apps.
Each POST requests renewal for one or more license IDs. On your license server, retrieve the list o
license IDs in the request using the ALDSession property’s requestedLicenseIDList.
The format you supply in response is:
Renewal response
key
Description
"license"
A signed, base64-encoded license, as done for dynamic license
responses. See Licensing alternative distribution apps.
"ineligible
Licenses"
An array of string license IDs from the request that you don’t intend
to renew.
To renew a license, call requestLicenseRenewal(appleItemIDs:) from within your
marketplace app, or other app you distribute from your website. The system then calls your licens
renewal endpoint and provides the license ID for the given AppleItemID. Your license server
responds by providing a new license with the issuedTime set to today, and a duration set at
your discretion.
Renew an app license from your app


## Page 14

If any logic running on your web server determines that an app license needs adjusting, record th
state and periodically check it from your marketplace app. For example, your marketplace app ca
call a custom endpoint you implement just for that purpose. When the state indicates the license
needs adjusting, your app calls requestLicenseRenewal(appleItemIDs:), which intructs
the system to send the renewal request to your license server.
To revoke an app license, call requestLicenseRenewal(appleItemIDs:) passing the app’s
AppleItemID from your app. The system then sends a request to your license renewal endpoint
with that app’s license ID. In response, your endpoint includes the license ID in the ineligible
Licenses array, which instructs the system to prevent the app from running.
When a license expires for your marketplace app or an app that your marketplace distributes and 
person taps the app icon on the Home Screen, the system presents the alert:
Revoke an app license from your app
Resolve an expired license from the Home Screen


## Page 15

A Resolve button follows that, after a person taps it, presents a web view that loads a page you
specify in your server’s marketplace-kit configuration file as the licenseResolutionURL:
When the system issues a GET request for the page, it includes the following parameters:
License resolution
parameter
Description
account
The account you associate with the person in the intitial Marketplace
KitURIScheme to install the app.
appleItemID
An identifier for a requested app. For more information, see AppleItem
ID.
appleVersionID
A version number that corresponds to the alternative distribution
package. For more information, see AppleVersionID.
Format the web page in your response to the person’s unique situation so they can resolve the
issue in line. If they can’t resolve the issue immediately, your webpage provides the necessary
context on the expiration or status of the problem.
If your configuration file lacks licenseResolutionURL, then the system presents the alert:


## Page 16

Licensing alternative distribution apps
Build a license server that supports the installation of your apps and the apps available in yo
marketplace.
struct ALDAppKey
A structure that identifies an app and a key that’s required to decrypt the app’s license
request.
struct ALDLicenseAttribute
A structure that defines the requested license type for the session.
class ALDProvider
An object that creates a session with the alternative app marketplace’s signing assets.
class ALDSession
A structure that contains the details of a license request and methods to generate license
responses.
See Also
App licensing


## Page 17

An instance of this structure represents a unique variant for an app. The AppleItemID argumen
to the init(appleItemID:appKeyBlob:) initializer refers to the app, and the appKeyBlob
argument refers to a key blob for a specific app variant that App Store Connect provides your
marketplace server during app ingestion. For more information, see Ingesting an alternative
distribution package.
init(appleItemID: UInt64, appKeyBlob: [UInt8]) throws
Creates an app key to decrypt a license request.
Overview
Topics
Initializers
See Also
App licensing
App License Delivery SDK / ALDAppKey
Structure
ALDAppKey
A structure that identifies an app and a key that’s required to decrypt the app’s
license request.


## Page 18

Licensing alternative distribution apps
Build a license server that supports the installation of your apps and the apps available in yo
marketplace.
Renewing and revoking app licenses
Determine whether an app for which you issue a license launches.
struct ALDLicenseAttribute
A structure that defines the requested license type for the session.
class ALDProvider
An object that creates a session with the alternative app marketplace’s signing assets.
class ALDSession
A structure that contains the details of a license request and methods to generate license
responses.


## Page 19

init(licenseID: UInt64)
Create a license attribue
var duration: UInt64
The maximum amount of time, in seconds, that iOS considers the license valid.
var issuedTime: UInt64
func addAppKey(ALDAppKey) throws
Add an AppKey to be associated with this license
func revokeAppleItemID(UInt64) throws
An appleItemID to be revoked by the license
Topics
Initializers
Instance Properties
Instance Methods
App License Delivery SDK / ALDLicenseAttribute
Structure
ALDLicenseAttribute
A structure that defines the requested license type for the session.


## Page 20

Licensing alternative distribution apps
Build a license server that supports the installation of your apps and the apps available in yo
marketplace.
Renewing and revoking app licenses
Determine whether an app for which you issue a license launches.
struct ALDAppKey
A structure that identifies an app and a key that’s required to decrypt the app’s license
request.
class ALDProvider
An object that creates a session with the alternative app marketplace’s signing assets.
class ALDSession
A structure that contains the details of a license request and methods to generate license
responses.
See Also
App licensing


## Page 21

Licensing alternative distribution apps
init(encryptionCert: [UInt8], signingCert: [UInt8], PASK: [UInt8],
signingKey: [UInt8]?)
Initializes a provider with the marketplace’s App License Delivery assets and their unique
signing key.
func createSession(clientRequest: [UInt8]) throws -> ALDSession
Creates an ALD Session
Mentioned in
Topics
Initializers
Instance Methods
See Also
App License Delivery SDK / ALDProvider
Class
ALDProvider
An object that creates a session with the alternative app marketplace’s signing
assets.


## Page 22

Licensing alternative distribution apps
Build a license server that supports the installation of your apps and the apps available in yo
marketplace.
Renewing and revoking app licenses
Determine whether an app for which you issue a license launches.
struct ALDAppKey
A structure that identifies an app and a key that’s required to decrypt the app’s license
request.
struct ALDLicenseAttribute
A structure that defines the requested license type for the session.
class ALDSession
A structure that contains the details of a license request and methods to generate license
responses.
App licensing


## Page 23

Licensing alternative distribution apps
Renewing and revoking app licenses
init(request: [UInt8], PASK: [UInt8], encryptionCert: [UInt8], signing
Cert: [UInt8], signingKey: [UInt8]?) throws
Initialize a ALDSession with a license request. Call generateLicense() to create a license.
init(signingCert: [UInt8], signingKey: [UInt8]?, PASK: [UInt8]) throws
Initialize a static ALDSession without a request. This should only be used when an offline
generation of a static license is desired. A static license is a minimal license that is only used
to install apps on the device and is not meant to enforce marketplace defined rights. Only
generateStaticLicense() should be invoked to generate licenses in this case.
Mentioned in
Topics
Initializers
Instance Properties
App License Delivery SDK / ALDSession
Class
ALDSession
A structure that contains the details of a license request and methods to generate
license responses.


## Page 24

var requestAction: ALDLicenseAction
action specified in this request
var requestDeviceID: [UInt8]
the device ID of the requested device
var requestID: UInt64
requestID of the session
var requestTime: UInt64
the client time when the request was made
var requestVersion: UInt32
request version number
var requestedAppleItemIDList: [UInt64]
An array of identifiers for apps that iOS requests a license request for in the session.
var requestedLicenseIDList: [UInt64]
the list of license ID the client has requested a renwal for. used only when action is “renew”
var sessionType: ALDSessionType
the current session type
func finalizeLicenseResponse(licenseResponse: [UInt8], signature: [UInt
]?) throws -> [UInt8]
Returns a signed license in a byte array to send in response to a license request from iOS.
func generateLicense(attr: ALDLicenseAttribute) throws
Generates a license based on the provided ALDLicenseAttribute and add it to the session.
Multiple licenses can be generated in this session by callling this function multiple times, the
get added to the session response.
func generateLicenseResponse() throws -> [UInt8]
Generates a license response. This method produces a license response, in a bytes array. Th
response is not yet signed.
func generateStaticLicense(licenseID: UInt64, appKey: ALDAppKey) throws
Generates a static license based on the provided ALDLicenseAttribute. This method produce
a static license, in a bytes array. A static license is a minimal license that is only used to insta
apps on the device and is not meant to enforce marketplace defined rights.
Instance Methods


## Page 25

enum ALDLicenseAction
The action requested in the license request or provided in the response to one.
enum ALDSessionType
The type of the license session created. A normalSession is used for a session created with 
license request. A staticSession is used for session created without a license request
Licensing alternative distribution apps
Build a license server that supports the installation of your apps and the apps available in yo
marketplace.
Renewing and revoking app licenses
Determine whether an app for which you issue a license launches.
struct ALDAppKey
A structure that identifies an app and a key that’s required to decrypt the app’s license
request.
struct ALDLicenseAttribute
A structure that defines the requested license type for the session.
class ALDProvider
An object that creates a session with the alternative app marketplace’s signing assets.
Enumerations
See Also
App licensing


