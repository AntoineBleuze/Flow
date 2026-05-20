# 004_Communicates with Drivers.pdf

## Page 1

Key
com.apple.developer.driverkit.communicates-with-drivers
Type
Boolean
When true, this entitlement allows your app to open user clients to one or more drivers.
On macOS, use the com.apple.developer.driverkit.userclient-access entitlement
instead.
com.apple.developer.driverkit.userclient-access
An array of strings that represent macOS driver extensions that may communicate with othe
DriverKit services.
com.apple.developer.driverkit.allow-any-userclient-access
Details
Discussion
See Also
User client entitlements
Bundle Resources / Entitlements / Communicates with Drivers
Property List Key
Communicates with Drivers
A Boolean value that indicates whether an iPadOS app can communicate with
drivers.
iOS 16.0+
iPadOS 16.0+


## Page 2

A Boolean value that determines whether a macOS driver accepts user client connections
from any application.
DriverKit Allow Third Party User Clients
A Boolean value that indicates whether an iPadOS driver accepts calls from third-party user
clients.
Key: com.apple.developer.driverkit.allow-third-party-userclients


