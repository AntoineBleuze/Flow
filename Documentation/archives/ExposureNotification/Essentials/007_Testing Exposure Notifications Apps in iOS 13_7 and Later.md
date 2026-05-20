# 007_Testing Exposure Notifications Apps in iOS 13_7 and Later.pdf

## Page 1

Exposure Notifications apps automatically download configuration information for the phone’s
current region, such as the public key, public key version, and agency name. During development
those configuration files may not yet be available, or you may need to override the configuration
values, for example, to point your app at a test server. You can manually set the default
configuration values for your region by loading custom configuration files onto your development
iPhone.
To load custom configuration files, you’ll need a Mac running Xcode, a device with your region’s
Exposure Notifications app loaded on it, and the device profile you received from Apple when you
registered as a PHA.
To load a custom Exposure Notifications configuration, the device must have the Developer menu
enabled in the Settings app. If you’ve used the device to test applications from Xcode, the menu i
already enabled. To verify that it’s enabled, go to the Settings app and scroll down to make sure
Developer is listed. Alternatively, type “developer” into the search bar and confirm it’s listed. Once
you confirm the Developer menu is enabled, you’re ready to create your configuration file.
If your iPhone doesn’t have a Developer row in the Settings app, launch Xcode on a Mac, select
Devices & Simulators from the Window menu, and plug your iPhone into your Mac. As Xcode
prepares your device, a yellow bar appears at the top of the Devices & Simulators window. If you’v
never plugged your iPhone into this computer, you’ll be asked if you want to trust it. Select “Trust
on your iPhone. After a few minutes, the yellow bar disappears, which signals that your device is
configured for development.
Overview
Enable the Developer Menu
Exposure Notification / Testing Exposure Notifications Apps in iOS 13.7 and Later
Article
Testing Exposure Notifications Apps in iOS
13.7 and Later
Perform end-to-end validation of Exposure Notifications apps on a device by
manually loading configuration files.


## Page 2

Next, you need to create a configuration file that provides the configuration information your
Exposure Notifications app needs to connect with your region’s servers. Start by copying the JSO
below into a text file:
Create a Configuration File


## Page 3

Modify the JSON so the field values match your desired configuration. At a minimum, you must
replace:
[bundle identifier] with your app’s actual bundle identifier
[public key] with the most recent public key you registered with Apple
[public key version] with the version number of your public key as a string (for example
v2)
[countryCode] with the ENDeveloperRegion value from your app’s info.plist
If your app’s region includes both a country and subdivision code, such as “US-CA”, only include
the country code (for example “US”), not the entire region code in the countryCode field, and
then populate the state field with the full region code (for example, “US-CA”, not just “CA”).
After you’ve made your changes, save the file somewhere on your Mac with the name Test
_Config.json. If you’re testing in iOS 14.1 or later, copy Test_Config.json to the Files app 
your iPhone by using AirDrop, or by adding it to the iCloud Drive folder on your Mac and then
waiting for it to sync to your iPhone. If you’re testing in iOS 14.0 or iOS 13.7, you’ll need to convert
the JSON file you created into a property list before copying it to your iPhone.


## Page 4

To convert the JSON file you created into a property list in iOS 14.0 or iOS 13.7, open the Terminal
app on your Mac, use cd to navigate to the directory where you saved Test_Config.json, the
type the following command to generate the configuration property list to load onto your iPhone:
The plutil command converts your JSON file into a new .plist file called Test_Config
.plist and places it in the same directory as the original JSON file. Copy that new file to the File
app on your iPhone by using AirDrop, or by adding the file to the iCloud Drive folder on your Mac
and then waiting for it to sync to your iPhone.
Once the configuration file is available in the Files app on your iPhone, open the Settings app, scr
down, and tap Developer. Select Exposure Notifications, then tap Developer Server Configuration
to enable it, and choose Override Configuration File. Your phone will prompt you for the location o
the configuration file. Select Test_Config.json if you’re testing in iOS 14.1 or later, or Test
_Config.plist if testing in iOS 14.0 or iOS 13.7. After you select the configuration file, you’ll
receive a notification that says, “Successfully set override configuration file”.
Note
if you don’t see an Exposure Notifications option under the Develop menu in the Settings app,
you may need to install the Exposure Notifications profile provided by Apple, which enables
that option. If you have installed the profile and still don’t see the option, contact Apple
Developer Technical Support.
Navigate back to the top level of the Settings app and tap Exposure Notifications. Select Turn on
Exposure Notifications and then select your app’s region. Once you do this, your phone will use th
information from the custom configuration file. When you want to stop using your custom
configuration file, disable Developer Server Configuration under Exposure Notifications in the
Developer section of the Settings app.
Convert the JSON File to a Property List (iOS 14 and iOS
13.7)
Load the Configuration File
See Also
Essentials


## Page 5

Supporting Exposure Notifications Express
Configure servers to notify users of potential exposures to COVID-19 without an app.
Building an App to Notify Users of COVID-19 Exposure
Inform people when they may have been exposed to COVID-19.
Setting Up a Key Server
Ensure that your server meets the requirements for supporting Exposure Notifications.
class ENManager
A class that manages exposure notifications.
ENDeveloperRegion
A string that specifies the region that the app supports.
ENAPIVersion
A number that specifies the version of the API to use.
Changing Configuration Values Using the Server‑to‑Server API
Update Exposure Notifications configuration values from a Public Health Authority’s server.
Supporting Exposure Notifications in iOS 12.5
Prepare your Exposure Notifications app to run on a previous version of iOS.


