# Events.pdf

## Page 1

When dispatching stylus events, allocate an IOHIDDigitizerStylusData structure, fill it with
stylus data, and pass it to the dispatchDigitizerStylusEvent method.
identifier
A unique stylus identifier.
x
An x-axis value in the range 0.0 to 1.0.
y
A y-axis value in the range 0.0 to 1.0.
tipPressure
A tip pressure value in the range 0.0 to 1.0.
barrelPressure
Overview
Topics
Getting the Stylus Data
HIDDriverKit / IOHIDDigitizerStylusData
Structure
IOHIDDigitizerStylusData
A structure containing digitizer stylus data.
DriverKit
macOS


## Page 2

The barrel pressure value in the range 0.0 to 1.0.
tiltX
The tilt of the stylus across the x-axis.
tiltY
The tilt of the stylus across the y-axis.
twist
The clockwise rotation of the stylus.
pointerType
An optional pointer type defined by vendor.
effect
An optional stylus effect defined by vendor.
uniqueID
An optional unique identifier for the stylus.
inRange
A single-bit Boolean that indicates whether the stylus is in range.
tip
A single-bit Boolean that indicates whether the tip of the stylus is in contact with the surface
of the digitizer.
barrelSwitch
A single-bit Boolean that indicates whether the barrel switch button is pressed.
invert
A single-bit Boolean that indicates whether the stylus is inverted.
eraser
A Boolean value that indicates whether the inverted stylus is in contact with the surface of th
digitizer.
tipChanged
A single-bit Boolean that indicates whether the tip contact status changed since the last eve
was dispatched.
positionChanged
A single-bit Boolean that indicates whether the x or y position changed since the last event
was dispatched.


## Page 3

rangeChanged
A single-bit Boolean that indicates whether the in-range status changed since the last event
was dispatched.
IOHIDDigitizerTouchData
A structure containing the current digitizer touch data.
See Also
Events


## Page 4

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


## Page 5

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


