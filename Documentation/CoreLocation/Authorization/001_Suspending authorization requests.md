# 001_Suspending authorization requests.pdf

## Page 1

If your app has an onboarding flow that includes obtaining location updates, you may want to defe
the Core Location’s request for authorization from the user. You can inhibit the auto-prompting in
your app by creating a CLServiceSession at a convenient time in your app, then iterating over
its diagnostics property to determine the level of authorization the person using your app selects.
The following code snippet demonstrates how to defer the prompting.
Add the CLRequireExplicitServiceSession property to your app’s Info.plist file to opt into
this control behavior.
Overview
Core Location / Suspending authorization requests
Article
Suspending authorization requests
Defer the system’s authorization request dialog until your app is ready.


## Page 2

Requesting authorization to use location services
Obtain authorization to use location services and manage changes to your app’s authorizatio
status.
enum CLAuthorizationStatus
Constants that indicate the app’s authorization to use location services.
enum CLAccuracyAuthorization
Constants that indicate the level of location accuracy the app has authorization to use.
NSLocationAlwaysAndWhenInUseUsageDescription
A message that tells people why the app is requesting access to their location information at
all times.
NSLocationWhenInUseUsageDescription
A message that tells people why the app is requesting access to their location information
while the app is running in the foreground.
NSLocationUsageDescription
A message that tells people why the app is requesting access to their location information.
NSLocationDefaultAccuracyReduced
A Boolean value that indicates whether the app requests reduced location accuracy by
default.
NSLocationAlwaysUsageDescription
A message that tells people why the app is requesting access to their location at all times.
See Also
Authorization


