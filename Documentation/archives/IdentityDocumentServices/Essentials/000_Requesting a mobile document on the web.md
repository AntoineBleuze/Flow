# 000_Requesting a mobile document on the web.pdf

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


