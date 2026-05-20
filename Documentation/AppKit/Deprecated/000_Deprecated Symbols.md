# 000_Deprecated Symbols.pdf

## Page 1

class NSOpenGLView
A view that displays OpenGL content in a view.
Deprecated
class NSOpenGLContext
An object that represents an OpenGL graphics context, into which all OpenGL calls are
rendered.
Deprecated
class NSOpenGLLayer
A subclass of CAOpenGLLayer that is suitable for rendering OpenGL into layers.
Deprecated
class NSOpenGLPixelFormat
An object that specifies the types of buffers and other attributes of the OpenGL context.
Deprecated
class NSDrawer
A user interface element that contains and displays text, scroll, and browser views, in additio
to other view subclasses.
Deprecated
class NSForm
Topics
Classes
AppKit / Deprecated Symbols
API Collection
Deprecated Symbols
Review symbols that are no longer supported, and find the replacements to use
instead.


## Page 2

An NSForm object is a vertical matrix of NSFormCell objects to implement the fields.
Deprecated
class NSFormCell
The NSFormCell class is used to implement text entry fields in a form. The left part of an
NSFormCell object contains a title. The right part contains an editable text entry field.
class NSMenuItemCell
An object that handles the measurement and display of a single menu item in its
encompassing frame.
NSAccessibility
A legacy, informal protocol that Apple doesn’t recommend for active use.
protocol NSEditorRegistration
A set of methods that controllers can implement to enable an editor view to inform the
controller when it has uncommitted changes.
protocol NSInputServiceProvider
protocol NSInputServerMouseTracker
protocol NSDrawerDelegate
A set of methods that drawer delegates implement to open, close, and resize the drawer.
Deprecated
func NSConvertGlyphsToPackedGlyphs(UnsafeMutablePointer<NSGlyph>, Int,
NSMultibyteGlyphPacking, UnsafeMutablePointer<CChar>) -> Int
Prepares a set of glyphs for processing by character-based routines.
Deprecated
static func raiseBadArgumentException(Any!, NSAccessibility.Attribute!,
Any!)
Raises an error if the parameter is the wrong type or has an illegal value
Deprecated
func NSReleaseAlertPanel(Any!)
Disposes of an alert panel.
Protocols
Functions


## Page 3

Deprecated
func NSDisableScreenUpdates()
Disables screen updates.
Deprecated
func NSEnableScreenUpdates()
Enables screen updates.
Deprecated
func NSDrawColorTiledRects(NSRect, NSRect, UnsafePointer<NSRectEdge>,
AutoreleasingUnsafeMutablePointer<NSColor>, Int) -> NSRect
Draws a single-color, bordered rectangle.
func NSSetShowsServicesMenuItem(String, Bool) -> Int
Specifies whether an item should be included in Services menus.
func NSCopyBits(Int, NSRect, NSPoint)
Copies a bitmap image to the location specified by a destination point.
Deprecated
func NSShowsServicesMenuItem(String) -> Bool
Specifies whether a Services menu item is currently enabled.
func NSDottedFrameRect(NSRect)
Draws a bordered rectangle.
func NSReadPixel(NSPoint) -> NSColor?
Reads the color of the pixel at the specified location.
Deprecated
func NSGetWindowServerMemory(Int, UnsafeMutablePointer<Int>, Unsafe
MutablePointer<Int>, AutoreleasingUnsafeMutablePointer<NSString>) -> In
Returns the amount of memory being used by a context.
Deprecated
static func fileContentsType(forPathExtension: String) -> NSPasteboard.
PasteboardType!
Returns a pasteboard type based on the passed file type.
Deprecated
static func fileNameType(forPathExtension: String) -> NSPasteboard.
PasteboardType!


## Page 4

Returns a pasteboard type based on the passed file type.
Deprecated
var representedPathExtension: String?
A file type based on the passed pasteboard type.
Deprecated
static func representedPathExtensions(from: [NSPasteboard.PasteboardTyp
]) -> [String]?
Returns an array of file types based on the passed pasteboard types.
Deprecated
enum NSMultibyteGlyphPacking
A constant for glyph packing.
Deprecated
Glyph Attributes
Attributes that are used only inside the glyph generation machinery, but must also be shared
between components.
enum NSOpenGLGlobalOption
Constants that specify OpenGL options.
Deprecated
Data Entry Types
These constants specify how a cell formats numeric data.
Anonymous
Additional Writing Directions
Constants that specify additional options when setting the writing direction of attributed
strings.
Return values for modal operations
Historical return values for runModal(for:) and runModalSession(_:).
Tags of Views in the FontPanel
These constants are obsolete and should not be used.
Enumerations


