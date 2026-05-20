# 002_CMMotionActivity.pdf

## Page 1

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


## Page 2

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


## Page 3

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


