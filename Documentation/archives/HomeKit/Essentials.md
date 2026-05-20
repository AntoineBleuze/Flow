# Essentials.pdf

## Page 1

To access the devices in the user’s home automation network, you enable the HomeKit capability
for your app. You also provide a usage description that explains to the user why the app needs
access, and handle the case where the user denies access.
To ready your app to work with HomeKit, enable the HomeKit capability for your app in Xcode.
Open your project, select the app target, and choose the Signing & Capabilities pane. Then click
the + button. In the window that appears, choose HomeKit.
When you enable the HomeKit capability, Xcode automatically adds the HomeKit Entitlement
to your entitlements file. It also adds the corresponding feature to your App ID and links the
HomeKit framework.
Overview
Enable the HomeKit capability
HomeKit / Enabling HomeKit in your app
Article
Enabling HomeKit in your app
Declare your app’s intention to use HomeKit, and get permission from the user to
access home automation accessories.


## Page 2

Important
HomeKit supports independent Apple Watch apps in watchOS 7 and later.
A user’s home automation network is a sensitive resource. Apps with access can collect sensor
data and change the state of physical objects in the real world. To protect users, the first time you
app uses the HomeKit framework—typically, when you create a HMHomeManager instance—the
system prompts the user for permission.
You provide a message for this prompt called a purpose string or a usage description by setting a
string value for the NSHomeKitUsageDescription that you add to your app’s Information
Property List file. Find and select your project’s Info.plist file in Xcode’s project navigato
Modify the file using the property list editor built into Xcode:
The system automatically generates the prompt’s title, which includes the name of your app. Your
usage description—in this case, “Configure accessories from Kilgo Devices, Inc.”—indicates the
reason that your app needs the access.
Explain why your app needs access to the user’s home
network


## Page 3

Accurately and concisely explaining to the user why your app needs access to the home network,
typically in one complete sentence, lets the user make an informed decision and improves the
chances that they’ll grant access.
Important
If you don’t include a purpose string, your app crashes when you first try to use HomeKit.
If the user grants permission, the system remembers the user’s choice and doesn’t prompt again
the user denies permission, the access attempt that initiated the prompt and any further attempts
fail. Look for a homeAccessNotAuthorized error in your completion handlers to detect this
condition. Alternatively, you can inspect the home manager’s authorizationStatus property.
Be aware that even if the user allows the initial access, they can revoke permission at any time in
the Settings app. Your app should handle both initial and subsequent access denials gracefully.
If home automation is a secondary function of your app—like an alarm app that plays an audible
alert on the device and can also turn the house lights on when the alarm triggers—respect the
user’s choice and work around denied access. For example, you can omit unavailable features fro
the user interface.
If your app can’t provide meaningful functionality without HomeKit access, you can display a
message to the user saying so, directing them to change the privacy setting for your app to
continue.
HomeKit Entitlement
Handle permission denial gracefully
See Also
Essentials


## Page 4

A Boolean value that indicates whether users of the app may manage HomeKit-compatible
accessories.
NSHomeKitUsageDescription
A message that tells people why the app is requesting access to their HomeKit configuration
data.


## Page 5

Key
com.apple.developer.homekit
Type
Boolean
This key Indicates whether the users of an app may manage HomeKit-compatible accessories,
such as switches, lights, fans, locks, and thermostats.
To add this entitlement to your app, enable the HomeKit capability in Xcode. For more information
see Enabling HomeKit in your app.
Matter Allow Setup Payload
A Boolean value that allows an app to provide an optional Matter Setup payload while setting
up a Matter device in an ecosystem.
Details
Discussion
See Also
Home automation
Bundle Resources / Entitlements / HomeKit Entitlement
Property List Key
HomeKit Entitlement
A Boolean value that indicates whether users of the app may manage HomeKit-
compatible accessories.
iOS 8.0+
iPadOS 8.0+
tvOS 10.0+
visionOS 1.0+
watchOS 2.0+


## Page 6

Key: com.apple.developer.matter.allow-setup-payload


## Page 7

Name
Privacy - HomeKit Usage Description
Type
String
Important
This key is required if your app uses APIs that access the user’s HomeKit configuration data.
For more information about using HomeKit in your app, see Enabling HomeKit in your app.
Enabling HomeKit in your app
Details
Discussion
See Also
Home
Bundle Resources / Information Property List / NSHomeKitUsageDescription
Property List Key
NSHomeKitUsageDescription
A message that tells people why the app is requesting access to their HomeKit
configuration data.
iOS 8.0+
iPadOS 8.0+
visionOS 1.0+
watchOS 2.0+


## Page 8

Declare your app’s intention to use HomeKit, and get permission from the user to access
home automation accessories.


