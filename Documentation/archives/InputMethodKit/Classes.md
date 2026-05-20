# Classes.pdf

## Page 1

When you create an IMKCandidates object, you attach it to the IMKServer object for your inp
method. You then need to override the IMKInputController methods candidateSelectio
Changed: and candidateSelected: as well as implement a candidates method in your
delegate object. The IMKInputController subclass supplies candidates to the
IMKCandidates object by implementing the candidates method. When you are ready to display
candidates window, call the candidates method to update candidates and to show the candidates
window.
init!(server: IMKServer!, panelType: IMKCandidatePanelType)
Returns the initialized IMKCandidates object.
Overview
Topics
Initializing a Candidates Window
InputMethodKit / IMKCandidates
Class
IMKCandidates
The IMKCandidates class presents candidates to users and notifies the
appropriate IMKInputController object when the user selects a candidate.
Candidates are alternate characters for a given input sequence. The
IMKCandidates class supports using a candidates window in your input
method; using IMKCandidates is optional. Not all input methods require them.
macOS 10.5+


## Page 2

func setSelectionKeys([Any]!)
Sets the selection keys for the candidates.
func selectionKeys() -> [Any]!
Returns an array of NSNumber objects where each NSNumber object represents a virtual ke
code.
func setSelectionKeysKeylayout(TISInputSource!)
Sets the key layout that is used to map virtual key codes to characters.
func selectionKeysKeylayout() -> Unmanaged<TISInputSource>!
Returns the key layout that maps virtual key codes to selection keys.
func show(IMKCandidatesLocationHint)
Shows the candidates window.
func hide()
Hides a candidates window, if it is visible.
func isVisible() -> Bool
Returns whether or not the candidates window is visible.
func setDismissesAutomatically(Bool)
Sets the state of the flag that determines whether the candidates window dismisses
automatically.
func dismissesAutomatically() -> Bool
Returns the state of the flag that determines whether the candidates window dismisses
automatically.
func update()
Updates the candidates that are displayed in the candidates window.
func panelType() -> IMKCandidatePanelType
Returns the style of the candidates window.
Managing Selection Keys
Managing Window Visibility and Behavior
Managing Window Type and Text Attributes


## Page 3

func setPanelType(IMKCandidatePanelType)
Sets the style of the candidates window.
func setAttributes([AnyHashable : Any]!)
Sets the style attributes for the candidates window.
func attributes() -> [AnyHashable : Any]!
Returns a dictionary of the style attributes used for the candidates window..
func showAnnotation(NSAttributedString!)
Displays an annotation string in an annotation window.
typealias IMKCandidatePanelType
Types of candidates windows provide by the Input Method Kit.
typealias IMKCandidatesLocationHint
Hints that suggest where to place the candidates window.
IMKCandidatesOpacityAttributeName
The opacity level for a candidates window.
init!(server: IMKServer!, panelType: IMKCandidatePanelType, styleType:
IMKStyleType)
func attachChild(IMKCandidates!, toCandidate: Int, type: IMKStyleType)
func candidateFrame() -> NSRect
func candidateIdentifier(atLineNumber: Int) -> Int
func candidateStringIdentifier(Any!) -> Int
func clearSelection()
func detachChild(Int)
Showing an Annotation Window
Constants
Initializers
Instance Methods


## Page 4

func hideChild()
func lineNumberForCandidate(withIdentifier: Int) -> Int
func selectCandidate(Int)
func selectCandidate(withIdentifier: Int) -> Bool
func selectedCandidate() -> Int
func selectedCandidateString() -> NSAttributedString!
func setCandidateData([Any]!)
func setCandidateFrameTopLeft(NSPoint)
func show()
func showChild()
func showSublist([Any]!, subListDelegate: Any!)
NSResponder
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCoding
NSObjectProtocol
NSStandardKeyBindingResponding
NSTouchBarProvider
NSUserActivityRestoring
Relationships
Inherits From
Conforms To
See Also


## Page 5

class IMKInputController
The IMKInputController class provides a base class for custom input controller classes
The IMKServer class, which is allocated in the main function of an input method, creates a
input controller object for each input session created by a client application. For every input
session there is a corresponding IMKInputController object.
class IMKServer
The IMKServer class manages client connections to your input method. When you write th
main function for your input method, you create an IMKServer object. You should never
need to override this class.
Classes


## Page 6

An IMKInputController object controls text input on the input method side. It manages event
and text from the applications and converted text from the input method engine. IMKInput
Controller implements fully the IMKStateSetting and IMKMouseHandling protocols.
Typically you do not need to override this class, but you do need to provide a delegate object that
implements the methods that your are interested in. The IMKInputController versions of the
protocol methods check whether the delegate object implements a method, and calls the delegat
version if it exists.
init!(server: IMKServer!, delegate: Any!, client: Any!)
Initializes the input control by setting the delegate.
Overview
Topics
Initializing an Input Controller
InputMethodKit / IMKInputController
Class
IMKInputController
The IMKInputController class provides a base class for custom input
controller classes. The IMKServer class, which is allocated in the main function
of an input method, creates an input controller object for each input session
created by a client application. For every input session there is a corresponding
IMKInputController object.
macOS 10.5+


## Page 7

func compositionAttributes(at: NSRange) -> NSMutableDictionary!
Returns a dictionary of text attributes.
func selectionRange() -> NSRange
Returns where the range of the selection that should be placed inside marked text.
func replacementRange() -> NSRange
Returns the range in the client document that the text should replace.
func mark(forStyle: Int, at: NSRange) -> [AnyHashable : Any]!
Returns a dictionary of text attributes that can mark a range of an attributed string to send to
a client.
func delegate() -> Any!
Returns the delegate for input controller object.
func setDelegate(Any!)
Sets the delegate for input controller object.
func server() -> IMKServer!
Returns the server object that manages the input controller.
func client() -> (any IMKTextInput & NSObjectProtocol)!
Returns the client object associated with the input controller.
func annotationSelected(NSAttributedString!, forCandidate: NSAttributed
String!)
Sends the selected candidate string and annotation string to the input controller.
func candidateSelectionChanged(NSAttributedString!)
Informs an input controller that the current candidate selection in the candidate window has
changed.
Working with Ranges
Managing the Delegate
Getting the Client and Server Objects
Tracking Selections


## Page 8

func candidateSelected(NSAttributedString!)
Informs an input controller that a new candidate is selected.
func updateComposition()
Informs the input controller that the composition has changed.
func cancelComposition()
Stops the current composition and replaces marked text with the original text.
func hidePalettes()
Informs an input method that it should close any visible user interface.
func doCommand(by: Selector!, command: [AnyHashable : Any]!)
Passes commands that are not generated as part of the text input process.
func menu() -> NSMenu!
Returns a menu of commands that are specific to an input method.
func inputControllerWillClose()
NSObject
CVarArg
CustomDebugStringConvertible
Managing Composition
Hiding the User Interface
Working with Custom Commands
Instance Methods
Relationships
Inherits From
Conforms To


## Page 9

CustomStringConvertible
Equatable
Hashable
IMKMouseHandling
IMKStateSetting
NSObjectProtocol
class IMKCandidates
The IMKCandidates class presents candidates to users and notifies the appropriate
IMKInputController object when the user selects a candidate. Candidates are alternate
characters for a given input sequence. The IMKCandidates class supports using a
candidates window in your input method; using IMKCandidates is optional. Not all input
methods require them.
class IMKServer
The IMKServer class manages client connections to your input method. When you write th
main function for your input method, you create an IMKServer object. You should never
need to override this class.
See Also
Classes


## Page 10

init!(name: String!, bundleIdentifier: String!)
Creates and returns a server object from property list information contained in the provided
bundle.
init!(name: String!, controllerClass: AnyClass!, delegateClass: AnyClas
!)
Creates and returns a server object initialized with the provided parameters.
func bundle() -> Bundle!
Returns an NSBundle object for the input method.
IMKModeDictionary
Topics
Initializing a Server Object
Getting a Bundle for the Input Method
Constants
InputMethodKit / IMKServer
Class
IMKServer
The IMKServer class manages client connections to your input method. When
you write the main function for your input method, you create an IMKServer
object. You should never need to override this class.
macOS 10.5+


## Page 11

The input method mode dictionary key.
IMKControllerClass
The input method controller class key.
IMKDelegateClass
The input method delegate class key.
func lastKeyEventWasDeadKey() -> Bool
func paletteWillTerminate() -> Bool
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
class IMKCandidates
The IMKCandidates class presents candidates to users and notifies the appropriate
IMKInputController object when the user selects a candidate. Candidates are alternate
characters for a given input sequence. The IMKCandidates class supports using a
Instance Methods
Relationships
Inherits From
Conforms To
See Also
Classes


## Page 12

candidates window in your input method; using IMKCandidates is optional. Not all input
methods require them.
class IMKInputController
The IMKInputController class provides a base class for custom input controller classes
The IMKServer class, which is allocated in the main function of an input method, creates a
input controller object for each input session created by a client application. For every input
session there is a corresponding IMKInputController object.


