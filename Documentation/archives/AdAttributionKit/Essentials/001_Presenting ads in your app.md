# 001_Presenting ads in your app.pdf

## Page 1

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


## Page 2

To respond to a click-through interaction and redirect a person to open or install the advertised
app, first display a UIEventAttributionView over your ad content. Once the ad receives a ta
call handleTap(). The system then records a click-through impression, and if the app specified
by the impression’s advertised item ID isn’t installed, the system launches the app’s product page
on the App Store or alternative marketplace according to the user’s preferences in Settings. If the
app is already installed, the system launches the app directly.
Record click-through impressions


## Page 3

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


