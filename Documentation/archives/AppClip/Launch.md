# Launch.pdf

## Page 1

A great launch experience that helps the user complete a task quickly is the key to a successful
App Clip. Upon launch, your App Clip needs to be aware of the user’s context and update its UI
accordingly. For example, an App Clip might provide functionality to order donuts from a local
donut shop with multiple physical locations. Instead of making the user select a location before
displaying the donut menu, the App Clip recognizes the user’s context and updates its UI
accordingly. The user doesn’t have to select a location, and can complete their task — ordering
donuts — with fewer taps.
To enable the App Clip to respond to the user’s context upon launch, the system makes the
invocation URL available to the App Clip. Configuring the launch experience of your App Clip and
choosing invocation URLs are key tasks when creating an App Clip. However, configuring
invocation URLs in App Store Connect isn’t enough to provide a streamlined launch experience.
You also need to add code to your App Clip that handles the invocation URL and updates its UI.
Both the App Clip and the full app need to respond to the invocation URL and update their UI to
help the user quickly complete their task at hand. Consider the example of a donut shop with
multiple physical locations. The user shouldn’t have to select the location that matches their
context before they can order pastries. Instead, the App Clip can make use of the invocation URL 
update its UI to display the shop’s menu right away. For example, use an invocation URL with
additional URL parameters that help the App Clip recognize the user’s context and update its UI:
1. If you don’t use the default App Clip link that App Store Connect generates for a default
experience, add entries for each domain that launches the App Clip to the Associated
Domains Entitlement. For the example described above, you add example.com. You
typically do this when you add an App Clip target to your Xcode project.
Overview
Leveraging the invocation URL
App Clips / Responding to invocations
Article
Responding to invocations
Add code to respond to invocations and offer a focused launch experience.


## Page 2

2. Use invocation URLs that contain additional parameters; for example, https://example
.com/location1, https://example.com/location2, and so on.
3. On launch, respond to the URLs by persisting any unsaved data in case the user switches from
one location to another. Then, update the UI to match the new location.
If you configure a generic URL, both your App Clip and your full app must always be able to handl
the URL, even if you only intend to use it as a prefix for your actual invocation URLs. For example,
you can register https://example.com/ as part of an advanced App Store experience. For th
actual invocations — such as in your App Clip Codes — you can use URLs like https://exampl
.com/location1 or https://example.com/location2. However, your App Clip and full ap
must also be able to handle https://example.com.
For additional information on associating your App Clip with your website and configuring
experiences, refer to Associating your App Clip with your website and Configuring App Clip
experiences.
To respond to an invocation, you need to access the invocation URL so your App Clip can tailor
itself to the experience. To access the URL, query the NSUserActivity object the system pass
to the App Clip upon launch. If a user installs the full app, it replaces the App Clip, and the system
launches it with each invocation. To offer the same functionality and provide an equivalent user
experience as the App Clip, the full app also needs to handle all invocation URLs. In most cases, it
makes sense to share the code that handles your URL between full app and App Clip, and also ha
the App Clip store state information in a shared container. This way, the full app can access any
data stored by the App Clip, and, upon launch, take the user to the part of the app that best
matches their context.
To access the NSUserActivity object on launch:
If you use the SwiftUI lifecycle, apply the onContinueUserActivity(_:perform:)
modifier. For additional information on implementing lifecycle callbacks for your SwiftUI app,
refer to Restoring your app’s state with SwiftUI.
If you use a scene-based lifecycle, implement the scene(_:willConnectTo:options:)
and scene(_:willContinueUserActivityWithType:) callbacks. On the first launch, th
system calls the scene(_:willConnectTo:options:) callback. If the app or App Clip is
suspended in memory and the user launches it, the system calls scene(_:willContinue
UserActivityWithType:).
If you use the UIApplicationDelegate object to respond to lifecycle events, be sure to
implement the application(_:continue:restorationHandler:) callback. Note that
you don’t have access to the NSUserActivity object in application(_:didFinish
LaunchingWithOptions:).
Access the invocation URL


## Page 3

On launch, confirm that the invocation is of type NSUserActivityTypeBrowsingWeb, then
access the URL that the system passes to the App Clip. The following code shows a function that
extracts components from the invocation URL:
For more information about responding to lifecycle events, refer to Managing your app’s life cycle
For general information on handling links, refer to Supporting universal links in your app.
To learn more about sharing data between the App Clip and the full app, refer to Sharing data
between your App Clip and your full app.
A fast, consistent user experience that fits the user’s context is key to the App Clip user
experience, and it’s why designing and configuring your App Clip experiences is so important. As 
result, spending time to write resilient code, handling all possible invocation URLs, and testing the
code is key. Make sure you guard against faulty data and handle the following scenarios:
Invocations from the Maps app and location-based suggestions from Siri Suggestions use the
URL you register for an App Clip experience as the invocation URL.
Invocations from Messages app or your website use the site’s URL as the invocation URL.
If a user returns to a previously launched App Clip from the App Library or Spotlight, the App C
uses the invocation URL that it previously used to launch the App Clip.
If a user returns to a previously launched App Clip from a notification or the App Switcher, the
App Clip launches without an invocation URL. To address this case, save the state of your App
Clip before the user leaves it, and restore the saved state if the invocation URL isn’t available
upon launch.
For more information on verifying invocation URLs, refer to Testing the launch experience of your
App Clip.
Ensure your code handles all invocations
See Also


## Page 4

Associating your App Clip with your website
Enable the system to verify your App Clip to support invocations from your website and
devices running iOS 16.3 or earlier.
Supporting invocations from your website and the Messages app
Display a Smart App Banner and the App Clip card on your website that people tap to launch
your App Clip, and add support for invocations from the Messages app.
Confirming a person’s physical location
Add code to quickly confirm a person’s physical location while respecting their privacy.
Launching another app’s App Clip from your app
Enable people to launch another app’s App Clip from your app with App Clip links and offer a
rich preview of it with the Link Presentation framework.
class APActivationPayload
Information that’s passed to an App Clip on launch.
NSAppClip
A collection of keys that an App Clip uses to get additional capabilities.
Launch


## Page 5

An App Clip gives people quick access to a particular workflow in your app, even when a person
hasn’t installed your app. NFC readers, App Clip Codes, or QR codes define an invocation URL tha
specifies which App Clip, or workflow within your full app, the system needs to run. If you want to
support invocations from your website or support iOS 16.3 and earlier, enable the system to verify
your App Clip. The system’s verification checks that the App Clip includes the URL in its code
signature as the Associated Domains Entitlement, which cites the invocation URL’s
domain. The system also verifies that the server of the domain agrees to launch the App Clip, by
citing the App Clip within an Apple App Site Association (AASA) file that it hosts.
Note
If you don’t support iOS 16.3 and earlier, don’t plan to support all invocations, and don’t have a
website to associate with your App Clip, you may be able to keep your invocations to the
default URL that App Store Connect generates. For more information, refer to Configuring App
Clip experiences.
Overview
App Clips / Associating your App Clip with your website
Article
Associating your App Clip with your
website
Enable the system to verify your App Clip to support invocations from your websit
and devices running iOS 16.3 or earlier.


## Page 6

To associate your app and App Clip with your website:
Specify your invocation URL’s domain within an Associated Domains Entitlement on
both your app and App Clip targets in Xcode.
Add or modify an AASA file on the domain’s server.
The system verifies that both the entitlement and the configuration in the AASA file match before 
permits the invocation of the App Clip. App Store Connect also verifies the match when you creat
an App Clip experience; for more information, refer to Set up an App Clip experience.
Tip
You may already be familiar with the Associated Domains Entitlement if your app
supports Handoff or universal links. If you’re new to using this entitlement and universal links,
read Allowing apps and websites to link to your content and Supporting universal links in your
app. For additional information about the Associated Domains Entitlement — including
cache policies — read Supporting associated domains.
To associate your App Clip with your website, you must add the Associated Domains
Entitlement to the app and the App Clip targets.
First, open your project in Xcode; then, in your project settings, enable the Associated Domains
capability to add the Associated Domains Entitlement.
Second, for each URL that launches your App Clip or full app, add its domain to the Associated
Domains capability using the pattern: appclips:<fully qualified domain>. For example,
add appclips:example.com or appclips:appclip.example.com. Make sure to only
include the desired subdomain and the top-level domain. Don’t include a trailing slash (/), wildca
(*), or path and query components in the URL. For more information, refer to Supporting
associated domains.
In addition to adding the Associated Domains Entitlement to your Xcode project, you nee
to make changes to your server to associate your App Clip with your server and allow the system 
verify the URL that tries to invoke your App Clip.
First, create an AASA file as described in Supporting associated domains. Next, add an entry for
the App Clip with the appclips key to the file.
The following code shows the content to add. Note how the value for the apps key is an array tha
contains the app identifier of the App Clip. In many cases, the array contains only one entry.
Add the Associated Domains entitlement
Make changes to your server


## Page 7

However, it can contain entries for multiple App Clips.
Important
For apps that detect App Clip Codes in AR, add an entry for the parent app identifier. For more
information, refer to Interacting with App Clip Codes in AR.
Then, add the AASA file to your website’s .well-known directory. If you previously added an
AASA file to your server, add the entry for the appclips key to the existing file.
Note
If you plan to use multiple invocation URLs with different domains, remember to add an AASA
file to each domain’s .well-known directory. In addition, remember to add each domain to
the Associated Domains Entitlement.
Finally, to make sure the system can validate the association between your App Clip and the AASA
file on your server, check your server’s configuration and make sure it allows AASA-Bot and
CFNetwork as user agents.
App Store Connect verifies the AASA file configuration of your App Clip after you’ve uploaded a
build to App Store Connect and created an App Clip experience. To check the verification status:
1. Open App Store Connect in your browser and navigate to a build’s details page.
2. Click View Status in the App Clip section to show the domain validation status. It shows the
validation status for each domain that’s associated with your App Clip.
For example, you could configure the default App Clip experience to use https://example.co
as its invocation URL and configure an advanced App Clip experience to use https://appclip
.example.com. In this example, you’d place an AASA file in the .well-known directories for
each URL’s domain, and App Store Connect would show the verification status for both domains.
Check the validation status of your App Clip


## Page 8

The Cache Status column shows the validation status for your App Clip as the system performs th
validation on people’s devices. As you develop your App Clip, you may make frequent changes to
your AASA file. To check the verification status in real time, click Load Debug Status in the modal
view that shows the verification status of your App Clip. If a configuration error occurs, App Store
Connect shows information about the error in the Debug Status column.
For more information, refer to WWDC20: What’s New in App Store Connect.
Responding to invocations
Add code to respond to invocations and offer a focused launch experience.
Supporting invocations from your website and the Messages app
Display a Smart App Banner and the App Clip card on your website that people tap to launch
your App Clip, and add support for invocations from the Messages app.
Confirming a person’s physical location
Add code to quickly confirm a person’s physical location while respecting their privacy.
Launching another app’s App Clip from your app
Enable people to launch another app’s App Clip from your app with App Clip links and offer a
rich preview of it with the Link Presentation framework.
class APActivationPayload
Information that’s passed to an App Clip on launch.
NSAppClip
A collection of keys that an App Clip uses to get additional capabilities.
See Also
Launch


## Page 9

When you create your App Clip, register a default App Clip experience. By creating a default App
Clip experience, you lay the foundation for supporting invocations from a Smart App Banner on
your website. This has an added benefit: If a person shares a link to your website in the Messages
app and the website displays a Smart App Banner, the recipient can tap the link to instantly launc
your App Clip.
Additionally, you can display the App Clip card on your website if a person’s device runs iOS 15 or
later. This makes your App Clip even more discoverable and reduces the number of taps required
launch your App Clip.
Overview
App Clips / Supporting invocations from your website and the Messages app
Article
Supporting invocations from your website
and the Messages app
Display a Smart App Banner and the App Clip card on your website that people ta
to launch your App Clip, and add support for invocations from the Messages app.


## Page 10

Note that the Smart App Banner only appears on your website if:
You associated your App Clip with the website where you want to display the banner.
You added the banner to your website’s source code.
You configured the default App Clip experience.
You published a version of your app that offers an App Clip.
A person opens the website in an SFSafariViewController or in Safari without Private
Browsing enabled.
With the App Clip card on your website, people don’t need to tap the Smart App Banner for the
card to appear. Alternatively, they can choose to view the website with the Smart App Banner
instead of launching the App Clip. Both Safari and an SFSafariViewController remember th
person’s decision and won’t display the App Clip card when they visit the site again.
Tip
Displaying an App Clip card in Safari on devices that run iOS 15 or later increases the
discoverability of your App Clip and reduces the number of taps required to launch the App
Clip. However, obscuring your website’s content with the App Clip card may not be ideal. In this
case, creating a dedicated page that displays the App Clip card in Safari and linking to it may
be a good option to guide people to launch your App Clip.
In most cases, the best time to add the Smart App Banner and the App Clip card to your website i
while you associate your App Clip with your website. Add both by including the following HTML
meta tag and replacing all placeholders with the appropriate values:
Add code to display the Smart App Banner and the App
Clip Card on your website


## Page 11

Note how the meta tag’s content attribute includes the app-clip-bundle-id, app-id, and
app-clip-display parameters. By including the app-id parameter, you enable the Smart Ap
Banner to open the full app on devices that run iOS 13 or earlier and on devices where Screen Tim
or a mobile device management (MDM) profile don’t allow App Clips. By including the app-clip
display parameter, you display the App Clip card in Safari or an SFSafariViewController o
devices running iOS 15 or later.
Tip
If you already display a Smart App Banner on your site, add the app-clip-bundle-id=app
ClipBundleID attribute to the existing meta tag for the Smart App Banner, and use the
bundle identifier of your App Clip for its value. To display the App Clip card on devices running
iOS 15 or later, also add the app-clip-display parameter.
Note that the value of a Smart App Banner’s app-argument attribute isn’t available to App Clips
When you add the meta tag to your webpage to support invocations from Safari or an SFSafari
ViewController, you automatically add support for invocations from links people share with
others in the Messages app. When a person shares a link to the website that displays the banner 
App Clip card, the recipient can tap the link to instantly launch your App Clip.
Tip
If people share the default App Clip URL or the App Clip demo URL in Messages, Messages
displays the App Clip card.
Sharing your App Clip in Messages requires that the recipient’s device:
Runs iOS 14 or later
Contains the sender as a contact in the Contacts app
If a person shares the link with someone else as an SMS, the recipient must opt to load the rich lin
before they can tap the preview to launch the App Clip.
Note
When a person taps a link to a website that displays the Smart App Banner in the Messages
app, the invocation URL of your App Clip opens in the default browser.
Support invocations from links people share in Messages


## Page 12

In addition to the above requirements, you must provide the preview image that appears in the
Messages app. To provide the preview image:
1. If your website doesn’t already contain the property=”og:image” HTML meta tag, add
<meta property=”og:image” content=”https://example.com/example.png”> t
each page that displays the Smart App Banner and the App Clip card.
2. Replace the value of the content attribute with the URL of the preview image. Typically, this is
the same image you use on the App Clip card. For additional information on displaying link
previews in Messages, see Best Practices for Link Previews in Messages.
To enable your App Clip or full app to respond to the invocation from a website that displays the
Smart App Banner or the App Clip card in Safari, retrieve the website’s URL upon invocation. Then
use the URL to update the interface of your App Clip to best match the content on the website. Fo
more information on accessing the invocation URL, see Responding to invocations.
Add the Smart App Banner and App Clip card to multiple
websites


## Page 13

In some cases, you may want to add the App Clip card and the Smart App Banner to several
websites where each site uses its own domain — for example, if your App Clip serves several
individual businesses. However, the default App Clip experience offers only one set of metadata. 
you want to display the Smart App Banner on multiple websites where tapping each website’s
banner displays a different App Clip card for your App Clip:
1. Add the meta tags for the Smart App Banner and App Clip card and for the link previews in the
Messages app to each website, for example, https://example.com, https://example2
.com, https://example3.com, and so on.
2. Associate each website with your App Clip as described in Associating your App Clip with your
website.
3. Configure the default App Clip experience for one website, likely for a more generic landing
page. When people launch the App Clip from the landing page, the App Clip could then allow
them to choose a business.
4. Create separate advanced App Clip experiences for https://example2.com,
https://example3.com, and so on, as described in Configuring App Clip experiences.
5. Use different metadata for each advanced experience you configure; for example, choose
custom imagery for the App Clip card.
6. Add code to handle the invocation of your App Clip and to update the interface of your App Clip
using the invocation URL — the URL of the website that displays the Smart App Banner or App
Clip card. For more information on accessing the invocation URL, see Responding to invocation
Important
Remember to associate each domain where you display the App Clip card and the Smart App
Banner with your App Clip as described in Associating your App Clip with your website.
To avoid associating your App Clip with multiple domains, consider using one domain and use UR
like https://example.com/business1 or https://example.com/business2. By using
one domain, you’ll only have to associate your app and App Clip with https://example.com
and configure an advanced App Clip experience for each URL.
Responding to invocations
Add code to respond to invocations and offer a focused launch experience.
See Also
Launch


## Page 14

Associating your App Clip with your website
Enable the system to verify your App Clip to support invocations from your website and
devices running iOS 16.3 or earlier.
Confirming a person’s physical location
Add code to quickly confirm a person’s physical location while respecting their privacy.
Launching another app’s App Clip from your app
Enable people to launch another app’s App Clip from your app with App Clip links and offer a
rich preview of it with the Link Presentation framework.
class APActivationPayload
Information that’s passed to an App Clip on launch.
NSAppClip
A collection of keys that an App Clip uses to get additional capabilities.


## Page 15

If you create an App Clip that people invoke at a physical location, you may need to confirm a
person’s location before allowing them to perform a task. For a quick launch and to preserve user
privacy, App Clips use a lightweight mechanism in which the system verifies that a person is at a
specific, expected location. When you adopt this mechanism, and when people allow it, the App
Clip card contains a note that tells people that the App Clip can verify their location. They can
disable location verification by tapping the note on the App Clip card.
To enable your App Clip to verify the person’s location, modify your App Clip’s Info.plist file:
1. Open your App Clip’s Info.plist, add the NSAppClip key, and set its type to Dictionary
Overview
Enable your App Clip to verify a person’s location
App Clips / Confirming a person’s physical location
Article
Confirming a person’s physical location
Add code to quickly confirm a person’s physical location while respecting their
privacy.


## Page 16

2. Add an entry to the dictionary with NSAppClipRequestLocationConfirmation as the ke
select Boolean as its type, and set its value to true.
Alternatively, open the Info.plist file in the property list editor and add the entry by selecting
App Clip from the list of keys. This adds the NSAppClip key and the following entries of type
Boolean to its dictionary: “Requests ephemeral user notifications” and “Requests location
confirmation.” Per default, the value for both entries is NO. Change the value for “Requests locatio
confirmation” to YES.
Note
Don’t add an entry for the NSAppClipRequestLocationConfirmation key to your full
app’s Info.plist — functionality to confirm a person’s location is only available to App Clips.
Instead, modify your full app’s code to request permission to access the location of a device
and make use of the Core Location framework. For more information, refer to Getting the
current location of a device.
After you modify your App Clip’s Info.plist file, add code to provide the expected physical
location information to the App Clip. To retrieve this information, encode an identifier in the URL
that launches the App Clip, and use the identifier to look up the location information for a busines
Add code that verifies the physical location


## Page 17

in your database. Alternatively, encode the location information in the URL that launches the App
Clip.
On launch, access the location information, use it to create a CLCircularRegion object with a
radius of up to 500 meters, and pass it to the confirmAcquired(in:completionHandler:
function.
The following code verifies a person’s location when they launch the App Clip. Make sure to upda
your user interface for each possible result, including the case where a person denies access to
location services on their device.


## Page 18

For more information on how you can access the App Clip’s invocation URL, refer to Responding t
invocations.
Responding to invocations
Add code to respond to invocations and offer a focused launch experience.
Associating your App Clip with your website
Enable the system to verify your App Clip to support invocations from your website and
devices running iOS 16.3 or earlier.
Supporting invocations from your website and the Messages app
Display a Smart App Banner and the App Clip card on your website that people tap to launch
your App Clip, and add support for invocations from the Messages app.
Launching another app’s App Clip from your app
Enable people to launch another app’s App Clip from your app with App Clip links and offer a
rich preview of it with the Link Presentation framework.
See Also
Launch


## Page 19

class APActivationPayload
Information that’s passed to an App Clip on launch.
NSAppClip
A collection of keys that an App Clip uses to get additional capabilities.


## Page 20

Starting with iOS 17, an app can launch another app’s App Clip using the invocation URL of the Ap
Clip. For example, if you develop several apps, your apps can launch your other apps’ App Clips t
allow people to use their functionality without requiring an app installation. Or, your app could offe
to launch another developer’s App Clip if your app offers workflows that involve usage of the othe
app. Depending on the App Clip and its invocation URL, choose from the following options to allow
people to invoke an App Clip from your app:
To display a rich preview and allow people to launch default or advanced App Clip experiences,
use the Link Presentation framework.
To allow people to launch a default App Clip experience that makes use of the autogenerated
default App Clip link, use Link or open(_:options:completionHandler:).
Use the Link Presentation framework to include a rich preview of the App Clip in your app that
people tap to launch the App Clip directly:
1. To fetch metadata using the invokation URL of the App Clip, use LPMetadataProvider.
2. To display the App Clip preview, use the metadata you receive in an LPLinkView.
The following example fetches the metadata and then passes it to a link view.
Overview
Display a preview of the App Clip
App Clips / Launching another app’s App Clip from your app
Article
Launching another app’s App Clip from
your app
Enable people to launch another app’s App Clip from your app with App Clip links
and offer a rich preview of it with the Link Presentation framework.


## Page 21

If the App Clip uses the default App Clip link for its default App Clip experience, you can display a
direct link that launches the App Clip. In a SwiftUI app, use Link as shown in the following examp
that displays a link to the Backyard Birds: Building an app with SwiftData and widgets app:
If you use UIKit, use open(_:options:completionHandler:) to allow people to invoke the
App Clip:
Display a direct link to an App Clip
See Also


## Page 22

Responding to invocations
Add code to respond to invocations and offer a focused launch experience.
Associating your App Clip with your website
Enable the system to verify your App Clip to support invocations from your website and
devices running iOS 16.3 or earlier.
Supporting invocations from your website and the Messages app
Display a Smart App Banner and the App Clip card on your website that people tap to launch
your App Clip, and add support for invocations from the Messages app.
Confirming a person’s physical location
Add code to quickly confirm a person’s physical location while respecting their privacy.
class APActivationPayload
Information that’s passed to an App Clip on launch.
NSAppClip
A collection of keys that an App Clip uses to get additional capabilities.
Launch


## Page 23

When users launch an App Clip, the platform passes an activation payload to the App Clip as part
of an NSUserActivity object. When the App Clip receives the payload, confirm the user’s
physical location at the time of the invocation.
For more information, see Responding to invocations.
var url: URL?
The URL of the link that launched the App Clip.
func confirmAcquired(in: CLRegion, completionHandler: (Bool, (any Error
)?) -> Void)
Checks whether an App Clip invocation happened at an expected physical location.
Overview
Topics
Passing data to the App Clip
Confirming a person’s physical location
App Clips / APActivationPayload
Class
APActivationPayload
Information that’s passed to an App Clip on launch.
iOS 14.0+
iPadOS 14.0+
Mac Catalyst 14.0+


## Page 24

let APActivationPayloadErrorDomain: String
A string that identifies the activation payload’s error domain.
struct APActivationPayloadError
An error that an App Clip activation payload returns.
enum Code
Error codes that an App Clip activation payload returns.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCoding
NSCopying
NSObjectProtocol
NSSecureCoding
Responding to invocations
Add code to respond to invocations and offer a focused launch experience.
Understanding errors
Relationships
Inherits From
Conforms To
See Also
Launch


## Page 25

Associating your App Clip with your website
Enable the system to verify your App Clip to support invocations from your website and
devices running iOS 16.3 or earlier.
Supporting invocations from your website and the Messages app
Display a Smart App Banner and the App Clip card on your website that people tap to launch
your App Clip, and add support for invocations from the Messages app.
Confirming a person’s physical location
Add code to quickly confirm a person’s physical location while respecting their privacy.
Launching another app’s App Clip from your app
Enable people to launch another app’s App Clip from your app with App Clip links and offer a
rich preview of it with the Link Presentation framework.
NSAppClip
A collection of keys that an App Clip uses to get additional capabilities.


## Page 26

Name
App Clip
Type
Object
NSAppClipRequestEphemeralUserNotification
A Boolean value that indicates whether an App Clip can schedule or receive notifications for 
limited amount of time.
Name: Requests ephemeral user notifications
NSAppClipRequestLocationConfirmation
A Boolean value that indicates whether an App Clip can confirm the user’s location.
Name: Requests location confirmation
Details
Topics
Scheduling and Receiving Temporary Notifications
Verifying Location
Bundle Resources / Information Property List / NSAppClip
Property List Key
NSAppClip
A collection of keys that an App Clip uses to get additional capabilities.
iOS 14.0+
iPadOS 14.0+


