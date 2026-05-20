# Fall detection.pdf

## Page 1

In Series 4 and later, Apple Watch can detect when a wearer falls, and contact emergency service
if necessary. Using the CMFallDetectionManager, your app can request the user’s
authorization, and set up a delegate to receive notifications about these fall detection events. For
more information, see Use fall detection with Apple Watch.
Important
To use this API, you must include the NSFallDetectionUsageDescription key in your
app’s Info.plist file and provide a usage description string for the key. The description
appears in the prompt that the user receives when the system asks to access fall detection
data for your app. If you don’t include a usage description string, your app crashes when you
call this API.
CMFallDetectionManager requires an entitlement from Apple. To apply for the entitlement, se
Fall Detection Entitlement Request. This entitlement allows the app to run in the background
without requiring any additional capabilities. However, you can add capabilities for other
background modes, as needed by your app.
There are two approaches to detecting falls in your app. You can either query for numberOfTime
Fallen samples in HealthKit, or you can use Core Motion’s CMFallDetectionManager.
Overview
Detect and Respond to Falls
Core Motion / CMFallDetectionManager
Class
CMFallDetectionManager
An object for managing fall detection events.
watchOS 7.2+


## Page 2

The Core Motion fall detection manager is particularly useful for apps that need to respond to fall
in a timely manner so that the app can provide help to the person who fell.
The fall detection manager:
Notifies the app in real time
Notifies the app of all fall events
Provides background runtime so that your app can respond to the fall
The HealthKit sample is particularly useful for apps that monitor falls over longer time periods,
because there can be a delay between the fall event and HealthKit updating its samples.
HealthKit provides:
Samples that are available on all devices that can access the person’s HealthKit data—not just
the device that detected the fall
Samples for falls where the person who fell confirmed the fall, or the system escalated the fall t
emergency services. If the person who fell dismisses the fall alert, HealthKit doesn’t record the
fall.
To receive fall detection notifications, ensure that the feature is available on the current device. If
the feature is available, create the manager and set its delegate.
Set the delegate as early as possible, ideally in your extension delegate’s applicationDid
FinishLaunching() method. The system may not instantiate your app’s user interface when
launching your app in the background, so you can’t set the delegate from your user interface cod
Detect and Monitor Falls Over Time
Create the Manager


## Page 3

such as when an interface controller activates, or in response to a change in SwiftUI’s Scene
Phase state.
Important
Create only a single instance of the detection manager. Store the manager in a variable so you
can access it later. Be sure to use a variable that remains in memory throughout your app’s
lifetime—for example, add the variable to your extension delegate.
After your user interface loads, check if you previously requested approval. If you haven’t, call
requestAuthorization(handler:) to initiate a request.
Your delegate only receives fall detection event notifications if the user authorizes your app. The
user can change your app’s authorization state at any time from Settings > Privacy > Fall Detectio
After you set the delegate and the user grants authorization, your app checks for recent fall event
If the system finds an event, it calls your delegate’s fallDetectionManager(_:didDetect:
completionHandler:) method and passes the most recent event. On subsequent launches, a
long as your app remains authorized and the system has detected a recent fall event, the system
calls fallDetectionManager(_:didDetect:completionHandler:) as soon as you set
the delegate.
The system also wakes your app in the background to respond to any new fall detection events.
The system only gives your app a short amount of time to respond to the event and call the
completion handler. If the app exceeds the allotted time, the system may suspend it.
Request User Authorization
Topics


## Page 4

class var isAvailable: Bool
A Boolean value that indicates whether the current device supports fall detection.
func requestAuthorization(handler: (CMAuthorizationStatus) -> Void)
Requests authorization to receive notifications about fall detection events.
var authorizationStatus: CMAuthorizationStatus
The authorization status for receiving fall detection event notifications.
enum CMAuthorizationStatus
The authorization status for motion-related features.
var delegate: (any CMFallDetectionDelegate)?
A delegate that can receive notifications about fall detection events.
protocol CMFallDetectionDelegate
A delegate that receives information about fall detection events and authorization status
changes.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Checking Availability
Requesting Authorization
Handling Events
Relationships
Inherits From
Conforms To


## Page 5

Hashable
NSObjectProtocol
protocol CMFallDetectionDelegate
A delegate that receives information about fall detection events and authorization status
changes.
class CMFallDetectionEvent
An object that contains data about a fall detection event.
NSFallDetectionUsageDescription
A message to the user that explains the app’s request for permission to access fall detection
event data.
See Also
Fall detection


## Page 6

func fallDetectionManager(CMFallDetectionManager, didDetect: CMFall
DetectionEvent, completionHandler: () -> Void)
Indicates a fall detection event occurred.
func fallDetectionManagerDidChangeAuthorization(CMFallDetectionManager)
Indicates the fall detection authorization status changed.
NSObjectProtocol
Topics
Detecting Falls
Detecting Authorization Changes
Relationships
Inherits From
Core Motion / CMFallDetectionDelegate
Protocol
CMFallDetectionDelegate
A delegate that receives information about fall detection events and authorization
status changes.
watchOS 7.2+


## Page 7

class CMFallDetectionManager
An object for managing fall detection events.
class CMFallDetectionEvent
An object that contains data about a fall detection event.
NSFallDetectionUsageDescription
A message to the user that explains the app’s request for permission to access fall detection
event data.
See Also
Fall detection


## Page 8

var resolution: CMFallDetectionEvent.UserResolution
The event’s resolution.
enum UserResolution
User resolutions for fall detection events.
var date: Date
The event’s time and date.
NSObject
Topics
Accessing Fall Data
Getting the event date
Relationships
Inherits From
Core Motion / CMFallDetectionEvent
Class
CMFallDetectionEvent
An object that contains data about a fall detection event.
watchOS 7.2+


## Page 9

CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
class CMFallDetectionManager
An object for managing fall detection events.
protocol CMFallDetectionDelegate
A delegate that receives information about fall detection events and authorization status
changes.
NSFallDetectionUsageDescription
A message to the user that explains the app’s request for permission to access fall detection
event data.
Conforms To
See Also
Fall detection


## Page 10

Name
Fall Detection Usage Description
Type
String
Important
If your app uses the CMFallDetectionManager, the app requires this key.
NSMotionUsageDescription
A message that tells people why the app is requesting access to the device’s motion data.
Details
Discussion
See Also
Motion
Bundle Resources / Information Property List / NSFallDetectionUsageDescription
Property List Key
NSFallDetectionUsageDescription
A message to the user that explains the app’s request for permission to access fa
detection event data.
iOS 14.2+
iPadOS 14.2+
visionOS 1.0+
watchOS 7.2+


## Page 11

Name: Privacy - Motion Usage Description


