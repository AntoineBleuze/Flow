# Drawing.pdf

## Page 1

Note
This sample code project is associated with WWDC19 session 221: Introducing PencilKit and
WWDC20 session 10107: What’s New in PencilKit.
This sample code project must be run on a physical device with Apple Pencil.
Customizing Scribble with Interactions
Enable writing on a non-text-input view by adding interactions.
Inspecting, Modifying, and Constructing PencilKit Drawings
Score users’ ability to match PencilKit drawings generated from text, by accessing the stroke
and points inside PencilKit drawings.
class PKCanvasView
A view that captures Apple Pencil input and displays the rendered results in an iOS app.
Overview
See Also
Canvas
PencilKit / Drawing with PencilKit
Sample Code
Drawing with PencilKit
Add expressive, low-latency drawing to your app using PencilKit.
Download
iOS 13.0+
iPadOS 13.0+
Xcode 11.5+


## Page 2

struct PKDrawing
A structure representing the drawing information captured by a canvas view.
struct PKStroke
A structure that represents the paths, boundaries, and other properties of a stroke drawn on
canvas.
struct PKStrokePath
A structure that captures the components of a stroke and provides methods to find and
interpolate points along the stroke’s path.
struct PKStrokePoint
A structure that represents the properties of a specific point along a stroke’s path.
struct PKInk
A structure that represents an ink that specifies its type, color, and width.


## Page 3

Note
This sample code project is associated with WWDC20 session 10148: Inspect, Modify, and
Construct PencilKit Drawings.
This sample code project must be run on a physical device with Apple Pencil.
Drawing with PencilKit
Add expressive, low-latency drawing to your app using PencilKit.
Customizing Scribble with Interactions
Enable writing on a non-text-input view by adding interactions.
Overview
See Also
Canvas
PencilKit / Inspecting, Modifying, and Constructing PencilKit Drawings
Sample Code
Inspecting, Modifying, and Constructing
PencilKit Drawings
Score users’ ability to match PencilKit drawings generated from text, by accessing
the strokes and points inside PencilKit drawings.
Download
iOS 14.0+
iPadOS 14.0+
Xcode 11.5+


## Page 4

class PKCanvasView
A view that captures Apple Pencil input and displays the rendered results in an iOS app.
struct PKDrawing
A structure representing the drawing information captured by a canvas view.
struct PKStroke
A structure that represents the paths, boundaries, and other properties of a stroke drawn on
canvas.
struct PKStrokePath
A structure that captures the components of a stroke and provides methods to find and
interpolate points along the stroke’s path.
struct PKStrokePoint
A structure that represents the properties of a specific point along a stroke’s path.
struct PKInk
A structure that represents an ink that specifies its type, color, and width.


## Page 5

UIKit usually delivers touches to your app at around 60 Hz, but some devices are capable of
recording touch information at up to 240 Hz. On such devices, UIKit doesn’t deliver the extra touc
information automatically, in case the app doesn’t need the extra data. Instead, it coalesces any
extra touches into a single UITouch object, whose location reflects only the last recorded touch.
However, apps that want the extra precision can retrieve and use the additional touch information
Important
Coalesced touches are intended for apps that need the extra precision and can handle the
associated costs. Processing coalesced touches means gathering additional data and applying
it to your content. If you don’t need the extra precision, continue using the set of touch objects
that UIKit passes to the methods of your views or gesture recognizers.
The following image illustrates what happens when the user drags Apple Pencil across the device
At the point where UIKit reports a touch event to the app, Apple Pencil has reported four touch
positions, but UIKit reports only the last touch to the app by default. The remaining three touches
are delivered as coalesced touches, and the app must retrieve them explicitly to use them.
Overview
UIKit
/ Handling touches in your view / Getting high-fidelity input with coalesced touches
Getting high-fidelity input with coalesced
touches
Learn how to support high-precision touches in your app.
/


## Page 6

To retrieve coalesced touches, call the coalescedTouches(for:) method of the UIEvent
object containing the original UITouch object. That method returns the array of all touches since
the last event, including the last UITouch object actually delivered to the app. You must retrieve
coalesced touches immediately when handling an event. After handling the event, there’s no
guarantee that any coalesced touches will remain available.
Implementing coalesced touch support in an app
Learn how to create a simple app that handles coalesced touches.
Implementing a Multi-Touch app
Topics
Example
See Also
Advanced touch handling


## Page 7

Learn how to create a simple app that handles multitouch input.
Minimizing latency with predicted touches
Create a smooth and responsive drawing experience using UIKit’s predictions for touch
locations.


## Page 8

The following image shows a simple drawing app that captures touches and renders the resulting
path onscreen. The app tracks all touches reported by UIKit, including coalesced touches. The ap
builds the path by drawing line segments from one touch point to the next.
Overview
UIKit
/ Getting high-fidelity input with coalesced touches / Implementing coalesced touch support in an app
Article
Implementing coalesced touch support in
an app
Learn how to create a simple app that handles coalesced touches.
/


## Page 9

The main view of the app uses incoming touch events to build a set of Stroke objects. The
following image shows the definition of the Stroke class and the associated StrokeSample
class, which store information about each touch event.
Provide storage for the touches


## Page 10

The main view maintains a collection of Stroke objects that have been created using the Strok
Collection class, the implementation of which is shown in the following code. The strokes
property of this class stores the completed strokes and the activeStroke property contains a
stroke object that’s currently being modified. Calling the acceptActiveStroke method moves
the active stroke to the set of completed strokes.
The following code shows the portion of the main drawing view that creates new Stroke objects
The view doesn’t support multitouch, so only the first touch event needs to be tracked. The
touchesBegan(_:with:) method creates a new stroke object and marks it as the active strok
New touch data is added to the active stroke until the touchesEnded(_:with:) method is
called, at which point the stroke is accepted into the stroke collection. If the touch sequence is
interrupted for any reason, the touchesCancelled(_:with:) method abandons the currently
active stroke.
Retrieve the coalesced touches


## Page 11

The touch input methods of DrawingView use the addSamples method (shown in the following
code) to incorporate new touches into the active stroke. This method creates a new Stroke
Sample for each touch point and adds that sample to the active stroke. The example flags
coalesced touches internally, but the touches are no different from the regular touches reported b
the system.


## Page 12

Note
When capturing drawing input from Apple Pencil, you can use the preciseLocation(in:)
method instead of the location(in:) method to get more precise touch information. Use
the preciseLocation(in:) method only for capturing drawing-related input. For general
interactions with your interface, continue to get the touch location using the location(in:)
method.
The remaining methods of the DrawingView class take the touch samples and turn them into th
rendered output. The app’s Clear button releases the view’s current StrokeCollection object
and creates a new one.


