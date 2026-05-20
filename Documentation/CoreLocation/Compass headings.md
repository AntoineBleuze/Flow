# Compass headings.pdf

## Page 1

Heading and course information are commonly used by navigation apps to help guide the user to 
destination. The heading of a user’s device is its current orientation relative to magnetic or true
north. Devices with GPS can report course information, which represents the direction in which th
device is moving. The Compass app in iOS uses heading information to implement a magnetic
compass interface, as shown in Figure 1. Augmented reality apps might use this information to
determine which direction the user is facing.
Overview
Core Location / Getting heading and course information
Article
Getting heading and course information
Use a device’s orientation and course information for navigation.


## Page 2

You use heading information to determine the current orientation of the user’s device. For examp
an augmented reality app might use the current heading to help determine what information to
show on the user’s screen. Headings are usually reported relative to the top of the device, but you
can configure how values are reported using the headingOrientation property of your
CLLocationManager object.
After determining whether heading information is available, call the startUpdatingHeading()
method of your CLLocationManager object to begin the delivery of heading updates. The
location manager delivers updates to the locationManager(_:didUpdateHeading:) metho
of its delegate whenever the heading information changes.
Note
Heading information is available only on devices with a built-in magnetometer; it’s not available
in iOS Simulator. The magnetometer determines a device’s orientation relative to magnetic
north. When location data is available, Core Location also reports the device’s orientation
relative to true north.
Get the current heading


## Page 3

Course information reflects the speed and direction in which a device is moving and is available
only on devices with GPS hardware. Don’t confuse course information with heading information.
Course direction reflects the direction in which the device is moving and is independent of the
device’s physical orientation. The most common use of course information is in navigation apps.
Course information is included automatically in CLLocation objects delivered to your app as par
of its location updates. When enough location data has been gathered to compute a course, the
location manager fills in the speed and course properties of the location object with the
appropriate values.
class CLHeading
The orientation of the user’s device, relative to true or magnetic north.
Get course information
See Also
Compass headings


## Page 4

A CLHeading object contains computed values for the device’s azimuth (orientation) relative to
true or magnetic north. It also includes the raw data for the three-dimensional vector used to
compute those values. A navigation app might use the information to rotate a map so that it reflec
the direction that the user is facing.
Typically, you don’t create instances of this class yourself, nor do you subclass it. Instead, you
receive instances of this class through the delegate assigned to the CLLocationManager objec
whose startUpdatingHeading() method you called.
Note
If you want heading objects to contain valid data for the trueHeading property, configure
your location manager object to deliver location updates. You can start the delivery of these
updates by calling the location manager object’s startUpdatingLocation() method.
Overview
Topics
Getting the heading values
Core Location / CLHeading
Class
CLHeading
The orientation of the user’s device, relative to true or magnetic north.
iOS 3.0+
iPadOS 3.0+
Mac Catalyst 13.1+
macOS 10.7+
watchOS 2.0+


## Page 5

var magneticHeading: CLLocationDirection
The heading (measured in degrees) relative to magnetic north.
var trueHeading: CLLocationDirection
The heading (measured in degrees) relative to true north.
var headingAccuracy: CLLocationDirection
The maximum deviation (measured in degrees) between the reported heading and the true
geomagnetic heading.
var x: CLHeadingComponentValue
The geomagnetic data (measured in microteslas) for the x-axis.
var y: CLHeadingComponentValue
The geomagnetic data (measured in microteslas) for the y-axis.
var z: CLHeadingComponentValue
The geomagnetic data (measured in microteslas) for the z-axis.
typealias CLHeadingComponentValue
A type used to report magnetic differences reported by the onboard hardware.
var timestamp: Date
The time at which this heading was determined.
NSObject
CVarArg
CustomDebugStringConvertible
Getting the raw heading data
Getting the event timestamp
Relationships
Inherits From
Conforms To


## Page 6

CustomStringConvertible
Equatable
Hashable
NSCoding
NSCopying
NSObjectProtocol
NSSecureCoding
Getting heading and course information
Use a device’s orientation and course information for navigation.
See Also
Compass headings


