# iBeacon.pdf

## Page 1

Beacons make location-based products and services available to users by broadcasting
information to your device. Ranging is the process of reading the characteristics of a beacon
region, such as signal strength, advertising interval, and measured power.
This sample code project configures a device to act as a beacon, and configures a device to use
ranging to find surrounding beacons. Use two iOS devices to run the sample, with one acting as a
beacon, and the other ranging for the beacon.
Note
This project is associated with WWDC 2019 session 705: What’s New in Location.
Run the sample app on the first iOS device. Select the option to Configure a Beacon. The project
hardcodes a default value for the UUID that can be changed in ConfigureBeaconView
Controller.swift.
Optionally modify the major and minor value for the beacon, then select the Enabled switch on th
configuration screen to start advertising.
Overview
Configure a Device to Act as a Beacon
Core Location / Ranging for Beacons
Sample Code
Ranging for Beacons
Configure a device to act as a beacon and to detect surrounding beacons.
Download
iOS 13.0+
iPadOS 13.0+
Xcode 11.2+


## Page 2

ConfigureBeaconViewController.swift contains a view controller object that configures
the iOS device running this app to act as a beacon. The configureBeaconRegion() method
sets up the region and starts advertising itself.
Using a second iOS device, run the sample app and tap Range for Beacons to scan for beacons.
Add a UUID to range for by tapping the Add button in the upper corner of the screen. The
hardcoded UUID appears by default.
RangeBeaconViewController.swift contains a view controller object that ranges a set of
beacon regions that the user adds. As in any location-based service, first request authorization.
Use a CLLocationManager instance to request that authorization, set up the constraint based 
the hardcoded UUID, then tell the instance to start monitoring.
Configure a Device to Range for Beacons


## Page 3

When the device enters the specified region, the locationManager(_ manager:
CLLocationManager, didDetermineState state: CLRegionState, for region:
CLRegion) delegate method receives the region state and starts ranging beacons.
While one or more beacons are in range, the locationManager(_ manager: CLLocation
Manager, didRange beacons: [CLBeacon], satisfying beaconConstraint:
CLBeaconIdentityConstraint) delegate method receives their characteristics in the passe
array.
Determining the proximity to an iBeacon device
Detect beacons and determine the relative distance to them.
Turning an iOS device into an iBeacon device
Broadcast iBeacon signals from an iOS device.
class CLBeacon
Information about an observed iBeacon device and its relative distance to a person’s device.
protocol CLCondition
The abstract base class for all other monitor conditions.
See Also
iBeacon


## Page 4

An iBeacon is a device that emits a Bluetooth signal that can be detected by your devices.
Companies can deploy iBeacon devices in environments where proximity detection is a benefit to
users, and apps can use the proximity of beacons to determine an appropriate course of action.
You decide what actions to take based on the proximity of nearby beacons. For example, a
department store might deploy beacons identifying each section of the store, and the
corresponding app might point out sale items when the user is near each section.
Adding iBeacon support to your app involves detecting beacons in two different stages:
1. Use region monitoring to detect the presence of an iBeacon.
2. Use beacon ranging to determine the proximity to a detected iBeacon.
Using a two-step process for detecting beacons significantly reduces power consumption. Rangi
requires taking frequent measurements of the strength of Bluetooth signals and computing the
distance to the associated beacons. By contrast, region monitoring involves only passive listening
for nearby beacons, which consumes far less power.
When deploying your iBeacon hardware, you must program each iBeacon with an appropriate
proximity UUID, major value, and minor value. These values identify each of your beacons uniquel
and make it possible for your app to differentiate between those beacons later.
The uuid (universally unique identifier) is a 128-bit value that uniquely identifies your app’s
beacons.
Overview
Deploy your iBeacon hardware
Core Location / Determining the proximity to an iBeacon device
Article
Determining the proximity to an iBeacon
device
Detect beacons and determine the relative distance to them.


## Page 5

The major value is a 16-bit unsigned integer that you use to differentiate groups of beacons
with the same UUID.
The minor value is a 16-bit unsigned integer that you use to differentiate groups of beacons
with the same UUID and major value.
Only the UUID is required, but it is recommended that you program all three values into your
iBeacon hardware. In your app, you can look for related groups of beacons by specifying only a
subset of values.
Use region monitoring to alert your app when an iBeacon is nearby. To monitor for beacons, creat
a CLBeaconRegion object and register it with the startMonitoring(for:) method of your
CLLocationManager object. The beacon region contains the proximity UUID, major value, and
minor value of the beacons that you want to detect. Only beacons with matching values trigger a
call to your delegate object.
Listing 1 shows an example of how to set up region monitoring for a company’s beacons. Because
you typically define a UUID for your company once and do not change it later, the example include
a hard-coded version of that value. Prior to calling this method, you must have created a
CLLocationManager object and assigned a delegate to it.
Listing 1. Setting up region monitoring for beacons
When a matching iBeacon is detected, the CLLocationManager object notifies its delegate by
calling the locationManager(_:didEnterRegion:) method. Similarly, when a detected
beacon moves out of range, the location manager calls the locationManager(_:didExit
Region:) method. Use your delegate methods to start and stop beacon ranging.
Detect the presence of beacons using region monitoring


## Page 6

If your app is not running when a beacon is detected, the system tries to launch your app.
Important
Apps must have authorization to use region monitoring, and they must be configured with the
Location updates background mode to be launched. For more information, see Requesting
authorization to use location services.
After detecting an iBeacon, use ranging to determine the relative distance between the beacon an
the user’s device. Ranging reports when the two devices are far apart, near to each other, or in th
immediate vicinity of each other; it does not offer a precise distance, nor should you rely on the
strength of a beacon’s signal to compute that information yourself. Use the relative values to
determine an appropriate course of action. For example, an app for an art museum might wait unt
the user is in the immediate vicinity of an iBeacon before offering information about the
corresponding artwork.
The most logical place to start ranging is in your location manager delegate’s location
Manager(_:didEnterRegion:) method when a beacon is first detected. (The place to stop
ranging is in your delegate’s locationManager(_:didExitRegion:) method.) To begin
ranging, pass the same CLBeaconRegion object you used for region monitoring to your location
manager’s startRangingBeacons(in:) method.
Determine the proximity to beacons using ranging


## Page 7

Listing 2 shows an implementation of this delegate method that turns on ranging for a detected
beacon. The method also adds the beacon to an internal array so that the app can stop and resta
ranging at any time. For example, you might stop ranging when your app is in the background to
save power.
Listing 2. Ranging for beacons
When ranging is active, the location manager object calls the locationManager(_:didRange
Beacons:in:) method of its delegate whenever there is a change to report. Use this method to
take action based on the proximity of nearby beacons. Listing 3 shows how a museum app might
use the proximity value to display information about the closest exhibit. In this example, the
museum uses the major and minor values to identify each exhibit.
Listing 3. Acting on the nearest beacon


## Page 8

Tip
When deploying beacons, consider giving each one a unique combination of UUID, major, and
minor values so that you can distinguish among them. If multiple beacons use the same UUID,
major, and minor values, the array of beacons delivered to the locationManager(_:did
RangeBeacons:in:) method might be differentiated only by their proximity and accuracy
values.
Ranging for Beacons
Configure a device to act as a beacon and to detect surrounding beacons.
Turning an iOS device into an iBeacon device
Broadcast iBeacon signals from an iOS device.
class CLBeacon
Information about an observed iBeacon device and its relative distance to a person’s device.
protocol CLCondition
The abstract base class for all other monitor conditions.
See Also
iBeacon


## Page 9

Any iOS device that supports sharing data using Bluetooth low energy can be turned into an
iBeacon. Apps that use their underlying iOS device as an iBeacon must run in the foreground. As a
result, use this feature for point-of-sale apps or for apps that are meant to run in the foreground
anyway. For other types of iBeacon implementations, use dedicated beacon hardware from third-
party manufacturers. To use an iOS device as an iBeacon, you do the following:
1. Obtain or generate a 128-bit UUID for your device.
2. Create a CLBeaconRegion object containing the UUID value along with appropriate major and
minor values for your beacon.
3. Advertise the beacon information using the Core Bluetooth framework.
The primary way to identify an iBeacon is from its UUID. When deploying one or more beacons, yo
assign a UUID to each one that conveys the beacon’s purpose to clients. The exact purpose of a
beacon is something you define. For example, a department store chain might use the same UUID
for all of its deployed beacons, or each store might be assigned a different UUID. Because
detection involves using region monitoring to look for beacons with specific UUIDs, using fewer
UUIDs is easier to manage.
To create a new UUID for your iBeacon deployment, use the uuidgen command-line tool. Open
Terminal and type uuidgen on the command line and press Return. This tool generates a unique
128-bit value and formats it as an ASCII string that is punctuated by hyphens, as shown in Listing 
Listing 1. Generating a UUID from the command line
Overview
Get a UUID for your device
Core Location / Turning an iOS device into an iBeacon device
Article
Turning an iOS device into an iBeacon
device
Broadcast iBeacon signals from an iOS device.


## Page 10

Use a CLBeaconRegion object to configure your beacon’s identity. You use the beacon region to
generate a dictionary of information that you can advertise later over Bluetooth. Listing 2 shows
how to create a beacon region object and fill it with information.
Listing 2. Configuring your beacon’s identity
The UUID, major, and minor values are specific to your iBeacon implementation. You decide the
meaning of these values and decide how apps that detect your beacons interpret those values.
To broadcast your beacon’s identity from an iOS device, use the Core Bluetooth framework to
configure the iOS device as a Bluetooth peripheral. When configured as a peripheral, your iOS
device broadcasts its beacon information out to other devices using the Bluetooth hardware. Othe
devices use that information to perform ranging and detect their proximity to your iOS device.
Add the Core Bluetooth framework to your Xcode project. In your code, create a CBPeripheral
Manager object and call its startAdvertising(_:) method to begin broadcasting your
beacon data. The startAdvertising(_:) method takes a dictionary parameter that contains
your beacon information. Call the peripheralData(withMeasuredPower:) method of the
CLBeaconRegion that you created previously to get a dictionary containing the data associated
with your beacon.
Listing 3. Advertising your device over Bluetooth
Configure the beacon region
Advertise your beacon over bluetooth


## Page 11

When calling the peripheralData(withMeasuredPower:) method to obtain your data
dictionary, you typically pass nil to specify the default received signal strength indicator (RSSI)
value associated with the iOS device. This parameter represents the signal strength (in decibels)
measured from one meter away from the device. You can specify custom values if you need to
calibrate the device for better ranging performance in certain environments.
When you create a peripheral manager object, it calls the peripheralManagerDidUpdate
State(_:) method of its delegate object. You must implement this delegate method to ensure
that Bluetooth low energy is supported and available to use on the iOS device.
Important
After advertising your app as a beacon, your app must continue running in the foreground to
broadcast the needed Bluetooth signals. If the user quits the app, the system stops advertising
the device as a peripheral over Bluetooth.
During ranging, there may be a brief period in which Core Location creates two CLBeacon object
for the same iOS device. This behavior occurs because iOS changes the device’s Bluetooth
identifier periodically to protect the user’s privacy, and one beacon represents the old identifier a
one beacon represents the new identifier. Within 2 seconds of the identifier change, the beacon
with the old identifier has its proximity property set to CLProximity.unknown. Within 10
seconds, the beacon with the old identifier is no longer reported.
Ranging for Beacons
Configure a device to act as a beacon and to detect surrounding beacons.
Determining the proximity to an iBeacon device
Detect beacons and determine the relative distance to them.
class CLBeacon
See Also
iBeacon


## Page 12

Information about an observed iBeacon device and its relative distance to a person’s device.
protocol CLCondition
The abstract base class for all other monitor conditions.


## Page 13

Turning an iOS device into an iBeacon device
The CLBeacon class represents a beacon that was observed during beacon ranging. You do not
create instances of this class directly. The location manager (CLLocationManager) object
reports observed beacons to its associated delegate object.
The identity of a beacon is defined by its uuid, major, and minor properties. These values are
coded into the beacon itself. For a more thorough description of the meaning of those values, see
CLBeaconRegion.
var uuid: UUID
The UUID that the observed beacon transmitted.
Mentioned in
Overview
Topics
Getting the beacon identity
Core Location / CLBeacon
Class
CLBeacon
Information about an observed iBeacon device and its relative distance to a
person’s device.
iOS 7.0+
iPadOS 7.0+
Mac Catalyst 13.1+
macOS 10.15+


## Page 14

var major: NSNumber
The major value that the observed beacon transmitted.
var minor: NSNumber
The minor value that the observed beacon transmitted.
var proximityUUID: UUID
The proximity ID of the beacon.
Deprecated
var proximity: CLProximity
The relative distance to the beacon.
enum CLProximity
Constants that reflect the relative distance to a beacon.
var accuracy: CLLocationAccuracy
The accuracy of the proximity value, measured in meters from the beacon.
var rssi: Int
The received signal strength of the beacon, measured in decibels.
var timestamp: Date
A timestamp representing when the beacon was observed.
NSObject
CVarArg
Determining the distance to the beacon
Getting the observation timestamp
Relationships
Inherits From
Conforms To


## Page 15

CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCoding
NSCopying
NSObjectProtocol
NSSecureCoding
Ranging for Beacons
Configure a device to act as a beacon and to detect surrounding beacons.
Determining the proximity to an iBeacon device
Detect beacons and determine the relative distance to them.
Turning an iOS device into an iBeacon device
Broadcast iBeacon signals from an iOS device.
protocol CLCondition
The abstract base class for all other monitor conditions.
See Also
iBeacon


## Page 16

Decodable
Encodable
Sendable
SendableMetatype
CLMonitor.BeaconIdentityCondition, CLMonitor.CircularGeographicCondition
Ranging for Beacons
Configure a device to act as a beacon and to detect surrounding beacons.
Determining the proximity to an iBeacon device
Relationships
Inherits From
Conforming Types
See Also
iBeacon
Core Location / CLCondition
Protocol
CLCondition
The abstract base class for all other monitor conditions.
iOS 17.0+
iPadOS 17.0+
Mac Catalyst 17.0+
macOS 14.0+


## Page 17

Detect beacons and determine the relative distance to them.
Turning an iOS device into an iBeacon device
Broadcast iBeacon signals from an iOS device.
class CLBeacon
Information about an observed iBeacon device and its relative distance to a person’s device.


