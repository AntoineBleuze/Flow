# 2D Drawing.pdf

## Page 1

A CGContext instance represents a Quartz 2D drawing destination. A graphics context contains
drawing parameters and all device-specific information needed to render the paint on a page to th
destination, whether the destination is a window in an application, a bitmap image, a PDF
document, or a printer.
typealias CGBitmapContextReleaseDataCallback
A callback function used to release data associate with the bitmap context.
init?(CFURL, mediaBox: UnsafePointer<CGRect>?, CFDictionary?)
Creates a URL-based PDF graphics context.
init?(consumer: CGDataConsumer, mediaBox: UnsafePointer<CGRect>?,
CFDictionary?)
Overview
Topics
Creating Bitmap Graphics Contexts
Creating PDF Graphics Contexts
Core Graphics / CGContext
Class
CGContext
A Quartz 2D drawing environment.
iOS
iPadOS
Mac Catalyst
macOS
tvOS
visionOS
watchOS


## Page 2

Creates a PDF graphics context.
Auxiliary Dictionary Keys
Keys for the auxiliary info dictionary you specify when creating a PDF context.
var userSpaceToDeviceSpaceTransform: CGAffineTransform
Returns an affine transform that maps user space coordinates to device space coordinates.
func convertToDeviceSpace(CGPoint) -> CGPoint
Returns a point that is transformed from user space coordinates to device space coordinate
func convertToUserSpace(CGPoint) -> CGPoint
Returns a point that is transformed from device space coordinates to user space coordinate
func convertToDeviceSpace(CGRect) -> CGRect
Returns a rectangle that is transformed from user space coordinate to device space
coordinates.
func convertToUserSpace(CGRect) -> CGRect
Returns a rectangle that is transformed from device space coordinate to user space
coordinates.
func convertToDeviceSpace(CGSize) -> CGSize
Returns a size that is transformed from user space coordinates to device space coordinates
func convertToUserSpace(CGSize) -> CGSize
Returns a size that is transformed from device space coordinates to user space coordinates
func beginPath()
Creates a new empty path in a graphics context.
func move(to: CGPoint)
Begins a new subpath at the specified point.
func addLine(to: CGPoint)
Appends a straight line segment from the current point to the specified point.
func addLines(between: [CGPoint])
Converting Between Coordinate Spaces
Constructing a Current Graphics Path


## Page 3

Adds a sequence of connected straight-line segments to the current path.
func addRect(CGRect)
Adds a rectangular path to the current path.
func addRects([CGRect])
Adds a set of rectangular paths to the current path.
func addEllipse(in: CGRect)
Adds an ellipse that fits inside the specified rectangle.
func addArc(center: CGPoint, radius: CGFloat, startAngle: CGFloat, end
Angle: CGFloat, clockwise: Bool)
Adds an arc of a circle to the current path, specified with a radius and angles.
func addArc(tangent1End: CGPoint, tangent2End: CGPoint, radius: CGFloat
Adds an arc of a circle to the current path, specified with a radius and two tangent lines.
func addCurve(to: CGPoint, control1: CGPoint, control2: CGPoint)
Adds a cubic Bézier curve to the current path, with the specified end point and control point
func addQuadCurve(to: CGPoint, control: CGPoint)
Adds a quadratic Bézier curve to the current path, with the specified end point and control
point.
func addPath(CGPath)
Adds a previously created path object to the current path in a graphics context.
func closePath()
Closes and terminates the current path’s subpath.
var path: CGPath?
Returns a path object built from the current path information in a graphics context.
func replacePathWithStrokedPath()
Replaces the path in the graphics context with the stroked version of the path.
var boundingBoxOfPath: CGRect
Returns the smallest rectangle that contains the current path.
var currentPointOfPath: CGPoint
Examining the Current Graphics Path


## Page 4

Returns the current point in a non-empty path.
var isPathEmpty: Bool
Indicates whether the current path contains any subpaths.
func pathContains(CGPoint, mode: CGPathDrawingMode) -> Bool
Checks to see whether the specified point is contained in the current path.
func drawPath(using: CGPathDrawingMode)
Draws the current path using the provided drawing mode.
enum CGPathDrawingMode
Options for rendering a path.
func fillPath(using: CGPathFillRule)
Paints the area within the current path, as determined by the specified fill rule.
func strokePath()
Paints a line along the current path.
func clear(CGRect)
Paints a transparent rectangle.
func fill(CGRect)
Paints the area contained within the provided rectangle, using the fill color in the current
graphics state.
func fill([CGRect])
Paints the areas contained within the provided rectangles, using the fill color in the current
graphics state.
func fillEllipse(in: CGRect)
Paints the area of the ellipse that fits inside the provided rectangle, using the fill color in the
current graphics state.
func stroke(CGRect)
Paints a rectangular path.
Drawing the Current Graphics Path
Drawing Shapes


## Page 5

func stroke(CGRect, width: CGFloat)
Paints a rectangular path, using the specified line width.
func strokeEllipse(in: CGRect)
Strokes an ellipse that fits inside the specified rectangle.
func strokeLineSegments(between: [CGPoint])
Strokes a sequence of line segments.
func draw(CGImage, in: CGRect, byTiling: Bool)
Draws an image in the specified area.
func drawPDFPage(CGPDFPage)
Draws the content of a PDF page into the current graphics context.
var interpolationQuality: CGInterpolationQuality
Returns the current level of interpolation quality for a graphics context.
enum CGInterpolationQuality
Levels of interpolation quality for rendering an image.
func drawLinearGradient(CGGradient, start: CGPoint, end: CGPoint,
options: CGGradientDrawingOptions)
Paints a gradient fill that varies along the line defined by the provided starting and ending
points.
func drawRadialGradient(CGGradient, startCenter: CGPoint, startRadius:
CGFloat, endCenter: CGPoint, endRadius: CGFloat, options: CGGradient
DrawingOptions)
Paints a gradient fill that varies along the area defined by the provided starting and ending
circles.
struct CGGradientDrawingOptions
Drawing locations for gradients.
func drawShading(CGShading)
Fills the clipping path of a context with the specified shading.
Drawing Images and PDF Content
Drawing Gradients and Shadings


## Page 6

var textMatrix: CGAffineTransform
Returns the current text matrix.
var textPosition: CGPoint
func selectFont(name: UnsafePointer<CChar>, size: CGFloat, textEncoding
CGTextEncoding)
Sets the font and font size in a graphics context.
Deprecated
func setCharacterSpacing(CGFloat)
Sets the current character spacing.
func setFont(CGFont)
Sets the platform font in a graphics context.
func setFontSize(CGFloat)
Sets the current font size.
func setTextDrawingMode(CGTextDrawingMode)
Sets the current text drawing mode.
func setAllowsFontSmoothing(Bool)
Sets whether or not to allow font smoothing for a graphics context.
func setAllowsFontSubpixelPositioning(Bool)
Sets whether or not to allow subpixel positioning for a graphics context.
func setAllowsFontSubpixelQuantization(Bool)
Sets whether or not to allow subpixel quantization for a graphics context.
func setShouldSmoothFonts(Bool)
Enables or disables font smoothing in a graphics context.
func setShouldSubpixelPositionFonts(Bool)
Enables or disables subpixel positioning in a graphics context.
func setShouldSubpixelQuantizeFonts(Bool)
Enables or disables subpixel quantization in a graphics context.
Drawing Text


## Page 7

func showGlyphs(g: UnsafePointer<CGGlyph>?, count: Int)
Displays an array of glyphs at the current text position.
Deprecated
func showGlyphs([CGGlyph], at: [CGPoint])
Draws a set of glyphs at a set of corresponding positions.
func showGlyphsAtPoint(x: CGFloat, y: CGFloat, glyphs: UnsafePointer<
CGGlyph>?, count: Int)
Displays an array of glyphs at a position you specify.
Deprecated
func showGlyphsWithAdvances(glyphs: UnsafePointer<CGGlyph>?, advances:
UnsafePointer<CGSize>?, count: Int)
Draws an array of glyphs with varying offsets.
Deprecated
func showText(string: UnsafePointer<CChar>, length: Int)
Displays a character array at the current text position, a point specified by the current text
matrix.
Deprecated
func showTextAtPoint(x: CGFloat, y: CGFloat, string: UnsafePointer<CCha
>, length: Int)
Displays a character string at a position you specify.
Deprecated
enum CGTextDrawingMode
Modes for rendering text.
func draw(CGLayer, at: CGPoint)
Draws the contents of a layer object at the specified point.
func draw(CGLayer, in: CGRect)
Draws the contents of a layer object into the specified rectangle.
func setFillColor(CGColor)
Drawing Core Graphics Layers
Setting Fill, Stroke, and Shadow Colors


## Page 8

Sets the current fill color in a graphics context, using a CGColor.
func setFillColor(UnsafePointer<CGFloat>)
Sets the current fill color.
func setFillColor(cyan: CGFloat, magenta: CGFloat, yellow: CGFloat,
black: CGFloat, alpha: CGFloat)
Sets the current fill color to a value in the DeviceCMYK color space.
func setFillColor(gray: CGFloat, alpha: CGFloat)
Sets the current fill color to a value in the DeviceGray color space.
func setFillColor(red: CGFloat, green: CGFloat, blue: CGFloat, alpha:
CGFloat)
Sets the current fill color to a value in the DeviceRGB color space.
func setFillColorSpace(CGColorSpace)
Sets the fill color space in a graphics context.
func setShadow(offset: CGSize, blur: CGFloat)
Enables shadowing in a graphics context.
func setShadow(offset: CGSize, blur: CGFloat, color: CGColor?)
Enables shadowing with color a graphics context.
func setStrokeColor(CGColor)
Sets the current stroke color in a context, using a CGColor.
func setStrokeColor(UnsafePointer<CGFloat>)
Sets the current stroke color.
func setStrokeColor(cyan: CGFloat, magenta: CGFloat, yellow: CGFloat,
black: CGFloat, alpha: CGFloat)
Sets the current stroke color to a value in the DeviceCMYK color space.
func setStrokeColor(gray: CGFloat, alpha: CGFloat)
Sets the current stroke color to a value in the DeviceGray color space.
func setStrokeColor(red: CGFloat, green: CGFloat, blue: CGFloat, alpha:
CGFloat)
Sets the current stroke color to a value in the DeviceRGB color space.
func setStrokeColorSpace(CGColorSpace)
Sets the stroke color space in a graphics context.


## Page 9

func setStrokePattern(CGPattern, colorComponents: UnsafePointer<CGFloat
>)
Sets the stroke pattern in the specified graphics context.
func setAlpha(CGFloat)
Sets the opacity level for objects drawn in a graphics context.
func clip(using: CGPathFillRule)
Modifies the current clipping path.
func clip(to: CGRect)
Sets the clipping path to the intersection of the current clipping path with the area defined b
the specified rectangle.
func clip(to: [CGRect])
Sets the clipping path to the intersection of the current clipping path with the region defined
by an array of rectangles.
func clip(to: CGRect, mask: CGImage)
Maps a mask into the specified rectangle and intersects it with the current clipping area of th
graphics context.
var boundingBoxOfClipPath: CGRect
Returns the bounding box of a clipping path.
func beginTransparencyLayer(in: CGRect, auxiliaryInfo: CFDictionary?)
Begins a transparency layer whose contents are bounded by the specified rectangle.
func beginTransparencyLayer(auxiliaryInfo: CFDictionary?)
Begins a transparency layer.
func endTransparencyLayer()
Ends a transparency layer.
var ctm: CGAffineTransform
Working with the Current Clipping Path
Working with Transparency Layers
Working with the Current Transformation Matrix


## Page 10

Returns the current transformation matrix.
func rotate(by: CGFloat)
Rotates the user coordinate system in a context.
func scaleBy(x: CGFloat, y: CGFloat)
Changes the scale of the user coordinate system in a context.
func translateBy(x: CGFloat, y: CGFloat)
Changes the origin of the user coordinate system in a context.
func concatenate(CGAffineTransform)
Transforms the user coordinate system in a context using a specified matrix.
func setAllowsAntialiasing(Bool)
Sets whether or not to allow antialiasing for a graphics context.
func setFlatness(CGFloat)
Sets the accuracy of curved paths in a graphics context.
func setLineCap(CGLineCap)
Sets the style for the endpoints of lines drawn in a graphics context.
func setLineDash(phase: CGFloat, lengths: [CGFloat])
Sets the pattern for drawing dashed lines.
func setLineJoin(CGLineJoin)
Sets the style for the joins of connected lines in a graphics context.
func setLineWidth(CGFloat)
Sets the line width for a graphics context.
func setMiterLimit(CGFloat)
Sets the miter limit for the joins of connected lines in a graphics context.
func setPatternPhase(CGSize)
Sets the pattern phase of a context.
func setFillPattern(CGPattern, colorComponents: UnsafePointer<CGFloat>)
Sets the fill pattern in the specified graphics context.
Setting Path Drawing Options


## Page 11

func setShouldAntialias(Bool)
Sets antialiasing on or off for a graphics context.
func saveGState()
Pushes a copy of the current graphics state onto the graphics state stack for the context.
func restoreGState()
Sets the current graphics state to the state most recently saved.
func flush()
Forces all pending drawing operations in a window context to be rendered immediately to th
destination device.
func synchronize()
Marks a window context for update.
func setBlendMode(CGBlendMode)
Sets how sample values are composited by a graphics context.
enum CGBlendMode
Compositing operations for images.
func setRenderingIntent(CGColorRenderingIntent)
Sets the rendering intent in the current graphics state.
These properties and methods are valid only when used with a CGContext object created with th
initializers listed in Creating Bitmap Graphics Contexts.
var bitmapInfo: CGBitmapInfo
Obtains the bitmap information associated with a bitmap graphics context.
var alphaInfo: CGImageAlphaInfo
Returns the alpha information associated with the context, which indicates how a bitmap
context handles the alpha component.
var bitsPerComponent: Int
Saving and Restoring Graphics State
Managing a Graphics Context
Managing a Bitmap Graphics Context


## Page 12

Returns the bits per component of a bitmap context.
var bitsPerPixel: Int
Returns the bits per pixel of a bitmap context.
var bytesPerRow: Int
Returns the bytes per row of a bitmap context.
var colorSpace: CGColorSpace?
Returns the color space of a bitmap context.
var data: UnsafeMutableRawPointer?
Returns a pointer to the image data associated with a bitmap context.
var height: Int
Returns the height in pixels of a bitmap context.
var width: Int
Returns the width in pixels of a bitmap context.
func makeImage() -> CGImage?
Creates and returns a CGImage from the pixel data in a bitmap graphics context.
These methods are valid only when used with a CGContext object created with the initializers
listed in Creating PDF Graphics Contexts.
func beginPDFPage(CFDictionary?)
Begins a new page in a PDF graphics context.
func endPDFPage()
Ends the current page in the PDF graphics context.
func addDestination(CFString, at: CGPoint)
Sets a destination to jump to when a point in the current page of a PDF graphics context is
clicked.
func setDestination(CFString, for: CGRect)
Sets a destination to jump to when a rectangle in the current PDF page is clicked.
func setURL(CFURL, for: CGRect)
Sets the URL associated with a rectangle in a PDF graphics context.
Managing a PDF Graphics Context


## Page 13

func addDocumentMetadata(CFData?)
Associates custom metadata with the PDF document.
func closePDF()
Closes a PDF document.
func beginPage(mediaBox: UnsafePointer<CGRect>?)
Starts a new page in a page-based graphics context.
func endPage()
Ends the current page in a page-based graphics context.
class var typeID: CFTypeID
Returns the type identifier for a graphics context.
enum CGPathFillRule
Rules for determining which regions are interior to a path, used by the fillPath(using:)
and clip(using:) methods.
enum CGTextEncoding
Text encodings for fonts.
func draw(CGImage, in: CGRect, by: CGToneMapping, options: CFDictionary
?) -> Bool
func resetClip()
func setEDRTargetHeadroom(Float) -> Bool
func synchronizeAttributes()
struct AuxiliaryInfo
Managing a Page-Based Graphics Context
Working with Core Foundation Types
Constants
Instance Methods
Structures


## Page 14

init?(data: UnsafeMutableRawPointer?, width: Int, height: Int, bitsPer
Component: Int, bytesPerRow: Int, space: CGColorSpace?, bitmapInfo:
CGBitmapInfo)
init?(data: UnsafeMutableRawPointer?, width: Int, height: Int, bitsPer
Component: Int, bytesPerRow: Int, space: CGColorSpace, bitmapInfo:
UInt32)
Deprecated
init?(data: UnsafeMutableRawPointer?, width: Int, height: Int, bitsPer
Component: Int, bytesPerRow: Int, space: CGColorSpace?, bitmapInfo:
CGBitmapInfo, releaseCallback: CGBitmapContextReleaseDataCallback?,
releaseInfo: UnsafeMutableRawPointer?)
init?(data: UnsafeMutableRawPointer?, width: Int, height: Int, bitsPer
Component: Int, bytesPerRow: Int, space: CGColorSpace, bitmapInfo:
UInt32, releaseCallback: CGBitmapContextReleaseDataCallback?, release
Info: UnsafeMutableRawPointer?)
Deprecated
var contentToneMappingInfo: CGContentToneMappingInfo
Copyable, Equatable, Hashable
Quartz 2D Programming Guide
Initializers
Instance Properties
Relationships
Conforms To
See Also
Related Documentation


## Page 15

class CGImage
A bitmap image or image mask.
class CGPath
An immutable graphics path: a mathematical description of shapes or lines to be drawn in a
graphics context.
class CGMutablePath
A mutable graphics path: a mathematical description of shapes or lines to be drawn in a
graphics context.
class CGLayer
An offscreen context for reusing content drawn with Core Graphics.
2D Drawing


## Page 16

A bitmap image is a rectangular array of pixels, each of which represents a single sample or data
point from a source image.
init?(width: Int, height: Int, bitsPerComponent: Int, bitsPerPixel: Int
bytesPerRow: Int, space: CGColorSpace, bitmapInfo: CGBitmapInfo,
provider: CGDataProvider, decode: UnsafePointer<CGFloat>?, should
Interpolate: Bool, intent: CGColorRenderingIntent)
Creates a bitmap image from data supplied by a data provider.
init?(jpegDataProviderSource: CGDataProvider, decode: UnsafePointer<
CGFloat>?, shouldInterpolate: Bool, intent: CGColorRenderingIntent)
Creates a bitmap image using JPEG-encoded data supplied by a data provider.
init?(pngDataProviderSource: CGDataProvider, decode: UnsafePointer<
CGFloat>?, shouldInterpolate: Bool, intent: CGColorRenderingIntent)
Creates a bitmap image using PNG-encoded data supplied by a data provider.
Overview
Topics
Creating images
Core Graphics / CGImage
Class
CGImage
A bitmap image or image mask.
iOS
iPadOS
Mac Catalyst
macOS
tvOS
visionOS
watchOS


## Page 17

init?(headroom: Float, width: Int, height: Int, bitsPerComponent: Int,
bitsPerPixel: Int, bytesPerRow: Int, space: CGColorSpace, bitmapInfo:
CGBitmapInfo, provider: CGDataProvider, decode: UnsafePointer<CGFloat>?
shouldInterpolate: Bool, intent: CGColorRenderingIntent)
var isMask: Bool
Returns whether a bitmap image is an image mask.
var width: Int
Returns the width of a bitmap image, in pixels.
var height: Int
Returns the height of a bitmap image.
var bitsPerComponent: Int
Returns the number of bits allocated for a single color component of a bitmap image.
var bitsPerPixel: Int
Returns the number of bits allocated for a single pixel in a bitmap image.
var bytesPerRow: Int
Returns the number of bytes allocated for a single row of a bitmap image.
var colorSpace: CGColorSpace?
Return the color space for a bitmap image.
var alphaInfo: CGImageAlphaInfo
Returns the alpha channel information for a bitmap image.
enum CGImageAlphaInfo
Storage options for alpha component data.
var dataProvider: CGDataProvider?
Returns the data provider for a bitmap image or image mask.
var decode: UnsafePointer<CGFloat>?
Returns the decode array for a bitmap image.
var shouldInterpolate: Bool
Returns the interpolation setting for a bitmap image.
Examining an image


## Page 18

var renderingIntent: CGColorRenderingIntent
Returns the rendering intent setting for a bitmap image.
var bitmapInfo: CGBitmapInfo
Returns the bitmap information for a bitmap image.
struct CGBitmapInfo
Component information for a bitmap image.
var utType: CFString?
The Universal Type Identifier for the image.
func copy() -> CGImage?
Creates a copy of a bitmap image.
func copy(colorSpace: CGColorSpace) -> CGImage?
Creates a copy of a bitmap image, replacing its colorspace.
func cropping(to: CGRect) -> CGImage?
Creates a bitmap image using the data contained within a subregion of an existing bitmap
image.
func masking(CGImage) -> CGImage?
Creates a bitmap image from an existing image and an image mask.
func copy(maskingColorComponents: [CGFloat]) -> CGImage?
init?(maskWidth: Int, height: Int, bitsPerComponent: Int, bitsPerPixel:
Int, bytesPerRow: Int, provider: CGDataProvider, decode: UnsafePointer<
CGFloat>?, shouldInterpolate: Bool)
Creates a bitmap image mask from data supplied by a data provider.
Enhancing high dynamic range image rendering
Copying an image
Creating images by modifying an image
Creating image masks
Adopting high dynamic range (HDR)


## Page 19

Improve your app’s High Dynamic Range (HDR) image support with metadata.
var contentHeadroom: Float
var calculatedContentHeadroom: Float
var contentAverageLightLevel: Float
var calculatedContentAverageLightLevel: Float
func copy(contentAverageLightLevel: Float) -> CGImage?
func copyWithCalculatedHDRStats() -> CGImage?
enum CGImageAlphaInfo
Storage options for alpha component data.
struct CGBitmapInfo
Component information for a bitmap image.
Host Endian Bitmap Formats
Bit-depth constants for image bitmaps in host-endian byte order.
class var typeID: CFTypeID
Returns the type identifier for CGImage objects.
var byteOrderInfo: CGImageByteOrderInfo
var containsImageSpecificToneMappingMetadata: Bool
var contentHeadroom: Float
var pixelFormatInfo: CGImagePixelFormatInfo
var shouldToneMap: Bool
Constants
Working with Core Foundation types
Instance properties
Relationships


## Page 20

Equatable
Hashable
Sendable
SendableMetatype
Quartz 2D Programming Guide
class CGContext
A Quartz 2D drawing environment.
class CGPath
An immutable graphics path: a mathematical description of shapes or lines to be drawn in a
graphics context.
class CGMutablePath
A mutable graphics path: a mathematical description of shapes or lines to be drawn in a
graphics context.
class CGLayer
An offscreen context for reusing content drawn with Core Graphics.
Conforms To
See Also
Related Documentation
2D Drawing


## Page 21

Neither CGPath nor CGMutablePath define functions to draw a path. To draw a Core Graphics
path to a graphics context, you add the path to the graphics context by calling addPath(_:) an
then call one of the context’s drawing functions—see CGContext.
Each figure in the graphics path is constructed with a connected set of lines and Bézier curves,
called a subpath. A subpath has an ordered set of path elements that represent single steps in th
construction of the subpath. (For example, a line segment from one corner of a rectangle to
another corner is a path element. Every subpath includes a starting point, which is the first point i
the subpath. The path also maintains a current point, which is the last point in the last subpath.
init(rect: CGRect, transform: UnsafePointer<CGAffineTransform>?)
Create an immutable path of a rectangle.
init(ellipseIn: CGRect, transform: UnsafePointer<CGAffineTransform>?)
Create an immutable path of an ellipse.
Overview
Topics
Creating Graphics Paths
Core Graphics / CGPath
Class
CGPath
An immutable graphics path: a mathematical description of shapes or lines to be
drawn in a graphics context.
iOS
iPadOS
Mac Catalyst
macOS
tvOS
visionOS
watchOS


## Page 22

init(roundedRect: CGRect, cornerWidth: CGFloat, cornerHeight: CGFloat,
transform: UnsafePointer<CGAffineTransform>?)
Create an immutable path of a rounded rectangle.
func copy() -> CGPath?
Creates an immutable copy of a graphics path.
func copy(using: UnsafePointer<CGAffineTransform>?) -> CGPath?
Creates an immutable copy of a graphics path transformed by a transformation matrix.
func copy(dashingWithPhase: CGFloat, lengths: [CGFloat], transform:
CGAffineTransform) -> CGPath
Returns a new path equivalent to the results of drawing the path with a dashed stroke.
func copy(strokingWithWidth: CGFloat, lineCap: CGLineCap, lineJoin:
CGLineJoin, miterLimit: CGFloat, transform: CGAffineTransform) -> CGPat
Returns a new path equivalent to the results of drawing the path with a solid stroke.
func mutableCopy() -> CGMutablePath?
Creates a mutable copy of an existing graphics path.
func mutableCopy(using: UnsafePointer<CGAffineTransform>?) -> CGMutable
Path?
Creates a mutable copy of a graphics path transformed by a transformation matrix.
var boundingBox: CGRect
Returns the bounding box containing all points in a graphics path.
var boundingBoxOfPath: CGRect
Returns the bounding box of a graphics path.
var currentPoint: CGPoint
Returns the current point in a graphics path.
func contains(CGPoint, using: CGPathFillRule, transform: CGAffine
Transform) -> Bool
Returns whether the specified point is interior to the path.
Copying a Graphics Path
Examining a Graphics Path


## Page 23

var isEmpty: Bool
Indicates whether or not a graphics path is empty.
func isRect(UnsafeMutablePointer<CGRect>?) -> Bool
Indicates whether or not a graphics path represents a rectangle.
func apply(info: UnsafeMutableRawPointer?, function: CGPathApplier
Function)
For each element in a graphics path, calls a custom applier function.
typealias CGPathApplierFunction
Defines a callback function that can view an element in a graphics path.
struct CGPathElement
A data structure that provides information about a path element.
enum CGPathElementType
The type of element found in a path.
class var typeID: CFTypeID
Returns the Core Foundation type identifier for Core Graphics paths.
func applyWithBlock((UnsafePointer<CGPathElement>) -> Void)
func componentsSeparated(using: CGPathFillRule) -> [CGPath]
func flattened(threshold: CGFloat) -> CGPath
func intersection(CGPath, using: CGPathFillRule) -> CGPath
func intersects(CGPath, using: CGPathFillRule) -> Bool
func lineIntersection(CGPath, using: CGPathFillRule) -> CGPath
func lineSubtracting(CGPath, using: CGPathFillRule) -> CGPath
func normalized(using: CGPathFillRule) -> CGPath
func subtracting(CGPath, using: CGPathFillRule) -> CGPath
Applying a Function to the Elements of a Path
Working with Core Foundation Types
Instance Methods


## Page 24

func symmetricDifference(CGPath, using: CGPathFillRule) -> CGPath
func union(CGPath, using: CGPathFillRule) -> CGPath
CGMutablePath
Equatable, Hashable
Quartz 2D Programming Guide
class CGContext
A Quartz 2D drawing environment.
class CGImage
A bitmap image or image mask.
class CGMutablePath
A mutable graphics path: a mathematical description of shapes or lines to be drawn in a
graphics context.
class CGLayer
An offscreen context for reusing content drawn with Core Graphics.
Relationships
Inherited By
Conforms To
See Also
Related Documentation
2D Drawing


## Page 25

Neither CGPath nor CGMutablePath define functions to draw a path. To draw a Core Graphics
path to a graphics context, you add the path to the graphics context by calling addPath(_:) an
then call one of the context’s drawing functions—see CGContext.
Each figure in the graphics path is constructed with a connected set of lines and Bézier curves,
called a subpath. A subpath has an ordered set of path elements that represent single steps in th
construction of the subpath. (For example, a line segment from one corner of a rectangle to
another corner is a path element. Every subpath includes a starting point, which is the first point i
the subpath. The path also maintains a current point, which is the last point in the last subpath.
To append a new subpath onto a mutable path, your application typically calls CGPathMoveTo
Point to set the subpath’s starting point and initial current point, followed by a series of “add”
calls (such as CGPathAddLineToPoint) to add line segments and curves to the subpath. As
segments or curves are added to the subpath, the subpath’s current point is updated to point to
the end of the last segment or curve to be added. The lines and curves of a subpath are always
connected, but they are not required to form a closed set of lines. Your application explicitly close
a subpath by calling closeSubpath(). Closing the subpath adds a line segment that terminates
at the subpath’s starting point, and also changes how those lines are rendered—for more
information see Paths in Quartz 2D Programming Guide.
Overview
Core Graphics / CGMutablePath
Class
CGMutablePath
A mutable graphics path: a mathematical description of shapes or lines to be
drawn in a graphics context.
iOS
iPadOS
Mac Catalyst
macOS
tvOS
visionOS
watchOS


## Page 26

init()
Creates a mutable graphics path.
func mutableCopy() -> CGMutablePath?
Creates a mutable copy of an existing graphics path.
func mutableCopy(using: UnsafePointer<CGAffineTransform>?) -> CGMutable
Path?
Creates a mutable copy of a graphics path transformed by a transformation matrix.
func move(to: CGPoint, transform: CGAffineTransform)
Begins a new subpath at the specified point.
func addLine(to: CGPoint, transform: CGAffineTransform)
Appends a straight line segment from the current point to the specified point.
func addLines(between: [CGPoint], transform: CGAffineTransform)
Adds a sequence of connected straight-line segments to the path.
func addRect(CGRect, transform: CGAffineTransform)
Adds a rectangular subpath to the path.
func addRects([CGRect], transform: CGAffineTransform)
Adds a set of rectangular subpaths to the path.
func addEllipse(in: CGRect, transform: CGAffineTransform)
Adds an ellipse that fits inside the specified rectangle.
func addRoundedRect(in: CGRect, cornerWidth: CGFloat, cornerHeight:
CGFloat, transform: CGAffineTransform)
Adds a subpath to the path, in the shape of a rectangle with rounded corners.
Topics
Creating Graphics Paths
Copying a Graphics Path
Constructing a Graphics Path


## Page 27

func addArc(center: CGPoint, radius: CGFloat, startAngle: CGFloat, end
Angle: CGFloat, clockwise: Bool, transform: CGAffineTransform)
Adds an arc of a circle to the path, specified with a radius and angles.
func addArc(tangent1End: CGPoint, tangent2End: CGPoint, radius: CGFloat
transform: CGAffineTransform)
Adds an arc of a circle to the path, specified with a radius and two tangent lines.
func addRelativeArc(center: CGPoint, radius: CGFloat, startAngle:
CGFloat, delta: CGFloat, transform: CGAffineTransform)
Adds an arc of a circle to the path, specified with a radius and a difference in angle.
func addCurve(to: CGPoint, control1: CGPoint, control2: CGPoint,
transform: CGAffineTransform)
Adds a cubic Bézier curve to the path, with the specified end point and control points.
func addQuadCurve(to: CGPoint, control: CGPoint, transform: CGAffine
Transform)
Adds a quadratic Bézier curve to the path, with the specified end point and control point.
func addPath(CGPath, transform: CGAffineTransform)
Appends another path object to the path.
func closeSubpath()
Closes and completes a subpath in a mutable graphics path.
CGPath
Equatable, Hashable
Relationships
Inherits From
Conforms To
See Also


## Page 28

Quartz 2D Programming Guide
class CGContext
A Quartz 2D drawing environment.
class CGImage
A bitmap image or image mask.
class CGPath
An immutable graphics path: a mathematical description of shapes or lines to be drawn in a
graphics context.
class CGLayer
An offscreen context for reusing content drawn with Core Graphics.
Related Documentation
2D Drawing


## Page 29

init?(CGContext, size: CGSize, auxiliaryInfo: CFDictionary?)
Creates a layer object that is associated with a graphics context.
var context: CGContext?
Returns the graphics context associated with a layer object.
var size: CGSize
Returns the width and height of a layer object.
class var typeID: CFTypeID
Returns the unique type identifier used for CGLayer objects.
Topics
Creating Layer Objects
Examining a Layer
Working with Core Foundation Types
Core Graphics / CGLayer
Class
CGLayer
An offscreen context for reusing content drawn with Core Graphics.
iOS
iPadOS
Mac Catalyst
macOS
tvOS
visionOS
watchOS


## Page 30

Equatable, Hashable
class CGContext
A Quartz 2D drawing environment.
class CGImage
A bitmap image or image mask.
class CGPath
An immutable graphics path: a mathematical description of shapes or lines to be drawn in a
graphics context.
class CGMutablePath
A mutable graphics path: a mathematical description of shapes or lines to be drawn in a
graphics context.
Relationships
Conforms To
See Also
2D Drawing


