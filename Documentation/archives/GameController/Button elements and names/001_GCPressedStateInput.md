# 001_GCPressedStateInput.pdf

## Page 1

var isPressed: Bool
A Boolean value that indicates whether the user presses the button.
Required
var lastPressedStateTimestamp: TimeInterval
The time of the most recent press state change.
Required
var lastPressedStateLatency: TimeInterval
The time in seconds between the last press state change and the current time.
Required
var pressedDidChangeHandler: ((any GCPhysicalInputElement, any GCPresse
StateInput, Bool) -> Void)?
The block that the profile calls when an element’s press state changes.
Required
Topics
Getting change information
Getting user actions
Game Controller / GCPressedStateInput
Protocol
GCPressedStateInput
The common properties for an element that has press state input, such as input
from a button.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+


## Page 2

var sources: Set<AnyHashable>
One or more physical actions the user performs to manipulate the input.
Required
NSObjectProtocol
protocol GCTouchedStateInput
The common properties for an element that has touch state input.
Relationships
Inherits From
See Also
Button elements and names


