# 004_BGAppRefreshTask.pdf

## Page 1

Choosing Background Strategies for Your App
Use app refresh tasks for updating your app with small bits of information, such as the latest stoc
values.
Executing app refresh tasks requires setting the fetch UIBackgroundModes capability. For
information on setting this capability, see BGTaskScheduler.
BGTask
CVarArg
Mentioned in
Overview
Relationships
Inherits From
Conforms To
Background Tasks / BGAppRefreshTask
Class
BGAppRefreshTask
An object representing a short task typically used to refresh content that’s run
while the app is in the background.
iOS 13.0+
iPadOS 13.0+
Mac Catalyst 13.1+
tvOS 13.0+
visionOS 1.0+


## Page 2

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
class BGProcessingTask
A time-consuming processing task that runs while the app is in the background.
class BGHealthResearchTask
A time-consuming, necessary processing task that runs while the app is in the background t
prepare data essential to a health research study.
See Also
Background tasks


