# 001_Refreshing and Maintaining Your App Using Background Tasks.pdf

## Page 1

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


## Page 2

class BGProcessingTask
A time-consuming processing task that runs while the app is in the background.
class BGAppRefreshTask
An object representing a short task typically used to refresh content that’s run while the app
in the background.
class BGHealthResearchTask
A time-consuming, necessary processing task that runs while the app is in the background t
prepare data essential to a health research study.


