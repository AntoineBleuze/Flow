# Essentials.pdf

## Page 1

An App Clip is a lightweight version of your app that offers some of its functionality when and
where it’s needed, or gives people a way to try a demo version of your app. App Clips offer a
focused feature set, and are designed to launch instantly, protect user privacy, and preserve
resources. As a result, an App Clip comes with some limitations. Before you create your App Clip,
first review the technology available, and identify the functionality that makes a great App Clip.
Note
Your full app can offer multiple App Clip experiences, but you have to package them as a single
App Clip target. Additionally, the full app must include the same functionality as the App Clip.
To ensure a fast launch experience, App Clips must be small. Aim to keep your App Clip binary we
below the applicable limit:
iOS version
Maximum size of the uncompressed App Clip binary
iOS 15 and earlier
10 MB
iOS 16 and earlier
15 MB
iOS 17 and later
100 MB, with additional requirements and limitations (see below)
Overview
Keep your App Clip within size limitations
App Clips / Choosing the right functionality for your App Clip
Article
Choosing the right functionality for your
App Clip
Review frameworks available to App Clips and identify functionality that makes a
great App Clip.


## Page 2

On devices running iOS 17 and later, the uncompressed App Clip binary can be up to 100 MB in si
if you meet the following conditions:
The App Clip only supports digital invocations — for example, from your website or Spotlight
search.
The App Clip doesn’t support physical invocations such as App Clip Codes, QR codes, or NFC
tags.
People use your App Clip in situations where a reliable internet connection is likely; for example
at home.
Your App Clip doesn’t support iOS 16 and earlier.
Additionally, you can use the App Clip demo link that App Store Connect generates to use the 100
MB size limit and support physical invocations from App Clip Codes, NFC tags, and QR codes.
For more information, refer to Configuring App Clip experiences and Verify the size of your App
Clip.
If your App Clip needs to download additional assets; for example, if you offer a demo version of
your game; use Background Assets to download additional assets. For more information, refer to
Download additional assets.
App Clips make use of SwiftUI and UIKit, and have access to the same frameworks as your full ap
However, the following frameworks provide no functionality at runtime: App Intents, Assets Librar
Background Tasks, CallKit, CareKit Contacts, Contacts UI, Core Motion, EventKit, EventKit UI, File
Provider, File Provider UI, HealthKit, HomeKit, Media Player, Messages, Message UI, Nearby
Interaction, PhotoKit, ResearchKit, SensorKit, and Speech.
For most unavailable frameworks, using them in an App Clip doesn’t result in compile-time errors,
but their APIs return values that indicate unavailability, empty data, or error codes at runtime. For
example, HealthKit’s isHealthDataAvailable() returns false when you call it from an App
Clip.
App Clips can’t perform background activity. For example, they can’t make use of:
Background networking with URLSession
Functionality enabled by the Background Modes capability as described in Pushing background
updates to your App
The ability to maintain Bluetooth connections while the App Clip isn’t in use
Some frameworks are available to App Clips but offer only limited functionality, or using them
requires special consideration:
Advanced networking features and low-level networking APIs
Review available frameworks and APIs


## Page 3

Advanced networking features like Bonjour and low-level networking APIs like CFSocket or
POSIX functions aren’t available to App Clips. Instead, use URLSession or the Network
framework.
App extensions
App Clips can’t include app extensions, but they can include a widget extension to offer Live
Activities. For more information, refer to Offering Live Activities with your App Clip.
Core Telephony
Functionality provided by Core Telephony is available to App Clips. However, they can’t
provision cellular plan eSIMs or use functionality that carrier apps with suitable entitlements
use. For example, an App Clip can’t use CTCellularPlanProvisioning and CTCellula
PlanProvisioningRequest.
CloudKit
CloudKit isn’t available to App Clips in iOS 14 or 15. Starting with iOS 16, App Clips can read
their public iCloud database. However, App Clips can’t write data to a public database or use
private or shared containers. Additionally, they can’t use iCloud Documents or iCloud key-val
storage. To learn more about using CloudKit in your App Clip, refer to the Access your public
iCloud database section of Sharing data between your App Clip and your full app.
Face ID
App Clips can’t use Face ID because the NSFaceIDUsageDescription entitlement isn’t
available to them. However, you can use the Local Authentication framework to authenticate
people with Touch ID.
Note that App Clips may configure Wi-Fi networks using the Hotspot Configuration
Entitlement. Additionally, to connect to an authentication provider, they may initialize an ASWe
AuthenticationSession using init(url:callback:completionHandler:).
App Clips come with limitations that help to protect user privacy and prevent user tracking across
apps and App Clips, for example:
Functionality provided by SKAdNetwork isn’t available.
App Clips can’t request authorization to track a person with App Tracking Transparency.
Both name and identifierForVendor return an empty string.
App Clips can’t request continuous location access. However, you can call requestWhenInUs
Authorization() to request the When In Use authorization, which resets automatically the
next day at 4:00 a.m.
In iOS 17 and later, App Clips can request the Pass Type IDs Entitlement to read passes
stored in the Wallet app. On devices that run iOS 16 or earlier, where App Clips can’t read pass
Preserve user privacy


## Page 4

stored in the Wallet app, App Clips can add a pass to the Wallet app and check if this pass is
already present. For more information, refer to Checking Whether a Pass Is in the Library.
App Clips can’t share data with any other app except its corresponding full app. For more
information, refer to Sharing data between your App Clip and your full app.
To help protect user data, App Clips can’t access:
Apple Music and Media
Data from apps like Calendar, Contacts, Files, Health, Messages, Reminders, and Photos
Motion and fitness data
App Clips that aren’t demo versions of full apps provide an in-the-moment experience and focus 
offering the quickest possible solution to an everyday task, so some functionality works best in
your full app. If your App Clip offers an in-the-moment experience, reserve the following
functionality for the full app:
App extensions
Customization and settings, for example, creation of a settings bundle
Data handoff and document opening
In-app purchases
Low-level UNIX functionality, for example, BSD notifications
Multiple scenes on iPad
On-demand resources and Background Assets
Promoting other apps
Registration of custom URL schemes
Requests for reviews of the full app by using StoreKit’s requestReview(in:) method
Searching for paired Bluetooth devices
Configuring App Clip experiences
Reserve certain functionality for your full app
See Also
Essentials


## Page 5

Review how people launch your App Clip with invocation URLs, default and demo links, and
advanced App Clip experiences.
App Clips updates
Learn about important changes in App Clips.


## Page 6

People launch your App Clip by performing an invocation — for example, by scanning an App Clip
Code or tapping a Smart App Banner on a website. Upon launch, the App Clip receives an
invocation URL that determines what information appears on the App Clip card. To offer the best
launch experience for a person’s current context, use the invocation URL on launch to update the
UI of your App Clip.
To configure invocation URLs and the metadata that appears on the App Clip card, create the
required default App Clip experience in App Store Connect. For more advanced use cases — for
example, to associate an App Clip with a physical location or to create an App Clip for multiple
businesses — configure optional advanced App Clip experiences.
Important
In some cases, the App Clip doesn’t receive an invocation URL upon launch. Make sure to
handle this use case in your code. For more information on responding to invocations where
the invocation URL isn’t available, refer to Ensure your code handles all invocations.
The actual configuration of your App Clip experiences typically happens when you upload the firs
build that contains an App Clip to App Store Connect. However, it’s important to understand how
App Clip experiences work before you start developing your App Clip. Identify invocations and
invocation URLs, and plan changes to your code before or in parallel with the implementation of
your App Clip. Additionally, to support advanced App Clip experiences or iOS versions older than
iOS 16.4, you need to make changes to your server to associate your App Clip with your website.
Overview
Review how people invoke an App Clip
App Clips / Configuring App Clip experiences
Article
Configuring App Clip experiences
Review how people launch your App Clip with invocation URLs, default and demo
links, and advanced App Clip experiences.


## Page 7

People don’t search the App Store for an App Clip. They discover it when and where they need it,
and launch the App Clip by performing one of the following invocations:
Scanning an App Clip Code, NFC tag, or QR code at a physical location
Tapping a location-based suggestion from Siri Suggestions
Tapping a link in the Maps app
Tapping a Smart App Banner on a website in Safari or an app that uses SFSafariView
Controller
Tapping the action button of an App Clip card that appears in Safari or an SFSafariView
Controller (requires iOS 15 or later)
Tapping a link that someone shares in the Messages app (as a text message only)
Tapping an App Clip preview or link to an App Clip in another app (requires iOS 17 or later)
Tapping a link to an App Clip in an email or on a website
With each invocation, the system verifies whether the invocation URL matches the invocation URL
in App Store Connect. After it verifies the invocation, the system uses the invocation URL to
determine which App Clip experience to use for launching your App Clip. It then uses the App Clip
experience’s metadata to populate the App Clip card and passes the invocation URL to the App
Clip.
Important
When people install the corresponding app for an App Clip, the full app replaces the App Clip.
Every invocation from that moment on launches the full app instead of the App Clip. As a
result, the full app must handle all invocations and offer the same functionality that the App
Clip provides.
No matter which invocation method you want to support, you need to create a default App Clip
experience in App Store Connect. With a default App Clip experience, App Store Connect
Choose App Clip experiences you want to support


## Page 8

generates a default App Clip link that supports common invocations, without requiring any chang
to your server. For some App Clips, this default experience and the default App Clip link may be
enough to provide their functionality.
However, your App Clip might benefit from using a custom link for your default experience, or the
generated App Clip demo link. Additionally, depending on the functionality your app and App Clip
provide, you may need to configure advanced App Clip experiences in addition to the default App
Clip experience.
The following table shows the invocations each experience and link type supports:
Invocations and
URL constraints
Default App
Clip experience
with default link
Default App Clip
experience with
an associated
website
App Clip demo
link
Advanced
App Clip
experience
A Smart App
Banner or the App
Clip card on your
website
No
Yes
No
Yes, if you
associate you
website with
the App Clip.
A shared link to an
App Clip in the
Messages app
Yes
Yes
Yes, with a
limited preview.
Yes, if you
associate you
website with
the App Clip.
QR codes
Yes
Yes
Yes
Yes
NFC tags
Yes
Yes
Yes
Yes
App Clip Codes
No
No
Yes, if you use
the short
version of the
demo link.
Yes
Maps
No
No
No
Yes
Spotlight search
Yes, excluding
location-based
Spotlight
suggestions.
Yes, excluding
location-based
Spotlight
suggestions.
Yes, excluding
location-based
Spotlight
suggestions.
Yes
Another app that
uses Link
Presentation
Yes
Yes
Yes
Yes


## Page 9

Invocations and
URL constraints
Default App
Clip experience
with default link
Default App Clip
experience with
an associated
website
App Clip demo
link
Advanced
App Clip
experience
Another app that
uses Link or
open(_:
options:
completion
Handler:)
Yes
Yes
Yes
No
Supports URL
parameters
Yes
Yes
No
Yes
If you don’t have a website for your app or don’t want to support invocations that require an
associated website, configure the default experience and use the default link for your invocations
you support iOS 16.3 and earlier or want to support additional invocations, including showing an
App Clip card on your website, associate your website with your App Clip.
Important
Testing and using default and demo links requires your app and App Clip to pass App Store
review and to be available in the App Store. For more information on testing App Clips, see
Testing the launch experience of your App Clip.
You can use the generated demo URL to offer a demo version of your app that launches from
physical and digital experiences. Note that the demo URL doesn’t replace the default App Clip
experience. It allows you to use the default App Clip experience, support digital and physical
invocations, and create an App Clip with a larger uncompressed binary size. For more information
see Keep your App Clip within size limitations.
Configure an advanced App Clip experience if:
You want your App Clip to support all possible invocations on devices that run iOS 16.3 and
earlier.
You want to display a Smart App Banner and an App Clip card on an additional website that use
a different subdomain or domain.
You need to associate your App Clip with a physical location.
You create an App Clip for multiple businesses to use.


## Page 10

An App Clip always requires a corresponding full app, and you submit your App Clip binary togeth
with your full app’s binary to App Store Connect. After you’ve uploaded your full app to App Store
Connect, configure a default App Clip experience. Navigate to the page for the app version that
offers an App Clip, expand the App Clip section, and provide the following metadata for the App
Clip card:
A header image
Copy for the App Clip card’s subtitle
The call-to-action verb that appears on the Action button people tap to launch the App Clip
For your default App Clip experience, the invocation URL that’s available to the App Clip on launch
can be:
The default App Clip link that the system generates for you for your default App Clip experienc
The App Clip demo link that the system generates for you
The URL of the website you associated with the App Clip and that displays the Smart App
Banner and the App Clip card
The default App Clip link is a URL generated by Apple that invokes your App Clip without addition
setup on your server. They follow this URL scheme: https://appclip.apple.com/id?=
<bundle_id>&key=value. Instead of the <bundle_id> placeholder, your default App Clip lin
includes the bundle ID of your app. Optionally, it can include parameters you pass with the
invocation, represented as &key=value. For example, a default App Clip link from a QR code for 
coffee shop’s app might be https://appclip.apple.com/id?=com.example
.Clip&promotion=WWDC23. , using promotion as the key and WWDC23 as the value for the
launch parameters.
App Store Connect generates an App Clip demo link when you configure the default App Clip
experience. With the demo link, you can offer an App Clip that’s a demo version of your app. Its
uncompressed App Clip binary can be larger in size and supports all invocations, including physic
invocations. However, App Clip demo links can’t contain URL parameters.
Note
If you provide a task-oriented App Clip that helps people achieve a goal, often while they are
on-the-go and might experience slow internet connections, use the autogenerated default App
Clip link or a custom short invocation URL – which requires you to associate your App Clip with
your website. Reserve usage of the demo URL if you offer a demo version of your app.
Configure a default App Clip experience
Choose invocation URLs for your default experience


## Page 11

The default and demo App Clip links offer functionality without changes to your server. However,
associating your App Clip with your website and making changes to your server comes with
benefits: The website can display a Smart App Banner or the App Clip card. For example, a shop
might associate its App Clip with its website on https://example.com. To launch the App Clip, the
website displays a Smart App Banner at various locations, for example:
https://example.com/menu
https://example.com/contact
https://example.com/menu/breakfast
https://example.com/menu/lunch
The website also displays the App Clip card on https://appclip.example.com/, a dedicat
page that promotes the App Clip. Upon launch, the App Clip receives the website’s URL as the
invocation URL and displays the functionality in the App Clip that matches the URL — for example
the coffee shop’s lunch menu.
For additional information about associating your App Clip with your website, refer to Associating
your App Clip with your website.
The App Clip card is the first thing people see when they discover your App Clip, which makes the
App Clip card’s design especially important. To explore different imagery and text, and to test the
appearance on your device, use local experiences as described in Testing the launch experience o
your App Clip.
An effective App Clip card matches a person’s context. For example, a business with multiple
physical locations might display imagery that matches the person’s current location. Each physica
location might correspond to a different image and text on the App Clip card. However, it’s not
possible to programmatically change the content on the App Clip card. Instead, configure an
advanced App Clip experience in App Store Connect for each context that needs its own App Clip
card. You can choose text and imagery for each advanced App Clip experience.
You can also localize the text that appears on the App Clip card in App Store Connect. For more
information on localization, refer to Localize App Store Information.
Note
Keep the text that appears on the App Clip card short: Use up to 30 characters for the title and
up to 56 characters for the subtitle.
Customize the App Clip card
Configure advanced App Clip experiences


## Page 12

To support additional invocations (for example, from scanning an App Clip Code), create an
advanced App Clip experience in App Store Connect.
Important
If you’re using a URL with a different domain than the default App Clip link, make sure the
system can verify the association between your App Clip and the domain. For more
information, refer to Associating your App Clip with your website.
In App Store Connect, select your App, and then select the iOS app version for which you want to
add an advanced App Clip experience. Then, click Edit Advanced Experiences and create an
advanced App Clip experience. For more information, refer to Set up an App Clip experience in th
App Store Connect Help.
Important
To set up an advanced App Clip experience that appears in Apple Maps, create a place
association that connects the App Clip experience to a physical location. Apple Maps uses any
location data that you provide solely for matching an App Clip experience to an existing
location. If it can’t find a match, Apple Maps doesn’t use the provided location data.
In your Xcode project, add or modify code for both your App Clip and your full app to respond to
the new URL you registered. For more information, refer to Responding to invocations.
Consider the previous example for a coffee shop’s App Clip: It would use the default App Clip
experience with https://example.com because that’s the domain associated with the App Cl
In addition, it would use one advanced App Clip experience with https://example.com as its
invocation URL, and generate an App Clip Code for the advanced App Clip experience. In its code
the App Clip handles the invocation from an App Clip Code just like an invocation from Smart App
Banners, the App Clip card on a website, and the Messages app.
In general, try to register as few URLs as possible, and register generic URLs to take advantage o
URL prefix matching. Upon invocation, the system matches the invocation URL against URLs you
registered as part of your advanced App Clip experiences. The system then chooses the App Clip
experience with the URL that has the most specific matching prefix. This means that you can
register one URL to cover many cases.
Consider the example for a coffee shop. By registering one advanced App Clip experience with
https://example.com as its invocation URL, it’s possible to handle invocation URLs, for
example:
Take advantage of URL prefix matching


## Page 13

https://example.com/menu
https://example.com/contact
https://example.com/menu/breakfast
Upon launch, the App Clip receives a URL, then extracts path components and query parameters
and uses them to update its UI so that it corresponds to the URL and matches the person’s conte
If the coffee shop has multiple physical locations, its App Clip could use one advanced App Clip
experience for each location with a different header image, metadata, and invocation URL — for
example, https://example.com/location1, https://example.com/location2, and s
on. The App Clip could then, similar to the previous example, extract path components and query
parameters to update its UI for each App Clip experience.
For additional information, refer to WWDC20: Configure and Link Your App Clips.
An App Clip Code is immediately recognizable to people and lets them know that an App Clip is
available. The App Clip Code offers a fast and secure launch experience for your App Clip that
people trust. Although App Clip Codes are a great way to launch your App Clip, an App Clip Code
can only contain a limited amount of information in its visual code or NFC tag. If you plan to suppo
invocations from App Clip Codes, refer to Creating App Clip Codes and Encoding a URL in an App
Clip Code.
In some cases — for example, if you already use shortened URLs to deep link into your app — you
may want to launch your App Clip from a short URL in addition to a long URL. In other cases, you
may want to redirect from the short URL to a URL with a long path or many query parameters.
You may create both short and long URLs, as well as make URL redirects to launch App Clips.
However, you need to set up both the short URL and the long URL to invoke your App Clip. For
example, you may want to use https://some.subdomain.example.com/path/to/thing
query=1234 as the invocation URL for your App Clip and a shorter URL — for example,
https://appclip.example.com?id=1 — that redirects to the long URL. For the URL
forwarding to work, add both https://some.subdomain.example.com and
https://appclip.example.com to your list of associated domains. Make sure to place an
AASA file into the corresponding .well-known directory for each subdomain. Then, create App
Clip experiences for both URLs.
For additional information, refer to Associating your App Clip with your website and Supporting
associated domains.
Choose URLs to encode in an App Clip Code
Use short URLs or redirects


## Page 14

The App Store Connect website offers a convenient way to create and manage your default and
advanced App Clip experiences. However, if you need to manage a large number of App Clip
experiences, using the website may be too cumbersome. For example, say your App Clip allows
people to order food at a chain restaurant with dozens, hundreds, or even thousands of locations
For each location, you likely want to display imagery on the App Clip card for that specific
restaurant. As a result, you need to create an advanced App Clip experience for each location.
To help you create and manage a large number of App Clip experiences, use the App Store
Connect API to automate these tasks. For more information, refer to App Clips and App Clip
Experiences.
Choosing the right functionality for your App Clip
Review frameworks available to App Clips and identify functionality that makes a great App
Clip.
App Clips updates
Learn about important changes in App Clips.
Creating App Clip experiences using the App Store
Connect API
See Also
Essentials


## Page 15

Browse notable changes in App Clips.
Make a demo version of your app or game available as an App Clip.
Use the autogenerated demo URL to offer an App Clip that’s up to 100 MB in size and supports
physical invocations.
Download additional assets for your App Clip with Background Assets.
Accelerate updates
Learn about important changes to Accelerate.
Accessibility updates
Learn about important changes to Accessibility.
ActivityKit updates
Learn about important changes in ActivityKit.
Overview
June 2025
See Also
Technology updates
Updates / App Clips updates
Article
App Clips updates
Learn about important changes in App Clips.


## Page 16

AdAttributionKit Updates
Learn about important changes to AdAttributionKit.
App Intents updates
Learn about important changes in App Intents.
AppKit updates
Learn about important changes to AppKit.
Apple Intelligence updates
Learn about important changes to Apple Intelligence.
AppleMapsServerAPI Updates
Learn about important changes to AppleMapsServerAPI.
Apple Pencil updates
Learn about important changes to Apple Pencil.
ARKit updates
Learn about important changes to ARKit.
Audio Toolbox updates
Learn about important changes to Audio Toolbox.
AuthenticationServices updates
Learn about important changes to AuthenticationServices.
AVFAudio updates
Learn about important changes to AVFAudio.
AVFoundation updates
Learn about important changes to AVFoundation.
Background Tasks updates
Learn about important changes in Background Tasks.


