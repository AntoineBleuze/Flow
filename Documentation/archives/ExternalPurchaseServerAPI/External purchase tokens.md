# External purchase tokens.pdf

## Page 1

An external purchase token is a unique string that your app or website receives when your
customer chooses to view your external purchase offerings. You receive external purchase tokens
within your app or appended to your website URL, depending on the API you call.
When you call token(for:) and your app configures the SKExternalPurchaseCustom
LinkRegions property list key, you receive an external purchase token for custom links (also
called a custom link token) . For more information about these tokens, see the following section
Receive custom link tokens.
When you call token(for:), and your app configures the SKExternalPurchaseLink
StreamingRegions property list key, you receive custom link tokens for a music streaming
service.
When you call presentNoticeSheet() and the response is ExternalPurchase.Notice
Result.continuedWithExternalPurchaseToken(token:), you receive an external
purchase token in your app.
When you call open() or open(url:), you receive an external purchase token appended to
the current storefront’s destination URL. You configure the URLs in the SKExternalPurchas
Link or SKExternalPurchaseMultiLink property list keys, respectively.
In all cases, decode the token to obtain its externalPurchaseId. Use the externalPurchas
Id to report the token and its associated transactions to Apple using the Send External
Purchase Report endpoint of the External Purchase Server API.
The External Purchase API returns tokens that are specific to the app’s environment, either
production or sandbox. Tokens in the sandbox environment have an externalPurchaseId valu
that begins with SANDBOX.
Overview
StoreKit / External Purchase / Receiving and decoding external purchase tokens
Article
Receiving and decoding external purchase
tokens
Receive tokens for external purchases that you use to report transactions to Appl


## Page 2

The system automatically generates custom link tokens for your customer if your app configures
the SKExternalPurchaseCustomLinkRegions or SKExternalPurchaseLinkStreaming
Regions property list keys. Your app calls the token(for:) method to receive the tokens. The
tokens have two possible token types: ACQUISITION and SERVICES.
The system automatically generates new custom link tokens when the following qualifying events
occur:
Qualifying event
Custom link tokens
Customer installs an app for the first time
across all of their devices
The system generates both the ACQUISITION and
SERVICES tokens.
Customer updates or redownloads an app
on any of their devices
If there’s no active SERVICES token, the system
generates a new SERVICES token.
Custom link tokens have expiration dates. A token is considered active during the time between it
creation date and expiration date.
Apps can request custom link tokens at any time, for example, when the app launches, or before
displaying a store. If there’s an active token period, the system returns the token that corresponds
to that active period. The returned token can be identical to the original token, or it can be a
refreshed token. A refreshed token has the same creation and expiration dates as the original
token, but a different externalPurchaseId.
Use either the original token or a refreshed token to report transactions that occur during the acti
token period.
Note
To report transactions for custom link tokens, you can use any token associated with the
customer that is active (not expired) at the time of the transaction.
After a customer’s ACQUISITION token expires, the system doesn’t generate another. The
ACQUISITION token type has only one active token period. After a customer’s SERVICES token
expires, the system generates a new SERVICES token only if a qualifying event occurs, as listed i
the table above.
Custom link tokens are available only on devices running iOS 18.1 and later, iPadOS 18.1 and later,
macOS 15.1 and later, tvOS 18.1 and later, visionOS 2.1 and later, and watchOS 11.1 and later.
Receive custom link tokens


## Page 3

The token your app or website’s server receives is a string that is Base64URL-encoded JSON.
Decode the token using Base64URL decoding to read the JSON, which contains the following
fields:
appAppleId
Uniquely identifies the app to which the token applies.
bundleId
The bundle ID of the app.
tokenCreationDate
UNIX time, in milliseconds, when the system created the token.
externalPurchaseId
A unique value the system creates to identify the token. Use this value when you report token
and transactions.
The following additional fields apply only to custom link tokens:
tokenType
The custom link token’s type, either ACQUISITION or SERVICES.
tokenExpirationDate
UNIX time, in milliseconds, when the token expires, after which you no longer associate the
token with new transactions.
The Send External Purchase Report endpoint requires the externalPurchaseId field 
report tokens and transactions. To get the externalPurchaseId, decode the token string usin
Base64URL decoding.
The following example shows an external purchase token. For a token string that is:
The token’s value after Base64URL decoding is the following JSON:
The following example shows a custom link token with a SERVICES token type. The token string i
Decode external purchase tokens


## Page 4

The custom link token’s value after Base64URL decoding is the following JSON:
The External Purchase API returns external purchase tokens that are specific to the app’s
environment: production or sandbox. You can recognize a token for the sandbox environment by i
externalPurchaseId property, which always begins with SANDBOX.
The following example is an external purchase token that the system created in the sandbox
environment. The sandbox token string is:
The token’s JSON content after Base64URL decoding is:
The following example is a custom link token with a SERVICES token type, that the system create
in the sandbox environment. The sandbox token string is:
The custom link token’s JSON content after Base64URL decoding is:
Recognize tokens from the testing environment


## Page 5

Notice that the custom link token has both a creation date and an expiration date. In the sandbox
environment, the expiration date is one hour after the creation date. An ACQUISITION token has
the same format, with a tokenType value of ACQUISITION.
For more information about testing and receiving custom link tokens in the sandbox environment,
see Testing transactions that use custom link tokens.


