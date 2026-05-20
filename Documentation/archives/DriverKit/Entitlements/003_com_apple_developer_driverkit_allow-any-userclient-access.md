# 003_com_apple_developer_driverkit_allow-any-userclient-access.pdf

## Page 1

Type
Boolean
Add this entitlement to your dext that contains an IOUserClient implementation. This
entitlement allows any application to connect to the dext without having to specify bundle IDs, as
com.apple.developer.driverkit.userclient-access requires.
com.apple.developer.driverkit.userclient-access
An array of strings that represent macOS driver extensions that may communicate with othe
DriverKit services.
Communicates with Drivers
A Boolean value that indicates whether an iPadOS app can communicate with drivers.
Key: com.apple.developer.driverkit.communicates-with-drivers
Details
Discussion
See Also
User client entitlements
Bundle Resources / Entitlements / com.apple.developer.driverkit.allow-any-userclient-access
Property List Key
com.apple.developer.driverkit.allow-any-
userclient-access
A Boolean value that determines whether a macOS driver accepts user client
connections from any application.
macOS 10.15+


## Page 2

DriverKit Allow Third Party User Clients
A Boolean value that indicates whether an iPadOS driver accepts calls from third-party user
clients.
Key: com.apple.developer.driverkit.allow-third-party-userclients


