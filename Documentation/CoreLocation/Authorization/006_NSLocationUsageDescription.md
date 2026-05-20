# 006_NSLocationUsageDescription.pdf

## Page 1

Name
Privacy - Location Usage Description
Type
String
Use this key in a macOS app that accesses the user’s location information. In an iOS app, use
NSLocationWhenInUseUsageDescription or NSLocationAlwaysAndWhenInUseUsage
Description instead.
Important
This key is required if your macOS app uses APIs that access the user’s location information.
Details
Discussion
See Also
Location
Bundle Resources / Information Property List / NSLocationUsageDescription
Property List Key
NSLocationUsageDescription
A message that tells people why the app is requesting access to their location
information.
iOS 6.0–8.0 Deprecated
iPadOS 6.0–8.0 Deprecated
macOS 10.14+


## Page 2

Choosing the Location Services Authorization to Request
Determine the authorization your app needs to access location data.
NSLocationAlwaysAndWhenInUseUsageDescription
A message that tells people why the app is requesting access to their location information at
all times.
Name: Privacy - Location Always and When In Use Usage Description
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


