# Essentials.pdf

## Page 1

This sample code project demonstrates how a web browser app uses BrowserEngineKit and
XPC to communicate with its alternative browser engine over XPC, and implement a browser UI.
The workspace contains four targets that define components of the browser app:
BrowserExample contains the main app that presents the UI.
RenderingExtension contains the rendering extension that the app uses to play media and
render complex views.
NetworkingExtension contains the networking extension that the app uses to fetch data
from remote websites.
WebContentExtension contains the web content extension that the app uses to parse HTM
content and compile code just-in-time.
For more information on how these targets work together to support a custom web browser engin
see Designing your browser architecture.
To build a web browser that uses an alternative browser engine, including the one in this sample
project, apply for the entitlements from Apple. The entitlement request process varies by region:
European Union
See Using alternative browser engines in the European Union.
Overview
Configure the sample code project
BrowserEngineKit / Developing a browser app that uses an alternative browser engine
Sample Code
Developing a browser app that uses an
alternative browser engine
Create a web browser app and associated extensions.
Download
iOS 17.4+
Xcode 15.3+


## Page 2

Japan
See Using alternative browser engines in Japan.
For more information on which entitlements to use, see Creating browser extensions in Xcode.
To build the sample code project for a device, you must target an iPhone that supports the arm64
instruction set. The project doesn’t support iPad.
When someone using the browser app opens a new tab, the browser app’s BrowserPage create
a TabContentView to display the tab’s contents, which gets its data from the tab’s TabView
Model.
The TabViewModel‘s webView property is a WebView that displays the tab’s contents, which th
TabContentView wraps in a WebViewRepresentable to display using SwiftUI.
The WebView’s initializer creates a WebContentView, which is the view that renders the HTML
document in the tab. WebContentView calls launchProcesses(id: PageID), which does
the following:
Creates a new web content extension process to render the web content, and set up an XPC
connection between the browser app and the web content process.
Open a new tab


## Page 3

Gets a connection to the single rendering-extension process, launching it if necessary.
Asks the rendering process to create an anonymous XPC connection and sends an endpoint fo
the connection to the browser app.
Repeats steps 2-3 for the single networking extension process, so that the browser app has an
anonymous XPC connection endpoint for the networking process.
Sends a bootstrap message to the web-content process, handing it the endpoints to the other
two extension processes, so that they can communicate directly.
The web content process responds to the bootstrap message by retrieving the anonymous XPC
connections for the other extensions from the endpoints it was sent by the host app, and sends
them each “ping” messages to ensure the connections are valid.


## Page 4

For more information on this process, see the section “Pass anonymous connection endpoints
between extensions” in Using XPC to communicate with browser extensions.
When someone using the browser app navigates to a new location, the WebContentView asks t
proxy object that represents the web-content process to load the data at the location’s URL:
This method sends a network load message to the web-content process:
The web-content process checks what kind of data it’s trying to load. If it’s a URL, it asks the
networking extension to load the content. Otherwise, it prepares the data itself, either by decodin
a string, or loading the contents of a file.
Load web content


## Page 5

Note
To open a file in your browser, send a bookmark with implicit security scope to the web-
content process, so that it can extend its sandbox to access the file. For more information, see
Accessing files in browser extensions.
In your browser app, you need to handle any networking errors at this point. If the networking
extension loads the content, parse it using your alternative browser engine to create rendering
commands, that you send to the rendering process. In the rendering process, update the layer tha
the browser app is hosting.
Finally, the web-content process replies to the browser app, telling the WebContentView to
update its view.
Designing your browser architecture
Isolate privileged access to operating system resources and private data from untrusted cod
Preparing your app to be the default web browser
Configure your browser app so users can set it as the default on their device instead of Safa
See Also
Essentials


## Page 6

A browser is a complex app with many components: a graphical user interface (GUI), network
communications, media playing, content parsing and rendering, and JavaScript execution. Improv
the security of your browser for people using your app by creating separate extensions that are
responsible for different parts of your app. The operating system runs your app and each of its
extensions in separate processes with their own sandboxed access to operating system resource
Communicate between your app and its extensions, and between extensions, using XPC.
Your app presents the browser GUI, handles input from the person using the browser, and
coordinates with the extensions to provide the browser features. Use SwiftUI or UIKit to display
user interface and handle input. For more information on managing extensions, see Managing the
browser extension life cycle.
Use other API as necessary to provide common app features, for example, store a person’s
preferences with UserDefaults.
Note
A browser app has a restricted app sandbox that stops the app from accessing some APIs.
Your app can’t get the advertisingIdentifier, and can’t detect the presence of other
apps using canOpenURL(_:).
If your browser engine uses custom text rendering and layout routines to display text on a web
page, your browser app needs to adopt UITextInput and BETextInput to integrate with
Overview
Present the GUI and handle user input
BrowserEngineKit / Designing your browser architecture
Article
Designing your browser architecture
Isolate privileged access to operating system resources and private data from
untrusted code.


## Page 7

standard text interactions like showing text selection and displaying the contextual menu.
Your browser can create one instance of a networking extension, which uses URLSession or
socket APIs to retrieve remote resources and submit HTTP POST data. When web content
extensions need to fetch additional resources, for example, images referenced in HTML
documents, they communicate with the network extension to make the request and retrieve the
data.
You create a content extension to host your browser’s rendering engine, which parses HTML
documents and CSS style sheets, runs Javascript, and prepares the resulting document object fo
display. Create as many content extensions as your app needs to securely process browser
contents, for example, one extension for each browser tab that a person uses, or one extension fo
each document and iframe with which your app works.
Content extensions work with untrusted data from remote sources, so don’t access a person’s da
or operating system resources from a content extension. Instead, design protocols for
communicating between your content extensions and your browser app and the other extensions
that permit limited requests to access specific resources.
If your content extension uses just-in-time (JIT) compilation to run JavaScript code, you need to
toggle the memory that contains the compiled code from writable to executable. For more
information, see Protecting code compiled just in time.
Your browser can create one instance of a rendering extension, which uses Metal to directly acce
the GPU to process video and other complex graphical data.
The operating system maintains a low level for the maximum memory that the rendering extension
may allocate. If your rendering extension uses more than the permitted maximum memory, the
operating system may stop the extension. To avoid requesting too much memory in the rendering
extension, your content extension can claim ownership of memory that the rendering extension
uses to render its content. For more information, see Attributing memory to a content extension.
Create a networking extension
Create content extensions
Process video and graphics
See Also


## Page 8

Developing a browser app that uses an alternative browser engine
Create a web browser app and associated extensions.
Preparing your app to be the default web browser
Configure your browser app so users can set it as the default on their device instead of Safa
Essentials


## Page 9

In iOS 14 and later, users can select an app to be their default web browser. To make your app a
choice, confirm that your app meets the requirements below, then request a managed entitlemen
The system invokes the default web browser in iOS whenever the user opens an HTTP or HTTPS
link. Because this app becomes the user’s primary gateway to the internet, Apple requires that we
browsing apps meet specific functional criteria to protect user privacy and ensure proper access 
internet resources.
Apps express their capability to be a default web browser by using the com.apple.developer
.web-browser managed entitlement.
Important
Request the default browser entitlement by filling out the Default browser entitlement request
form. In that form you can also request the com.apple.developer.browser.app-
installation entitlement. If you do that and your request for the default browser
entitlement is accepted you get both the default browser entitlement and the app-installation
entitlement for your browser app.
Overview
Configure your app to be a default browser
Fulfill default browser requirements
Xcode
/ Allowing apps and websites to link to your content / Preparing your app to be the default web brows
Article
Preparing your app to be the default web
browser
Configure your browser app so users can set it as the default on their device
instead of Safari.
/


## Page 10

Apps that register as a default web browser option must satisfy the following criteria:
Your app must specify the HTTP and HTTPS schemes in its Info.plist file.
Your app can’t use UIWebView.
On launch, the app must provide a text field for entering a URL, search tools for finding relevan
links on the internet, or curated lists of bookmarks.
When opening an HTTP or HTTPS URL in its default configuration:
The app must navigate directly to the specified destination and render the expected web
content. Apps that redirect to unexpected locations or render content not specified in the
destination’s source code don’t meet the requirements of a default web browser.
Apps designed to operate in a parental controls or locked down mode may restrict navigation t
comply with those goals.
Your app may present a “Safe Browsing” or other warning for content suspected of phishing or
other problems.
Your app may offer a native authentication UI for a site that also offers a native web sign-in flow
Apps that use the com.apple.developer.web-browser managed entitlement can:
Be an option for the user to choose as their default browser.
Load pages from all domains with full script access.
Use Service Workers in WKWebView instances.
Offer the Add to Home Screen action in a share sheet by including the current WKWebView in t
activityItems array when creating a UIActivityViewController.
Apps that have the com.apple.developer.web-browser managed entitlement may not claim
to respond to Universal Links for specific domains. The system will ignore any such claims. Apps
with the entitlement can still open Universal Links to other apps as usual.
Because of their privileged position in a user’s web browsing, browser apps should avoid
unnecessary access to personal data. Apps that use any of the following Info.plist keys while
using the com.apple.developer.web-browser managed entitlement will be rejected:
NSPhotoLibraryUsageDescription — For saving images, your app should only specify
NSPhotoLibraryAddUsageDescription. WKWebView can still upload photos and files
without your app needing access to a user’s entire photo library. To access individual photos
Use default browser capabilities
Adhere to browser restrictions


## Page 11

your app should use PHPickerViewController which doesn’t require NSPhotoLibrary
UsageDescription, instead of UIImagePickerController.
NSLocationAlwaysUsageDescription, NSLocationAlwaysAndWhenInUseUsage
Description — For determining the user’s location, request while in-use authorization instea
(NSLocationWhenInUseUsageDescription). Browsers are restricted from always-on
location access.
NSHomeKitUsageDescription — Browsers can’t access the user’s HomeKit database.
NSBluetoothAlwaysUsageDescription — Browsers can’t poll for Bluetooth devices whe
the app is in the background. Browsers should use NSBluetoothWhileInUseUsage
Description for Bluetooth features.
NSHealthShareUsageDescription, NSHealthUpdateUsageDescription — Browsers
can’t access the user’s health database.
Note
NSLocationAlwaysUsageDescription was deprecated in iOS 10. For more information,
see Choosing the Location Services Authorization to Request.
To test whether someone configured your app as the default browser in iOS, call isDefault(_:
(Swift) or defaultStatusForCategory:error: (Objective-C), with the category
UIApplication.Category.webBrowser.
This method is rate-limited: if your app calls it too frequently, the method throws an error. The val
for the key retryAvailableDateErrorKey in the error’s user info dictionary is the date at
which your app can next check whether it’s the default browser.
If your iOS browser app includes an alternative browser engine, which includes using a version of
WebKit other than the framework supplied in the operating system, you need to design your
browser as an app that hosts extensions to access system resources and process untrusted data
For more information, see BrowserEngineKit.
Check if your app is the default browser
Ship an alternative browser engine


