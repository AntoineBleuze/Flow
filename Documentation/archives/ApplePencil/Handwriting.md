# Handwriting.pdf

## Page 1

Note
This sample code project is associated with WWDC20 session 10106: Meet Scribble for iPad.
This sample code project must be run on a physical device with Apple Pencil.
Drawing with PencilKit
Add expressive, low-latency drawing to your app using PencilKit.
Inspecting, Modifying, and Constructing PencilKit Drawings
Score users’ ability to match PencilKit drawings generated from text, by accessing the stroke
and points inside PencilKit drawings.
class PKCanvasView
A view that captures Apple Pencil input and displays the rendered results in an iOS app.
Overview
See Also
Canvas
PencilKit / Customizing Scribble with Interactions
Sample Code
Customizing Scribble with Interactions
Enable writing on a non-text-input view by adding interactions.
Download
iOS 14.0+
iPadOS 14.0+
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

Customizing Scribble with Interactions
Enable writing on a non-text-input view by adding interactions.
class UIScribbleInteraction
An interaction for customizing the behavior of Scribble on text input views, or for suppressin
it entirely in specific cases.
protocol UIScribbleInteractionDelegate
Methods for customizing or suppressing Scribble behavior within text input views.
class UIIndirectScribbleInteraction
An interaction for using Scribble to enter text by writing on a view that isn’t formally a text
input.
protocol UIIndirectScribbleInteractionDelegate
Methods that customize behavior on views that aren’t formally text input views.
associatedtype ElementIdentifier : Hashable = String
Topics
Essentials
Text fields
Custom views
UIKit / Handwriting recognition
API Collection
Handwriting recognition
Configure text fields and custom views that accept text to handle input from Appl
Pencil.


## Page 4

A unique identifier for a control that isn’t a text field in a Scribble interaction.
Required
Text display and fonts
Display text, manage fonts, and check spelling.
TextKit
Manage text storage and perform custom layout of text-based content in your app’s views.
Keyboards and input
Configure the system keyboard, create your own keyboards to handle input, or detect key
presses on a physical keyboard.
Writing Tools
Add support for Writing Tools to your app’s text views.
See Also
Text


