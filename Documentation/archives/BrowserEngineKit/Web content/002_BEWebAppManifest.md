# 002_BEWebAppManifest.pdf

## Page 1

To add a web app or bookmark to someone’s Home Screen:
1. Create a SFAddToHomeScreenActivityItem that represents the web app or bookmark.
2. A web app indicates its manifest using a <link/> element with the attribute rel=manifest;
the href attribute is a URL that locates the manifest JSON. If the website offers a web app
manifest, initialize a BEWebAppManifest with the contents of the web app’s manifest.
3. Create a UIActivityViewController with the SFAddToHomeScreenActivityItem you
created in step 1 in its list of activity items.
4. Present the UIActivityViewController.
5. When someone selects the Add to Home Screen activity, the system calls the activity item’s ge
WebAppManifest(completionHandler:) method. Pass the web app manifest you create
in step 2 to the completion handler in your implementation, or nil if the website doesn’t offer 
web app manifest or you can’t fetch the manifest.
Overview
Topics
Creating a web app manifest
BrowserEngineKit / BEWebAppManifest
Class
BEWebAppManifest
An object that represents a web app manifest.
iOS 17.5+
iPadOS 17.5+
macOS
tvOS 17.5+
visionOS 1.2+


## Page 2

init?(JSONData: Data, manifestURL: URL)
init?(jsonData: Data, manifestURL: URL)
Returns nil if manifestURL is invalid or jsonData cannot be parsed.
var jsonData: Data
var manifestURL: URL
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
View coordination
Display content in the browser’s UI that an extension renders.
Text interaction
Integrate your web browser engine asynchronously with the text system.
Getting manifest information
Relationships
Inherits From
Conforms To
See Also
Web content


