# 000_Ranging for Beacons.pdf

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


