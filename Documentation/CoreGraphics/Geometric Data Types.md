# Geometric Data Types.pdf

## Page 1

The size and precision of this type depend on the CPU architecture. When you build for a 64-bit
CPU, the CGFloat type is a 64-bit, IEEE double-precision floating point type, equivalent to the
Double type. When you build for a 32-bit CPU, the CGFloat type is a 32-bit, IEEE single-precisio
floating point type, equivalent to the Float type.
init()
Create an instance initialized to zero.
init(CGFloat)
Create an instance initialized to value.
init(NSNumber)
Creates a new value, rounded to the closest possible representation.
Overview
Topics
Initializers
Core Foundation / CGFloat
Structure
CGFloat
The basic type for floating-point scalar values in Core Graphics and related
frameworks.
iOS 2.0+
iPadOS 2.0+
Mac Catalyst 13.0+
macOS 10.0+
tvOS 9.0+
visionOS
watchOS 1.0+


## Page 2

init(bitPattern: UInt)
init?(exactly: NSNumber)
init(nan: CGFloat.RawSignificand, signaling: Bool)
init(truncating: NSNumber)
var bitPattern: UInt
var native: CGFloat.NativeType
The native value.
typealias NativeType
The native type used to store the CGFloat.
CustomReflectable Implementations
CustomStringConvertible Implementations
ExpressibleByFloatLiteral Implementations
ExpressibleByIntegerLiteral Implementations
Hashable Implementations
Strideable Implementations
AdditiveArithmetic
Animatable
BinaryFloatingPoint
BitwiseCopyable
CVarArg
Instance Properties
Type Aliases
Default Implementations
Relationships
Conforms To


## Page 3

Comparable
Copyable
CustomReflectable
CustomStringConvertible
Decodable
Encodable
Equatable
ExpressibleByFloatLiteral
ExpressibleByIntegerLiteral
FloatingPoint
Hashable
Numeric
Sendable
SendableMetatype
SignedNumeric
Strideable
VectorArithmetic
struct CGAffineTransform
struct CGAffineTransformComponents
struct CGPoint
struct CGRect
struct CGSize
A structure that contains width and height values.
struct CGVector
A structure that contains a two-dimensional vector.
See Also
Structures


## Page 4

init()
init?(dictionaryRepresentation: CFDictionary)
init(x: Double, y: Double)
init(x: Double, y: Double)
init(x: Int, y: Int)
var customPlaygroundQuickLook: PlaygroundQuickLook
A custom playground Quick Look for this instance.
Deprecated
var dictionaryRepresentation: CFDictionary
var x: Double
var y: Double
Topics
Initializers
Instance Properties
Instance Methods
Core Foundation / CGPoint
Structure
CGPoint
iOS
iPadOS
Mac Catalyst
macOS
tvOS
visionOS
watchOS


## Page 5

func applying(CGAffineTransform) -> CGPoint
func applying(ProjectionTransform) -> CGPoint
func equalTo(CGPoint) -> Bool
static var zero: CGPoint
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
struct CGAffineTransform
struct CGAffineTransformComponents
struct CGFloat
The basic type for floating-point scalar values in Core Graphics and related frameworks.
struct CGRect
struct CGSize
Type Properties
Relationships
Conforms To
See Also
Structures


## Page 6

A structure that contains width and height values.
struct CGVector
A structure that contains a two-dimensional vector.


## Page 7

A CGSize structure is sometimes used to represent a distance vector, rather than a physical size
As a vector, its values can be negative. To normalize a CGRect structure so that its size is
represented by positive values, call the standardized function.
var width: Double
A width value.
var height: Double
A height value.
static var zero: CGSize
init()
Overview
Topics
Geometric Properties
Special Values
Core Foundation / CGSize
Structure
CGSize
A structure that contains width and height values.
iOS
iPadOS
Mac Catalyst
macOS
tvOS
visionOS
watchOS


## Page 8

Creates a size with zero width and height.
func applying(CGAffineTransform) -> CGSize
var dictionaryRepresentation: CFDictionary
init?(dictionaryRepresentation: CFDictionary)
var debugDescription: String
A textual representation of the size’s dimensions.
var customMirror: Mirror
A representation of the size’s structure and display style for use in debugging.
var customPlaygroundQuickLook: PlaygroundQuickLook
A custom playground Quick Look for this instance.
func CGSizeEqualToSize(CGSize, CGSize) -> Bool
Returns whether two sizes are equal.
init(CVImageSize)
Convert CVImageSize to CGSize
init?(dictionaryRepresentation: CFDictionary)
init(width: Double, height: Double)
init(width: Double, height: Double)
init(width: Int, height: Int)
var customPlaygroundQuickLook: PlaygroundQuickLook
Transforming Sizes
Alternate Representations
Comparing Sizes
Initializers
Instance Properties


## Page 9

A custom playground Quick Look for this instance.
Deprecated
var dictionaryRepresentation: CFDictionary
func applying(CGAffineTransform) -> CGSize
func equalTo(CGSize) -> Bool
static var zero: CGSize
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
struct CGAffineTransform
struct CGAffineTransformComponents
Instance Methods
Type Properties
Relationships
Conforms To
See Also
Structures


## Page 10

struct CGFloat
The basic type for floating-point scalar values in Core Graphics and related frameworks.
struct CGPoint
struct CGRect
struct CGVector
A structure that contains a two-dimensional vector.


## Page 11

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


## Page 12

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


## Page 13

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


## Page 14

struct CGAffineTransform
struct CGAffineTransformComponents
struct CGFloat
The basic type for floating-point scalar values in Core Graphics and related frameworks.
struct CGPoint
struct CGSize
A structure that contains width and height values.
struct CGVector
A structure that contains a two-dimensional vector.


## Page 15

static var zero: CGVector
init()
Creates a vector whose components are both zero.
var dx: Double
The x component of the vector.
var dy: Double
The y component of the vector.
init(dx: Double, dy: Double)
init(dx: Double, dy: Double)
init(dx: Int, dy: Int)
Topics
Special Values
Geometric Properties
Initializers
Core Foundation / CGVector
Structure
CGVector
A structure that contains a two-dimensional vector.
iOS
iPadOS
Mac Catalyst
macOS
tvOS
visionOS
watchOS


## Page 16

static var zero: CGVector
BitwiseCopyable
Copyable
CustomDebugStringConvertible
Decodable
Encodable
Equatable
Hashable
Sendable
struct CGAffineTransform
struct CGAffineTransformComponents
struct CGFloat
The basic type for floating-point scalar values in Core Graphics and related frameworks.
struct CGPoint
struct CGRect
struct CGSize
A structure that contains width and height values.
Type Properties
Relationships
Conforms To
See Also
Structures


## Page 17

init()
init(CGAffineTransformComponents)
init(CGFloat, CGFloat, CGFloat, CGFloat, CGFloat, CGFloat)
init(a: Double, b: Double, c: Double, d: Double, tx: Double, ty: Double
init(rotationAngle: CGFloat)
init(scaleX: CGFloat, y: CGFloat)
init(translationX: CGFloat, y: CGFloat)
var a: Double
var b: Double
var c: Double
var d: Double
var isIdentity: Bool
Topics
Initializers
Instance Properties
Core Foundation / CGAffineTransform
Structure
CGAffineTransform
iOS
iPadOS
Mac Catalyst
macOS
tvOS
visionOS
watchOS


## Page 18

var tx: Double
var ty: Double
func concatenating(CGAffineTransform) -> CGAffineTransform
func decomposed() -> CGAffineTransformComponents
func inverted() -> CGAffineTransform
func rotated(by: CGFloat) -> CGAffineTransform
func scaledBy(x: CGFloat, y: CGFloat) -> CGAffineTransform
func translatedBy(x: CGFloat, y: CGFloat) -> CGAffineTransform
static var identity: CGAffineTransform
BitwiseCopyable
Copyable
Decodable
Encodable
Equatable
Hashable
Sendable
struct CGAffineTransformComponents
Instance Methods
Type Properties
Relationships
Conforms To
See Also
Structures


## Page 19

struct CGFloat
The basic type for floating-point scalar values in Core Graphics and related frameworks.
struct CGPoint
struct CGRect
struct CGSize
A structure that contains width and height values.
struct CGVector
A structure that contains a two-dimensional vector.


