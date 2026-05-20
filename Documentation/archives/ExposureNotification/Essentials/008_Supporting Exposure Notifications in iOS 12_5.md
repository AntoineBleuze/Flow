# 008_Supporting Exposure Notifications in iOS 12_5.pdf

## Page 1

To increase adoption and broaden usage, the Exposure Notification framework now supports
iPhones compatible with iOS 12.5. Because Exposure Notifications was originally released in iOS
13.5, special considerations apply when developing for iOS 12.5. However, all privacy protections
put in place with the original release also apply in iOS 12.5.
Depending on your circumstances, you have a couple of options for adopting Exposure
Notifications.
If you havenʼt already developed an Exposure Notifications app, or if you have an existing app tha
uses features in later versions of iOS that arenʼt available in iOS 12.5, consider using Exposure
Notifications Express, which provides an app-less experience. For more information, see
Supporting Exposure Notifications Express.
If you have an app that uses version 1 risk scoring and want to support iOS 12.5, consider updatin
to the more robust version 2 scoring. For more information, see ENExposureConfiguration.
Exposure Notifications for iOS 12.5 requires Xcode 12.3 or later. In your Xcode project’s Build
Settings tab, set the iOS deployment target. From the menu, select Other and type “12.5.”
Overview
Determine the Level of Support You Need
Set the Deployment Target and Link the Framework
Exposure Notification / Supporting Exposure Notifications in iOS 12.5
Article
Supporting Exposure Notifications in iOS
12.5
Prepare your Exposure Notifications app to run on a previous version of iOS.


## Page 2

Select the Exposure Notification framework explicitly in the Link Binary With Libraries section und
Build Phases. Set the status of the framework to Optional.
Extend your app to handle different versions of iOS and Exposure Notifications by incorporating t
following code. Call getSupportedExposureNotificationsVersion() to determine if
Exposure Notifications is available on the device, and if so, which API version to support.
Perform API and iOS Version Checks
Objective-C
Swift


## Page 3

Although iOS 13.0 to 13.4 doesn’t support Exposure Notifications, your app might still download
onto devices with those versions of iOS. If that happens, present a dialog to let the user know
Exposure Notifications isn’t available for their device.
Apps that support Exposure Notifications periodically need time in the background to download
and evaluate temporary exposure keys. Because BGTaskScheduler isn’t available in iOS 12.5,
Bluetooth explicitly grants apps with the Exposure Notifications entitlement 3.5 minutes at least
once a day.
Add the following code to your app to prepare it to receive background processing time at the
defined interval.
Set Background Task Interval and Request Runtime
Objective-C
Swift


## Page 4

Background scheduling starts when the user authorizes and enables Exposure Notifications for th
app. Upon user authorization, the first iteration of the background launch happens after the defin
interval, and after every subsequent interval. If the app loses authorization, scheduling stops
immediately.
Add the following code to your app to extend the setLaunchActivityHandler to download
and detect exposures.
Supporting Exposure Notifications Express
Configure servers to notify users of potential exposures to COVID-19 without an app.
Building an App to Notify Users of COVID-19 Exposure
Inform people when they may have been exposed to COVID-19.
Setting Up a Key Server
Ensure that your server meets the requirements for supporting Exposure Notifications.
class ENManager
Objective-C
See Also
Essentials
Swift


## Page 5

A class that manages exposure notifications.
ENDeveloperRegion
A string that specifies the region that the app supports.
ENAPIVersion
A number that specifies the version of the API to use.
Changing Configuration Values Using the Server‑to‑Server API
Update Exposure Notifications configuration values from a Public Health Authority’s server.
Testing Exposure Notifications Apps in iOS 13.7 and Later
Perform end-to-end validation of Exposure Notifications apps on a device by manually loadin
configuration files.


