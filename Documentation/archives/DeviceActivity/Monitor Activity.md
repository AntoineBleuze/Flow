# Monitor Activity.pdf

## Page 1

DeviceActivityMonitor provides the entry point into a device activity monitor extension. You
should subclass DeviceActivityMonitor and designate your subclass as the principal class 
your app extension.
The following code implements DeviceActivityMonitor in an app:
Overview
DeviceActivity / DeviceActivityMonitor
Class
DeviceActivityMonitor
The object that monitors scheduled device activity.
iOS 15.0+
iPadOS 15.0+
Mac Catalyst 15.0+


## Page 2

Note
Shielding an app dims the app’s icon on the homescreen and applies an hourglass symbol.
When the app launches, the system covers it with a view that your app can configure.
init()
Creates a new monitor implemented by subclasses.
func intervalDidEnd(for: DeviceActivityName)
Indicates that the device activity interval ended.
func intervalDidStart(for: DeviceActivityName)
Indicates that the device activity interval started.
func intervalWillEndWarning(for: DeviceActivityName)
Warns your app of an ongoing activity’s conclusion a specified time before the activity ends.
func intervalWillStartWarning(for: DeviceActivityName)
Warns your app of an upcoming activity a specified time before the activity starts.
func eventDidReachThreshold(DeviceActivityEvent.Name, activity: Device
ActivityName)
Indicates that the activity reached its threshold.
func eventWillReachThresholdWarning(DeviceActivityEvent.Name, activity:
DeviceActivityName)
Warns your app that an activity is about to reach its threshold.
Topics
Configuring a Monitor
Monitoring Scheduled Intervals
Monitoring Event Thresholds
Relationships


## Page 3

NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Inherits From
Conforms To


