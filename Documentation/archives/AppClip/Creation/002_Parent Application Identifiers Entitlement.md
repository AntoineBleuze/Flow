# 002_Parent Application Identifiers Entitlement.pdf

## Page 1

Key
com.apple.developer.parent-application-identifiers
Type
Array of strings
The Parent Application Identifiers entitlement establishes a secure association between an App C
and its corresponding app. Add it only to an App Clip target.
Note
When you add an App Clip target to your project as described in Creating an App Clip with
Xcode, Xcode creates this entitlement and adds the correct value.
Because an App Clip is always associated with exactly one app, ensure the parent application
entitlement has exactly one entry, the corresponding app’s application identifier.
Ensure that the application identifier for the App Clip uses the full app’s application identifier as its
prefix, followed by a string. For example, if your app’s application identifier is $(AppIdentifier
Prefix)com.example.MyApp, the App Clip’s application identifier may be $(AppIdentifie
Prefix)com.example.MyApp.Clip.
Details
Discussion
Bundle Resources / Entitlements / Parent Application Identifiers Entitlement
Property List Key
Parent Application Identifiers Entitlement
A list of parent application identifiers for an App Clip with exactly one entry.
iOS 14.0+
iPadOS 14.0+


## Page 2

com.apple.developer.associated-appclip-app-identifiers
A list of App Clip identifiers for an app with exactly one entry.
com.apple.developer.on-demand-install-capable
A Boolean value that indicates whether a bundle represents an App Clip.
See Also
App Clips


