# 001_BEDownloadMonitor.pdf

## Page 1

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


## Page 2

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


## Page 3

Hashable
Identifiable
NSObjectProtocol
Sendable
SendableMetatype
Downloading files in a web browser with an alternative browser engine
Report download progress to the system to keep your networking extension active.
See Also
Downloads


