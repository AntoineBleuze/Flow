# 002_Setting Up a Key Server.pdf

## Page 1

Apps that use the Exposure Notification framework rely on a key server to identify potential
exposure to individuals diagnosed with COVID-19, the disease caused by the SARS-CoV-2 virus.
The key server is responsible for collecting and distributing exposure keys to allow on-device
exposure detection. This article describes how to provide the data that allows exposure notificatio
to work, and details the data format the Exposure Notification framework requires.
A key server, at a minimum, must allow exposure notification clients to:
Retrieve diagnosis keys so they can check for potential exposures
Submit temporary exposure keys
If providing a client app, a Health Authority can choose how to implement these capabilities as lon
as the data that passes to and from the exposure notification client conforms to the data formats
this article describes. To support Exposure Notifications Express, which allows exposure
notifications without an app in iOS 13.7 and above, a key server’s functionality must conform to
specific requirements. For more information on how to support Exposure Notifications Express wi
your key server, see Configuring a Key Server for Exposure Notifications Express.
Google has created an implementation of a key server that you can use as a reference, or as a
starting point for creating your own key server.
Note
Diagnosis keys are temporary exposure keys for individuals who have had a positive diagnosis
of COVID-19.
Overview
Exposure Notification / Setting Up a Key Server
Article
Setting Up a Key Server
Ensure that your server meets the requirements for supporting Exposure
Notifications.


## Page 2

Before you begin setting up your key server, request an Exposure Notification Entitlement. Once
your request is accepted, you’ll be asked to provide information that clients will use to authentica
the data they receive from your server, such as its public key.
A key server must reject invalid key files uploaded from a client app. Uploaded key data is
considered invalid if:
The period of time covered by the data file exceeds 14 days
TEKRollingPeriod, if included, must be a positive value that is no greater than 144
If TEKRollingPeriod is not included, use a default value of 144. You may optionally want to
validate the clock time the device submits.
For detailed information on implementing key validity checks, see Exposure Notification
Cryptography Specification.
To help ensure that the data sent to client devices canʼt be used to reveal a userʼs identity, your k
server:
Must store temporary exposure keys in randomized order, not in the order in which theyʼre
received, and not grouped by user
Must not distribute temporary exposure key data until at least 2 hours after the end of the keyʼs
expiration window
Must periodically delete any stored temporary exposure keys to ensure that none are over 30
days old
A key server must always sign files with the private key that corresponds to the latest public key
provided to Apple using SHA-256 with ECDSA. Exposure notification clients reject keys retrieved
from a server when they can’t verify them against the current public key.
A key server must deliver diagnosis key data to clients as a zip archive that contains two files, bot
stored at the root level, and both with the same base name, but different extensions. The file that
contains the temporary exposure key data must have the extension .bin and the file that contain
the signature and signature-verification metadata must have the extension .sig.
Reject Invalid Temporary Exposure Keys
Take Precautions with Temporary Exposure Keys
Sign Downloads with the Latest Registered Certificate
Package Temporary Exposure Key Data in a Zip Archive


## Page 3

A key server can send multiple zip archives to the same client, but each archive sent at the same
time must use different base names for the contained files. For compatibility, send a maximum of
15 key files to a single client in a 24-hour period, because clients running on iOS 13.5 and earlier
are limited to 15 key files in this time frame.
For best results, zip archives should be no larger than 16 MB and contain no more than 750,000
keys.
Note
While both the key and signature file specifications support multi-file batches, not all exposure
notification clients accept them. To ensure that all clients can accept your key server’s
diagnosis keys, always set batch_num and batch_size to a value of 1.
The .bin file in the zip archive is a binary file that begins with a 16-byte header that contains ​EK
Export v1​ in UTF-8 encoding, right-padded with whitespace characters. This header represent
the current version of the exposure-key binary format. The header is followed by a serialized ​
protocol buffer​ message named TemporaryExposureKeyExport,​ which uses the following
protocol buffer definition:


## Page 4



## Page 5

The .sig file in the archive contains the signature and information the client needs to validate the
download. The key server generates the signature file by serializing a single TEKSignatureLis
protocol buffer message, which uses the following protocol buffer definition:
To calculate the signature data inside a TEKSignature message, start by generating a digest
of the data file in the archive using the SHA-256 hash algorithm. Then, sign the digest value using
the ECDSA with P-256 algorithm. The private key you use for signing must be the one that
corresponds to the public key registered with Appleʼs key server.


## Page 6

Supporting Exposure Notifications Express
Configure servers to notify users of potential exposures to COVID-19 without an app.
Building an App to Notify Users of COVID-19 Exposure
Inform people when they may have been exposed to COVID-19.
class ENManager
A class that manages exposure notifications.
ENDeveloperRegion
A string that specifies the region that the app supports.
ENAPIVersion
A number that specifies the version of the API to use.
Changing Configuration Values Using the Server‑to‑Server API
Update Exposure Notifications configuration values from a Public Health Authority’s server.
Testing Exposure Notifications Apps in iOS 13.7 and Later
Perform end-to-end validation of Exposure Notifications apps on a device by manually loadin
configuration files.
Supporting Exposure Notifications in iOS 12.5
Prepare your Exposure Notifications app to run on a previous version of iOS.
See Also
Essentials


