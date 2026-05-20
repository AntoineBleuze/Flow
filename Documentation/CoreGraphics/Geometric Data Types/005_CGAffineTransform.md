# 005_CGAffineTransform.pdf

## Page 1

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


## Page 2

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


## Page 3

struct CGFloat
The basic type for floating-point scalar values in Core Graphics and related frameworks.
struct CGPoint
struct CGRect
struct CGSize
A structure that contains width and height values.
struct CGVector
A structure that contains a two-dimensional vector.


