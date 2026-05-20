# 004_NSLocationAlwaysAndWhenInUseUsageDescription.pdf

## Page 1

Name
Privacy - Location Always and When In Use Usage Description
Type
String
Use this key if your iOS app accesses location information while running in the background. If you
app only needs location information when in the foreground, use NSLocationWhenInUseUsage
Description instead. For more information, see Choosing the Location Services Authorization t
Request.
If you need location information in a macOS app, use NSLocationUsageDescription instead
your iOS app deploys to versions earlier than iOS 11, see NSLocationAlwaysUsage
Description.
Important
This key is required if your iOS app uses APIs that access the user’s location information at all
times.
Details
Discussion
Bundle Resources / Information Property List / NSLocationAlwaysAndWhenInUseUsageDescription
Property List Key
NSLocationAlwaysAndWhenInUseUsage
Description
A message that tells people why the app is requesting access to their location
information at all times.
iOS 11.0+
iPadOS 11.0+
visionOS 1.0+


## Page 2

Choosing the Location Services Authorization to Request
Determine the authorization your app needs to access location data.
NSLocationUsageDescription
A message that tells people why the app is requesting access to their location information.
Name: Privacy - Location Usage Description
NSLocationWhenInUseUsageDescription
A message that tells people why the app is requesting access to their location information
while the app is running in the foreground.
Name: Privacy - Location When In Use Usage Description
NSLocationTemporaryUsageDescriptionDictionary
A collection of messages that explain why the app is requesting temporary access to their
location.
Name: Privacy - Location Temporary Usage Description Dictionary
NSLocationAlwaysUsageDescription
A message that tells people why the app is requesting access to their location at all times.
Name: Privacy - Location Always Usage Description
Deprecated
NSWidgetWantsLocation
A Boolean value that indicates a widget uses the user’s location information.
Name: Widget wants location
NSLocationDefaultAccuracyReduced
A Boolean value that indicates whether the app requests reduced location accuracy by
default.
Name: Privacy - Location Default Accuracy Reduced
See Also
Location


