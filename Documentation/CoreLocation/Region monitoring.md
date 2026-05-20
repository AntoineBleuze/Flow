# Region monitoring.pdf

## Page 1

Condition monitoring (also known as geofencing) is a way for your app to be alerted when the use
enters or exits a geographical region. You might use region monitoring to perform location-related
tasks. For example, the Reminders app uses them to trigger reminders when the user arrives at o
leaves a specified location, as shown in Figure 1.
In iOS, the system monitors regions and wakes up your app as needed when conditions change
between satisfied and unsatisfied states. In macOS, condition monitoring works only while the ap
is running (either in the foreground or background) and the user’s system is awake. The system
doesn’t launch Mac apps to deliver region-related notifications.
Overview
Core Location / Monitoring the user’s proximity to geographic regions
Article
Monitoring the user’s proximity to
geographic regions
Use condition monitoring to determine when the user enters or leaves a
geographic region.


## Page 2

Define a circular area centered on a geographic coordinate using a CLCircularGeographic
Condition. The radius of the condition defines its boundary. You define the conditions you want
to monitor and register them with the system by calling the startMonitoring(for:) method 
your CLLocationManager object. The system monitors your conditions until you explicitly ask i
to stop or until the device reboots.
Listing 1 shows how to configure and register a condition centered around a point provided by the
caller of the method. The task uses a radius of 200 meters to define the boundaries of the
condition, then awaits as AsyncSequence events arrive asynchronously from Core Location.
Listing 1. Monitoring a region around the specified coordinate
Tip
Conditions are shared resources that rely on specific hardware capabilities. To ensure that all
apps can participate in condition monitoring, Core Location prevents any single app from
monitoring more than 20 conditions of any type simultaneously. Prioritize what you want to
monitor to based on this restriction.
If an iOS app isn’t running when a condition is satisfied, the system tries to launch it. When the ap
relaunches, recreate the monitor with the same identifier. Note that monitoring can only occur aft
the user unlocks the device after a reboot.
Define and monitor a geographic condition


## Page 3

Whenever the state of your app’s condition changes, Core Location provides an event through the
monitor’s AsyncSequence.
If an iOS app isn’t running when a condition is satisfied, the system tries to launch it. When your
app relaunches, it’s your responsibility to recreate the monitor with the same identifier. Monitoring
can only occur after the user unlocks the device after a reboot.
It’s important to keep iterating events in order to determine when conditions change.
class CLRegion
A base class representing an area that can be monitored.
Respond to events
See Also
Region monitoring


## Page 4

This is an abstract base class. Instantiate one of the provided subclasses that define specific type
of regions. After you create a region, register it with a CLLocationManager object with the
startMonitoring(for:) method. The location manager generates appropriate events
whenever the user crosses the boundaries of the region.
var identifier: String
The identifier for the region object.
var notifyOnEntry: Bool
A Boolean indicating that notifications are generated upon entry into the region.
var notifyOnExit: Bool
A Boolean indicating that notifications are generated upon exit from the region.
Overview
Topics
Getting the region identifier
Specifying the notification conditions
Core Location / CLRegion
Class
CLRegion
A base class representing an area that can be monitored.
iOS 4.0+
iPadOS 4.0+
Mac Catalyst 13.1+
macOS 10.7+
tvOS 9.0+
watchOS 2.0+


## Page 5

init(circularRegionWithCenter: CLLocationCoordinate2D, radius:
CLLocationDistance, identifier: String)
Initializes and returns a region object defining a circular area.
Deprecated
func contains(CLLocationCoordinate2D) -> Bool
Returns a Boolean value indicating whether the region contains the specified coordinate.
Deprecated
var center: CLLocationCoordinate2D
The center point of the region.
Deprecated
var radius: CLLocationDistance
The radius (measured in meters) that defines the region’s outer boundary.
Deprecated
NSObject
CLBeaconRegion, CLCircularRegion
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCoding
NSCopying
Deprecated
Relationships
Inherits From
Inherited By
Conforms To


## Page 6

NSObjectProtocol
NSSecureCoding
Monitoring the user’s proximity to geographic regions
Use condition monitoring to determine when the user enters or leaves a geographic region.
See Also
Region monitoring


