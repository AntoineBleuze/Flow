# 000_IMKMouseHandling.pdf

## Page 1

func mouseDown(onCharacterIndex: Int, coordinate: NSPoint, withModifier
Int, continueTracking: UnsafeMutablePointer<ObjCBool>!, client: Any!) -
Bool
Handles mouse-down event send to an input method.
Required
func mouseUp(onCharacterIndex: Int, coordinate: NSPoint, withModifier:
Int, client: Any!) -> Bool
Handles a mouse-up event sent to an input method.
Required
func mouseMoved(onCharacterIndex: Int, coordinate: NSPoint, withModifie
: Int, client: Any!) -> Bool
Handles a mouse-moved event sent to an input method.
Required
Topics
Handling Mouse Events
InputMethodKit / IMKMouseHandling
Protocol
IMKMouseHandling
The IMKMouseHandling protocol defines methods that your input method can
implement to handle mouse events.
macOS 10.5+


## Page 2

IMKInputController
IMKServerInput
IMKServerInput is an informal protocol that defines methods for receiving text events. Th
is intentionally not a formal protocol because there are three ways to receive events. An inpu
method chooses one of the following approaches and implements the appropriate methods:
protocol IMKStateSetting
The IMKStateSetting protocol defines methods for setting or accessing values that
indicate the state of an input method.
Relationships
Conforming Types
See Also
Protocols


