# 001_Text interaction.pdf

## Page 1

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


## Page 2

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


## Page 3

struct BEDirectionalTextRange
View coordination
Display content in the browser’s UI that an extension renders.
class BEWebAppManifest
An object that represents a web app manifest.
See Also
Web content


