# 003_Implementing coalesced touch support in an app.pdf

## Page 1

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


## Page 2

The main view of the app uses incoming touch events to build a set of Stroke objects. The
following image shows the definition of the Stroke class and the associated StrokeSample
class, which store information about each touch event.
Provide storage for the touches


## Page 3

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


## Page 4

The touch input methods of DrawingView use the addSamples method (shown in the following
code) to incorporate new touches into the active stroke. This method creates a new Stroke
Sample for each touch point and adds that sample to the active stroke. The example flags
coalesced touches internally, but the touches are no different from the regular touches reported b
the system.


## Page 5

Note
When capturing drawing input from Apple Pencil, you can use the preciseLocation(in:)
method instead of the location(in:) method to get more precise touch information. Use
the preciseLocation(in:) method only for capturing drawing-related input. For general
interactions with your interface, continue to get the touch location using the location(in:)
method.
The remaining methods of the DrawingView class take the touch samples and turn them into th
rendered output. The app’s Clear button releases the view’s current StrokeCollection object
and creates a new one.


