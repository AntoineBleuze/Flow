# 001_Creating postbacks in developer settings.pdf

## Page 1

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


## Page 2

To create development postbacks for your app, type in your app’s bundle identifier and tap the
Configure Development Postbacks button.
Create a development postback


## Page 3

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


## Page 4

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


## Page 5

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


## Page 6

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


