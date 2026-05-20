# Dictionaries.pdf

## Page 1

items
[ManifestURL.Items
Item]
(Required) An array of dictionaries representing what the manifest installs.
Installing, managing, updating, and removing apps
Installing packages
Use SHA-256 hashes instead of MD5 because SHA-256 has stronger security. If both SHA-256
and MD5 hash properties are present, the device uses only the SHA-256 hashes to verify the
manifest data.
Properties
Mentioned in
Discussion
Example Manifest
Device Management / ManifestURL
Object
ManifestURL
The URL to the app manifest.
iOS 7.0+
iPadOS 7.0+
macOS 10.9+
tvOS 10.2+
visionOS 1.1+
watchOS 10.0+


## Page 2

object ManifestURL.ItemsItem
Topics
Objects


## Page 3

An array of dictionaries representing what the manifest installs.


## Page 4

SALTED-SHA512-PBKDF2
PasswordHash.SALTED-
SHA512-PBKDF2
(Required) A dictionary that contains the entropy, iterations, and salt
elements to create the password hash using the CommonCrypto libraries, or
equivalent. Convert this dictionary to binary data before setting it as the value
for the password hash.
object PasswordHash.SALTED-SHA512-PBKDF2
A dictionary that contains the elements to create the password hash.
Properties
Topics
Objects
Device Management / PasswordHash
Object
PasswordHash
A dictionary that contains the password hash for the account.
macOS 10.11+


## Page 5

data
[Resource]
(Required)
meta
RelationshipResponse.Meta
next
string
object RelationshipResponse.Meta
Properties
Topics
Dictionaries
Device Management / RelationshipResponse
Object
RelationshipResponse
Device Assignment Services
VPP License Management


## Page 6

errorMessage
string
The human-readable explanation of an error.
errorNumber
int32
The number that uniquely identifies an error.
Properties
Device Management / ResponseErrorCode
Object
ResponseErrorCode
An error code.
Device Assignment Services
VPP License Management


