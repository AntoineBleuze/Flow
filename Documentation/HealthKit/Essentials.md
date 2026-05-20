# Essentials.pdf

## Page 1

Share health and fitness data between apps using the HealthKit framework. Rather than develope
creating custom data types and units, HealthKit constrains data types and units to a predefined li
This ensures that all apps understand what the data means and how they can use it.
Additionally, the framework uses a large number of subclasses, producing deep hierarchies of
similar classes. Often, these classes have subtle but important differences between them. For
example, you use an HKQuantitySample object to store data with a numeric value and an
HKCategorySample object to store a value selected from an enumeration.
HealthKit also uses pairs of closely related classes that you need to use together. For example, th
HKObject and HKObjectType abstract classes have largely parallel hierarchies of concrete
subclasses. When working with objects and object types, you must use matching subclasses.
HealthKit saves a variety of data types in the HealthKit Store:
Characteristic data
Characteristics that typically don’t change, such as the user’s birthdate, blood type, biologic
sex, and skin type. You can read this data directly from the HealthKit store, using the dateOf
Birth(), bloodType(), biologicalSex(), and fitzpatrickSkinType() methods.
Your application can’t save characteristic data. The user must enter or modify this data using
the Health app.
Sample data
Samples that represent a measurement at a particular point in time. All sample classes are
subclasses of the HKSample class, which is a subclass of the HKObject class. For more
information, see Samples.
Workout data
Overview
HealthKit data
HealthKit / About the HealthKit framework
Article
About the HealthKit framework
Learn about the architecture and design of the HealthKit framework.


## Page 2

Samples that store information about fitness and exercise activities. While HKWorkout is a
subclass of HKSample, it behaves somewhat differently than other sample subclasses. For
more information, see Workout data.
Source data
Information about a sample’s source. The HKSourceRevision object contains information
about the app or device that saved the sample. The HKDevice object contains information
about the hardware device that generated the data.
Deleted objects
An object that represents a sample after something deletes it from the HealthKit store.
HealthKit uses an HKDeletedObject instance to temporarily store the UUID of deleted
samples. You can use deleted objects to respond when the user or another app deletes an
object. For more information, see HKAnchoredObjectQuery and HKDeletedObject.
The HKObject class is the superclass of all HealthKit sample types. All HKObject subclasses ar
immutable. Each object has the following properties:
UUID
A unique identifier for that particular entry.
Metadata
A dictionary containing additional information about the entry. The metadata can contain bot
predefined and custom keys. The predefined keys facilitate the sharing of data between apps
Custom keys help extend a given HealthKit object type, adding app-specific data to the entry
Source Revision
The source of the sample. The source can be a device that directly saves data into HealthKit 
an app. HealthKit automatically records each object’s source and version when it saves the
data to the HealthKit store. This property is available only on objects retrieved from the store
Device
The hardware device that generated the data stored in this sample.
The HKSample class is a subclass of HKObject. Sample objects represent data at a particular
point in time, and all sample objects are subclasses of the HKSample class. They have the
following properties:
Type
The sample type, such as a sleep analysis sample, a height sample, or a step count sample.
Start date
The sample’s start time.
End date
The sample’s end time. If the sample represents a single point in time, the end time should
equal the start time. If the sample represents data collected over a time interval, the end time
Properties of objects and samples


## Page 3

should occur after the start time.
Samples are further divided into four concrete subclasses:
Category samples
Data that can you can classify into a finite set of categories. See HKCategorySample.
Quantity samples
Data that you can store as numeric values. Quantity samples are the most common data type
in HealthKit. These include the user’s height and weight, as well as other data such as the
number of steps taken, the user’s temperature, and their pulse rate. See HKQuantity
Sample.
Correlations
Composite data containing one or more samples. HealthKit uses correlations to represent foo
and blood pressure. You should always use a correlation when creating food or blood pressur
data. See HKCorrelation.
Workouts
Data representing a physical activity, like running, swimming, or even play. Workouts often
have type, duration, distance, and energy burned properties. You can also associate a worko
with additional, fine-grained samples. Unlike correlations, the workout doesn’t contain these
samples; however, you can query for them using the workout. For more information, see
HKWorkout.
The HealthKit store is thread-safe, and most HealthKit objects are immutable. In general, you can
use HealthKit safely in a multithreaded environment.
Note
All the HealthKit API’s completion handlers execute on private background queues. You
typically dispatch this data back to the main queue before updating your user interface or
changing any other resources that you can only safely modify from the main thread.
For more information about multithreading and concurrent programming, see Concurrency
Programming Guide.
iPhone, Apple Watch, and visionOS each have their own HealthKit store. iPadOS 17 and later also
has its own HealthKit store. It is also available on iPadOS apps running on Vision Pro. HealthKit
automatically syncs data between these devices. To save space, old data is periodically purged
Threading
Syncing data between devices


## Page 4

from Apple Watch. Use earliestPermittedSampleDate() to determine the earliest samples
available on Apple Watch.
While the HealthKit framework is available on iPadOS 16 and earlier and on MacOS 13 and later,
these devices don’t have a copy of the HealthKit store. This means you can include HealthKit cod
in apps running on these devices, simplifying the creation of multiplatform apps. However, they
can’t read or write HealthKit data, and calls to isHealthDataAvailable() return false.
Setting up HealthKit
Set up and configure your HealthKit store.
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


## Page 5

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


## Page 6

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


## Page 7

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


## Page 8

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


## Page 9

To help protect people’s privacy, HealthKit requires fine-grained authorization. You need to reque
permission to both read and share each data type before your app attempts to use the data.
However, you don’t need to request permission for all data types at once. Instead, it might make
more sense to wait until you need to access the data before asking for permission.
As part of the privacy protections, your app doesn’t know whether someone granted or denied
permission to read data from HealthKit. If they denied permission, attempts to read data from
HealthKit return only samples that your app successfully saved to the HealthKit store. Additionally
in a Guest User session on Apple Vision Pro, the guest can view previously authorized data, but
can’t access unauthorized data or change the authorizations.
Important
In iOS 17.2 and later, the Journal app encourages people to reflect on their day-to-day
experiences, including physical accomplishments, workouts, and emotions and moods. If your
app saves data to HealthKit, high-level summaries of that data can appear as suggestions in
the Journal app, or in other apps that use the Journaling Suggestions framework.
Requesting permission to read and share data is only one part of protecting your user’s privacy. F
more information, see Protecting user privacy.
Before you can request authorization to read or save HealthKit data, you need to add the HealthK
capability to your app. You must also provide custom messages for the Health permissions sheet.
Overview
Enable HealthKit
HealthKit / Authorizing access to health data
Article
Authorizing access to health data
Request permission to read and share data in your app.


## Page 10

Xcode requires separate custom messages for reading and writing HealthKit data. Set the
NSHealthShareUsageDescription key to customize the message for reading data and the
NSHealthUpdateUsageDescription key to customize the message for writing data.
For projects created using Xcode 13 or later, set these keys in the Target Properties list on the
app’s Info tab. For projects created with Xcode 12 or earlier, set these keys in the app’s Info
.plist file. For more information, see Information Property List.
Finally, check that Health data is available on the current device by calling isHealthData
Available() before calling any other HealthKit methods. For more information, see Setting up
HealthKit.
To request permission to read or write data, start by creating the HealthKit data types that you wa
to read or write. The following example creates data types for active energy burned, distance
cycling, distance walking or running, distance in a wheelchair, and heart rate.
Next, you can request read or write access to that data. To request access from the HealthKit sto
call requestAuthorization(toShare:read:).
Request permission


## Page 11

To request access from SwiftUI, use the healthDataAccessRequest(store:shareTypes:
readTypes:trigger:completion:) modifier.
Important
The healthDataAccessRequest(store:shareTypes:readTypes:trigger:
completion:)modifier is only available if you import both SwiftUI and HealthKitUI.


## Page 12

Any time your app requests new permissions, the system displays a form with all the requested
data types shown. People can toggle individual read and share permissions on and off.
To learn how to provide a great experience when asking for permissions, see Human Interface
Guidelines > HealthKit.


## Page 13

Important
People can change the permissions for your app at any time using either the Settings or the
Health app. Your app appears in the Health app’s Sources tab, even if they didn’t allow
permission to read or share data.
If someone grants permission to share a data type, you can create new samples of that type and
save them to the HealthKit store. However, before attempting to save any data, check to see if yo
app is authorized to share that data type by calling the authorizationStatus(for:) method
If you haven’t yet requested permission, any attempts to save fail with an HKError.Code.error
AuthorizationNotDetermined error. If they’ve denied permission, attempts to save fail with
an HKError.Code.errorAuthorizationDenied error.
To protect their privacy, people can put their Vision Pro in a Guest User session before sharing it.
This session lets the owner control which apps the guest can use, and what data they can see. Fo
more information, refer to Let another person use your Apple Vision Pro with Guest User.
A Guest User session has the following affects on HealthKit:
If the owner has already authorized access to the data, the guest can read that data from the
HealthKit store.
The guest can’t authorize any additional data types.
The system obscures Health data in the Privacy and Security and Health Data panels in Setting
Any attempts to save data or otherwise mutate data in the HealthKit store fails with an HKErro
.Code.errorNotPermissibleForGuestUserMode error (or HKError.Code.error
HealthDataRestricted on apps running in iOS 17).
Important
An app’s permissions don’t change when an app runs in a Guest User session. Therefore,
authorizationStatus(for:) returns true if the owner previously granted authorization
to write the data, even though the app can’t write it during a Guest User session.
Any attempt to request authorization for HealthKit data types fails silently. The system doesn’t
display the authorization sheet during a Guest User session.
Check for authorization before saving data
Support Guest User sessions on Vision Pro


## Page 14

If your app receives an HKError.Code.errorNotPermissibleForGuestUserMode error, y
can silently ignore the error for passive or periodic saves. Silently dropping the changes ensures
that they don’t persist past the Guest User session without interrupting the guest’s experience.
However, if the guest performs an action that would obviously result in saving data (for example,
tapping a Save button), you can display an alert telling them that the action isn’t available during a
Guest User session.
If your app requires access to specific clinical record data to function properly, specify the require
clinical record types in your app’s Info.plist file using the NSHealthRequiredRead
AuthorizationTypeIdentifiers key. This key defines the data types that your app must
have permission to read. Set the value to an array of strings containing the type identifiers for you
required types. For a list of type identifiers, see HKClinicalTypeIdentifier.
To protect people’s privacy, you must specify three or more required clinical record types. If a
person denies authorization to any of the types, authorization fails with an HKError.Code.erro
RequiredAuthorizationDenied error; the system doesn’t tell your app which record types t
person denied access to.
About the HealthKit framework
Learn about the architecture and design of the HealthKit framework.
Setting up HealthKit
Set up and configure your HealthKit store.
Protecting user privacy
Respect and safeguard your user’s privacy.
HealthKit updates
Learn about important changes to HealthKit.
HealthKitUI
Display user interface that enables a person to view and interact with their health data.
Specify required clinical record types
See Also
Essentials


## Page 15

Because health data can be sensitive, HealthKit provides users with fine-grained control over the
information that apps can share. The user must explicitly grant each app permission to read and
write data to the HealthKit store. Users can grant or deny permission separately for each type of
data.
For example, a user could let your app read step count data, but prevent it from reading blood
glucose levels. To prevent possible information leaks, an app isn’t aware when the user denies
permission to read data. From the app’s point of view, no data of that type exists.
Important
Apps must include usage descriptions, or it will crash when you request authorization to
access HealthKit data. Include the NSHealthShareUsageDescription key to read, and
NSHealthUpdateUsageDescription key to write data to Healthkit. For projects created
using Xcode 13 or later, set these keys in the Target Properties list on the app’s Info tab. For
projects created with Xcode 12 or earlier, set these keys in the apps Info.plist file. For
more information, see Information Property List.
The user’s device stores all HealthKit data locally. For security, the device encrypts the HealthKit
store when the user locks the device. As a result, your app may not be able to read data from the
store when it runs in the background. However, your app can still write to the store, even when th
phone is locked. HealthKit temporarily caches the data and saves it to the encrypted store as soo
as the user unlocks the phone.
Overview
Access encrypted data
HealthKit / Protecting user privacy
Article
Protecting user privacy
Respect and safeguard your user’s privacy.


## Page 16

In addition, your app must not access the HealthKit APIs unless the use is for health or fitness
purposes and this usage is clear in both your marketing text and your user interface. Specifically,
the following guidelines apply to all HealthKit apps:
Your app may not use information gained through the use of the HealthKit framework for
advertising or similar services. Note that you may still serve advertising in an app that uses the
HealthKit framework, but you can’t use data from the HealthKit store to serve ads.
You must not disclose any information gained through HealthKit to a third party without expres
permission from the user. Even with permission, you can only share information to a third party
they also provide a health or fitness service to the user.
You can’t sell information gained through HealthKit to advertising platforms, data brokers, or
information resellers.
If the user consents, you may share their HealthKit data with a third party for medical research.
You must clearly disclose to the user how you and your app will use their HealthKit data.
You must also provide a privacy policy for any app that uses the HealthKit framework. You can fin
guidance on creating a privacy policy at the following sites:
Personal Health Record model (for non-HIPAA apps): http://www.healthit.gov/policy-
researchers-implementers/personal-health-record-phr-model-privacy-notice
HIPAA model (for HIPAA covered apps): https://www.hhs.gov/hipaa/for-
professionals/privacy/guidance/model-notices-privacy-practices/index.html
These models, developed by the Office of the National Coordinator for Health Information
Technology (ONC), are designed to improve user experience and comprehension with plain
language and approachable designs that explain how your app collects and shares user data.
These models aren’t intended to replace a web-based privacy policy, and developers should
consult ONC guidance regarding which model is appropriate for a given app. These models are
provided for your reference only, and Apple expressly disclaims all liability for your use of such
models.
Specify how your app uses the health data
Provide a privacy policy


## Page 17

Note
It’s essential that you understand Apple’s requirements for working with HealthKit and the
user’s health-related data. To learn about these requirements, see the HealthKit section in App
Store Review Guidelines and the relevant sections in the Apple Developer Program License
Agreement. The App Store Review Guidelines are also available from the App Review page.
For additional technical information about working with sensitive user data, see Preparing your
UI to run in the background.
About the HealthKit framework
Learn about the architecture and design of the HealthKit framework.
Setting up HealthKit
Set up and configure your HealthKit store.
Authorizing access to health data
Request permission to read and share data in your app.
HealthKit updates
Learn about important changes to HealthKit.
HealthKitUI
Display user interface that enables a person to view and interact with their health data.
See Also
Essentials


## Page 18

Browse notable changes in HealthKit.
Start workout sessions on iOS using HKLiveWorkoutBuilder.
Query medications that a person has added to the Health app, using HKUserAnnotated
MedicationQueryDescriptor and the times they’ve logged that medication using
HKMedicationDoseEventType.
Apple Watch Series 10 supports the Shallow Depth and Pressure capability. Use underwater
Depth and waterTemperature to read depth and temperature data from shallow dives.
Create HealthKit apps for VisionOS.
Associate perceived and estimated exertion values with workouts. Use workoutEffortScor
and estimatedWorkoutEffortScore to read and write exertion data. Use relateWorkou
EffortSample(_:with:activity:completion:) to associate exertion data with a
workout, and HKWorkoutEffortRelationshipQuery to query for associated exertion data
Overview
June 2025
September 2024
June 2024
General
Updates / HealthKit updates
Article
HealthKit updates
Learn about important changes to HealthKit.


## Page 19

Access water temperature data from swimming workouts. Any Apple Watch Ultra records wate
Temperature samples during swimming workouts.
Read and write mental well-being samples using the HKStateOfMind, HKPHQ9Assessment,
and HKGAD7Assessment data types.
Track menstrual flow and intermenstrual bleeding during pregnancy using the bleeding
DuringPregnancy and bleedingAfterPregnancy data types.
Now available in iPadOS. Health data automatically synchronizes between a person’s iPhone,
iPad, and Apple Watch.
Create custom, interval-based workouts. You can use either distance or time for the intervals,
and sync the intervals to a group, such as a workout class.
Mirror workout sessions in your iOS app. This includes the ability to control the workout session
from the iOS app, and the ability to send data between the iOS and watchOS apps during an
active workout session.
Access batches of higher-rate motion data from Apple Watch. New Core Motion APIs provide
800 Hz accelerometer data and 200 Hz device motion data. Use this data to analyze someone
motion after performing an action, like swinging a golf club.
Measure time spent outdoors and average light intensity with new data types.
Track cycling with new data types for tracking someone’s power, speed, cadence, and function
threshold power.
Accelerate updates
Learn about important changes to Accelerate.
Accessibility updates
Learn about important changes to Accessibility.
ActivityKit updates
Learn about important changes in ActivityKit.
AdAttributionKit Updates
Learn about important changes to AdAttributionKit.
June 2023
See Also
Technology updates


## Page 20

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


## Page 21

HealthKitUI defines user interface for the HealthKit framework.
class HKActivityRingView
A view that uses the Move, Exercise, and Stand activity rings to display data from a HealthKi
activity summary object.
HealthKit
Access and share health and fitness data while maintaining the user’s privacy and control.
Overview
Topics
Essentials
Framework
HealthKitUI
Display user interface that enables a person to view and interact with their health
data.
iOS 8.0+
iPadOS 8.0+
Mac Catalyst 17.0+
macOS 14.0+
tvOS 10.0+
visionOS 1.0+
watchOS 2.0+


