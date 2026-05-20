# Ad attribution testing.pdf

## Page 1

Important
For devices running OS versions earlier than iOS 18, use the AdAttributionKit testing profile on
your test device. For more information, see Testing ad attributions with a downloaded profile.
In iOS 18 and later, you can reduce the time-window for receiving AdAttributionKit postbacks by
enabling Developer Mode on your test device. Developer Mode is compatible with both
AdAttributionKit and SKAdNetwork. For more information, see Enabling Developer Mode on a
device.
After enabling Developer Mode, access the developer settings in Settings on your test device. Th
scroll down to the Ad Attribution Testing section and enable the AdAttributionKit Developer Mode
switch, as the screenshot below shows:
Overview
AdAttributionKit / Testing ad attributions with Developer Mode
Article
Testing ad attributions with Developer
Mode
Reduce the time-window for ad attributions and inspect postbacks using a proxy
during testing.


## Page 2

Important
Enabling Developer Mode reduces the privacy protections the system provides. Use this mode
only during development or testing. This setting automatically turns off after two weeks.
To test ad attributions, you need to log in to the device with a production Apple ID. AdAttributionK
doesn’t support sandbox Apple IDs.
In iOS 18 and later, you sign development impressions to receive development postbacks.
Development impressions allow you to test your integration with reduced time-windows using
Developer Mode. After a conversion event occurs using a development impression, the system
creates development postbacks. Development postbacks aren’t subject to the rate limits that
reengagement in AdAttributionKit imposes, and they generate postbacks with the highest data tie
that Crowd Anonymity allows.
AdAttributionKit and SKAdNetwork both support development impressions and postbacks.
Configuring development impressions can vary based on the ad framework you’re using, as follow
In AdAttributionKit, you create development impressions by specifying a publisher item identifie
of 0 in the impression’s JSON web signature (JWS).
Similarly, in SKAdNetwork for ads that apps show, you create development impressions by
setting a source App Store identifier of 0.
Create development impressions and postbacks


## Page 3

In SKAdNetwork for web ads, the system registers development impressions for all web ads as
long as Developer Mode is in an enabled state at the time of the click.
AdAttributionKit and SKAdNetwork 4 create a winning set of three development postbacks as par
of multiple conversion windows. SKAdNetwork 3 and earlier create a single winning postback. For
more information, see Receiving postbacks in multiple conversion windows.
You can test development postbacks using the production time-windows, or reduce their time-
windows by enabling Developer Mode.
Note
The system prioritizes production impressions over development impressions for any
conversion event. If production and development impressions are present during a conversion,
the system ignores development impressions.
The system signs development postbacks with a different private key from production postbacks 
help distinguish them. The system uses the apple-development-identifier/0 kid to
identify signed development postbacks in end-to-end flows.
The steps for verifying development postback signatures are identical to the steps for production
postbacks, with the exception of the key you use. For more information on the public key for
development postbacks and verifying a postback’s JWS signature, see Verifying a postback.
Enabling Developer Mode reduces the time-window for receiving development postbacks from th
device. Developer Mode only affects the time-windows of development postbacks. Postbacks tha
the system generates from production impressions use the full time-windows.
When you enable Developer Mode, the framework reduces each development postback’s
conversion window to 3 minutes instead of the full duration to allow for faster testing. The
conversion window begins when the installed app first updates the conversion value. The first
window spans 0 to 3 minutes, the second window spans 3 to 6 minutes, and the third window
spans 6 to 9 minutes. Developer Mode reduces the postback delay from 24 to 48 hours to 5 to 10
minutes.
Verify development postbacks
Reduce time-windows using Developer Mode
Inspect postbacks using an HTTP proxy


## Page 4

When you enable Developer Mode, the system can send AdAttributionKit postbacks through an
HTTP proxy that you configure. By using an HTTP proxy, you can monitor the HTTP traffic betwee
your device and the network, including AdAttributionKit postbacks. To configure the HTTP proxy,
follow these steps on a testing device:
1. Choose Settings > Wi-Fi and select the Wi-Fi network you’re connected to.
2. Under the HTTP Proxy heading, select Configure Proxy.
3. Select Manual to configure the Server, Port, and Authentication settings for your proxy, or selec
Automatic to provide a URL for your proxy.
4. Tap Save.
When you enable Developer Mode, the AdAttributionKit postbacks that the device sends go
through the proxy.
Creating postbacks in developer settings
Test development postbacks for your advertised app without interacting with ads from a
publisher app.
Testing ad attributions with a downloaded profile
Reduce the time-window for ad attributions and inspect postbacks using a proxy during
testing.
See Also
Ad attribution testing


## Page 5

Use the AdAttributionKit Development Postbacks tool in the developer settings to create
development postbacks for your advertised app. This tool allows you to test your AdAttributionKit
functionality without interacting with ads from a publisher app or publishing your app in the App
Store or an alternate marketplace. Test your app from various distribution methods, such as those
you build with Xcode, ad-hoc, or TestFlight.
This tool also allows you to configure the amount of data that returns in the postback to simulate
different Crowd Anonymity tiers so you can validate server logic for receiving those postbacks. Fo
more information about Crowd Anonymity tiers, see Identifying the parameters in a postback.
You can access the AdAttributionKit tools by enabling Developer Mode on your test device. For
more information, see Enabling Developer Mode on a device.
Important
Enabling Developer Mode reduces the privacy protections the system provides. Use this mode
only during development or testing. This setting automatically turns off after two weeks.
After enabling Developer Mode, access the developer settings on your test device by choosing
Settings > Developer. Then scroll down to the Ad Attribution Testing section and tap Developmen
Postbacks, as the screenshot below shows:
Overview
AdAttributionKit / Creating postbacks in developer settings
Article
Creating postbacks in developer settings
Test development postbacks for your advertised app without interacting with ads
from a publisher app.


## Page 6

To create development postbacks for your app, type in your app’s bundle identifier and tap the
Configure Development Postbacks button.
Create a development postback


## Page 7

Note
An app with the specified bundle identifier needs to exist on your device. The system doesn’t
allow you to create development postbacks for an app that isn’t installed.
Provide the URL of the server to receive the development postbacks. AdAttributionKit sends the
postback to this destination when the postback is eligible for transmission.
You can also tap Use Developer Postback URL to generate the full postback copy URL that the
app’s information property list specifies. This is the same URL that AdAttributionKit generates wh
creating developer copies of postbacks in full end-to-end flows. For more information on receivin
developer postback copies, see Configuring an advertised app.
Note
It’s a best practice to use a server URL that’s different than the production server URL for
testing. The testing URL can include a custom path that’s difficult to guess, such as a UUID
that you can disable once the test is complete.
Provide the server URL to process the postback


## Page 8

Configure each property of the postback in this section. You can create variations of all properties
in the postback, including the view or click interaction type, conversion types, and one or three
conversion windows.
Fill in a conversion tag if you’re testing the overlapping conversion windows feature. After you
specify a conversion tag, you can update the postback by setting the conversionTag property
and calling updateConversionValue(_:). For more information on overlapping conversion
windows, see Identifying conversion values with conversion tags.
AdAttributionKit uses Crowd Anonymity to control the amount of data the framework returns in
postbacks in production flows. For each postback, adjust the amount of data that AdAttributionKi
includes in the postback.
Fill in postback properties
Add a conversion tag
Adjust postback data tiers


## Page 9

You can use this to test that your server logic is processing different postback data granularities
correctly. For more information about Crowd Anonymity, see Receiving postbacks in multiple
conversion windows.
Postbacks you create using the developer settings have notable differences from postbacks you
create in a full end-to-end flow:
The kid property of the JWS header is apple-development-identifier/1.
The ad-network-identifier property of the JWS payload is development
.adattributionkit.
If you build and install your app with Xcode, it has an advertised-item-identifier of 0. 
you install the app from the App Store or alternate marketplace, it has an advertised-item-
identifier matching the item identifier of your app in App Store Connect.
The system signs development postbacks with a different private key from production postbacks 
help distinguish them. The steps for verifying development postback signatures are identical to th
steps for production postbacks, with the exception of the key you use. For more information on th
public key for development postbacks and verifying a postback’s JWS signature, see Verifying a
postback.
Examine the JWS of the development postback


## Page 10

The device sends eligible postbacks automatically, which can take a few minutes. To send
postbacks immediately, you can transmit eligible development postbacks on-demand by tapping
the Transmit Development Postbacks button.
AdAttributionKit treats a postback as eligible for transmission after its conversion window elapses
or you lock it by calling the updateConversionValue(_:) API. The duration of the postback’s
conversion window depends on whether you enable AdAttributionKit Developer Mode. For more
information about Developer Mode, see Testing ad attributions with Developer Mode.
Tapping Clear Development Postbacks deletes all development postbacks currently in the system
allowing you to return the device to a known starting point.
Testing ad attributions with Developer Mode
Reduce the time-window for ad attributions and inspect postbacks using a proxy during
testing.
Testing ad attributions with a downloaded profile
Reduce the time-window for ad attributions and inspect postbacks using a proxy during
testing.
Transmit eligible development postbacks on-
demand
Clear development postbacks
See Also
Ad attribution testing


## Page 11

Important
You can only use the AdAttributionKit testing profile for devices running OS versions earlier
than iOS 18. In iOS 18 and later, the testing profile no longer works in AdAttributionKit or
SKAdNetwork, so you need to use the AdAttributionKit Developer Mode. For more information
see, Testing ad attributions with Developer Mode.
You can reduce the time-window for receiving ad attribution postbacks by installing an
AdAttributionKit testing profile on your test device.
Download the latest profile by signing in to your Apple Developer account and then downloading
the AdAttributionKit profile. This profile is compatible with both AdAttributionKit and SKAd
Network.
For information about installing profiles, see Install a configuration profile on your iPhone or iPad.
You can install this profile on devices running iOS or iPadOS 17.4 or later.
With this profile, the installed app has 5 minutes to update the conversion value after initially
registering. The device sends the postback within another 5 minutes after the rolling 5-minute
timer for conversion updates expires. Using this profile reduces the conversion value update and
postback window from 24–48 hours to 5–10 minutes.
This testing profile expires 2 weeks after you install it on the device. To continue testing, downloa
the latest profile and reinstall it.
Overview
AdAttributionKit / Testing ad attributions with a downloaded profile
Article
Testing ad attributions with a downloaded
profile
Reduce the time-window for ad attributions and inspect postbacks using a proxy
during testing.


## Page 12

Note
To test ad attributions, you need to log in to the device with a production Apple ID.
AdAttributionKit doesn’t support sandbox Apple IDs.
With this installed profile, the system can send AdAttributionKit postbacks through an HTTP proxy
that you configure. By using an HTTP proxy, you can monitor the HTTP traffic between your devic
and the network, including AdAttributionKit postbacks. To configure the HTTP proxy, follow these
steps on a testing device:
1. Choose Settings > Wi-Fi and select the Wi-Fi network you’re connected to.
2. Under the HTTP Proxy heading, select Configure Proxy.
3. Select Manual to configure the Server, Port, and Authentication settings for your proxy, or selec
Automatic to provide a URL for your proxy.
4. Tap Save.
With the installed profile, the AdAttributionKit postbacks that the device sends go through the
proxy.
Testing ad attributions with Developer Mode
Reduce the time-window for ad attributions and inspect postbacks using a proxy during
testing.
Creating postbacks in developer settings
Test development postbacks for your advertised app without interacting with ads from a
publisher app.
Inspect postbacks using an HTTP proxy
See Also
Ad attribution testing


