# 002_CGPath.pdf

## Page 1

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


## Page 2

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


## Page 3

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


## Page 4

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


