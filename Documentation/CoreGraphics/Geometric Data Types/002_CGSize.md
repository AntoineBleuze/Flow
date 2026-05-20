# 002_CGSize.pdf

## Page 1

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


## Page 2

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


## Page 3

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


## Page 4

struct CGFloat
The basic type for floating-point scalar values in Core Graphics and related frameworks.
struct CGPoint
struct CGRect
struct CGVector
A structure that contains a two-dimensional vector.


