# 001_Setting up HealthKit.pdf

## Page 1

Before using HealthKit, you must perform the following steps:
1. Enable HealthKit in your app.
2. Ensure HealthKit is available on the current device.
3. Create your app’s HealthKit store.
4. Request permission to read and share data.
The following sections describe the first three steps in detail. For more information on requesting
authorization, see Authorizing access to health data. For a practical example of how to set up and
use HealthKit, see Build a workout app for Apple Watch.
Before you can use HealthKit, you must enable the HealthKit capabilities for your app. In Xcode,
select the project and add the HealthKit capability. Only select the Clinical Health Records
checkbox if your app needs to access the user’s clinical records. App Review may reject apps tha
enable the Clinical Health Records capability if the app doesn’t actually use the health record data
For more information, see Accessing Health Records.
Overview
Enable HealthKit
HealthKit / Setting up HealthKit
Setting up HealthKit
Set up and configure your HealthKit store.


## Page 2

For a detailed discussion about enabling capabilities, see Configuring HealthKit access.
When you enable the HealthKit capabilities on an iOS app, Xcode adds HealthKit to the list of
required device capabilities, which prevents users from purchasing or installing the app on device
that don’t support HealthKit.
If HealthKit isn’t required for the correct operation of your app, delete the healthkit entry from
the “Required device capabilities” array. Delete this entry from either the Target Properties list on
the app’s Info tab or from the app’s Info.plist file.
Note
The healthkit entry isn’t used by watchOS apps.
For more information on required device capabilities, see the UIRequiredDevice
Capabilities.
Call the isHealthDataAvailable() method to confirm that HealthKit is available on the user
device.
Ensure HealthKit’s availability


## Page 3

Call this method before calling any other HealthKit methods. If HealthKit isn’t available on the
device (for example, on iPadOS 16 or earlier, or macOS), other HealthKit methods fail with an
errorHealthDataUnavailable error. If HealthKit is restricted (for example, in an enterprise
environment), the methods fail with an errorHealthDataRestricted error.
If HealthKit is both enabled and available, instantiate an HKHealthStore object for your app as
shown:
You need only a single HealthKit store per app. These are long-lived objects; you create the store
once, and keep a reference for later use.
HealthKit Entitlement
A Boolean value that indicates whether the app may request user authorization to access
health and activity data that appears in the Health app.
HealthKit Capabilities Entitlement
Health data types that require additional permission.
NSHealthUpdateUsageDescription
A message to the user that explains why the app requested permission to save samples to th
HealthKit store.
NSHealthShareUsageDescription
A message that explains to people why the app requests permission to read samples from th
HealthKit store.
Create the HealthKit store
Topics
Entitlements
Information property list keys


## Page 4

NSHealthRequiredReadAuthorizationTypeIdentifiers
The clinical record data types that your app must get permission to read.
NSHealthClinicalHealthRecordsShareUsageDescription
A message to the user that explains why the app requested permission to read clinical
records.
About the HealthKit framework
Learn about the architecture and design of the HealthKit framework.
Authorizing access to health data
Request permission to read and share data in your app.
Protecting user privacy
Respect and safeguard your user’s privacy.
HealthKit updates
Learn about important changes to HealthKit.
HealthKitUI
Display user interface that enables a person to view and interact with their health data.
See Also
Essentials


