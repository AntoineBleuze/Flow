# 003_CGRect.pdf

## Page 1

init()
init?(dictionaryRepresentation: CFDictionary)
init(origin: CGPoint, size: CGSize)
init(x: Double, y: Double, width: Double, height: Double)
init(x: Int, y: Int, width: Int, height: Int)
init(x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat)
var customPlaygroundQuickLook: PlaygroundQuickLook
A custom playground Quick Look for this instance.
Deprecated
var dictionaryRepresentation: CFDictionary
var height: CGFloat
var integral: CGRect
var isEmpty: Bool
Topics
Initializers
Instance Properties
Core Foundation / CGRect
Structure
CGRect
iOS
iPadOS
Mac Catalyst
macOS
tvOS
visionOS
watchOS


## Page 2

var isInfinite: Bool
var isNull: Bool
var maxX: CGFloat
var maxY: CGFloat
var midX: CGFloat
var midY: CGFloat
var minX: CGFloat
var minY: CGFloat
var origin: CGPoint
var size: CGSize
var standardized: CGRect
var width: CGFloat
func applying(CGAffineTransform) -> CGRect
func clip()
Modifies the current graphics context clipping path by intersecting it with this rect. This
permanently modifies the graphics state, so the current state should be saved beforehand
and restored afterwards.
func contains(CGPoint) -> Bool
func contains(CGRect) -> Bool
func divided(atDistance: CGFloat, from: CGRectEdge) -> (slice: CGRect,
remainder: CGRect)
func equalTo(CGRect) -> Bool
func fill(using: NSCompositingOperation)
Fills this rect in the current NSGraphicsContext in the context’s fill color. The compositing
operation of the fill defaults to the context’s compositing operation, not necessarily using
.copy like NSRectFill().
func frame(withWidth: CGFloat, using: NSCompositingOperation)
Draws a frame around the inside of this rect in the current NSGraphicsContext in the context
fill color The compositing operation of the fill defaults to the context’s compositing operation
Instance Methods


## Page 3

not necessarily using .copy like NSFrameRect().
func inset(by: UIEdgeInsets) -> CGRect
func insetBy(dx: CGFloat, dy: CGFloat) -> CGRect
func intersection(CGRect) -> CGRect
func intersects(CGRect) -> Bool
func offsetBy(dx: CGFloat, dy: CGFloat) -> CGRect
func union(CGRect) -> CGRect
static var infinite: CGRect
static var null: CGRect
static var zero: CGRect
Animatable
BitwiseCopyable
Copyable
CustomDebugStringConvertible
CustomReflectable
Decodable
Encodable
Equatable
Hashable
Sendable
Type Properties
Relationships
Conforms To
See Also
Structures


## Page 4

struct CGAffineTransform
struct CGAffineTransformComponents
struct CGFloat
The basic type for floating-point scalar values in Core Graphics and related frameworks.
struct CGPoint
struct CGSize
A structure that contains width and height values.
struct CGVector
A structure that contains a two-dimensional vector.


