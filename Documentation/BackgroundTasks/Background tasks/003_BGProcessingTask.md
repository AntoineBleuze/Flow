# 003_BGProcessingTask.pdf

## Page 1

Choosing Background Strategies for Your App
Use processing tasks for long data updates, processing data, and app maintenance. Although
processing tasks can run for minutes, the system can interrupt the process. Add an expiration
handler by setting expirationHandler for any required cleanup.
Executing processing tasks requires setting the processing UIBackgroundModes capability.
For information on setting this capability, see BGTaskScheduler.
Processing tasks run only when the device is idle. The system terminates any background
processing tasks running when the user starts using the device. Background refresh tasks aren’t
affected.
BGTask
Mentioned in
Overview
Relationships
Inherits From
Background Tasks / BGProcessingTask
Class
BGProcessingTask
A time-consuming processing task that runs while the app is in the background.
iOS 13.0+
iPadOS 13.0+
Mac Catalyst 13.1+
tvOS 13.0+
visionOS 1.0+


## Page 2

BGHealthResearchTask
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Using background tasks to update your app
Configure your app to perform tasks in the background to make efficient use of processing
time and power.
Refreshing and Maintaining Your App Using Background Tasks
Use scheduled background tasks for refreshing your app content and for performing
maintenance.
Choosing Background Strategies for Your App
Select the best method of scheduling background runtime for your app.
class BGAppRefreshTask
An object representing a short task typically used to refresh content that’s run while the app
in the background.
class BGHealthResearchTask
A time-consuming, necessary processing task that runs while the app is in the background t
prepare data essential to a health research study.
Inherited By
Conforms To
See Also
Background tasks


