# 002_com_apple_developer_driverkit_userclient-access.pdf

## Page 1

Type
Array of strings
Add this entitlement to your app that opens the IOUserClient. Set its value to an array of bund
IDs of driver extensions that you want to use with DriverKit. If you have only one bundle ID, you ca
use either a single string or a one-element array.
On iPadOS, use the Communicates with Drivers entitlement instead.
com.apple.developer.driverkit.allow-any-userclient-access
A Boolean value that determines whether a macOS driver accepts user client connections
from any application.
Communicates with Drivers
Details
Discussion
See Also
User client entitlements
Bundle Resources / Entitlements / com.apple.developer.driverkit.userclient-access
Property List Key
com.apple.developer.driverkit.userclient-
access
An array of strings that represent macOS driver extensions that may communicat
with other DriverKit services.
macOS 10.15+


## Page 2

A Boolean value that indicates whether an iPadOS app can communicate with drivers.
Key: com.apple.developer.driverkit.communicates-with-drivers
DriverKit Allow Third Party User Clients
A Boolean value that indicates whether an iPadOS driver accepts calls from third-party user
clients.
Key: com.apple.developer.driverkit.allow-third-party-userclients


