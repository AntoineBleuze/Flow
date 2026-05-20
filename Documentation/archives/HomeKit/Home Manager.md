# Home Manager.pdf

## Page 1

This sample presents a simplified version of the kind of app a HomeKit-enabled accessory
manufacturer might provide. You use the app to configure and control a specific device—a garage
door opener from a fictional manufacturer, Kilgo Devices. The app offers access to secondary and
custom characteristics that Apple’s Home app doesn’t expose. It provides a user experience that
consistent with the Home app’s approach and terminology, but doesn’t attempt to replicate every
feature of the Home app.
For more information about user interface considerations for HomeKit-enabled apps, see the
HomeKit section of the Human Interface Guidelines.
Overview
HomeKit / Configuring a home automation device
Sample Code
Configuring a home automation device
Give users a familiar experience when they manage HomeKit accessories.
Download
iOS 12.1+
iPadOS 12.1+
Xcode 10.2+


## Page 2

To be able to use HomeKit, you enable the HomeKit capability and include the NSHomeKitUsage
Description key in your app’s Info.plist file, as described in Enabling HomeKit in Your App
In this sample app, the capability is already enabled and a usage description is provided.
Perform the following steps before building and running the app:
1. Set a valid signing team in the target’s General pane so that Xcode can create a provisioning
profile containing the HomeKit entitlement when you build for the first time.
2. Download and install the Home Accessory Simulator (HAS) on your Mac to be able to emulate
HomeKit-enabled accessories. See Testing Your App with the HomeKit Accessory Simulator.
3. Import the hasaccessory file that the sample app bundles to define the specific garage door
opener accessory that the app controls. Choose File > Import Accessory from the HAS
menu. In the dialog that appears, navigate to the downloaded sample code project’s
Documentation folder, and select the garage.hasaccessory file.
The import creates a single accessory with a hidden accessory information service that all
accessories have, and two user-interactive services: one that controls a garage door and another
to control an attached light bulb. Most of the associated characteristics are standard for their
service. Only one—the light bulb’s fade rate—is custom. You can use HAS to inspect and
manipulate all of these items.
You always use an instance of HMHomeManager as the root HomeKit object. The home manager
contains an array of homes, each of which has a collection of accessories. The sample app define
a HomeStore class for use as a singleton that holds the one and only home manager for the app:
Configure the sample code project
Create a home manager and get the primary home


## Page 3

You create an accessory list collection view controller to present the list of connected accessorie
Because this root view controller never gets deallocated, it can safely assign itself as the HMHome
ManagerDelegate protocol delegate:
The manager tells its delegate when the list of homes changes, including the first time the home
manager loads data from the HomeKit database during initialization. When this happens, the
accessory list reloads to show the accessories in the primary home, or prompts the user to create
new home if none exists.
You can extend the app to allow the user to select among all known homes instead of always
choosing the primary home. You can also allow users to add, remove, or rename homes, although
the user performs these tasks infrequently, and typically relies on the Home app to do so.
The first time you run the app, the accessory list is empty, because you haven’t associated any
accessories from Kilgo Devices. The app’s UI presents a + button in the navigation bar that you ta
to initiate a search for accessories on the local network. The button’s tap handler calls the home’s
addAndSetupAccessories(completionHandler:) method.
This presents the standard HomeKit UI for locating and adding new accessories to a given home.
On success, the completion handler refreshes the app’s copy of the HomeKit data and redraws th
display.
When your app enters the standard accessory association flow, which is the same one that the
Home app uses, the user follows these steps:
1. Scan or enter the new device’s HomeKit setup code. This code comes packaged with the
device, or is available in the HAS display for the accessory.
2. Select from a list of devices on the network that don’t already have an existing HomeKit
association. This includes both real and simulated devices that can access the local area
Add new accessories


## Page 4

network.
3. Wait for HomeKit to verify that the setup code entered in step 1 matches the device’s code
4. Assign a name and room to each service associated with the device. HomeKit provides a
default name and room for each service, one page per service, that the user can accept or
change.
Each item that the user names in step 4 appears in the Home app as an “accessory”. However, in
HomeKit, these are HMService instances. They are owned by an HMAccessory instance that
represents the physical device that you selected in step 2. To maintain a user experience consiste
with the Home app, the sample app UI (and the rest of this article) also refers to each HMService
instance as an accessory.
You draw the display based on a copy of data from HomeKit captured into an array of Kilgo
services:
When the accessory list reloads, either because a new home is set or because the accessory-add
flow completes, you populate the above array, filtering out HMAccessory instances from
manufacturers other than Kilgo, and HMService instances that aren’t user interactive. Also while
gathering the list, you request notifications for changes on any of the corresponding
characteristics, which are the individual points of status and control for a given service:
As a result, the display shows only the accessories relevant to this particular app.
Show only accessories relevant to your app


## Page 5

Note
Use care when crafting your filters. For example, the name “Kilgo Devices, Inc.” might not be
unique among all past and future manufacturers, and therefore might not serve as a sufficient
predicate in a real app.
Accessories (like light bulbs) have characteristics (like power state, color temperature, brightness
and so on) that users control or observe. Users typically care about one of these characteristics
above the others, because they change or read that characteristic most often. This is the primary
characteristic, and you should give users quick access to it. For a light bulb, users most often wan
to switch it on or off, so the power state is the primary characteristic.
It’s up to you to define what the primary charactersitc is for the accessories you control. You can 
that by creating a computed property on HMService in an extension that returns the type of
primary characteristic:
Then use this primary characteristic type to locate and return the characteristic that has that type
For Kilgo Devices, both the light bulb and garage door have binary primary state. The bulb is on o
off. The target state of the door is open or closed. This lends itself to an interface where a toggle
switch is sufficient to control all primary characteristics. You can implement this as the tap handle
on each item in the accessory list collection view. When the user taps the accessory, you read the
current characteristic value and then write the opposite:
Tailor common interactions to specific accessories


## Page 6

The write involves network access, so HomeKit calls a completion handler when the write
completes. Use this opportunity to update the state of the interface, as shown in the snippet
above.
When the user taps an accessory’s information button, the app reveals details about the accesso
From the detail view, the user can rename the accessory, assign it to a room, remove it from the
home, and see device information, like the firmware version. The user can also tap Settings to
reveal a list of secondary characteristics for that accessory.
Control the user experience by presenting only relevant characteristic types. The KilgoService
extension of HMService defines a computed property that limits the list of displayable
characteristics to those in a curated list:
These are mostly HomeKit standard types, all of which are applicable to Kilgo devices. There’s als
one custom type—fade rate—defined earlier in the same extension:
Enable custom configuration


## Page 7

Characteristic types are stored as UUID strings. The value specified in the code for fade rate
matches the value found in the accessory simulator, which you can inspect in HAS. If you also bui
a real Kilgo device, the value used there would have to match as well.
Testing your app with the HomeKit Accessory Simulator
Install the HomeKit Accessory Simulator to help you debug your HomeKit-enabled app.
class HMHomeManager
The manager for a collection of one or more of a user’s homes.
See Also
Home Manager


## Page 8

While developing your HomeKit-enabled app, you might not have physical access to all the kinds 
accessories that you want your app to control. To test your app, install the HomeKit Accessory
Simulator (HAS) to simulate any accessories you don’t have, or to help automate your testing
process.
HAS runs on your Mac, simulating accessories that you define as a supplement to any physical
accessories in your network. You can create accessories with both standard and custom services
and characteristics. You can use your Mac’s camera to simulate network cameras and video
doorbells. You can also create bridges and bridged accessories to represent more complex
network architectures.
You download the HAS as part of the Additional Tools for Xcode package found on the More
Downloads for Apple Developers page, which is part of the Apple developer portal. Choose the
version of the package that matches your version of Xcode.
As a convenience, Xcode provides a link to the download page from the Capabilities pane. Xcode
displays a button embedded in the HomeKit capability that takes you directly to the download pag
in Safari.
Overview
Download the HomeKit Accessory Simulator
HomeKit / Testing your app with the HomeKit Accessory Simulator
Article
Testing your app with the HomeKit
Accessory Simulator
Install the HomeKit Accessory Simulator to help you debug your HomeKit-enable
app.


## Page 9

After downloading the disk image file, open it and navigate to the Hardware folder. Drag the Hom
KitAccessorySimulator.app from there to your Applications folder. Double-click to
launch the simulator.
Accessories in a home automation network are physical devices like light bulbs or garage door
openers. Accessories provide control points called services. For example, a garage door opener
might offer a door opener and a light. Each service, in turn, has characteristics—the values that
describe and control the service. The light has a power state (on or off), a brightness level, and so
on. Accessories also have hidden services, like the accessory information service that provides
manufacturing information.
Add accessories, services, and characteristics


## Page 10

In the HomeKit Accessory Simulator, define accessories that you can use with your app. For detai
see the HomeKit Accessory Simulation Help, accessible through the simulator’s Help menu.
Add an accessory. Assign a name and provide other identifying details. An accessory isn’t typica
the user’s main focus, but does serve as a logical container for the services that the user cares
about. When you create an accessory, HAS adds the accessory information service by default
based on the information you provide.
Add one or more services to the accessory. Add as many additional services as you need,
potentially including hidden services. For each, specify a service type using one of the standard
values in Accessory Service Types, or using a custom service with a new, unique identifier. Give
each service a unique name. For user-visible services, the user might later change the name usin
the Home app, or using your app.
Add or modify service characteristics. HAS populates standard services with a set of standard
characteristics for that service, but you can adjust these to match the specific devices you want t
model. For example, if a light bulb offers a fade-to-off feature with configurable timing, you might


## Page 11

add a custom characteristic indicating the fade rate. The Home app doesn’t expose custom
characteristics to the user, but you can control them from your own app.
To be able to access simulated accessories from a HomeKit enabled app, you associate them with
a home network. You can do this from any device on your local area network running the Home
app, which is installed on all iOS devices by default. The accessory becomes part of the logged-in
user’s home network. From the Home or Rooms tab, tap the plus button and choose Add
Accessory. Then follow the instructions in the dialog that appears.
Alternatively, you can call the addAndSetupAccessories(completionHandler:) method
from your app.
Associate the accessory with the network


## Page 12

This generates the same accessory association flow as the one presented in the Home app, and
produces the same result. Doing it from within your app offers the advantage of being able to wor
on the iOS Simulator, where the Home app isn’t available.
Important
If you add an accessory on a device, including an iOS Simulator, without a logged-in iCloud
account, the accessory is isolated to that device. This means that if you add an accessory to
an iPhone simulator and then switch over to using an iPad simulator, you have to reassociate
the accessory for it to appear in the new environment.
After the simulated accessory is part of the home automation network, you can find it and control
from your app just as you would a real accessory.
Changes that you make to characteristics in your app show up immediately in HAS. For example, 
you let the user switch a light bulb off in your app with a toggle switch, the state of the light bulb
changes right away in the HAS interface to match. When you implement accessory delegate
methods like accessory(_:service:didUpdateValueFor:), changes made with HAS sho
up in your app right away as well.
Configuring a home automation device
Give users a familiar experience when they manage HomeKit accessories.
class HMHomeManager
The manager for a collection of one or more of a user’s homes.
Observe and change characteristic values
See Also
Home Manager


## Page 13

Enabling HomeKit in your app
HomeKit stores the user’s home automation information in a database that’s shared among Apple
built-in iOS Home app, your HomeKit-enabled app, and apps from other developers. All these app
access the database as peers using the HomeKit framework.
Mentioned in
Overview
HomeKit / HMHomeManager
Class
HMHomeManager
The manager for a collection of one or more of a user’s homes.
iOS 8.0+
iPadOS 8.0+
Mac Catalyst 8.0+
tvOS 10.0+
visionOS 1.0+
watchOS 2.0+


## Page 14

Each app creates a single HMHomeManager instance to coordinate its HomeKit-related activities.
The manager’s homes array gives your app access to a collection of HMHome instances that
represent the user’s homes. These in turn contain references to the home automation accessorie
that your app can inspect and control.
Adopt the HMHomeManagerDelegate protocol in your app to stay informed of any changes to th
set of homes made outside your app.
var authorizationStatus: HMHomeManagerAuthorizationStatus
The current state of the app’s access to home data.
struct HMHomeManagerAuthorizationStatus
The possible home-access states.
var homes: [HMHome]
An array of all homes managed by this home manager.
Topics
Inspecting authorization status
Working with the home layout


## Page 15

class HMHome
The primary unit of living space, typically composed of rooms organized into zones.
var delegate: (any HMHomeManagerDelegate)?
A delegate that receives updates on the collection of homes.
protocol HMHomeManagerDelegate
An interface the home manager uses to communicate changes to the state of the home
network.
func addHome(withName: String, completionHandler: (HMHome?, (any Error
)?) -> Void)
Adds a new home to this home manager.
func removeHome(HMHome, completionHandler: ((any Error)?) -> Void)
Removes a home from this home manager.
var primaryHome: HMHome?
The primary home managed by this home manager.
Deprecated
func updatePrimaryHome(HMHome, completionHandler: ((any Error)?) -> Voi
)
Updates the primary home of this home manager.
Deprecated
init()
Keeping track of connected homes
Adding and removing homes
Managing the primary home
Initializers
Instance Methods


## Page 16

func findVendorAccessory(hapPublicKey: Data, completionHandler: (
HMAccessory?, (any Error)?) -> Void)
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Sendable
SendableMetatype
Configuring a home automation device
Give users a familiar experience when they manage HomeKit accessories.
Testing your app with the HomeKit Accessory Simulator
Install the HomeKit Accessory Simulator to help you debug your HomeKit-enabled app.
Relationships
Inherits From
Conforms To
See Also
Home Manager


