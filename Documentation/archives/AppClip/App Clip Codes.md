# App Clip Codes.pdf

## Page 1

An App Clip Code is immediately recognizable to users and lets them know an App Clip is availabl
The App Clip Code offers a fast and secure launch experience for your App Clip that users trust.
The visual design of an App Clip Code encodes your App Clip’s invocation URL. Optionally, you ca
embed an NFC tag that also encodes the invocation URL. An App Clip Code with an embedded
NFC tag is called an NFC-integrated App Clip Code, while a code without an NFC tag is called a
scan-only App Clip Code.
The image at the center of an App Clip Code icon lets users know how to interact with the code. I
they discover an NFC-integrated App Clip Code, they hold their device close to the code or scan 
with the NFC Tag Reader in Control Center to launch your App Clip. They can also scan an NFC-
Overview
App Clips / Creating App Clip Codes
Creating App Clip Codes
Help users discover your App Clip by using an NFC-integrated or scan-only App
Clip Code.


## Page 2

integrated App Clip Code with the Camera app or the Code Scanner in Control Center. If they
discover a scan-only App Clip Code, they scan it with the Camera or the Code Scanner in Control
Center to launch your App Clip.
In addition to providing a great launch experience for your App Clip, you can also use an App Clip
Code to offer a context-aware augmented reality experience. For more information, see Interactin
with App Clip Codes in AR.
Note
Scanning App Clip Codes requires a device that runs iOS 14.3 or later.
Creating an App Clip Code requires the following tasks:
1. Choosing an invocation URL and configuring an advanced App Clip experience in App Store
Connect. To learn more, see Configuring App Clip experiences.
2. Choosing the type (scan-only or NFC-integrated), colors, and design of your App Clip Code. Fo
design guidance, see Human Interface Guidelines > App Clips > App Clip Codes.
3. Generating App Clip Codes with App Store Connect or with the App Clip Code Generator
command-line tool. For more information, see Pick a tool to create App Clip Codes below.
4. Printing App Clip Codes yourself or with the help of a professional printing service — for
example, RR Donnelley. For printing guidance, see Human Interface Guidelines > App Clips >
Printing Guidelines and Preparing multiple App Clip Codes for production.
For more information, see Encoding a URL in an App Clip Code.
App Clip Codes always use the design Apple provides to ensure users instantly recognize them.
You can create an App Clip Code by selecting an advanced App Clip experience in App Store
Connect or by installing the App Clip Code Generator command-line tool. Both have similar
features and it’s up to you to pick the tool that best fits your needs.
Consider using App Store Connect if:
You’ve already created an advanced App Clip experience in App Store Connect.
You prefer an instantaneous preview while you experiment with colors.
You’re comfortable using a tool that offers a more visual interface compared to a command-lin
tool.
Consider using the App Clip Code Generator command-line tool if:
Pick a tool to create App Clip Codes


## Page 3

You haven’t created an advanced App Clip experience in App Store Connect — for example,
during development of your App Clip.
You need to create a lot of App Clip Codes and want to automate their creation with a script.
You’re comfortable using a command-line tool.
For more information, see Creating App Clip Codes with App Store Connect and Creating App Clip
Codes with the App Clip Code Generator.
Note
You must be enrolled in the Apple Developer Program before you can download the App Clip
Code Generator. For information about the Apple Developer Program, see How the Program
Works.
Creating App Clip Codes with App Store Connect
Select one or more advanced App Clip experiences in App Store Connect and create App Cl
Codes for users to scan to launch your App Clip.
Creating App Clip Codes with the App Clip Code Generator
Use the App Clip Code Generator command-line tool to verify your code’s colors, get color
suggestions, and create App Clip Codes.
Encoding a URL in an App Clip Code
Choose an invocation URL for your App Clip Code that you can encode efficiently.
Preparing multiple App Clip Codes for production
Prepare your App Clip Codes to send to a professional printing service.
Interacting with App Clip Codes in AR
Topics
App Clip Code creation
See Also
App Clip Codes


## Page 4

Display content and provide services in an AR experience with App Clip Codes.


## Page 5

Creating an App Clip Code involves the following key tasks:
Choosing invocations to support
Choosing invocation URLs to use in your App Clip Code
Setting up advanced App Clip experiences
Although App Clip Codes are a great way to launch your App Clip, an App Clip Code can only
contain a limited amount of information in its visual code or NFC tag. At the same time, it’s
important you choose invocation URLs with additional parameters or attributes that lead to the be
possible launch experience for users. This additional information could make your invocation URL
too long to encode.
When you create an App Clip Code, you need to find the best tradeoff between the limited capac
to store information in the App Clip Code and the need to encode more information. Therefore,
choosing the right URLs to launch your App Clip from an App Clip Code is important.
Users launch your App Clip with an invocation; for example, by tapping a link in the Messages app
by scanning a QR code, or by scanning an App Clip Code. To support invocations from App Clip
Codes:
App Clip demo URL
You don’t have to associate your App Clip with your website or create an advanced App Clip
experience to use the App Clip demo URL in an App Clip Code. However, you can’t use launc
parameters with the demo URL.
default App Clip URL
Overview
Review App Clip experiences and invocation URLs
App Clips / Encoding a URL in an App Clip Code
Article
Encoding a URL in an App Clip Code
Choose an invocation URL for your App Clip Code that you can encode efficiently


## Page 6

You can’t use the default App Clip URL in your App Clip Code.
advanced App Clip experiences
Create at least one advanced App Clip experience and associate your App Clip with your
website to enable the system to verify your App Clip upon launch. For more information, see
Associating your App Clip with your website.
When you create an advanced App Clip experience, use a custom URL for your default App Clip
experience and your advanced App Clip experiences. For example, create a default App Clip
experience that uses https://example.com as its invocation URL, and one advanced App Clip
experience. The advanced experience’s registered invocation URL might be https://appclip
.example.com, and takes advantage of prefix matching.
When you use the advanced App Clip experience, you support invocations from QR codes, NFC
tags, and App Clip Codes. These invocations use https://appclip.example.com as their U
prefix and encode additional information with URL path components or queries. For example, you
can encode https://appclip.example.com/shop?p=123&p1=ab in an App Clip Code.
For more information, refer to Configuring App Clip experiences.
In general, the invocation URL encoded in an App Clip Code follows the same pattern as other
URLs: https://[host][/<path>][?<query>][#<fragment>]. However, the URL encode
in an App Clip Code must meet additional requirements:
The invocation URL must use the https scheme in lowercase.
The host segment is the invocation URL’s authority component and can only contain the
lowercase ASCII characters a to z, ., and -.
The invocation URL may have zero or more path and query components, followed by an option
fragment. They can use the following ASCII characters: a to z, A to Z, 0 to 9, and /#?
=%-._,+;:&.
An App Clip Code can only contain a limited amount of information, and as a result, the tools you
use to create the code compress the encoded invocation URL. The underlying encoding algorithm
can encode some words efficiently, while some characters may reduce the algorithm’s efficiency.
As a result, the exact length of an invocation URL you can encode in an App Clip Code varies base
on the ASCII characters and words you use.
When you create an App Clip Code, both App Store Connect and the App Clip Code Generator
command-line tool inform you if your invocation URL is too long.
To ensure you can encode your invocation URL in an App Clip Code:
Choose a valid invocation URL
Follow practices that allow for efficient encoding


## Page 7

Use the minimum number of characters you need to uniquely identify a resource. Long unique
identifiers (UUIDs) lower the effectiveness of the encoding.
Use a short host name with as few subdomains as possible.
If possible, remove the www subdomain from your host name.
Use decimal numbers as values for query components.
Replace long query string argument names and values with short strings. For example, use
https://example.com/?p=0 instead of https://example.com/?status=view.
Omit a trailing slash (/) character at the end of the URL. For example, use https://example
.com instead of https://example.com/.
Optionally, you can use the special subdomain appclip to define URLs specific to App Clip Code
for example, https://appclip.example.com. The algorithm that generates App Clip Codes
encodes this subdomain more efficiently than others. Choosing appclip as a subdomain also
allows URLs to have short path and query components by eliminating the possibility of conflicts
with an unrelated functionality of your website. If you use this subdomain, it must appear as the
first subdomain of the URL’s host.
If possible, don’t use any path components at all. However, if you must use them, choose from the
list below so the algorithm that creates the App Clip Code can encode the path components more
efficiently. For example, you might use https://example.com/brand.
Always use the fewest possible path components.
about, access, account, add, app, archives, article, attraction, author
bag, biz, book, brand, brands, browse, buy
cancel, cart, cat, catalog, category, categories, channel, charts, checkin, checkout, collection,
collections, company, compare, connect, contact, content, contents, cost, coupons, create
data, demo, destinations, detail, discover, download
entry, event, events, explore
faq, fetch, finance, find, food, fund
game, gift, goods, guide
health, help, home, hotel, hotels
Use a separate subdomain
Choose a single-word path component


## Page 8

id, index, info, item, item_id
join
lifestyle, list, listen, live, local, location, locations, locator, login
manage, menu, more, music
name, news, note, open
order, overview
park, part, pay, payment, payments, play, post, posts, preview, product, product_id, products,
profile, promotion, purchase
rate, recipe, recipes, reservation, reservations, reserve, retail, review, rewards
sale, scan, schedule, search, sell, send, service, share, shop, show, showtime, site, song,
special, stations, status, store, store-locator, stores, stories, story
tag, tags, terms, tickets, tips, title, today, top, topic, tours, track, transaction, travel, try
update, upload, use, user
vehicles, video, view, visit
watch, wiki
Note that the words in the list above don’t lead to more efficient encoding if you use them as a
subdomain or query parameter.
If you use no path component, or a single-word path component from the above list of special
words and query components, use the special ordered argument names p, p1, p2, p3, and so on
Doing so increases the likelihood of the URL fitting in an App Clip Code. For example, instead of
https://appclip.example.com/shop?a=123&b=456&c=789, use https://appclip
.example.com/shop?p=123&p1=456&p2=789.
In some cases, you may need to pass long query strings to the App Clip upon launch that result in
URL that’s too long to encode in an App Clip Code. In this case, you can use a hashing algorithm t
shorten the long query string. Upon launch, your app and App Clip can then expand the hash bac
to the long query string and use it to update their UI.
Use ordered argument names for query components
Hash long URLs
Reuse existing URLs


## Page 9

You may want to reuse URLs you previously created for other purposes in your App Clip Codes; fo
example, if you created your own tool to create short URLs for use in QR codes. If you do so, you
also need to:
Register each domain that can launch your App Clip in the list of associated domains.
Set up the AASA file for each domain you use.
Configure advanced App Clip experiences for both the short and long URLs.
For more information, refer to Configuring App Clip experiences.
Creating App Clip Codes
Help users discover your App Clip by using an NFC-integrated or scan-only App Clip Code.
Preparing multiple App Clip Codes for production
Prepare your App Clip Codes to send to a professional printing service.
Interacting with App Clip Codes in AR
Display content and provide services in an AR experience with App Clip Codes.
See Also
App Clip Codes


## Page 10

After you create your App Clip Codes, you can print them yourself, or work with a professional
printing service — for example, RR Donnelley. However, if you have a lot of App Clip Codes, printin
them yourself doesn’t scale well, and you’ll have more success working with a professional printin
service.
Because you can’t see which invocation URL your App Clip Code contains just by looking at it, you
need to keep track of your SVG files and their corresponding URLs. Careful file management,
versioning, and change tracking are key to avoiding faulty print runs.
For additional information, see Human Interface Guidelines > App Clips > Printing Guidelines.
In general, it’s up to you to decide how to keep track of changes and which SVG files map to whic
invocation URLs. In most cases, a mapping file that uses the comma-separated values (CSV) file
format is the preferred option.
To reduce the risk of human error and simplify change tracking, consider using a single mapping
file to create your SVG files before sending them to a printing service.
If you’re working with RR Donnelley to produce App Clip Codes:
Create a ZIP file that contains the SVG files for your App Clip Codes and the mapping file in its
root folder.
The mapping file must be a CSV file with one field named SVG File Name and another name
URL, with each row representing one App Clip Code.
Overview
Map SVG filenames to invocation URLs
App Clips / Preparing multiple App Clip Codes for production
Article
Preparing multiple App Clip Codes for
production
Prepare your App Clip Codes to send to a professional printing service.


## Page 11

The ZIP file may contain up to 10,000 SVG files, and the mapping file may contain up to 10,000
corresponding entries.
The maximum length for any filename (ZIP file, SVG files, or mapping file) is 188 characters.
The following code shows the contents of a mapping file with entries for two App Clip Codes:
Creating App Clip Codes
Help users discover your App Clip by using an NFC-integrated or scan-only App Clip Code.
Encoding a URL in an App Clip Code
Choose an invocation URL for your App Clip Code that you can encode efficiently.
Interacting with App Clip Codes in AR
Display content and provide services in an AR experience with App Clip Codes.
See Also
App Clip Codes


## Page 12

The sample app Seed Shop provides gardeners with previews of fully grown plants. At the nursery
Seed Shop identifies the plant from an App Clip Code on a seed packet, and displays the adult
plant in 3D. With the help of AR, the buyer can see, for example, the real height of a typical
Mammoth sunflower by inspecting the virtual plant at scale, relative to real objects in the camera
feed.
Overview
App Clips / Interacting with App Clip Codes in AR
Sample Code
Interacting with App Clip Codes in AR
Display content and provide services in an AR experience with App Clip Codes.
Download
iOS 14.5+
iPadOS 14.5+
Xcode 12.5+


## Page 13

When a user with a device running iOS & iPad OS 14.3 or later scans the seed packet’s App Clip
Code with their camera or Code Scanner, the sample project’s App Clip provides a virtual image o
the plant.
If the user indicates they may buy a particular plant in the App Clip experience, Seed Shop
suggests the user download the full version of the app to preview the plant in their own garden.
This sample project builds the App Clip Code provided on the seed packet at the garden store,
allowing the user to view an AR version of the plant before purchase.
To configure Seed Shop for code signing, first set a development team on each target. Define a
unique bundle ID for the targets, and set the App Clip’s parent application identifiers entitlement.
Next, set the hostname for the App Clip experience URL in the Associated Domains entitlement.
The process of setting the hostname requires an explicit App ID, provided by a development team
member with Admin permission. For more information on setting a development team, bundle ID,
and entitlements, see Creating an App Clip with Xcode.
Run the following command to generate an App Clip Code from the App Clip Code Generator:
To add the sample’s App Clip Codes to the environment, you can display them on another device 
print them out. For more on creating App Clip Codes, see Creating App Clip Codes.
The App Clip Codes in Seed Shop display on a package of seeds. Add this image of a seed packe
to your physical environment by displaying it on another device or printing it out.
Note
You must set the run destination to an actual device. The Simulator doesn’t support
augmented reality.
In viewDidLoad, the sample app calls supportsAppClipCodeTracking to check if the devic
contains the Apple Neural Engine (ANE), which App Clip Code tracking requires.
Configure the Sample Code Project
Ensure Device Support and Run a Session


## Page 14

To search the environment for physical codes, the sample sets appClipCodeTrackingEnable
to true before running the session.
When the user points the device at an App Clip Code using the camera or Code Scanner, the
system launches its associated App Clip, or if present, the full app.
In the AR experience, the sample code checks the NSUserActivity invocation URL to identify
the App Clip Code that invoked the app or App Clip.
The source of the URL depends on how the App Clip launched:
The invocation URL is the _XCAppClipURL scheme environment variable when Xcode launche
the app or App Clip. For more information, see Testing Your App Clip’s Launch Experience.
The invocation URL is the invoking App Clip Code’s URL when the system launches the app or
App Clip in the device’s camera feed or through the Code Scanner.
There may be multiple App Clip Codes visible in the camera feed that share the same url; for mo
information, see ARAppClipCodeAnchor.
If an app interacts with a single App Clip Code, the app can limit its interaction with App Clip Code
that encode the invocation URL. For simplicity, the sample allows the user to scan any associated
App Clip Code. However, because the sample app downloads custom assets over the web per Ap
Clip Code, the sample app begins downloading assets for the invocation URL immediately, in
anticipation that ARKit will recognize the invoking App Clip Code in the camera feed.
The device may pan away from the App Clip Code that launched the experience in the time it take
for the system to transition from the camera or Code Scanner to the app or App Clip. In the event
ARKit doesn’t immediately find the App Clip Code in the camera feed, the sample app displays tex
instructing the user what to do.
Identify the App Clip Code that Launched the Experience
Guide the User with Messaging


## Page 15

During development, the sample project can launch the App Clip target in Xcode to test the AR
experience. After the target launches once, the device scans the test App Clip Code with Code
Scanner to invoke the App Clip.
Note
Control Center disables Code Scanner by default. Open Control Center Settings on the device
and click the “+” button to enable Code Scanner.
To associate an App Clip Code to the App Clip during development, Seed Shop sets up an App Cl
local experience. The sample app requires a local experience URL prefix of https://develope
.apple.com, and a bundle ID of com.example.apple-samplecode.AppClipCodes
ExampleApp1.Clip.
For more on local experiences, see Testing Your App Clip’s Launch Experience.
At runtime, the system checks the App Clip registry in App Store Connect to ensure an App Clip
associates to an App Clip Code before allowing the app access to the App Clip Code URL. For mo
information, see url.
To decode App Clip Code URLs, Seed Shop sets up an App Clip experience in App Store Connect
and defines the App Clip experience URL of https://developer.apple.com. The value of th
App Clip experience URL maps to a server that’s unique and depends on the development team.
For more information, see Set up an App Clip experience.
The app generates App Clip Codes that associate to the App Clip experience in App Store Connec
by uploading a CSV file containing the App Clip Code URLs. The fully qualified domain name of
each URL matches the App Clip experience URL. The URL suffix identifies the context-specific
items or locations with which the App Clip interacts. The sample app identifies a seed packet for a
sunflower. To create an App Clip Code for the sunflower, the sample requires a CSV file containing
the URL:
Launch the App Clip in Code Scanner
Set Up an App Clip Experience in App Store Connect


## Page 16

When testers view App Clip Codes to launch the App Clip or decode ARAppClipCodeAnchor
URLs in an AR experience, the framework refers to the device’s local experience. Otherwise, the
system displays the App Clip card in the device camera, and allows ARAppClipCodeAnchor UR
decoding, only for App Clip experience URLs of app-review approved App Clips. For more
information, see Test an App Clip Experience.
Important
During testing in the TestFlight app, the three experience URLs in App Store Connect’s
TestFlight area change the invocation URL the system passes into the App Clip, but they don’t
affect ARAppClipCodeAnchor URL decoding.
App Store Connect allows an app to define a particular App Clip experience URL if the server
hosting the URL’s domain approves of it via Apple App Site Association. In addition, the framewor
performs an equivalent runtime check before allowing the App Clip or parent app to decode ARAp
ClipCodeAnchor URLs that are within the App Clip experience’s domain. This check occurs for
local and App Store Connect experiences. To express approval, the server provides the App Clip’s
and parent app’s fully qualified application identifiers in an Apple App Site Association (AASA) file
appclips node.
Seed Shop requires the AASA file that the Apple Developer website hosts at
https://developer.apple.com/.well-known/apple-app-site-association. Navigate the URL in Safari
and inspect its appclips node to see the sample app’s AASA configuration.
The sample project enables the Associated Domains capability on both targets. The key’s value is
the fully qualified domain of the sample project’s App Clip experience URL.
Configure the Server and Targets for App Site Association


## Page 17

For more on configuring AASA for App Clips, see Associating Your App Clip with Your Website.
When ARKit recognizes an App Clip Code in the camera feed, it instantiates an ARAppClipCode
Anchor and passes it to the session:didAdd:anchors: callback. Since the user succeeded 
scanning a code, the sample app hides the instructional text.
Access the anchor’s URL for context-specific information about the recognized App Clip Code. T
URL is nil until the anchor’s urlDecodingState is decoded. To check for decoding state
changes, the sample app monitors the session:didUpdate:anchors: callback.
If Seed Shop fails to decode the URL, the sample project uses a test URL.
For more on URL decoding failure, see failed.
Note
The sample project bundles seed packaging material that displays App Clip Codes, but an app
might situate App Clip Codes differently. For detailed guidance on displaying App Clip Codes in
the environment, see App Clip Code Human Interface Guidelines.
Recognize an App Clip Code and Decode the URL


## Page 18

When ARKit decodes an App Clip Code’s URL, the sample app parses the URL suffix to get the
product name.
The app implements a custom URL mapping system using the project’s modelURLFor dictionary
Each dictionary key is an App Clip Code’s URL suffix, and the value represents the seed packet’s
corresponding grown plant 3D asset.
The sample app downloads the asset and prepares the 3D model using the mapped contentUR
The sample project’s URL mapping system includes an image of the product’s packaging materia
on which to place the product’s 3D model in the environment.
ARKit estimates the 3D position and orientation of each ARAppClipCodeAnchor, but ARImage
Anchor serves as a better platform on which to place virtual content for several reasons:
Small physical size impacts ARKit’s tracking accuracy, and App Clip Codes typically run small o
product packaging or in an advertisement.
Retrieve a Product’s 3D Model
Search for Product Packaging


## Page 19

ARKit manages the removal of App Clip Code anchors from the session whereas the app
controls whether to remove an image anchor. As a result, the image anchor is less likely to go
away.
Important
An app may require another content anchoring technique, such as placing virtual content
instantly after retrieving a position on a nearby horizontal or vertical plane. To ray cast on
horizontal planes, see Placing Objects and Handling 3D Interaction.
To search the environment for the product’s packaging image, the sample downloads the image
that the mapping URL references and then creates an ARReferenceImage.
For more information about image tracking, see Tracking and Altering Images.
When the user pans the device from the scanned App Clip Code to its downloaded packaging
image, ARKit identifies the seed packet’s real-world location and displays the full-grown plant on
top.
Display the 3D Asset


## Page 20

When ARKit recognizes the packaging image, the session creates an image anchor and passes it
into the session:didAdd:anchors: callback. The app displays the virtual product on top of t
image by calling its present(_:on) function.
As the user views the virtual plant, the App Clip waits for the user to scan another seed packet.
During this time, the App Clip can provide information about the features of the full app. For
example, the Seed Shop App Clip might offer the user the ability to download the full app to
preview the full-grown plant in their garden. For recommendations about showcasing an app in an
App Clip, see App Clip Human Interface Guidelines.
Creating App Clip Codes
Help users discover your App Clip by using an NFC-integrated or scan-only App Clip Code.
Encoding a URL in an App Clip Code
Choose an invocation URL for your App Clip Code that you can encode efficiently.
Preparing multiple App Clip Codes for production
Prepare your App Clip Codes to send to a professional printing service.
See Also
App Clip Codes


