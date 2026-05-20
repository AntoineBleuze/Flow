# Signatures.pdf

## Page 1

A JSON Web Signature (JWS) is an open standard (RFC 7515) that defines a way to securely
transmit information. AdAttributionKit requires a JWS to create an AppImpression. You create
the JWS and sign it with your private key. For more information about creating keys, see
Registering an ad network
To generate a signed compact JWS:
1. Create the JOSE (JSON Object Signing and Encryption) header.
2. Create the JWS payload.
3. Sign the JWS.
To create a JWS impression to use with AdAttributionKit, use the following fields and values in the
header:
Header field
Value
alg -
encryption
algorithm
ES256 — All JWSs for AdAttributionKit require signing with ES256 encryption.
kid - your ad
network ID
The ad network ID you receive during ad network registration (for example, a
string similar to example.adattributionkit). You can also use your
existing SKAdNetwork ad network ID, which ends with .skadnetwork.
Overview
Create the JOSE header
AdAttributionKit / Generating JWS impressions
Article
Generating JWS impressions
Create a JSON Web Signature (JWS) for use with app impressions in
AdAttributionKit.


## Page 2

Here’s an example of a JOSE header:
The JWS payload contains information about the advertisement, such as the advertised app item
ID, publisher app item ID, source identifier, and type of impression. Use the following fields to
include these values in the JWS payload:
Payload field
Value
impression-identifier
The id
publisher-item-
identifier
The publisherItemID
impression-type
The impression type, "app-impression"
ad-network-identifier
A string that defines the ad network, such as example
.adattributionkit
source-identifier
The hierarchical source identifier, which may include two, three, or fou
digits
timestamp
The time the ad network created the impression, in milliseconds since
1970
advertised-item-
identifier
The advertisedItemID
eligible-for-re-
engagement
A Boolean value that indicates whether the impression is eligible for
reengagement. (optional)
Here’s an example of a JWS payload:
Create the JWS payload


## Page 3

To create impressions eligible for reengagement conversions, add the following field and value to
the JWS payload:
Use the private key you generated during ad network registration to sign the JWS using ES256
encryption.
You need to sign the JWS in the compact format outlined in section 5.1 of RFC 7515 that describe
the JWS signature process and format, and conforms to the following format as a UTF-8 string:
This renders a compact JWS impression like the example below that you can pass into the API:
Sign the JWS


