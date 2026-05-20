# Essentials.pdf

## Page 1

The Digital Credentials API allows websites to request identity document information from apps
installed on a device. You can request mobile documents (mdocs), as defined in the ISO/IEC 1801
5 standard, through the Digital Credentials API.
Using the Digital Credentials API is the most streamlined and secure way for websites to request
mdocs. By implementing the API, your website has access to the mdocs stored in the Wallet app,
and in other apps on device. By default, the API supports these flows across iPhone, iPad, and Ma
without any platform-specific work required by the website. Additionally, the API leverages other
standards to enable cross-platform flows to other operating systems.
Your server needs to build the request and handle encryption. The request format is defined in th
mdoc request profile in ISO/IEC 18013-7 Annex C.
A request includes two parts: the encryption information and the device request. The encryption
information contains parameters important for response encryption. Part of creating the encryptio
information is generating a recipient encryption key pair. Your server uses this key pair to decrypt
the document response returned from the API, so you need to keep the encryption key safely on
your server and rotate it frequently.
The parameters in the encryption information are:
nonce
An unpredictable random value or pseudorandom value, generated once per request.
recipientPublicKey
The public key of the encryption key pair that your server generates.
Overview
Build the request
IdentityDocumentServices / Requesting a mobile document on the web
Article
Requesting a mobile document on the web
Send a request for mobile document information for apps installed on a device.


## Page 2

The device request is the second part of a request. Section 8.3.2.1.2.1 of the ISO/IEC 18013-5
standard defines the format for this request. Use the latest version string available from the
standard when building your device request for the Digital Credentials API.
Define the details of the document you’re requesting in the ItemsRequest type. The notable
parameters are:
docType
A standardized string that describes the type of document you’re requesting. For example, yo
can request a mobile driver’s license (mDL) by using “org.iso.18013.5.1.mDL”.
nameSpaces
A nested dictionary that defines the elements you request and whether your website intends 
retain these elements after the identity verification is complete. These elements are divided
into groups called namespaces. The standardized namespaces and element identifiers may b
different for each document type.
After you build the request that describes the document you’re requesting, you might need to
authenticate the request through a signature. Any apps that contain these documents are eligible
to respond to this request. Some apps might have additional authentication that requires
identification of the requesting website.
The standardized mechanism for authenticating the request is the ReaderAuth mechanism
described in Section 9.1.4 of ISO/IEC 18013-5. This section contains instructions on how to
generate a signature and attach it to your device request. The SessionTranscript your app
uses to generate this signature needs to be the SessionTranscript defined in Annex C of
ISO/IEC 18013-7.
Apple Wallet’s authentication requirements include authenticating the request via the ReaderAut
mechanism with a certificate.
You get this request authentication certificate from Apple Business Connect. For more informatio
see the Apple Business Connect User Guide.
After you have this certificate, generate the ReaderAuth signature with its signing key. Then,
attach the certificate to the ReaderAuth structure through the x5chain header defined in RFC
9360.
Sign and authenticate the request
Enable Apple Wallet to accept an mdoc request
Call the Digital Credentials API


## Page 3

First, you build the request based on the generated information from your server. Then, you can
build the request structure for the Digital Credentials API.
After you create a request, then you pass it to navigator.credentials.get to trigger the
Digital Credentials API. This code must be triggered by an explicit user interaction such as a click
handler. If you call this API without a user interaction, the system throws an exception.
The following code shows how to call the API:
First, build the request based on the generated information from your server. Once built, you can
build the request structure for the Digital Credentials API.
Pass your mdoc request as an individual request in the requests array. The protocol string org-
iso-mdoc identifies the request profile.


## Page 4

The format of the mdoc response returned from the Digital Credentials API is defined in Annex C 
ISO/IEC 18013-7. There are two important parameters in the mdoc response:
enc
The sender public key that the document provider app used to encrypt the device response.
The decryption process uses this key.
cipherText
The encrypted device response.
The server decrypts the response through Hybrid Public Key Encryption (HPKE) defined in RFC
9180. The particular parameters to use for decryption operation are defined in Annex C of ISO/IEC
18013-7.
The decryption results in a DeviceResponse, defined in Section 8.3.2.1.2.3 of ISO/IEC 18013-5.
This device response contains the returned documents and element information.
There are some additional security structures attached in the response. You need to verify these
properties before using the returned element information. The two structures that need to be
verified are: the issuer authentication structure and the device authentication structure.
Section 9.1.2 of ISO/IEC 18013-5 defines a procedure for validating the issuer data in the device
response. This helps your business verify that the data is authentic and comes from a source that
you trust. Part of this process involves maintaining a list of trusted Issuing Authority Certificate
Authority (IACA) root certificates. This list allows you to control which entities you trust to issue
document data. If a document response isn’t signed by a certificate that chains up to an IACA in
your trust store, then discard the response.
Section 9.1.3 of ISO/IEC 18013-5 defines a procedure for validating the mdoc itself. This procedur
helps your business verify that the response came from the device to which it was issued by your
app. Using this procedure helps prevent cloning of the mdoc to an unauthorized device. This is
done through the DeviceAuth structure and an associated device key.
After you perform the validations above, then you’re ready to use the returned data.
Implementing as an identity document provider
Add your app as an option for mobile document web presentment.
Receive an mdoc response
See Also
Essentials


## Page 5

The Identity Document Provider APIs in IdentityDocumentServices and Identity
DocumentServicesUI enable your app to participate in web presentment activated through the
Digital Credentials API. By implementing the identity document provider APIs into your app, your
app appears as an option for the user to select during a presentment. If the user selects your app
then an authorization UI that you provide appears for them to review.
Integrating the identity document provider requires two steps: registering your available documen
with iOS and adding the Identity Document Provider app extension to your app to build the
authorization UI you show to the user.
Before your app can provide identity documents, you must add the Digital Credentials AP
- Mobile Document Provider entitlement to your app.
The API enables you to provide mobile documents (mdocs), defined in the ISO/IEC 18013-5
standard. Your app must specify which types of mobile documents it intends to provide in the
entitlement. To maximize interoperability, your app needs to follow the appropriate standard that
defines the namespaces and elements for a given mobile document type.
In order for iOS to know when to surface your app, register information about the documents you
app contains. For a consistent user experience, register your documents as soon as the system
creates a document within your app.
Overview
Add the entitlement
Registering your document
IdentityDocumentServices / Implementing as an identity document provider
Article
Implementing as an identity document
provider
Add your app as an option for mobile document web presentment.


## Page 6

Identity document registrations happen through the IdentityDocumentProvider
RegistrationStore type. The registration store supports registering mdocs as defined in
ISO/IEC 18013-5.
The following code shows an example of how to register a mobile driver’s license (mDL):
When registering an mdoc, you provide the following information:
mobileDocumentType
The standardized docType string that identifies the type of mobile document. You can only
register document types that are listed in your entitlement.
supportedAuthorityKeyIdentifiers
A list of authority key identifiers. These identifiers allow your app to enforce a signing
requirement. If the incoming request is signed by a certificate issued by a root certificate that
has a subject key identifier matching an authority key identifier in this list, then your app
appears as an option to respond to the request. If there’s no certificate on the request, the
system hides your app, because the app can’t successfully respond to the request. If you
provide an empty array in this field, then your app can’t enforce a signing requirement for this
document type.
documentIdentifier
The identifier you use to associate a document identifier with your registration. You can use
this identifier to link a registration to a document stored in your database. Your app later uses
this identifier to remove registrations. If you don’t provide a document identifier, then one is
automatically generated by the API.
Add a registration


## Page 7

invalidationDate
An optional date that indicates when the mdoc isn’t valid. If the current date is past the
invalidation date, then your app no longer considers this document as an option for a
presentment until it refreshes the registration with a newer date.
When a document in your app is no longer available for use, it’s important to remove its registratio
from the iOS. This helps enable the best user experience. Use the appropriate document identifie
to remove the registration.
If you provide a document identifier, then you can determine the correct identifier based on your
app’s logic. If don’t provide a document identifier, you can query your app’s stored registrations to
determine the document identifier. Here’s an example:
Add the Identity Document Provider app extension to create your app UI. You can use the templat
available in Xcode.
The generated template gives you a place to fill in SwiftUI code:
Remove a registration
Create your authorization UI


## Page 8

The ISO18013MobileDocumentRequestContext provided in IdentityDocumentService
UI contains the information needed to build your UI:
requestingWebsiteOrigin
The origin URL of the requesting website.
request
A parsed version of the incoming request. This contains information about the documents
requested, as well as any certificates attached to the request. Please see “Handling the parse
and the raw request” below for more information on this request.
sendResponse
A function that allows your app to return a built document response. This function also allows
your app to receive the row ISO/IEC 18013 request. You should only call this function after the
user explicitly authorizes the release of their document in your UI.
cancel
A function that allows your app to cancel out of the current presentment.
The incoming request your app needs to handle is the request defined in ISO/IEC 18013-7 Annex 
and ISO/IEC 18013-5. These request types contain complex structures, as well as signatures to
help your document provider app authenticate the requesting website.
Due to the complex nature of this request and the fact that the website is potentially untrusted, th
browser can’t provide the full request to the system components, such as your app, until the user
performs an interaction. However, components of the request are necessary in order to build the
authorization UI.
To provide the best user experience while protecting your app’s security, the ISO18013Mobile
DocumentRequestScene provides two requests to your app. When your app receives the first
request, a system sandbox validates the signatures of the incoming request, and parses out the
information necessary to build a UI. This is the ISO18013MobileDocumentRequest type that 
available on the ISO18013MobileDocumentRequestContext received by your app.
Handling the parsed and raw request


## Page 9

After the user approves the presentment within your app’s authorization UI, then they perform a
user interaction. This means that the raw ISO/IEC 18013-7 Annex C request is ready for release to
your app. This raw request releases within a closure when your app calls the send response
function:
Now that your app has access to both requests, perform the following procedure:
1. Compare the consistency of the parsed request on ISO18013MobileDocumentRequest
Context against the received rawRequest.
2. Validate the signatures in the raw request to confirm that it originated from a source that your
app trusts. Your app needs to also confirm that the request is signed by a certificate that your
app trusts. Even though the sandboxed system process checks these signatures, it’s important
that your app checks them before releasing its document.
3. If both checks passed, then build and encrypt your document response according to ISO/IEC
18013-7 Annex C and ISO/IEC 18013-5.
4. Return your document response from the closure.
The following code illustrates the steps your app performs:
Responding to user authorization


## Page 10

Your app becomes eligible to register documents after the user authorizes your app to provide
documents during a web presentment.
The first time your app calls the addRegistration API on IdentityDocumentProvider
RegistrationStore, the system shows the user a display prompt. The user can choose to
approve your app in the prompt, and then your app’s document registration continues.
If the user doesn’t approve your app, then the addRegistration call throws an error. The user
can later enable your app again in your app’s page in Settings. After the user approves, the
system notifies your app through the performRegistrationUpdates function on your app
extension.
When you call this function, your app needs to ensure that all documents stored in your app are
registered with iOS:
Your app can also query the current user’s authorization status through the status API on
IdentityDocumentProviderRegistrationStore:
See Also


## Page 11

Requesting a mobile document on the web
Send a request for mobile document information for apps installed on a device.
Essentials


