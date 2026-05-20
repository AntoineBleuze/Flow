# 003_Configuring attribution rules for your app.pdf

## Page 1

AdAttributionKit provides a mechanism to configure the attribution rules that you change in your
app by adding and configuring keys in the information property list.
The structure of the AdAttributionKit additions to the information property list include stanzas tha
you can use to control the duration of impressions that the system considers eligible for attributio
for your app. You can also control the cooldown period — the minimum amount of time that needs
to pass between conversions before the system accepts new conversions.
There are two main configuration sections:
The AttributionWindows settings that controls the time duration that impressions will be valid in
your app.
The AttributionCooldown settings that allows your app to specify how often a conversion can
happen.
Inside each of these sections are additional keys that that tune the behavior of their respective
controls and allow you defined what ad networks they pertain to, or if they’re global settings.
AdAttributionKit uses your app’s information property list to hold its configuration settings. To
enable this configuration, add a new dictionary named AdAttributionKitConfigurations t
the information property list.
Inside this dictionary, you place additional dictionaries, or individual keys that control the attributio
windows and cooldown periods, depending on your app’s requirements. To create the Ad
Overview
Understand the AdAttributionKit configuration
dictionary
AdAttributionKit / Configuring attribution rules for your app
Article
Configuring attribution rules for your app
Tune aspects of attribution flow, including the time available to register
impressions and the minimum time your app is willing to accept conversions.


## Page 2

AttributionKitConfigurations dictionary, open your app’s Xcode project and follow these
steps:
1. Open your app’s project in Xcode.
2. Go to the file navigator.
3. Locate your app’s target, and select its filename.
4. Click the app’s Info panel.
5. Click the plus (+) button next to any existing entry to create a new element in the information
property list.
6. Set the new element’s name to AdAttributionKitConfigurations.
7. Click the Type menu for the new AdAttributionKitConfigurations element, and select
Dictionary as its type.
8. Click the disclosure triangle next to the AdAttributionKitConfigurations element to
open it.
To complete the configuration, add one or more of the following addition-controlling elements,
depending on the AdAttributionKit configuration you want to use with your app.
Note
For clarity, these examples show XML renderings of the dictionaries and keys that control the
AdAttributionKit attribution windows and cooldown periods. In practice, use Xcode’s’
information property list editor to create and edit these settings.
You can specify the time duration that impressions are valid in your app by using configurable
attribution windows. By default, view impressions are valid for 1 day after someone has seen them
and click impressions are valid for 30 days. With configurable attribution windows, you can specif
a duration from 1 to 7 days for view impressions, and 1 to 30 days for click impressions.
To create configurations for individual or global ad networks, AdAttributionKit
Configurations needs a dictionary to contain them. To create this dictionary, follow these
steps:
1. Inside the new AdAttributionKitConfigurations, add a new element named
AttributionWindows.
2. Click the Type menu for the new AttributionWindows element, and set its type to
Dictionary.
Add an attribution windows dictionary


## Page 3

3. Click the disclosure triangle next to the new AttributionWindows element to open it.
Your app can configure the attribution window globally, so that the framework applies it to all
conversions, as well as on a per-ad network basis. This allows you to control the levels of
granularity and define the attribution rules that make the most sense for your business. The syste
uses the following order of precedence for configurations: ad network > global > system default,
where an ad network configuration always takes precedence over a global or system default
configuration.
There are two types of global settings the attribution window settings support: global settings tha
apply to ad networks, and per-ad network settings that control specific parameters relating to
conversions for the ad networks you specify.
To override the built-in, global attribution window settings, follow these steps:
1. Create a new dictionary named global inside the AttributionWindows dictionary in your
app’s information property list.
2. Inside this dictionary, create another, nested dictionary called install. This describes the kin
of operation whose window you’re defining.
3. Inside the install dictionary, you can specify numeric values for either click or view value
The click value determines the number of days that click impressions are valid for your app
globally, with a range from 1 to 30 days. The view value determines the number of days that
view impressions are valid for your app globally, with a range from 1 to 7 days. This example
shows an XML rendering of a global dictionary inside the AttributionWindows dictionary
that constrains view to 3 days:
Configure your app’s global attribution window


## Page 4

You can also overwrite attribution windows for your app on a per-ad network basis, giving you mo
granular control of your app’s attribution windows for each partner you work with. To configure an
attribution window for an ad network, follow these steps:
1. Create a new dictionary named AttributionWindows inside of the AdAttributionKit
Configurations dictionary in your app’s information property list.
2. Add additional dictionaries to the AttributionWindows dictionary — one per ad network — 
control the click and view windows for that network. These network-specific dictionaries
need to have a key name that matches the ad network’s ID (for example, test
.adattributionkit). For more information on ad network IDs, see Registering an ad
network.
3. Inside this dictionary, add an install dictionary — following the same steps as for the globa
configuration — to control either the click or view duration. As with the global settings, th
install dictionary needs to be inside the AttributionWindows dictionary.
The time ranges are the same as for the global install dictionary. This example shows an XML
rendering of a dictionary for the ad network test.adattributionkit, constraining clicks to 2
days:
Additionally, you can specify the key ignoreInteractionType inside the install dictionary. You
can set the ignoreInteractionTypekey to view or click, which tells the system to ignore
impressions with either a view or click ad interaction type from the specific ad network during
attribution. This is useful for prioritizing either view or click attributions for your app when
working with a specific ad network.
The following code shows an XML rendering of an AdAttributionKitConfigurations
dictionary that contains AttributionWindows settings for both global and a specific ad
network:
Configure attribution windows per ad network


## Page 5

Important
You can only ignore an interaction type for ad network configurations. The system doesn’t
recognize ignored interaction types in global configurations.
Configurable attribution cooldown allows your app to specify a duration after the last conversion i
which the system won’t create any new conversions for your app. Consider the following scenario
someone installs your app from an ad, then within two hours taps another ad and re-engages bac
into your app. By default, the system creates a re-engagement conversion for the second tap, but
your business model may consider the initial conversion as the more important signal. Configurab
attribution cooldown allows you to specify a period in which the system ignores subsequent re-
engagements.
You can specify a cooldown period for install conversions as well as re-engagement conversions.
To specify a cooldown period after an install conversion, follow these steps:
Configure attribution cooldown


## Page 6

1. Define a dictionary with the key AttributionCooldown inside the AdAttributionKit
Configurations dictionary.
2. Inside AttributionCooldown, add a new element with the name install-cooldown-
hours.
3. Using the Type menu, set its type to Number. This value represents the number of hours the
system will wait after an install conversion before accepting new conversions.
This example shows an XML rendering of a dictionary for the AttributionCooldown that sets
the installation cooldown period to 24 hours:
Alternatively, you can specify a cooldown period after a re-engagement conversion. In this case,
name the number key re-engagement-cooldown-hours. This value represents the number o
hours the system waits after a re-engagement conversion before accepting new conversions.
The system accepts values with a range of 0 to 720 hours for both install and re-engagement
cooldown periods.
Registering an ad network
Use the AdAttributionKit APIs for your ad campaigns after registering your ad network with
Apple.
Configuring a publisher app
Set up a publisher app to participate in ad campaigns.
Configuring an advertised app
Prepare an advertised app to participate in ad campaigns.
See Also
Ad network registration and configuration


