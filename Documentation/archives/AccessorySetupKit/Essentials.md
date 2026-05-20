# Essentials.pdf

## Page 1

This sample project uses two app targets to demonstrate how to use AccessorySetupKit.
ASKSampleAccessory simulates Bluetooth dice, while ASKSample highlights how to use
AccessorySetupKit to onboard the accessory.
The ASKSample target uses AccessorySetupKit to authorize the use of a Bluetooth dice accesso
and receive roll results. When you tap the “Add Dice” button, the app searches for dice and
presents the set up AccessorySetupKit UI. AccessorySetupKit then authorizes and grants the app
access to that accessory. After authorization, you can connect to the accessory and receive roll
results until you decide to disconnect or remove authorization altogether.
Note
This sample code project is associated with WWDC24 session 10203: Meet
AccessorySetupKit.
Because this sample app relies on using Bluetooth to connect with the accessory functionality, yo
can’t run this sample in Simulator — you’ll need to run it on a device. To run this sample, you’ll nee
the following:
Overview
Configure the sample code project
AccessorySetupKit / Setting up and authorizing a Bluetooth accessory
Sample Code
Setting up and authorizing a Bluetooth
accessory
Discover, select, and set up a specific Bluetooth accessory without requesting
permission to use Bluetooth.
Download
iOS 18.0+
iPadOS 18.0+
Xcode 16.0+


## Page 2

An Apple Developer profile.
Two devices running iOS 18 or iPadOS 18 or later.
1. Run the two targets on separate devices.
2. In ASKSampleAccessory, tap “Power On”.
3. In ASKSample, tap “Add Dice” and authorize the accessory using the AccessorySetupKit UI.
The accessory is now authorized for use in the app.
Discovering and configuring accessories
Detect nearby accessories and facilitate their setup.
class ASAccessorySession
A class to coordinate accessory discovery.
Using the applications
See Also
Essentials


## Page 3

Use the AccessorySetupKit framework to simplify discovery and configuration of Bluetooth or Wi-
accessories. This allows the person using your app to use these devices without granting overly-
broad Bluetooth or Wi-Fi access.
To discover accessories and present them in your app:
1. Declare that your app uses AccessorySetupKit in its information property list.
2. In your app, create and activate an instance of ASAccessorySession.
3. Provide information about your supported accessories to display a picker. This lets the person
using your app discover and select nearby accessories to configure.
4. When the picker sends an accessory added event, use information about the selected device t
create a Bluetooth or Wi-Fi connection.
To prepare your app to discover accessories, add the NSAccessorySetupKitSupports key to
its information property list. Set its value to an array of strings that contains one or more of the
following values:
Bluetooth
Add this value if your app discovers accessories using Bluetooth or Bluetooth Low Energy.
WiFi
Add this value if your app discovers accessories by finding Wi-Fi SSIDs that the accessories
publish.
If you add Bluetooth to the list of supported protocols, you also need to add the following keys
and values to your app’s information property list:
Overview
Declare your app’s accessories
AccessorySetupKit / Discovering and configuring accessories
Article
Discovering and configuring accessories
Detect nearby accessories and facilitate their setup.


## Page 4

NSAccessorySetupBluetoothCompanyIdentifiers
An array of strings that represent the Bluetooth company identifiers for accessories your app
configures.
NSAccessorySetupBluetoothNames
An array of strings that represent the Bluetooth device names for accessories your app
configures.
NSAccessorySetupBluetoothServices
An array of strings that represent the hexadecimal values of Bluetooth services for accessori
your app configures.
Important
If your app tries to discover Bluetooth accessories during setup without supplying these keys
and values, or uses identifiers, names, or services that it doesn’t include in its information
property list, the app crashes. This only affects use of AccessorySetupKit discovery and
selection; you can use other services and properties on the accessory after the person using
the app selects it.
The ASAccessorySession is how your app uses the AccessorySetupKit framework. In your app
you create an instance of ASAccessorySession and activate it to receive callbacks with events
as the session processes events. The activate(on:eventHandler:) method takes a
DispatchQueue and an event-handling block or closure. The callbacks occur on the provided
queue, which defaults to main.
The event handler receives a single parameter of type ASAccessoryEvent, which has an even
Type that you use to determine what to do with each callback. For example, shortly after activatin
the session, your callback receives the ASAccessoryEventType.activated event. The
following listing comments on the meaning of these events and how you may want to handle them
Activate a discovery session


## Page 5

When the session activates, its accessories array contains any accessories previously
authorized for the app, which you can inspect. To discover new devices, your app needs to show 
accessory picker. The person using the app uses this picker to choose the accessory to configure
Note
If someone renames a previously-discovered Wi-Fi accessory, it becomes discoverable again
by the picker.
Create instances of ASPickerDisplayItem that describe the items in the session that your ap
can configure. Collect these items in an array and pass them to the session for the operating
system to present a picker:
Display an accessory picker


## Page 6

Each display item’s descriptor, a property of type ASDiscoveryDescriptor, needs to have
bluetoothCompanyIdentifier or bluetoothServiceUUID, and at least one of the
following accessory identifiers:
bluetoothNameSubstring
A bluetoothManufacturerDataBlob and bluetoothManufacturerDataMask set to t
same length.
A bluetoothServiceDataBlob and bluetoothServiceDataMask set to the same lengt
Either ssid or ssidPrefix, which needs to have a non-zero length. Only supply one of these
the app crashes if you supply both.
For Bluetooth accessories, the accessory identifiers you use in display items need to match the
values you supply in the app’s information property list.
Along with filtering matched accessories to show in the picker, the display item and its descriptor
allow you to control certain behaviors of the picker interaction. You can limit the bluetoothRang
of the descriptor to only match accessories in the immediate physical proximity of the device
running the app. To specify behaviors like allowing renaming of the accessory during setup, or
confirming accessory authorization before showing the setup view, set the display item’s setup
Options.
When the picker appears, the person using the app sees a view of all nearby accessories that
match the identifiers you provide. When multiple devices match a given identifier, the picker show


## Page 7

a separate item for each unique device. This allows the person to select a single device with the
picker.
The following figure shows a single accessory selected in the picker.
You can also perform a one-time migration of previously-configured accessories, which adds the
to the AccessorySetupKit framework’s list of known accessories. To do this, create instances of
ASMigrationDisplayItem and include them in the array of items you send to show
Picker(for:completionHandler:).
For items you want to migrate, set one or both of the following:
An hotspotSSID, which must be a full SSID and not a prefix.
An peripheralIdentifier, which corresponds to the identifier property of the CBPee
type.
Important
Don’t initialize a CBCentralManager before migration is complete. If you do, your callback
handler receives an error and the picker fails to appear.
Some apps need to obtain over-the-air (OTA) data from discovered accessories and perform
additional filtering before showing them in the picker. The filtering includes tasks like validating th
authenticity of an accessory, testing whether it’s in pairing mode, and other checks. If your app
needs do this, set the picker’s display settings to use the filterDiscoveryResults option. If
Use the picker when migrating to AccessorySetupKit
Perform custom filtering


## Page 8

you need unlimited time to perform filtering and perform additional actions like downloading
product artwork, set the discoveryTimeout to unbounded.
The following code performs these setup steps:
When the session produces an ASAccessoryEventType.accessoryDiscovered event,
examine the accessory and determine whether to display it in the picker. To add the accessory to
the picker, create a ASDiscoveredDisplayItem. Using this type gives you the option to
customize the item’s display with a specific name and a custom image. Then call update
Picker(showing:completionHandler:) on the session to show the customized item.
The following example demonstrates an event handler that inspects discovered accessories and
adds customized items to the picker.
If your custom filtering process requires the app to finish the accessory discovery early, manually
end the discovery process by calling finishPickerDiscovery(completionHandler:). If
your filtering process didn’t add any discovered items to the picker, this call shows a timeout
message in the app.


## Page 9

Tip
AccessorySetupKit limits the number of accessories it exposes for discovery. If you don’t
discover the accessory you expect, manually cause a picker timeout by calling finish
PickerDiscovery(completionHandler:). If you want to retry, wait for the
ASAccessoryEventType.pickerDidDismiss and call showPicker(for:completion
Handler:) again. In this scenario, you may want to suggest the person using the app verify
that the accessory is powered up and nearby.
When the person picks an accessory, the picker sends an event of type ASAccessoryEventTyp
.accessoryAdded, followed by an ASAccessoryEventType.pickerDidDismiss event
when they dismiss the picker. If your app presents its own UI to configure the accessory, wait for
the picker to dismiss, then use the accessory from the first event. You can handle this scenario by
rewriting your event handler closure from before as follows, storing the accessory on the first eve
and retrieving it on the second.
The event’s accessory property contains details of the selected device, like its displayName
and an bluetoothIdentifier for Bluetooth devices or ssid for Wi-Fi. Use this information to
connect to the accessory — using Core Bluetooth for Bluetooth or Network Extension for Wi-Fi —
and begin your device-specific setup process.
Because the app discovered the device with AccessorySetupKit, connecting to the device won’t
invoke the TCC or other alerts that the system normally shows when using these system
Connect and configure the selected device


## Page 10

frameworks.
Starting in watchOS 26, if your iOS app has a companion watchOS app, the watchOS app can use
CoreBluetooth to communicate with a device that someone set up by using AccessorySetupKit in
the iOS app. Unlike iOS, however, the watchOS app still shows TCC alerts when connecting.
Setting up and authorizing a Bluetooth accessory
Discover, select, and set up a specific Bluetooth accessory without requesting permission to
use Bluetooth.
class ASAccessorySession
A class to coordinate accessory discovery.
See Also
Essentials


## Page 11

Discovering and configuring accessories
Use an instance of ASAccessorySession to interact with the AccessorySetupKit framework.
Start the session by calling activate(on:eventHandler:), and pass in a dispatch queue and
an event-handling closure. AccessorySetupKit calls back to your event handler as the discovery
session processes events.
With your event-handler prepared, create an array of ASPickerDisplayItem instances to
describe accessories your app can set up. Pass this array to the session’s showPicker(for:
completionHandler:) method to allow someone using your app to choose a discovered
accessory to set up. Your event handler receives events as the picker appears and dismisses, as
well as when the person using the app adds an accessory.
Important
Starting in iOS 18.4, apps can use AccessorySetupKit for discovery and setup of Bluetooth LE
devices that conform to the Human Interface Device (HID) service, such as keyboard and
mouse accessories. The HID accessory needs to advertise a custom service besides the HID
service. Add the bluetoothHID option to the supportedOptions and configure the
ASDiscoveryDescriptor to discover the custom service instead of the HID service.
Mentioned in
Overview
AccessorySetupKit / ASAccessorySession
Class
ASAccessorySession
A class to coordinate accessory discovery.
iOS 18.0+
iPadOS 18.0+


## Page 12

func activate(on: dispatch_queue_t, eventHandler: (ASAccessoryEvent) ->
Void)
Activate the session and start delivering events to an event handler.
func invalidate()
Invalidate the session by stopping any operations.
func showPicker(completionHandler: ((any Error)?) -> Void)
Present a picker that shows accessories managed by a Device Discovery Extension in your
app.
func showPicker(for: [ASPickerDisplayItem], completionHandler: ((any
Error)?) -> Void)
Present a picker that shows discovered accessories matching an array of display items.
var pickerDisplaySettings: ASPickerDisplaySettings?
Settings that affect the display of the accessory picker.
class ASPickerDisplaySettings
A type that contains settings to customize the display of the accessory picker
func updatePicker(showing: [ASDiscoveredDisplayItem], completionHandler
((any Error)?) -> Void)
Updates the picker with app-filtered accessories.
func finishPickerDiscovery(completionHandler: ((any Error)?) -> Void)
Topics
Managing the session life cycle
Displaying an accessory picker
Customizing picker behavior
Updating the picker
Ending filtered discovery


## Page 13

Finish the discovery session in the picker and show a timeout error.
var accessories: [ASAccessory]
An array of previously-selected accessories for this application.
func renameAccessory(ASAccessory, options: ASAccessory.RenameOptions,
completionHandler: ((any Error)?) -> Void)
Displays a view to rename an accessory.
struct RenameOptions
Options that affect the behavior of an accessory renaming operation.
func removeAccessory(ASAccessory, completionHandler: ((any Error)?) ->
Void)
Removes an accessory.
func finishAuthorization(for: ASAccessory, settings: ASAccessorySetting
, completionHandler: ((any Error)?) -> Void)
Finish authorization of a partially-setup accessory.
class ASAccessorySettings
Properties of an accessory.
func failAuthorization(for: ASAccessory, completionHandler: ((any Error
)?) -> Void)
End authorization of a partially-configured accessory as a failure.
func updateAuthorization(for: ASAccessory, descriptor: ASDiscovery
Descriptor, completionHandler: ((any Error)?) -> Void)
Displays a view to upgrade an accessory with additional technology permissions.
Accessing discovered accessories
Managing accessories
Managing authorization
Relationships


## Page 14

NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Sendable
SendableMetatype
Setting up and authorizing a Bluetooth accessory
Discover, select, and set up a specific Bluetooth accessory without requesting permission to
use Bluetooth.
Discovering and configuring accessories
Detect nearby accessories and facilitate their setup.
Inherits From
Conforms To
See Also
Essentials


