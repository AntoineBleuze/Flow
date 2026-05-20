# Essentials.pdf

## Page 1

AdAttributionKit and SKAdNetwork are frameworks that enable ad attribution and user
engagement measurement for conversions. AdAttributionKit works with both the App Store and
alternative app marketplaces, while SKAdNetwork works specifically with the App Store.
The update API to call depends on the framework your ad network is using, although you can use
both APIs:
If your framework is integrated with AdAttributionKit, use the updateConversionValue(_:
coarseConversionValue:lockPostback:) or updateConversionValue(_:lock
Postback:) API methods. If your framework is integrated with SKAdNetwork, call the update
PostbackConversionValue(_:coarseValue:lockWindow:completionHandler:) or
updatePostbackConversionValue(_:coarseValue:completionHandler:) API
methods.
If your framework is integrated with both AdAttributionKit and SKAdNetwork, call APIs from both. 
your app doesn’t have any pending postbacks — for instance because a person hasn’t seen an ad
for your app — the system ignores calls to both AdAttributionKit and SKAdNetwork. Additionally,
.adattributionkit and .skadnetwork ad network IDs are compatible across both
AdAttributionKit and SKAdNetwork, so you don’t need a specific ad network ID for one or the othe
Overview
Update conversion values independently
Understand how the system determines attribution
AdAttributionKit / Understanding AdAttributionKit and SKAdNetwork interoperability
Article
Understanding AdAttributionKit and
SKAdNetwork interoperability
Learn how attribution APIs interact to deliver ad impressions.


## Page 2

If an app has both AdAttributionKit and SKAdNetwork impressions, the system sorts both of them
and decides the winner. Only one impression can win for a conversion, whether it comes from
AdAttributionKit or SKAdNetwork. If a person sees more than one advertisement, the attribution
goes to the ad the person most recently tapped. If a person doesn’t tap any ads, attribution goes 
the ad a person most recently viewed.
The system sorts the impressions based on the following criteria:
Whether they are click-through or view-through. Click-through ads always take precedence ov
view-through ads.
For impressions, in each click-through or view-through group, the system sorts them based on
their timestamp.
The system considers a maximum of six impressions for any conversion.
When an app calls the update conversion values APIs in SKAdNetwork, such as updatePostbac
ConversionValue(_:coarseValue:lockWindow:completionHandler:), SKAdNetwork
bridges the conversion values between the two frameworks by mirroring the call into
AdAttributionNetwork by calling
updateConversionValue(_:lockPostback:).
Presenting ads in your app
Render different ad styles in your app.
Receiving ad attributions and postbacks
Understand timeframes and priorities for ad impressions that result in ad attributions, and ho
impressions qualify for postbacks.
Identifying conversion values with conversion tags
Use conversion tags to identify and update specific postbacks when you have overlapping
conversion windows.
Bridge conversions between SKAdNetwork and
AdAttributionKit
See Also
Essentials


## Page 3

AdAttributionKit and StoreKit provide several ways to display in-app ads so you can customize ad
display based on your app’s ad positioning or other advertising goals.
The first step to presenting ads in your app is to initialize an AppImpression with an impression
in compact JSON Web Signature (JWS) format. For more information about generating JWS
impressions, see Generating JWS impressions
Custom rendered ads include content that overlays the app view. Record view-through impressio
when your ad content has been displayed. To record a view-through impression, use the
AdAttributionKit handleView() method, as in the following SwiftUI example:
Overview
Record view-through impressions using custom
rendered ads
AdAttributionKit / Presenting ads in your app
Article
Presenting ads in your app
Render different ad styles in your app.


## Page 4

To respond to a click-through interaction and redirect a person to open or install the advertised
app, first display a UIEventAttributionView over your ad content. Once the ad receives a ta
call handleTap(). The system then records a click-through impression, and if the app specified
by the impression’s advertised item ID isn’t installed, the system launches the app’s product page
on the App Store or alternative marketplace according to the user’s preferences in Settings. If the
app is already installed, the system launches the app directly.
Record click-through impressions


## Page 5

Pass an AppImpression when configuring a StoreKit rendered ad, and it handles recording a
view-through impression after the framework displays it for 2 seconds; it records a click-through
impression if a person taps through the ad. For more information on StoreKit rendered ads, see
SKStoreProductViewController, SKOverlay.AppConfiguration, appImpression,
and loadProduct(parameters:impression:)
Understanding AdAttributionKit and SKAdNetwork interoperability
Learn how attribution APIs interact to deliver ad impressions.
Receiving ad attributions and postbacks
Understand timeframes and priorities for ad impressions that result in ad attributions, and ho
impressions qualify for postbacks.
Identifying conversion values with conversion tags
Use conversion tags to identify and update specific postbacks when you have overlapping
conversion windows.
Display StoreKit rendered ads
See Also
Essentials


## Page 6

Ad networks receive attributions in the form of postbacks. Before an ad network can receive a
postback, the following events need to occur within limited time-windows:
Ad networks sign and present ads in the form of StoreKit-rendered ads and custom-rendered
ads.
Someone installs or reengages with the advertised app.
A person or AdAttributionKit launches the app.
The app updates the conversion values when the app launches, and continues to update it as
needed.
The following table shows the time-windows for the events:
Event
Time-window
View-through custom or StoreKit
rendered ads
A person has 24 hours to install the app.
Click-through custom or StoreKit-
rendered ads
A person has 30 days to install the app.
Someone installs the app.
The device has 60 days to send the first conversion
value update.
Someone reengages with the app.
The device has 2 days to send the first conversion
value update.
Overview
AdAttributionKit / Receiving ad attributions and postbacks
Article
Receiving ad attributions and postbacks
Understand timeframes and priorities for ad impressions that result in ad
attributions, and how impressions qualify for postbacks.


## Page 7

The minimum elapsed time between a conversion event for the advertised app and the time the a
network receives a postback is 24 to 48 hours. To reduce that time to 5 to 10 minutes during
testing, see Testing ad attributions with Developer Mode.
Time-windows for events apply equally to winning and nonwinning postbacks.
Install conversion events occur when someone installs the app from the App Store or alternative
app marketplace after interacting with an AdAttributionKit ad. Install conversions create winning
and nonwinning postbacks for ad networks that had qualifying ad impressions.
AdAttributionKit represents install postbacks as either download or redownload in the
postback’s conversion-type field. For more information about the postback parameters, see
Identifying the parameters in a postback.
When multiple ad impressions qualify for postbacks from an install conversion, the device sorts th
ad impressions and selects a single winner. The system considers ad impressions from both
AdAttributionKit and SKAdNetwork when evaluating the attribution after someone installs the
advertised app. For more information about the ad sorting criteria, see Understanding
AdAttributionKit and SKAdNetwork interoperability.
Note
Install conversions always produce winning postbacks if there’s a qualifying ad impression,
subject to their Crowd Anonymity tier.
Each ad network can receive only one postback, winning or nonwinning. If you receive the winning
postback, you don’t receive any nonwinning postbacks even if your ads have multiple qualifying a
impressions. Up to five ad networks receive one nonwinning postback each. The system sorts the
recorded ad impressions based on recency and whether they are click-through or view-through,
with the most recent ad views and click-through taking precedence. Devices send nonwinning
postbacks for the top five ad impressions from different ad networks that qualify for ad attribution
Process install conversions
Receive a winning postback
Receive a nonwinning postback
Handle reengagement conversions


## Page 8

Reengagement conversions occur when someone already has the advertised app installed and ta
a custom rendered ad, or they tap the Open button on a StoreKit rendered ad. Reengagement onl
involves the impression that drives the conversion, so there are no nonwinning postbacks.
Additionally, the system only processes reengagement conversions as a result of click interaction
on ads. The system doesn’t create reengagement postbacks from view-through ads.
In iOS 18 and later, AdAttributionsKit allows publisher apps to pass a reengagement URL. The
system opens the reengagement URL if the device has the advertised app installed, and the URL 
a registered universal link for the advertised app. The system also appends the query parameter A
AttributionKitReengagementOpen to the URL to indicate AdAttributionKit opened it. When
the advertised app receives the universal link, it can check the URL for the presence of this
parameter to determine whether AdAttributionKit opened it. The reengagementOpen
URLParameter property also defines this parameter as a constant. For more information about
universal links, see Allowing apps and websites to link to your content.
The system also strips known tracking parameters from the URL before delivering them to the
advertised app.
It’s possible a reengagement conversion may occur for an app when there’s already an existing
install or reengagement conversion for that app. In this case, the system locks the active postbac
from the prior conversion and schedules them for transmission. AdAttributionsKit removes
postbacks from the prior conversions that you haven’t registered and replaces them with any
postbacks from the latest conversion.
AdAttributionsKit represents reengagement postbacks as reengagement in the postback’s
conversion-type field. For more information about the postback parameters, see Identifying t
parameters in a postback.
Important
The system doesn’t always produce postbacks after a reengagement. The device is subject to
reengagement limits on a monthly per-app basis, as well as a yearly per-device basis. The
parameter AdAttributionsKit appends to the URL is always present on the URL, however, even
if AdAttributionsKit doesn’t create reengagement postbacks.
Advertisers may attribute conversion values differently inside their app, depending on the
conversion type: install or reengagement. In iOS 18 and later, use updateConversion
Value(_:) to specify which types of postbacks to update. The system defaults to updating all
types of postbacks if you specify nil for the conversion types, or if you use an API that doesn’t
contain conversion types to update the conversion value, such as updateConversionValue(_
coarseConversionValue:lockPostback:).
Update postbacks by their conversion type


## Page 9

For example in an onboarding flow, an advertiser can attribute conversion values differently,
depending on whether the conversion is an install or a reengagement.
Devices can send a copy of the winning postback to the developer of the advertised app.
Developers opt in to receive the postback by specifying a server endpoint in their app’s informatio
property list. For more information about opting in and specifying the endpoint, see Configuring a
advertised app. The postback that developers receive is an exact copy of the winning postback
that the device sends to the ad network. The device sends the postback to developers at the sam
time it sends the winning postback to the ad network. To verify the postback, see Verifying a
postback.
AdAttributionKit records a maximum of 15 view-through ad impressions per publisher app before
discarding the oldest one. The recorded ad impressions may advertise various products, and are
each eligible to become pending attributions until they expire (after 24 hours).
Opt in to receive a copy of the winning postback
Limit the number of view-through ad impressions
from a publisher app
See Also
Essentials


## Page 10

Understanding AdAttributionKit and SKAdNetwork interoperability
Learn how attribution APIs interact to deliver ad impressions.
Presenting ads in your app
Render different ad styles in your app.
Identifying conversion values with conversion tags
Use conversion tags to identify and update specific postbacks when you have overlapping
conversion windows.


## Page 11

AdAttributionKit supplies a conversion tag along with the reengagement URL it provides to your
app when the system opens it as a result of a reengagement by someone. A conversion tag acts a
a bookmark that you can supply as an argument to the update conversion value method to
selectively update only the conversion corresponding to the specified conversion tag. You can us
this capability, for example, to distinguish between measurements you apply to conversions that
happen chronologically close to one another.
When the system opens your app as the result of an AdAttributionKit reengagement, it supplies th
conversion tag in the URL it passes to your app.
The system keys the value to the AdAttributionKitReengagementOpen key in the URL.
If this reengagement is of interest to you and you want to independently update it’s conversion
value, persist the conversion tag along with some internal identifier to help you identify the
conversion it belongs to.
Note
The internal identifier is for your own bookkeeping and has no role in the API.
Overview
Receive conversion tags during reengagement
opens
AdAttributionKit / Identifying conversion values with conversion tags
Article
Identifying conversion values with
conversion tags
Use conversion tags to identify and update specific postbacks when you have
overlapping conversion windows.


## Page 12

In iOS 18.4 and later, the PostbackUpdate structure can accept an optional String property
named conversionTag during initialization.
During the flow to update the postback conversion value, initialize the PostbackUpdate structu
with the requisite values and with the conversion tag of the conversion.
Call AdAttributionKit’s updateConversionValue(_:) method, passing in the Postback
Update instance initialized before.
If the framework finds a conversion with the specified conversion tag, it updates it with the values
you specify in the PostbackUpdate instance.
Note
If you don’t specify a conversion tag, AdAttributionKit updates the most recent conversion.
This is same behavior the framework implements prior to iOS 18.4.
Understanding AdAttributionKit and SKAdNetwork interoperability
Learn how attribution APIs interact to deliver ad impressions.
Presenting ads in your app
Render different ad styles in your app.
Receiving ad attributions and postbacks
Understand timeframes and priorities for ad impressions that result in ad attributions, and ho
impressions qualify for postbacks.
Selectively update conversion values with
conversion tags
See Also
Essentials


