# Web content.pdf

## Page 1

Hosting browser view layers in the rendering extension
Coordinate view-hierarchy and layer-hierarchy changes between processes.
class LayerHierarchy
An object that holds a reference to layers rendered in another process’s view.
class LayerHierarchyHostingView
A view that hosts a layer hierarchy you manage in another process.
class LayerHierarchyHostingTransactionCoordinator
Synchronizes updates to views and layers in different processes.
class LayerHierarchyHandle
A reference to a layer hierarchy that you share between processes.
Propagating view visibility information to extension processes
Register the extensions that contribute to preparing your browser app’s UI.
func createVisibilityPropagationInteraction() -> any UIInteraction
Returns an interaction that associates a view with the rendering process.
func createVisibilityPropagationInteraction() -> any UIInteraction
Topics
Layer hosting
Visibility propagation
BrowserEngineKit / View coordination
API Collection
View coordination
Display content in the browser’s UI that an extension renders.


## Page 2

Returns an interaction that associates a view with the web content process.
Text interaction
Integrate your web browser engine asynchronously with the text system.
class BEWebAppManifest
An object that represents a web app manifest.
See Also
Web content


## Page 3

Integrating custom browser text views with UIKit
Process keyboard interactions asynchronously in your iOS browser app’s text view.
Supporting extended text interactions
Share content, add replacement shortcuts, and perform other rich actions in browser text
views.
protocol BETextInput
A protocol to which text views conform to asynchronously integrate with the text system.
protocol BETextInputDelegate
A delegate protocol that a browser text view uses to notify the text system of changes.
class BETextInteraction
An interaction you add to a text view to support extended text gestures.
protocol BETextInteractionDelegate
A set of methods that informs you about selection changes in text views.
protocol BEResponderEditActions
A set of methods that defines extended interactions in browser text views.
Topics
Custom text views
Interaction responses
BrowserEngineKit / Text interaction
API Collection
Text interaction
Integrate your web browser engine asynchronously with the text system.


## Page 4

enum BEGestureType
protocol BEResponderEditActions
A set of methods that defines extended interactions in browser text views.
protocol BETextSelectionDirectionNavigation
struct BESelectionFlags
enum BESelectionTouchPhase
class BEKeyEntry
A class that represents a keyboard event in the text system.
class BEKeyEntryContext
A class that describes a key event and the text document with which the event is associated
enum BEKeyModifierFlags
An enumeration that records the state of the shift-modifier keys.
class BEAutoFillTextSuggestion
class BETextAlternatives
class BETextDocumentContext
Information about the text surrounding a selection in a document.
class BETextDocumentRequest
struct Options
class BETextSuggestion
A text suggestion to insert into a document.
struct BETextReplacementOptions
protocol BEExtendedTextInputTraits
Text selection
Keyboard input
Replacements and AutoFill
Information about text


## Page 5

struct BEDirectionalTextRange
View coordination
Display content in the browser’s UI that an extension renders.
class BEWebAppManifest
An object that represents a web app manifest.
See Also
Web content


## Page 6

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


## Page 7

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


