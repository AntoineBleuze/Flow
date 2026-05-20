# 000_CGFloat.pdf

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


