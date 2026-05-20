# 000_Verifying a postback.pdf

## Page 1

Postbacks contain data that validate an ad conversion. You need to verify the postback signature 
make sure that Apple signed it before you count the conversion. Follow these steps to validate the
postback:
1. Receive the postback at a URL you configure.
2. Respond to the postback request when you receive it.
3. Validate the JSON Web Signature (JWS) by verifying its signature.
4. Count only unique postbacks with signatures you verify. Check the did-win parameter to learn
whether the postback represents a winning attribution.
Devices send postbacks to ad networks and developers within a defined timeframe after a
conversion event occurs and the advertised app updates the conversion value at least once. Ad
networks receive postbacks at the URL they provide when they register to use AdAttributionKit.
Developers who opt in receive copies of winning postbacks at the URL they configure in the app’s
property list key, AttributionCopyEndpoint. For more information about setting up your
postback URL, see Registering an ad network and Configuring an advertised app. For more
information about the timeframe for receiving attribution, see Receiving ad attributions and
postbacks. You may receive postbacks in three conversion windows. For more information, see
Receiving postbacks in multiple conversion windows.
Overview
Receive the postback
Verify Apple’s signature
AdAttributionKit / Verifying a postback
Article
Verifying a postback
Ensure the validity of a postback you receive after an ad conversion by verifying it
cryptographic signature.


## Page 2

Apple signs postbacks with a different key depending on the environment and whether the system
creates the postbacks in an end-to-end flow or in developer settings.
For production flows, always use the production key to validate that Apple generated the
postbacks. Ignore postbacks that don’t pass signature validation in production flows.
You can also validate postback signatures in development environments, whether you’re testing a
end-to-end flow or generating postbacks directly from the developer settings.
Determine which NIST P-256 public key you need from the list below:
To validate production postbacks:
Key identifier: apple-cas-identifier/0
Base64-encoded key: MFkwEwYHKoZIzj0CAQYIKoZIzj0DAQcDQgAEWdp8GPcGqmhgz
EFj9Z2nSpQVddayaPe4FMzqM9wib1+aHaaIzoHoLN9zW4K8y4SPykE3YVK3sVq
W6Af0lfx3gg==
To validate development postbacks the system creates from end-to-end flows:
Key identifier: apple-development-identifier/0
Base64-encoded key: MFkwEwYHKoZIzj0CAQYIKoZIzj0DAQcDQgAELeEDzpJEP+/qRSE5
JVC1p1J0ssUnQGMzBBbvnACBok8OVGGLgxL0myrKiy6lvRtSlLRsWit87i+vftD8AEqe
Q==
To validate development postbacks the system generates from developer settings:
Key identifier: apple-development-identifier/1
Base64-encoded key: MFkwEwYHKoZIzj0CAQYIKoZIzj0DAQcDQgAE8YzdO7e
M97s/IJ25kdW5CZ3A14USE5IJ5Ha/vhWaxI6UBI1ZxCEvjrKxVluVGe6qWwF1BDFq+QHq
KfH5u+wxHQ==
The following code demonstrates how to determine which public key to use, depending on the ki
property you receive in the postback’s JWS header:


## Page 3

To verify a signature, follow these steps:
1. Decode Apple’s public key, which appears as a Base64-encoded string above. The result is a
byte array in DER format.
2. Create an X.509 standard public key from the DER byte array.
3. Use the public key to verify the signature of the JWS using the outlined process in Section 5.2 
RFC 7515.
If your verification passes, the postback is valid.
Important
If the signature fails your verification, consider the postback message invalid. Don’t use it to
count a conversion.
The JWS components include the following:
A header that has alg and kid parameters.
A payload that contains the impression-type, ad-network-identifier, source-
identifier, advertised-item-identifier, conversion-type, postback-
identifier, did-win, and postback-sequence-index properties, as well as the
marketplace-identifier and publisher-item-identifier properties, both of which
are optional.
The signature that Apple generates, which is the last component of the JWS.
Verify the JWS components


## Page 4

When you receive a postback, respond with an HTTP 200 OK status code. If the device receives a
500 status code, it attempts to send the postback up to nine times over a maximum of 9 days.
Use the postback-identifier value to ensure that you’re counting unique ad conversions. If
you receive more than one postback with the same postback-identifier, discard the
duplicate report.
Identifying the parameters in a postback
Interpret postback properties to understand the attribution report.
Respond to the postback
Count unique messages only
See Also
Postback verification and parameter identification


