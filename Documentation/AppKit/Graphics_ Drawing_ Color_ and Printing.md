# Graphics_ Drawing_ Color_ and Printing.pdf

## Page 1

Providing images for different appearances
Supply image resources appropriate for light and dark appearances and for high-contrast
environments.
Supporting Continuity Camera in Your Mac App
Incorporate scanned documents and pictures from a user’s iPhone, iPad, or iPod touch into
your Mac app using Continuity Camera.
Supporting HDR images in your app
​ Load, display, edit, and save HDR images using SwiftUI and Core Image. ​
Applying Apple HDR effect to your photos
You can decode and apply Apple’s HDR gain map to your own images.
class NSImage
A high-level interface for manipulating image data.
protocol NSImageDelegate
A set of optional methods that you can use to respond to drawing failures and manage
incremental loads.
class NSImageRep
A semiabstract superclass that provides subclasses that you use to draw an image from a
particular type of source data.
Topics
Images
AppKit / Images and PDF
API Collection
Images and PDF
Create and manage images, in bitmap, PDF, and other formats.


## Page 2

class NSBitmapImageRep
An object that renders an image from bitmap data.
class NSCIImageRep
An object that can render an image from a Core Image object.
class NSPICTImageRep
An object that renders an image from a PICT format data stream of version 1, version 2, and
extended version 2.
class NSPDFImageRep
An object that can render an image from a PDF format data stream.
class NSPDFInfo
An object that stores information associated with the creation of a PDF file, such as its URL,
tag names, page orientation, and paper size.
class NSEPSImageRep
An object that can render an image from encapsulated PostScript (EPS) code.
Deprecated
class NSCustomImageRep
An object that uses a delegate object to render an image from a custom format.
Drawing
Draw shapes, images, and other content on the screen.
Bitmap Formats
Vector Formats
Custom Formats
See Also
Graphics, Drawing, Color, and Printing


## Page 3

Color
Represent colors using built-in or custom formats, and give users options for selecting and
applying colors.
Printing
Display the system print panels and manage the printing process.


## Page 4

class NSGraphicsContext
An object that represents a graphics context.
class NSBezierPath
An object that can create paths using PostScript-style commands.
Convenience Functions
Draw rectangles and other primitive shapes using these convenience functions.
class NSStringDrawingContext
An object that manages metrics for drawing attributed strings.
struct NSStringDrawingOptions
Constants that specify the rendering options for drawing a string.
class NSGradient
An object that can draw gradient fill colors
Topics
Drawing Contexts
Shapes and Paths
Strings
Gradients
AppKit / Drawing
API Collection
Drawing
Draw shapes, images, and other content on the screen.


## Page 5

class NSShadow
An object you use to specify attributes to create and style a drop shadow during drawing
operations.
Images and PDF
Create and manage images, in bitmap, PDF, and other formats.
Color
Represent colors using built-in or custom formats, and give users options for selecting and
applying colors.
Printing
Display the system print panels and manage the printing process.
Shadows
See Also
Graphics, Drawing, Color, and Printing


## Page 6

For design guidance, see Human Interface Guidelines.
class NSColor
An object that stores color data and sometimes opacity (alpha value).
class NSColorList
An ordered list of color objects, identified by keys.
class NSColorSpace
An object that represents a custom color space.
class NSColorPicker
An abstract superclass that implements the default color picking protocol.
class NSColorWell
A control that displays a color value and lets the user change that color value.
Overview
Topics
Colors
Color Selection
AppKit / Color
API Collection
Color
Represent colors using built-in or custom formats, and give users options for
selecting and applying colors.


## Page 7

class NSColorPickerTouchBarItem
A bar item that provides a system-defined color picker.
class NSColorSampler
An object that displays the system’s color-sampling interface and returns the selected color 
your app.
Images and PDF
Create and manage images, in bitmap, PDF, and other formats.
Drawing
Draw shapes, images, and other content on the screen.
Printing
Display the system print panels and manage the printing process.
Color Sampler
See Also
Graphics, Drawing, Color, and Printing


## Page 8

For design guidance, see Human Interface Guidelines.
class NSPrintPanel
The Print panel that queries the user for information about a print job.
class NSPageLayout
A panel that queries the user for information such as paper type and orientation.
class NSPrinter
An object that describes a printer’s capabilities.
class NSPrintInfo
An object that stores information that’s used to generate printed output.
class NSPrintOperation
Overview
Topics
Print Panels
Print Information
AppKit / Printing
API Collection
Printing
Display the system print panels and manage the printing process.


## Page 9

An object that controls operations that generate Encapsulated PostScript (EPS) code,
Portable Document Format (PDF) code, or print jobs.
Images and PDF
Create and manage images, in bitmap, PDF, and other formats.
Drawing
Draw shapes, images, and other content on the screen.
Color
Represent colors using built-in or custom formats, and give users options for selecting and
applying colors.
See Also
Graphics, Drawing, Color, and Printing


