# 000_GCTouchedStateInput.pdf

## Page 1

var isTouched: Bool
A Boolean value that indicates whether the user touches the button.
Required
var lastTouchedStateTimestamp: TimeInterval
The time of the most recent touch state change.
Required
var lastTouchedStateLatency: TimeInterval
The time in seconds between the last touch state change and the current time.
Required
var touchedDidChangeHandler: ((any GCPhysicalInputElement, any GCTouche
StateInput, Bool) -> Void)?
A block that the element calls when its touch value changes.
Required
Topics
Getting change information
Getting user actions
Game Controller / GCTouchedStateInput
Protocol
GCTouchedStateInput
The common properties for an element that has touch state input.
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
protocol GCPressedStateInput
The common properties for an element that has press state input, such as input from a butto
Relationships
Inherits From
See Also
Button elements and names


