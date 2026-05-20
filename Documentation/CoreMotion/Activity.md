# Activity.pdf

## Page 1

Motion data reflects whether the user is walking, running, in a vehicle, or stationary for periods of
time. Using this class, you can ask for notifications when the current type of motion changes or yo
can gather past motion change data. For example, a navigation app might look for changes in the
current type of motion and offer different directions for each.
Important
To use this API, you must include the NSMotionUsageDescription key in your app’s Info
.plist file and provide a usage description string for this key. The usage description appears
in the prompt that the user must accept the first time the system asks the user to access
motion data for your app. If you don’t include a usage description string, your app crashes
when you call this API.
class func isActivityAvailable() -> Bool
Returns a Boolean indicating whether motion data is available on the current device.
Overview
Topics
Determining Activity Availability
Core Motion / CMMotionActivityManager
Class
CMMotionActivityManager
An object that manages access to the motion data stored by the device.
iOS 7.0+
iPadOS 7.0+
Mac Catalyst 13.1+
watchOS 2.0+


## Page 2

class func authorizationStatus() -> CMAuthorizationStatus
Returns a value indicating whether the app is authorized to retrieve stored motion data.
enum CMAuthorizationStatus
The authorization status for motion-related features.
func startActivityUpdates(to: OperationQueue, withHandler: CMMotion
ActivityHandler)
Starts the delivery of current motion data updates to your app.
func stopActivityUpdates()
Stops the delivery of motion updates to your app
typealias CMMotionActivityHandler
A block that reports the current motion associated with the device.
func queryActivityStarting(from: Date, to: Date, to: OperationQueue,
withHandler: CMMotionActivityQueryHandler)
Gathers and returns historical motion data for the specified time period
typealias CMMotionActivityQueryHandler
A block that reports the motion updates that occurred between the specified query interval.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Starting and Stopping Activity Updates
Getting Historical Activity Data
Relationships
Inherits From
Conforms To


## Page 3

Hashable
NSObjectProtocol
class CMHeadphoneActivityManager
An object that starts and manages headphone activity services.
class CMMotionActivity
The data for a single motion update event.
Getting motion-activity data from headphones
Configure your app to listen for motion-activity changes from headphones.
See Also
Activity


## Page 4

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


## Page 5

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


## Page 6

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


## Page 7

On devices that support motion, you can use a CMMotionActivityManager or CMHeadphone
ActivityManager object to request updates when the current type of motion changes. When a
change occurs, the update information is packaged into a CMMotionActivity object and sent t
your app.
The motion-related properties of this class aren’t mutually exclusive. In other words, it’s possible
for more than one of the motion-related properties to contain the value true. For example, if the
user was driving in a car and the car stopped at a red light, the update event associated with that
change in motion would have both the automotive and stationary properties set to true. It
also possible for all of the properties to be set to false when the device is in motion but the
movement doesn’t correlate to walking, running, cycling, or automotive travel.
You don’t create instances of this class yourself. The CMMotionActivityManager object
creates them and sends them to the handler block you registered. For more information about ho
to initiate the delivery of motion activity updates to your app, see CMMotionActivityManager
var stationary: Bool
Overview
Topics
Getting the Type of Motion
Core Motion / CMMotionActivity
Class
CMMotionActivity
The data for a single motion update event.
iOS 7.0+
iPadOS 7.0+
Mac Catalyst 13.1+
macOS 15.0+
watchOS 2.0+


## Page 8

A Boolean indicating whether the device is stationary.
var walking: Bool
A Boolean indicating whether the device is on a walking person.
var running: Bool
A Boolean indicating whether the device is on a running person.
var automotive: Bool
A Boolean indicating whether the device is in an automobile.
var cycling: Bool
A Boolean indicating whether the device is in a bicycle.
var unknown: Bool
A Boolean indicating whether the type of motion is unknown.
var startDate: Date
The time at which the change in motion occurred.
var confidence: CMMotionActivityConfidence
The confidence in the assessment of the motion type.
enum CMMotionActivityConfidence
The confidence that the motion data is accurate.
CMLogItem
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Getting Metadata for the Motion
Relationships
Inherits From
Conforms To


## Page 9

Hashable
NSCoding
NSCopying
NSObjectProtocol
NSSecureCoding
class CMMotionActivityManager
An object that manages access to the motion data stored by the device.
class CMHeadphoneActivityManager
An object that starts and manages headphone activity services.
Getting motion-activity data from headphones
Configure your app to listen for motion-activity changes from headphones.
See Also
Activity


## Page 10

This sample app demonstrates how to use CMHeadphoneActivityManager to request update
when the current type of motion changes. When a change occurs, the app receives update
information as a CMMotionActivity object, which it uses to show a text description of the
motion change.
Because this sample app uses headphone motion updates, it needs to run on a device, not in
Simulator. To run this sample, you’ll need the following:
An iOS device with iOS 18 or later
Headphones that support motion updates, such as AirPods Pro 2 or AirPods 4
class CMMotionActivityManager
Overview
Configure the sample code project
See Also
Activity
Core Motion / Getting motion-activity data from headphones
Sample Code
Getting motion-activity data from
headphones
Configure your app to listen for motion-activity changes from headphones.
Download
iOS 18.0+
iPadOS 18.0+
Xcode 16.1+


## Page 11

An object that manages access to the motion data stored by the device.
class CMHeadphoneActivityManager
An object that starts and manages headphone activity services.
class CMMotionActivity
The data for a single motion update event.


