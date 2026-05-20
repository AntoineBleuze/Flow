# Essentials.pdf

## Page 1

This sample code project shows you how to create a background delivery extension with
FinanceKit. With the extension, you can receive notifications when data changes in FinanceStore
and handle it outside of your app’s life cycle. This enables your app and its extensions to access
up-to-date information without relying on the app itself.
Note
This sample code project is associated with WWDC25 session 201: What’s new in Apple Pay.
To run the sample app, you need an entitlement from Apple, and to complete the following:
Add an app extension to your project
Add an extension target to your new or existing Xcode project. Choose File > New > Target and, in
the sheet that appears, choose the Background Delivery Extension template under
Application Extension, and click Next. Then fill out your options for your new target and click Finis
In the next dialog that appears click Activate to use the extension scheme Xcode creates. If you
don’t have an Xcode project for your app, first create one from an Application template under iOS
For more information, see Creating an Xcode project for an app.
Overview
Configure the sample code project
FinanceKit / Implementing a background delivery extension
Sample Code
Implementing a background delivery
extension
Receive up-to-date financial data in your app and its extensions by adding a
background delivery extension.
Download
iOS 26.0+
iPadOS 26.0+
Xcode 26.0+


## Page 2

Add the App Groups capability
Add the App Groups capability to both your app and extension target. For more information, see
Adding capabilities to your app. Then, add both targets to the same app group. In the project
editor, select the app target, and then add a unique ID for the group under App Groups on the
Signing & Capabilities pane. Xcode automatically selects the new group ID. Select the extension
target, then go to App Groups, click Refresh, and select the same group ID. The app and extensio
are now in the same app group and can have access to the same shared data. For more informati
on configuring app groups, see Configuring app groups.
To access someone’s financial data, you must meet the criteria outlined in Get started with
FinanceKit, request the FinanceKit managed entitlement, hold an organization-level Apple
Developer account, be logged in as Account Holder, and include the NSFinancialDataUsage
Description string in your Info.plist.
Apple reviews each application using defined criteria. If your request meets the criteria, Apple add
the entitlement to your developer account by using managed capabilities. To request access, see
the FinanceKit managed entitlement request form. For more information about managed
entitlements, see Provisioning with capabilities.
FinanceKit updates
Learn more about changes to FinanceKit.
See Also
Essentials


## Page 3

Browse notable changes in FinanceKit.
Use the FinanceKit API to get access to on device financial data.
Call TransactionPicker() with FinanceKitUI to display an interface with searchable user
transactions.
Query individual account balances and transactions with AccountQuery or track them
overtime with accountHistory().
Accelerate updates
Learn about important changes to Accelerate.
Accessibility updates
Learn about important changes to Accessibility.
ActivityKit updates
Learn about important changes in ActivityKit.
Overview
June 2024
See Also
Technology updates
Updates / FinanceKit updates
Article
FinanceKit updates
Learn more about changes to FinanceKit.


## Page 4

AdAttributionKit Updates
Learn about important changes to AdAttributionKit.
App Clips updates
Learn about important changes in App Clips.
App Intents updates
Learn about important changes in App Intents.
AppKit updates
Learn about important changes to AppKit.
Apple Intelligence updates
Learn about important changes to Apple Intelligence.
AppleMapsServerAPI Updates
Learn about important changes to AppleMapsServerAPI.
Apple Pencil updates
Learn about important changes to Apple Pencil.
ARKit updates
Learn about important changes to ARKit.
Audio Toolbox updates
Learn about important changes to Audio Toolbox.
AuthenticationServices updates
Learn about important changes to AuthenticationServices.
AVFAudio updates
Learn about important changes to AVFAudio.
AVFoundation updates
Learn about important changes to AVFoundation.


