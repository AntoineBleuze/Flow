# 000_Location Push Service Extension.pdf

## Page 1

Key
com.apple.developer.location.push
Type
Boolean
Default: true
This entitlement enables your app to monitor for Apple Push Notification service (APNs) pushes
with the location push type, and receive pushes in your Location Push Service Extension. For
more information about the location push type, see Sending notification requests to APNs.
Note
Without this entitlement, your code receives an error when it calls startMonitoring
LocationPushes(completion:).
Add the entitlement to your app by following these steps:
1. Open your app’s Xcode project and select your app from the target list.
Details
Attributes
Discussion
Bundle Resources / Entitlements / Location Push Service Extension
Property List Key
Location Push Service Extension
An entitlement to enable a location-sharing app to query someone’s location in
response to a push notification.
iOS 7.0+
iPadOS 7.0+
macOS 10.9+


## Page 2

2. Select the Signing & Capabilities panel.
3. Click “+ Capabilities” and enter “push” in the search field; then double-click Location Push
Service Extension to add the entitlement to your app’s entitlements file.
For more information about implementing your Location Push Service Extension, see Creating a
location push service extension.


