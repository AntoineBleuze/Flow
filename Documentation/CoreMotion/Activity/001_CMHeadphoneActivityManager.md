# 001_CMHeadphoneActivityManager.pdf

## Page 1

This class delivers headphone activity updates to your app. Use an instance of the manager to
determine if the device supports headphone activity updates, and to start and stop updates. Befo
using this class, check isActivityAvailable and isStatusAvailable to make sure the
features are available.
This class provides similar information to CMMotionActivityManager, except the activity
information comes from headphone motion, rather than from device motion.
Important
In iOS and macOS, include the NSMotionUsageDescription key in your app’s Info
.plist file. If this key is absent, trying to start headphone activity updates terminates your
app.
var isActivityAvailable: Bool
Overview
Topics
Checking Availability
Core Motion / CMHeadphoneActivityManager
Class
CMHeadphoneActivityManager
An object that starts and manages headphone activity services.
iOS 18.0+
iPadOS 18.0+
Mac Catalyst 18.0+
macOS 15.0+
watchOS 11.0+


## Page 2

A Boolean value that indicates whether the current device supports headphone activity.
var isActivityActive: Bool
A Boolean value that indicates whether headphone motion activity is active.
var isStatusAvailable: Bool
A Boolean value that indicates whether the current device supports headphone status.
var isStatusActive: Bool
A Boolean value that indicates whether headphone status is active.
class func authorizationStatus() -> CMAuthorizationStatus
Returns the authorization status for monitoring headphone activity.
func startActivityUpdates(to: OperationQueue, withHandler: CMHeadphone
ActivityManager.ActivityHandler)
Starts headphone activity updates, providing data to the given handler through the given
queue.
func stopActivityUpdates()
Stops headphone activity updates.
func startStatusUpdates(to: OperationQueue, withHandler: CMHeadphone
ActivityManager.StatusHandler)
Starts headphone status updates, providing data to the given handler through the given
queue.
func stopStatusUpdates()
Stops headphone status updates.
enum Status
Headphone connection status updates.
typealias ActivityHandler
The type for a handler to be invoked when headphone motion activity data is available.
typealias StatusHandler
Starting and Stopping Updates
Supporting Types


## Page 3

The type for a handler to be invoked with status updates.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
class CMMotionActivityManager
An object that manages access to the motion data stored by the device.
class CMMotionActivity
The data for a single motion update event.
Getting motion-activity data from headphones
Configure your app to listen for motion-activity changes from headphones.
Relationships
Inherits From
Conforms To
See Also
Activity


