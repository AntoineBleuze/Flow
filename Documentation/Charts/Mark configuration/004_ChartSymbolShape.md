# 004_ChartSymbolShape.pdf

## Page 1

var perceptualUnitRect: CGRect
Returns a rectangle that bounds the shape in such a way that viewers perceive it as having t
same size and position as a unit rectangle.
Required
func strokeBorder(lineWidth: CGFloat) -> some ChartSymbolShape
func strokeBorder(style: StrokeStyle) -> some ChartSymbolShape
static var asterisk: BasicChartSymbolShape
Asterisk symbol.
static var circle: BasicChartSymbolShape
Circle symbol.
Topics
Instance Properties
Instance Methods
Type Properties
Swift Charts / ChartSymbolShape
Protocol
ChartSymbolShape
A type that can act as a shape for the marks that you add to a chart.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 9.0+


## Page 2

static var cross: BasicChartSymbolShape
Cross symbol.
static var diamond: BasicChartSymbolShape
Diamond symbol.
static var pentagon: BasicChartSymbolShape
Pentagon symbol.
static var plus: BasicChartSymbolShape
Plus symbol.
static var square: BasicChartSymbolShape
Square symbol.
static var triangle: BasicChartSymbolShape
Triangle symbol.
Animatable
Sendable
SendableMetatype
Shape
View
AnyChartSymbolShape, BasicChartSymbolShape
struct MarkStackingMethod
Relationships
Inherits From
Conforming Types
See Also
Mark configuration


## Page 3

The ways in which you can stack marks in a chart.
struct MarkDimension
An individual dimension representing a mark’s width or height.
struct InterpolationMethod
The ways in which line or area marks interpolate their data.
struct BasicChartSymbolShape
A basic chart symbol shape.
struct AnyChartSymbolShape
A type-erased plotting shape.


