# 002_IMKServer.pdf

## Page 1

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


## Page 2

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


## Page 3

candidates window in your input method; using IMKCandidates is optional. Not all input
methods require them.
class IMKInputController
The IMKInputController class provides a base class for custom input controller classes
The IMKServer class, which is allocated in the main function of an input method, creates a
input controller object for each input session created by a client application. For every input
session there is a corresponding IMKInputController object.


