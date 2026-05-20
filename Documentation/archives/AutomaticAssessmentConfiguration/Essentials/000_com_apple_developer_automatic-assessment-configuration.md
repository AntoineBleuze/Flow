# 000_com_apple_developer_automatic-assessment-configuration.pdf

## Page 1

Type
Boolean
Use an AEAssessmentSession instance to put a device into a state that prevents users from
accessing certain system features during high-stakes assessment activities, such as administerin
an exam. Your app needs the com.apple.developer.automatic-assessment-
configuration entitlement to create an assessment session.
To add the entitlement to your app, set the entitlement’s type to Boolean in the Xcode property lis
editor, and the corresponding value to YES.
Details
Discussion
Bundle Resources / Entitlements / com.apple.developer.automatic-assessment-configuration
Property List Key
com.apple.developer.automatic-
assessment-configuration
A Boolean value that indicates whether an app may create an assessment sessio
iOS 13.4+
iPadOS 13.4+
macOS 10.15.4+


## Page 2

Before your app can use this entitlement, you must first get permission to use it. Request
permission by filling in the Automatic Assessment Configuration Entitlement Request form.
Important
If your app has a deployment target earlier than macOS 11, to use the com.apple
.developer.automatic-assessment-configuration entitlement, your app also
needs the com.apple.security.temporary-exception.mach-lookup.global-
name entitlement. Add this to your app’s entitlements file with a corresponding value that’s an
array of strings containing the string com.apple.assessmentagent.
ClassKit Environment Entitlement
The ClassKit development or production environment for an education app that works with t
Schoolwork app.
Key: com.apple.developer.ClassKit-environment
See Also
Education


