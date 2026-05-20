# Downloads.pdf

## Page 1

Maintaining a long-running network connection to download a large file requires your browser app
networking extension to remain active in the background for a long period of time. Register your
browser’s downloads with the system and report progress so that the system keeps your
networking extension active. When the download completes, the system can optionally move the
downloaded file to the person’s Downloads folder.
In your browser app, when someone starts a download, create a URL bookmark for the URL that
represents the destination for the download, and an access token for the download progress API:
Pass both the bookmark data and access token to your networking extension. For information
about using XPC to communicate between a browser app and its extensions, see Using XPC to
communicate with browser extensions.
In your networking extension, receive the bookmark data and resolve the download’s destination
URL. Initialize a BEDownloadMonitor object with the download source URL, destination URL,
Overview
Create a download progress access token
Register download progress with the system
BrowserEngineKit / Downloading files in a web browser with an alternative browser engine
Article
Downloading files in a web browser with
an alternative browser engine
Report download progress to the system to keep your networking extension activ


## Page 2

access token, and a Progress object that you use to report the download’s progress to the
system:
If the system should create a placeholder file in the person’s Downloads folder that shows the sta
of the download, call the download monitor’s useDownloadsFolder(placeholderType:
finalFileCreatedHandler:) method. Use the completion handler to receive the location to
which the system moves the completed downloads, as both a URL and bookmark data:
The bookmark you get in the completion handler isn’t suitable for storing to resolve later, if you
need to do this then create your own bookmark with security scope. For more information, see
bookmarkData(options:includingResourceValuesForKeys:relativeTo:).
When your network extension is ready to commence the download, call beginMonitoring(). I
you requested that the system use the person’s Downloads folder, this method returns the
placeholder location that the system creates to host the downloaded content, as both a URL and
bookmark data. Make a network connection to download the content, for example using the URL
Loading System, store data in the file at the download’s destination URL, and update the
Progress object that you passed to the BEDownloadMonitor:
Request that the system move the file to the person’s
Downloads folder
Download the file and report progress to the system


## Page 3

When you indicate that the progress is complete, if you asked the system to create a placeholder
file in the person’s Downloads folder, the system calls the completion handler you passed to use
DownloadsFolder(placeholderType:finalFileCreatedHandler:) to inform your
browser of the downloaded file’s location in the Downloads folder. If you don’t tell the system to u
the Downloads folder, beginMonitoring() returns nil. You still download the file to a location
in your app’s container using networking APIs, but the system doesn’t show a placeholder in the
Downloads folder.
class BEDownloadMonitor
An object that reports the status of web downloads to the system.
See Also
Downloads


## Page 4

Downloading files in a web browser with an alternative browser engine
When someone downloads a file in your web browser, create an instance of this class to report
progress to the system, and optionally create a placeholder file in the person’s Downloads folder.
For more information, see Downloading files in a web browser with an alternative browser engine.
init(sourceURL: URL, destinationURL: URL, observedProgress: Progress,
liveActivityAccessToken: Data)
Initializes a download monitor to report progress for the specified download.
static func createAccessToken() -> Data?
Mentioned in
Overview
Topics
Creating a download monitor
BrowserEngineKit / BEDownloadMonitor
Class
BEDownloadMonitor
An object that reports the status of web downloads to the system.
iOS 18.2+
iPadOS 18.2+


## Page 5

Generates an opaque token that the system uses to keep your networking extension active i
the background.
func useDownloadsFolder(placeholderType: UTType?, finalFileCreated
Handler: (BEDownloadMonitor.Location?) -> Void)
Asks the system to create a placeholder for the downloaded file in the person’s Downloads
folder.
class Location
A class that associates a URL with the bookmark you use to access that URL.
func beginMonitoring() async throws -> BEDownloadMonitor.Location?
Informs the system to start monitoring the download.
func resumeMonitoring(placeholderURL: URL) async throws
Informs the system that it needs to resume monitoring the download.
let sourceURL: URL
let destinationURL: URL
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Creating a download placeholder
Reporting progress to the system
Getting information about a download
Relationships
Inherits From
Conforms To


## Page 6

Hashable
Identifiable
NSObjectProtocol
Sendable
SendableMetatype
Downloading files in a web browser with an alternative browser engine
Report download progress to the system to keep your networking extension active.
See Also
Downloads


