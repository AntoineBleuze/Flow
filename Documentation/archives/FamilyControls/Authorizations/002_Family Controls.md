# 002_Family Controls.pdf

## Page 1

Key
com.apple.developer.family-controls
Type
Boolean
You must add the Family Controls entitlement to your app before you call the Authorization
Center class’s requestAuthorization(completionHandler:) or revoke
Authorization(completionHandler:) methods.
Adding the Family Controls capability to your app automatically sets this entitlement. Before
submitting your app to the App Store, you must request permission to use the entitlement. For
more information, see Adding capabilities to your app.
Details
Discussion
Bundle Resources / Entitlements / Family Controls
Property List Key
Family Controls
A Boolean value that indicates whether the app can request or revoke
authorization to provide parental controls.
iOS 15.0+
iPadOS 15.0+
Mac Catalyst 15.0+
visionOS 1.0+


