# Background tasks.pdf

## Page 1

A task is a standalone activity that an app performs, often on a recurring basis. Examples of tasks
include performing maintenance on a database, refining a machine learning model, or updating
displayed data. You can configure your app to launch and run tasks in the background to take
advantage of processing time when the device isn’t used.
To schedule a task to run in the background, enable the background modes in Xcode, identify the
specific tasks that you need, and then register the tasks with the BGTaskScheduler object.
To configure your app to allow background tasks, enable the background capabilities that you
need, and then create a list of unique identifiers for each task.
There are two types of background tasks: BGAppRefreshTask and BGProcessingTask. BGAp
RefreshTask is for short-duration tasks that expect quick results, such as downloading a stock
quote. BGProcessingTask is for tasks that might be time-consuming, such as downloading a
large file or synchronizing data. Your app can use one or both of these.
To add the capabilities:
1. Open the project editor and select the desired target.
2. Click Signing & Capabilities.
3. Expand the Background Modes section. If the target doesn’t have a Background Modes section
click + Capability, and then select Background Modes.
Overview
Enable and schedule background tasks
UIKit
/ Preparing your UI to run in the background / Using background tasks to update your app
Article
Using background tasks to update your
app
Configure your app to perform tasks in the background to make efficient use of
processing time and power.
/


## Page 2

4. If you’re using BGAppRefreshTask, select “Background fetch.”
5. If you’re using BGProcessingTask, select “Background processing.”
You control which tasks run in the background by registering a list of permitted task identifiers. To
create this list, add the identifiers to the Info.plist file.
1. Open the project navigator and select your target.
2. Click Info and expand Custom iOS Target Properties.
3. Add a new item to the list and choose “Permitted background task scheduler identifiers,” which
corresponds to the BGTaskSchedulerPermittedIdentifiers array.
4. Add the string for each authorized task identifier as a separate item in the array.
In iOS 13 and later, adding a BGTaskSchedulerPermittedIdentifiers key to the Info
.plist disables the application(_:performFetchWithCompletionHandler:) and set
MinimumBackgroundFetchInterval(_:) methods.


## Page 3

For each task, provide the BGTaskScheduler object with a launch handler — a small block of
code that runs the task — and a unique identifier. Register all of the tasks before the end of the ap
launch sequence. For more information, see About the app launch sequence.
Note
An extension can schedule a task, but your main app must register the task. The system
launches the app to run the task.
The following code registers a handler, handleAppRefresh(task:), that’s called when the
system runs a task request with the identifier com.example.apple-samplecode.ColorFeed
.refresh.
To submit a task request for the system to launch your app in the background at a later time, use
submit(_:). When you resubmit a task, the new submission replaces the previous submission.
The code below schedules a refresh task request for the task identifier com.example.apple-
samplecode.ColorFeed.refresh that you previously registered.
Register, schedule, and run tasks


## Page 4

When the system opens your app in the background, it calls the launch handler to run the task.
Your task provides an expiration handler that the system calls if it needs to terminate your task. Yo
also add code to inform the system if the task completes successfully.
Extending your app’s background execution time
Ensure that critical tasks finish when your app moves to the background.
About the background execution sequence
Learn the order in which your custom code is executed when your app moves to the
background.
See Also
Background execution


## Page 5

Note
This sample code project is associated with WWDC 2019 session 707: Advances in App
Background Execution.
This sample code project must be run on a physical device.
Using background tasks to update your app
Configure your app to perform tasks in the background to make efficient use of processing
time and power.
Choosing Background Strategies for Your App
Select the best method of scheduling background runtime for your app.
Overview
See Also
Background tasks
Background Tasks / Refreshing and Maintaining Your App Using Background Tasks
Sample Code
Refreshing and Maintaining Your App
Using Background Tasks
Use scheduled background tasks for refreshing your app content and for
performing maintenance.
Download
iOS 13.0+
iPadOS 13.0+
Mac Catalyst 13.0+
Xcode 14.3+


## Page 6

class BGProcessingTask
A time-consuming processing task that runs while the app is in the background.
class BGAppRefreshTask
An object representing a short task typically used to refresh content that’s run while the app
in the background.
class BGHealthResearchTask
A time-consuming, necessary processing task that runs while the app is in the background t
prepare data essential to a health research study.


## Page 7

If your app needs computing resources to complete tasks when it’s not running in the foreground
you can select from many strategies to obtain background runtime. Selecting the right strategies
for your app depends on how it functions in the background.
Some apps perform work for a short time while in the foreground and must continue uninterrupte
if they go to the background. Other apps defer that work to perform in the background at a later
time or even at night while the device charges. Some apps need background processing time at
varied and unpredictable times, such as when an external event or message arrives.
Apps involved in health research studies can obtain background runtime to process data essentia
for the study. Apps can also request to launch in the background for studies in which the user
participates.
Select one or more methods for your app based on how you schedule activity in the background.
The system may place apps in the background at any time. If your app performs critical work that
must continue while it runs in the background, use beginBackgroundTask(withName:
expirationHandler:) to alert the system. Consider this approach if your app needs to finish
sending a message or complete saving a file.
The system grants your app a limited amount of time to perform its work once it enters the
background. Don’t exceed this time, and use the expiration handler to cover the case where the
time has depleted to cancel or defer the work.
Once your work completes, call endBackgroundTask(_:) before the time limit expires so that
your app suspends properly. The system terminates your app if you fail to call this method.
Overview
Continue Foreground Work in the Background
Background Tasks / Choosing Background Strategies for Your App
Article
Choosing Background Strategies for Your
App
Select the best method of scheduling background runtime for your app.


## Page 8

If the task is one that takes some time, such as downloading or uploading files, use URLSession
(Swift) or URLSession (Objective-C) . See Downloading files in the background for more
information.
To preserve battery life and performance, you can schedule backgrounds tasks for periods of low
activity, such as overnight when the device charges. Use this approach when your app manages
heavy workloads, such as training machine learning models or performing database maintenance
Schedule these types of background tasks using BGProcessingTask, and the system decides
the best time to launch your background task.
Apps involved in health research studies can have time-consuming tasks essential for the study
and might need to complete processing the background. Schedule these types of background
tasks using BGHealthResearchTask.
Your app may require short bursts of background time to perform content refresh or other work; f
example, your app may fetch content from the server periodically, or regularly update its internal
state. In this situation, use BGAppRefreshTask by requesting BGAppRefreshTaskRequest.
Your app can use BGHealthResearchTaskRequest to launch in the background and process
data for a health research study in which the user participates.
The system decides the best time to launch your background task, and provides your app up to 3
seconds of background runtime. Complete your work within this time period and call setTask
Completed(success:), or the system terminates your app. See Background Tasks for more
information.
Background pushes silently wake your app in the background. They don’t display an alert, play a
sound, or badge your app’s icon. If your app obtains content from a server infrequently or at
irregular intervals, use background pushes to notify your app when new content becomes availab
A messaging app with a muted conversation might use a background push solution, and so might
an email app that processes incoming mail without alerting the user.
When sending a background push, set content-available: to 1 without alert, sound, or
badge. The system decides when to launch the app to download the content. To ensure your app
launches, set apns-priority to 5, and apns-push-type to background.
Once the system delivers the remote notification with application(_:didReceiveRemote
Notification:fetchCompletionHandler:), your app has up to 30 seconds to complete it
Defer Intensive Work
Update Your App’s Content
Wake Your App with a Background Push


## Page 9

work. After your app performs the work, call the passed completion handler as soon as possible t
conserve power. If you send background pushes more frequently than three times per hour, the
system imposes rate limitations. See Pushing background updates to your App for more
information.
If your app needs to perform a task in the background and show a notification to the user, use a
Notification Service Extension. For example, an email app might need to notify a user after
downloading a new email. Subclass UNNotificationServiceExtension and bundle the
system extension with your app. Upon receiving a push notification, your service extension wakes
up and obtains background runtime through didReceive(_:withContentHandler:).
When your extension completes its work, it must call the content handler with the content you wa
to deliver to the user. Your extension has a limited amount of time to modify the content and
execute the contentHandler block.
Using background tasks to update your app
Configure your app to perform tasks in the background to make efficient use of processing
time and power.
Refreshing and Maintaining Your App Using Background Tasks
Use scheduled background tasks for refreshing your app content and for performing
maintenance.
class BGProcessingTask
A time-consuming processing task that runs while the app is in the background.
class BGAppRefreshTask
An object representing a short task typically used to refresh content that’s run while the app
in the background.
class BGHealthResearchTask
A time-consuming, necessary processing task that runs while the app is in the background t
prepare data essential to a health research study.
Request Background Time and Notify the User
See Also
Background tasks


## Page 10



## Page 11

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


## Page 12

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


## Page 13

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


## Page 14

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


## Page 15

Choosing Background Strategies for Your App
BGProcessingTask
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Mentioned in
Relationships
Inherits From
Conforms To
Background Tasks / BGHealthResearchTask
Class
BGHealthResearchTask
A time-consuming, necessary processing task that runs while the app is in the
background to prepare data essential to a health research study.
iOS 17.0+
iPadOS 17.0+
Mac Catalyst 17.0+
tvOS
visionOS 1.0+


## Page 16

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
class BGAppRefreshTask
An object representing a short task typically used to refresh content that’s run while the app
in the background.
See Also
Background tasks


