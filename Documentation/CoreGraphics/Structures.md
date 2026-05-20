# Structures.pdf

## Page 1

var colorSpace: CGColorSpace
subscript<T>(dynamicMember _: WritableKeyPath<__CGBitmapParameters, T>)
-> T
subscript<T>(dynamicMember _: KeyPath<__CGBitmapParameters, T>) -> T
Topics
Instance Properties
Subscripts
Core Graphics / CGBitmapParameters
Structure
CGBitmapParameters
iOS 26.0+
iPadOS 26.0+
Mac Catalyst
macOS 26.0+
tvOS 26.0+
visionOS 26.0+
watchOS 26.0+


## Page 2

init(rawValue: UInt32)
static var cmyk: CGColorModel
static var deviceN: CGColorModel
static var gray: CGColorModel
static var lab: CGColorModel
static var rgb: CGColorModel
BitwiseCopyable
Equatable
Topics
Initializers
Type Properties
Relationships
Conforms To
Core Graphics / CGColorModel
Structure
CGColorModel
iOS
iPadOS
Mac Catalyst
macOS
tvOS
visionOS
watchOS


## Page 3

ExpressibleByArrayLiteral
OptionSet
RawRepresentable
Sendable
SendableMetatype
SetAlgebra


## Page 4

init()
init(deepestImageComponent: CGComponent, contentColorModels: CGColor
Model, hasWideGamut: Bool, hasTransparency: Bool, largestContentHeadroo
: Float)
var contentColorModels: CGColorModel
var deepestImageComponent: CGComponent
var hasTransparency: Bool
var hasWideGamut: Bool
var largestContentHeadroom: Float
Topics
Initializers
Instance Properties
Relationships
Core Graphics / CGContentInfo
Structure
CGContentInfo
iOS
iPadOS
Mac Catalyst
macOS
tvOS
visionOS
watchOS


## Page 5

BitwiseCopyable, Sendable
Conforms To


