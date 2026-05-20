# 001_IOHIDDigitizerTouchData.pdf

## Page 1

Pass this structure to the dispatchDigitizerTouchEvent method when dispatching touch
events.
identifier
A unique contact identifier.
x
An x-coordinate value in the range 0.0 to 1.0.
y
A y-coordinate value in the range 0.0 to 1.0.
inRange
A single-bit Boolean that indicates whether the finger is in range.
touch
Overview
Topics
Getting the Touch Data
HIDDriverKit / IOHIDDigitizerTouchData
Structure
IOHIDDigitizerTouchData
A structure containing the current digitizer touch data.
DriverKit
macOS


## Page 2

A single-bit Boolean that indicates whether the finger is in contact with the surface of the
digitizer.
touchValid
A single-bit Boolean that indicates whether the touch contact was intended.
touchChanged
A single-bit Boolean that indicates whether the touch variable changed since the last event
was dispatched.
positionChanged
A single-bit Boolean that indicates whether the x or y position changed since the last event
was dispatched.
rangeChanged
A single-bit Boolean that indicates whether the range variable changed since the last event
was dispatched.
IOHIDDigitizerStylusData
A structure containing digitizer stylus data.
See Also
Events


