# 005_DriverKit Allow Third Party User Clients.pdf

## Page 1

Key
com.apple.developer.driverkit.allow-third-party-userclients
Type
Boolean
By default, an iPadOS driver accepts user-client connections from apps signed with the same tea
ID and the Communicates with Drivers entitlement. Set this entitlement to true on a driver to allo
connections apps with other team IDs. The connecting apps must still have the Communicates w
Drivers entitlement.
com.apple.developer.driverkit.userclient-access
An array of strings that represent macOS driver extensions that may communicate with othe
DriverKit services.
Details
Discussion
See Also
User client entitlements
Bundle Resources / Entitlements / DriverKit Allow Third Party User Clients
Property List Key
DriverKit Allow Third Party User Clients
A Boolean value that indicates whether an iPadOS driver accepts calls from third-
party user clients.
iOS 16.0+
iPadOS 16.0+


## Page 2

com.apple.developer.driverkit.allow-any-userclient-access
A Boolean value that determines whether a macOS driver accepts user client connections
from any application.
Communicates with Drivers
A Boolean value that indicates whether an iPadOS app can communicate with drivers.
Key: com.apple.developer.driverkit.communicates-with-drivers


