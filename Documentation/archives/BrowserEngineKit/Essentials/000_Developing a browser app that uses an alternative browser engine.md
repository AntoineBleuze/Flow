# 000_Developing a browser app that uses an alternative browser engine.pdf

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


