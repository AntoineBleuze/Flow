# Accessories.pdf

## Page 1

Use this class to provides steps for the user to add one or more accessories to a particular home,
and follow up with additional setup. These APIs don’t require that the current app has home data
authorization.
func performAccessorySetup(using: HMAccessorySetupRequest, completion
Handler: (HMAccessorySetupResult?, (any Error)?) -> Void)
Performs the process of setting up accessories with Apple Home.
init()
Overview
Topics
Adding accessories
Initializers
Relationships
HomeKit / HMAccessorySetupManager
Class
HMAccessorySetupManager
An object that setups up new accessories.
iOS 15.0+
iPadOS 15.0+


## Page 2

NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Sendable
SendableMetatype
class HMAccessorySetupResult
A result object describing information about a successful accessory setup request.
class HMAccessorySetupRequest
An object that describes how to add and setup up new accessories.
Interacting with a home automation network
Find all the automation accessories in the primary home and control their state.
class HMAccessory
A home automation accessory, like a garage door opener or a thermostat.
class HMService
A controllable feature of an accessory, like a light attached to a garage door opener.
class HMCharacteristic
A specific characteristic of a service, like the brightness of a dimmable light or its color
temperature.
class HMMediaSourceDisplayOrderProfile
Inherits From
Conforms To
See Also
Accessories


## Page 3

An interface from which to read and, if allowed by the accessory, update the ordering of inpu
sources.


## Page 4

var accessoryUniqueIdentifiers: [UUID]
The values corresponding to accessories that are set up.
var homeUniqueIdentifier: UUID
The home that accessories were added to.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Topics
Getting results
Relationships
Inherits From
Conforms To
HomeKit / HMAccessorySetupResult
Class
HMAccessorySetupResult
A result object describing information about a successful accessory setup reques
iOS 15.4+
iPadOS 15.4+


## Page 5

Equatable
Hashable
NSCopying
NSObjectProtocol
Sendable
SendableMetatype
class HMAccessorySetupManager
An object that setups up new accessories.
class HMAccessorySetupRequest
An object that describes how to add and setup up new accessories.
Interacting with a home automation network
Find all the automation accessories in the primary home and control their state.
class HMAccessory
A home automation accessory, like a garage door opener or a thermostat.
class HMService
A controllable feature of an accessory, like a light attached to a garage door opener.
class HMCharacteristic
A specific characteristic of a service, like the brightness of a dimmable light or its color
temperature.
class HMMediaSourceDisplayOrderProfile
An interface from which to read and, if allowed by the accessory, update the ordering of inpu
sources.
See Also
Accessories


## Page 6

Use this class to provide steps for the user to add one or more accessories to a particular home,
and follow up with additional setup.
var homeUniqueIdentifier: UUID?
The identifier corresponding to the home that the accessory should be added to when being
set up.
var payload: HMAccessorySetupPayload?
The payload to use for accessory setup.
var suggestedAccessoryName: String?
The name that the framework suggests when the user names the accessory being set up.
var suggestedRoomUniqueIdentifier: UUID?
The identifier corresponding to the room that the framework suggests.
Overview
Topics
Setting up accessorices
HomeKit / HMAccessorySetupRequest
Class
HMAccessorySetupRequest
An object that describes how to add and setup up new accessories.
iOS 15.4+
iPadOS 15.4+


## Page 7

var matterPayload: MTRSetupPayload?
init()
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCopying
NSObjectProtocol
Sendable
SendableMetatype
class HMAccessorySetupManager
An object that setups up new accessories.
class HMAccessorySetupResult
A result object describing information about a successful accessory setup request.
Instance Properties
Initializers
Relationships
Inherits From
Conforms To
See Also
Accessories


## Page 8

Interacting with a home automation network
Find all the automation accessories in the primary home and control their state.
class HMAccessory
A home automation accessory, like a garage door opener or a thermostat.
class HMService
A controllable feature of an accessory, like a light attached to a garage door opener.
class HMCharacteristic
A specific characteristic of a service, like the brightness of a dimmable light or its color
temperature.
class HMMediaSourceDisplayOrderProfile
An interface from which to read and, if allowed by the accessory, update the ordering of inpu
sources.


## Page 9

This sample app introduces you to the accessories, services, and characteristics found in a home
automation network, represented by instances of HMAccessory, HMService, and
HMCharacteristic, respectively. The sample displays all the properties and relationships it fin
using a simple set of hierarchical views inside a split view controller.
This view hierarchy is useful for learning how HomeKit structures device data, which is slightly
different than the way the Apple Home app refers to related concepts. It’s also useful for device
developers who want to understand how HomeKit sees custom hardware.
In a real app that you publish on the App Store, you would provide a user experience more like the
one found in Configuring a Home Automation Device. For example, you would focus on the action
Overview
HomeKit / Interacting with a home automation network
Sample Code
Interacting with a home automation
network
Find all the automation accessories in the primary home and control their state.
Download
iOS 12.1+
iPadOS 12.1+
Xcode 12.3+


## Page 10

a user can take and hide the underlying technical details. For more tips about presenting HomeKit
data to users, see the “Adjust the Interface for a Published App” section at the end of this article.
To be able to use HomeKit, you enable the HomeKit capability and include the NSHomeKitUsage
Description key in your app’s Info.plist file, as described in Enabling HomeKit in Your App
In this sample app, the capability is already enabled and a usage description is provided.
To be able to build an app that has the HomeKit capability, you must set a valid signing team in th
target’s General pane before you build, so that Xcode can create a provisioning profile containing
the HomeKit entitlement.
The sample app works with both real devices and simulated ones. If you don’t have any real home
automation accessories, or if you want to try an accessory type that you don’t have, use the
HomeKit Accessory Simulator (HAS), as described in Testing Your App with the HomeKit Accesso
Simulator. You can use a mix of simulated devices and real ones.
You always use an instance of HMHomeManager as the root HomeKit object, following the pattern
described in Configuring a Home Automation Device. As in that sample, this app finds the primary
home, allowing the user to create a new one if none exists. In other respects, this sample leaves
home management to the Home app.
When HomeKit data finishes loading after initialization, or after the user creates a new home, you
home manager delegate—an adopter of the HMHomeManagerDelegate protocol—gets access t
the user’s homes. Use the delegate to set the home view’s home property based on this
information. From the corresponding didSet observer, you then call the resetDisplay(for:
method to retrieve data from HomeKit and redraw the display, which consists of a list of
accessories in the home:
Before triggering a table view reload, use the reloadDisplayData(for:) method to prepare 
list of accessories sorted by room that can serve as a data source for the home view’s table view.
Start with the home’s default room—accessible using the roomForEntireHome() method. Add
that to the contents of the home’s rooms array. Then filter out any rooms from this composite
group lacking accessories. Sort the remaining rooms by name:
Configure the sample code project
Group accessories by room


## Page 11

Alternatively, you can display accessories sorted by category. Accessories have a category
property, which is an instance of the HMAccessoryCategory class that indicates what the devic
is, like a door or a light. You can derive a name from this information, and use that to group
accessories:
Unlike the HMRoom class, the HMAccessoryCategory class doesn’t natively contain the list of
related accessories. So you define a local Category type to serve as a category container:
As indicated in the previous and next snippet, both the Category type and the HMRoom type
adopt the AccessoryGroup protocol, which declares both a name and a list of accessories. This
ensures that either type can serve as the data source:
Group accessories by category


## Page 12

To enable the user to select between displaying accessories grouped by room or category, use a
segmented controller in the home view’s toolbar to set the groupKey property:
Inside the groupKey property’s didSet observer, reload the table view without reloading data
from HomeKit:
You use the table view’s data source and delegate methods to prepare table cells based on the
current grouping of accessories, as specified by the groupKey property.
To enable the pairing of new accessories, the UI presents a + button in the home view that the us
taps to initiate a search for accessories on the local network. The button’s tap handler calls the
home’s addAndSetupAccessories(completionHandler:) method, which presents the
standard HomeKit UI for locating and adding new accessories to a given home:
Pick a grouping to display
Add new accessories


## Page 13

On success, the completion handler refreshes the app’s copy of the HomeKit data and redraws th
display.
The sample app’s split view detail controller shows an AccessoryView with information about a
single accessory. This includes a list of accessory properties, like the accessory’s name and
manufacturer. It also includes services, like a door opener or a light bulb, that the accessory offer
Optionally, for an accessory that’s a bridge, which is an accessory that serves as a link to
accessories on a non-HomeKit network, the view also shows a list of the accessories to which the
bridge provides access.
Note
Bridged accessories (those with the isBridged property set to true) also appear in the
home view’s main list of accessories because HomeKit makes them directly accessible. Listing
them in the accessory view is a convenience to show the relationship with their bridge.
When the user taps an accessory in the home view, you use the prepare(for:sender:)
method override to assign the corresponding accessory to the accessory view, which triggers the
view to reload its content:
When the user taps a service in the accessory view, you push a ServiceView instance on the
navigation stack. The service view lists the corresponding service’s properties, like its name. It als
lists the associated characteristics, which are the control points and data values that the service
exposes. For example, the garage door opener service might have a characteristic whose value yo
set to indicate whether the garage door should be opened or closed. It might have another
characteristic whose value you read to find out where the garage door is right now—open, closed
or something in between.
When the user taps a characteristic in the service view, you push a CharacteristicView
instance onto the navigation stack to provide details about that specific characteristic, like its nam
and the content of its associated value.
A characteristic is primarily a container for its value property that represents an input to or outpu
from a service. Other properties of the characteristic tell you about that value, like if it’s a Boolean
Show accessory, service, and characteristic details
Read characteristic values before using them


## Page 14

number, string, or something else, what units apply to it, whether you can read or write it, and so
on.
When the user taps a service in the accessory view, the incoming service view writes a
characteristic to each of its characteristic cells. This begins the process of populating the cell’s U
for example by adjusting the visibility of the cell’s controls depending on the characteristic value’s
type. But the cell can’t rely on the actual value until it calls the characteristic’s read
Value(completionHandler:) method.
You can access the value property at any time, but this is a cached value from the last interactio
with the physical accessory, if any. Performing an explicit read operation prompts HomeKit to ask
the accessory for the characteristic’s current value, and update its local copy. Because this query
involves network access, HomeKit reports the value to your app in a completion handler, which
then finalizes the UI changes by setting the cell’s label text and the control state.
The characteristic view, which also displays the characteristic value, doesn’t perform an explicit
read. The user can only get to the characteristic view by tapping on a service view’s characteristic
cell, which has recently refreshed the corresponding value. Both views rely on accessory delegate
callbacks to track any further changes in the value, as described in the next section.
HomeKit gives apps access to a shared home automation network. Apps other than yours,
including the Home app, can change service names, characteristic values, the layout of a home,
and other attributes. Accessories can also drive changes independently. For example, a garage
door opener might have an obstruction sensor with output that varies based on physical changes
the environment. To keep your app’s local data caches and user interfaces up to date with outside
changes, your app adopts HomeKit delegate protocols.
The sample app’s home view adopts the HMHomeManagerDelegate protocol to handle changes
in the list of homes, as described in the section “Create a Home Manager and Get the Primary
Home”. This particular implementation ensures that the home view always shows the primary hom
The home view also implements the HMHomeDelegate protocol to be informed of changes withi
the chosen home. Because these kinds of changes affect the entire user interface, the app redraw
Keep home data up to date


## Page 15

the whole display when anything changes, such as when a room is added by another app:
Accessory changes, reported by the HMAccessoryDelegate protocol, typically don’t warrant
completely redrawing the entire interface, but can nonetheless affect multiple view controllers.
However, an accessory can have only a single delegate.
For example, it would be disruptive to reset the entire user interface to show only that a light bulb
turned off. But the corresponding characteristic value affects both a toggle switch in a
characteristic cell and a value label in the related characteristic view. Both of these might be on th
detail view’s navigation stack at the same time and need to be informed of the change.
To solve this, the home store singleton acts as the accessory delegate for all accessories, set
whenever the home is updated:
The home store also becomes the accessory delegate for any accessories added later, set in the
home(_:didAdd:) delegate method:
The home store can then act as an accessory delegate hub. Any view controllers that want to
receive accessory delegate callbacks register themselves by calling the addAccessory
Delegate(:) method:
Keep accessory data up to date


## Page 16

When the home store receives a delegate callback, it passes the call along to all interested parties
such as when a characteristic value changes:
Most delegate callbacks work by default. However, your app only receives callbacks for
characteristic value changes—the delegate method shown at the end of the previous section—
when it explicitly enables them. The sample app does this by calling the service’s enable
Notifications method whenever the service view’s service property changes.
This method—defined in an HMService extension—in turn calls the enableNotification(_:
completionHandler:) method of all the characteristics within the given service that have the
HMCharacteristicPropertySupportsEventNotification property.
Register for characteristic value update notifications


## Page 17

The sample app also deactivates notifications for characteristics that are no longer needed. The
willSet property observer, as shown in the code above, calls the same enabling method, but w
false as the input, for the service property value as it exists before the update.
For a HomeKit app that you want to publish in the App Store, you design a different user interface
than the one in this sample app.
Expose a lot less detail about individual accessories, services, and characteristics. Only prese
information that’s really useful. Most users aren’t interested in unique device identifiers and
firmware versions. At a minimum, nest or deemphasize less important details.
Focus on services as the root interface element, just like in the Home app. Help users complet
tasks by focusing on the actions they can perform, or the data they can read, rather than the
physical objects in the environment.
Expose only user interactive services. Hide services not reported as user interactive by the
device.
Feature behaviors and settings specific to your app. If your app supports devices only from a
certain manufacturer, or with certain capabilities, filter out the accessories that don’t match.
Reduce clutter and present only those devices or capabilities that make sense for your app.
Provide meaningful interfaces for custom elements. Your app might enable users to manage
custom services and characteristics of a device that you develop. For example, a light service
might offer a power-down decay rate characteristic, reducing brightness from full on to full off ov
a configurable period of time. The Home app doesn’t expose this characteristic, but your app can
provide the user with a suitable interface to control it.
For more information about user interface considerations for HomeKit enabled apps, see the
HomeKit section of the Human Interface Guidelines.
class HMAccessorySetupManager
An object that setups up new accessories.
Adjust the interface for a published app
See Also
Accessories


## Page 18

class HMAccessorySetupResult
A result object describing information about a successful accessory setup request.
class HMAccessorySetupRequest
An object that describes how to add and setup up new accessories.
class HMAccessory
A home automation accessory, like a garage door opener or a thermostat.
class HMService
A controllable feature of an accessory, like a light attached to a garage door opener.
class HMCharacteristic
A specific characteristic of a service, like the brightness of a dimmable light or its color
temperature.
class HMMediaSourceDisplayOrderProfile
An interface from which to read and, if allowed by the accessory, update the ordering of inpu
sources.


## Page 19

An HMAccessory instance represents a physical device, like a garage door opener, installed in a
home and assigned to a room.
You don’t create accessories directly. Instead you get them from the accessories array of an
HMHome instance when you want all the accessories in a home, or the accessories array of an
HMRoom instance when you want all the accessories in a particular room. Each physical accessory
in the home is represented by exactly one accessory instance, so that one instance appears in bo
a home and a room collection. This is because it’s simultaneously part of the home and in one of
the home’s rooms.
When you want to add new accessories, you call the home’s addAndSetup
Accessories(completionHandler:) method. In response, HomeKit presents the user with 
interface that steps through the process of searching for new accessories in the physical
environment, naming them, and assigning them to a room.
Accessories provide one or more services, represented by instances of HMService, that are the
features that the user can control, like the light attached to a garage door opener, or the door
opener mechanism itself.
Overview
Topics
HomeKit / HMAccessory
Class
HMAccessory
A home automation accessory, like a garage door opener or a thermostat.
iOS 8.0+
iPadOS 8.0+
Mac Catalyst 8.0+
tvOS 10.0+
visionOS 1.0+
watchOS 2.0+


## Page 20

var delegate: (any HMAccessoryDelegate)?
A delegate that receives updates on the state of the accessory.
protocol HMAccessoryDelegate
A set of methods that defines the communication method for state updates from accessorie
to their delegates.
var name: String
The name of the accessory.
func updateName(String, completionHandler: ((any Error)?) -> Void)
Changes the name of the accessory.
var uniqueIdentifier: UUID
A unique identifier for the accessory.
var identifier: UUID
A unique identifier for the accessory.
Deprecated
var category: HMAccessoryCategory
The category to which the accessory belongs.
class HMAccessoryCategory
A category for a HomeKit accessory.
var room: HMRoom?
The room containing the accessory.
class HMRoom
The smallest subdivision of a home’s space.
Tracking changes to an accessory
Identifying an Accessory
Categorizing an accessory
Locating an accessory


## Page 21

var profiles: [HMAccessoryProfile]
An array of profiles implemented by the accessory.
class HMAccessoryProfile
A profile that certain accessories implement.
class HMNetworkConfigurationProfile
A profile that provides information about network protection for an accessory.
class HMCameraProfile
A camera profile that interacts with an accessory’s camera.
struct CameraView
A SwiftUI view into which a video stream or an image snapshot is rendered.
var cameraProfiles: [HMCameraProfile]?
An array of camera profiles implemented by the accessory.
class HMCameraProfile
A camera profile that interacts with an accessory’s camera.
class HMCameraView
The view into which a video stream or an image snapshot is rendered.
var isReachable: Bool
A Boolean value indicating whether the accessory can be communicated with in the current
network environment.
var isBlocked: Bool
A Boolean value indicating whether the accessory is blocked.
var supportsIdentify: Bool
Managing accessory profiles
Managing camera profiles
Getting accessory state
Asking an accessory to identify itself


## Page 22

A Boolean value that indicates whether the accessory supports the identify action.
func identify(completionHandler: ((any Error)?) -> Void)
Asks an accessory to identify itself.
var services: [HMService]
An array of services provided by the accessory.
class HMService
A controllable feature of an accessory, like a light attached to a garage door opener.
var isBridged: Bool
A Boolean that indicates whether the accessory is accessed through a bridge.
var uniqueIdentifiersForBridgedAccessories: [UUID]?
An array of unique identifiers, each of which represents an accessory vended by the bridge.
var identifiersForBridgedAccessories: [UUID]?
An array of identifiers for accessories available through a bridge.
Deprecated
var firmwareVersion: String?
The firmware version of the accessory.
var manufacturer: String?
The manufacturer of the accessory.
var model: String?
The model name of the accessory.
class HMAccessoryBrowser
A network browser you can use to discover new accessories in a home.
Controlling accessory features
Managing bridged accessories
Getting manufacturer information
Browsing for accessories


## Page 23

var matterNodeID: UInt64?
var bridgedAccessories: [HMAccessory]
var hapInstanceID: UInt64?
var home: HMHome?
var isVendorAccessory: Bool
init()
Deprecated
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Sendable
SendableMetatype
Instance Properties
Initializers
Relationships
Inherits From
Conforms To
See Also
Accessories


## Page 24

class HMAccessorySetupManager
An object that setups up new accessories.
class HMAccessorySetupResult
A result object describing information about a successful accessory setup request.
class HMAccessorySetupRequest
An object that describes how to add and setup up new accessories.
Interacting with a home automation network
Find all the automation accessories in the primary home and control their state.
class HMService
A controllable feature of an accessory, like a light attached to a garage door opener.
class HMCharacteristic
A specific characteristic of a service, like the brightness of a dimmable light or its color
temperature.
class HMMediaSourceDisplayOrderProfile
An interface from which to read and, if allowed by the accessory, update the ordering of inpu
sources.


## Page 25

An HMService instance represents a service provided by an accessory. Accessories have both
user-controllable services, like a light, and services that are for the use of the accessory itself, like
firmware update service.
You don’t create services directly. Instead you find them in the services array of an
HMAccessory instance.
A single accessory may have more than one user-controllable service. For example, most garage
door openers have a service for opening and closing the door, and another service for the light on
the garage door opener. These services are what Apple’s Home app labels as “accessories”.
You inspect or change a service’s HMCharacteristic instances to discover state, or modify
behavior.
var characteristics: [HMCharacteristic]
An array of characteristics for the service.
Overview
Topics
Getting service characteristics
HomeKit / HMService
Class
HMService
A controllable feature of an accessory, like a light attached to a garage door
opener.
iOS 8.0+
iPadOS 8.0+
Mac Catalyst 8.0+
tvOS 10.0+
visionOS 1.0+
watchOS 2.0+


## Page 26

class HMCharacteristic
A specific characteristic of a service, like the brightness of a dimmable light or its color
temperature.
var name: String
The user specified name of the service.
func updateName(String, completionHandler: ((any Error)?) -> Void)
Updates the name of the service to the specified string.
var uniqueIdentifier: UUID
A unique identifier for the service.
var serviceType: String
The type of the service.
Accessory Service Types
The service types supported by HomeKit.
var localizedDescription: String
The localized description of the service.
var isPrimaryService: Bool
A Boolean value that indicates whether this service is the primary service on the accessory.
var isUserInteractive: Bool
A Boolean value that indicates whether this service supports user interaction.
var associatedServiceType: String?
The type of the service associated with an outlet or a switch.
func updateAssociatedServiceType(String?, completionHandler: ((any Erro
)?) -> Void)
Identifying the service
Getting the service type
Reading service properties
Associating a secondary service


## Page 27

Associates the service type of the plugged-in device with a switch or an outlet service.
var linkedServices: [HMService]?
An array of service objects that represents all the services to which the service links.
var accessory: HMAccessory?
The accessory that provides this service.
init()
Deprecated
var matterEndpointID: UInt16?
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Sendable
SendableMetatype
Finding the linked services
Getting the service’s provider
Initializers
Instance Properties
Relationships
Inherits From
Conforms To


## Page 28

class HMAccessorySetupManager
An object that setups up new accessories.
class HMAccessorySetupResult
A result object describing information about a successful accessory setup request.
class HMAccessorySetupRequest
An object that describes how to add and setup up new accessories.
Interacting with a home automation network
Find all the automation accessories in the primary home and control their state.
class HMAccessory
A home automation accessory, like a garage door opener or a thermostat.
class HMCharacteristic
A specific characteristic of a service, like the brightness of a dimmable light or its color
temperature.
class HMMediaSourceDisplayOrderProfile
An interface from which to read and, if allowed by the accessory, update the ordering of inpu
sources.
See Also
Accessories


## Page 29

An HMCharacteristic instance represents an aspect of a service that provides data, or that
your app can control.
You don’t create characteristic instances. Instead, an accessory manufacturer incorporates them
into a device, which publishes them to you through the characteristics array of an
HMService instance.
Characteristics have a properties array that indicates attributes like readability, writability, and
user-visibility. They also have a characteristicType property that tells your app what the
characteristic controls or describes. Device manufacturers can use one of the standard types,
given in Characteristic types, or they can create custom types.
Each characteristic has a value that you can read or write. Some characteristics use plain
numbers, Booleans, or strings. Others have application specific meanings declared in enumeratio
associated with the given characteristic type. The characteristic’s metadata can help your app
interpret the value.
Overview
Topics
Identifying a characteristic
HomeKit / HMCharacteristic
Class
HMCharacteristic
A specific characteristic of a service, like the brightness of a dimmable light or its
color temperature.
iOS 8.0+
iPadOS 8.0+
Mac Catalyst 8.0+
tvOS 10.0+
visionOS 1.0+
watchOS 2.0+


## Page 30

var uniqueIdentifier: UUID
A unique identifier for the characteristic.
var localizedDescription: String
The localized description of the characteristic.
var properties: [String]
An array of properties that describe the characteristic.
Characteristic Properties
The properties that characteristics can have.
var characteristicType: String
The type of the characteristic.
Characteristic types
The characteristic types supported by HomeKit-based accessories.
var value: Any?
The current value of the characteristic.
func readValue(completionHandler: ((any Error)?) -> Void)
Reads the value for the characteristic.
func writeValue(Any?, completionHandler: ((any Error)?) -> Void)
Modifies the value of the characteristic.
func updateAuthorizationData(Data?, completionHandler: ((any Error)?) -
Void)
Sets or clears authorization data used when writing to the characteristic.
var metadata: HMCharacteristicMetadata?
Metadata about the units and other properties of the characteristic.
Reading characteristic properties
Determining what a characteristic controls
Controlling a characteristic
Managing characteristic presentation


## Page 31

class HMCharacteristicMetadata
Metadata that describes a characteristic’s value and that may be useful for presentation
purposes.
func enableNotification(Bool, completionHandler: ((any Error)?) -> Void
Enables or disables notifications for changes in the value of the characteristic.
var isNotificationEnabled: Bool
A Boolean indicating whether the characteristic has been set to send notifications.
var service: HMService?
The service that contains this characteristic.
init()
Deprecated
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Sendable
SendableMetatype
Receiving change notifications
Getting the characterized service
Initializers
Relationships
Inherits From
Conforms To


## Page 32

class HMAccessorySetupManager
An object that setups up new accessories.
class HMAccessorySetupResult
A result object describing information about a successful accessory setup request.
class HMAccessorySetupRequest
An object that describes how to add and setup up new accessories.
Interacting with a home automation network
Find all the automation accessories in the primary home and control their state.
class HMAccessory
A home automation accessory, like a garage door opener or a thermostat.
class HMService
A controllable feature of an accessory, like a light attached to a garage door opener.
class HMMediaSourceDisplayOrderProfile
An interface from which to read and, if allowed by the accessory, update the ordering of inpu
sources.
See Also
Accessories


## Page 33

This class represents a media source display that orders functionality for the HMServiceType
Television service contained in the services array of the profile.
func writeOrder([Int]) async throws
Writes the display order of the media sources to the accessory.
var delegate: (any HMMediaSourceDisplayOrderProfile.Delegate)?
The property that handles updates to the display order.
var order: [Int]
The display order of input media sources.
let canModifyOrder: Bool
A Boolean that indicates if the display order of the input media sources can be modified.
Overview
Topics
Managing input source order
HomeKit / HMMediaSourceDisplayOrderProfile
Class
HMMediaSourceDisplayOrderProfile
An interface from which to read and, if allowed by the accessory, update the
ordering of input sources.
iOS 18.0+
iPadOS 18.0+
Mac Catalyst 18.0+
tvOS 18.0+
visionOS 2.0+
watchOS 11.0+


## Page 34

protocol Delegate
The protocol through which a delegate receives updates on the order of input media sources
HMAccessoryProfile
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Sendable
SendableMetatype
class HMAccessorySetupManager
An object that setups up new accessories.
class HMAccessorySetupResult
A result object describing information about a successful accessory setup request.
class HMAccessorySetupRequest
An object that describes how to add and setup up new accessories.
Interacting with a home automation network
Find all the automation accessories in the primary home and control their state.
class HMAccessory
Relationships
Inherits From
Conforms To
See Also
Accessories


## Page 35

A home automation accessory, like a garage door opener or a thermostat.
class HMService
A controllable feature of an accessory, like a light attached to a garage door opener.
class HMCharacteristic
A specific characteristic of a service, like the brightness of a dimmable light or its color
temperature.


