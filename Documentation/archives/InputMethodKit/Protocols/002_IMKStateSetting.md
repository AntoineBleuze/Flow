# 002_IMKStateSetting.pdf

## Page 1

func activateServer(Any!)
Activates the input method server.
Required
func deactivateServer(Any!)
Deactivates the input method server.
Required
func showPreferences(Any!)
Displays a preferences window.
Required
func recognizedEvents(Any!) -> Int
Returns an unsigned integer that contains a union of event masks
Topics
Activating and Deactivating the Server
Showing a Preferences Window
Getting the Supported Events
InputMethodKit / IMKStateSetting
Protocol
IMKStateSetting
The IMKStateSetting protocol defines methods for setting or accessing value
that indicate the state of an input method.
macOS 10.5+


## Page 2

Required
func modes(Any!) -> [AnyHashable : Any]!
Returns the modes dictionary associated with the input method.
Required
func value(forTag: Int, client: Any!) -> Any!
Returns a value object whose key is the provided tag.
Required
func setValue(Any!, forTag: Int, client: Any!)
Set the value for the provided key.
Required
IMKInputController
protocol IMKMouseHandling
The IMKMouseHandling protocol defines methods that your input method can implement 
handle mouse events.
IMKServerInput
Getting the Mode Dictionary
Getting and Setting Values
Relationships
Conforming Types
See Also
Protocols


## Page 3

IMKServerInput is an informal protocol that defines methods for receiving text events. Th
is intentionally not a formal protocol because there are three ways to receive events. An inpu
method chooses one of the following approaches and implements the appropriate methods:


