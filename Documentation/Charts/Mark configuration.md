# Mark configuration.pdf

## Page 1

static var center: MarkStackingMethod
Stack marks using a center offset.
static var normalized: MarkStackingMethod
Create normalized stacked bar and area charts.
static var standard: MarkStackingMethod
Stack marks starting at zero.
static var unstacked: MarkStackingMethod
Don’t stack marks.
Topics
Type Properties
Relationships
Conforms To
Swift Charts / MarkStackingMethod
Structure
MarkStackingMethod
The ways in which you can stack marks in a chart.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 9.0+


## Page 2

BitwiseCopyable
Copyable
CustomStringConvertible
Equatable
Sendable
SendableMetatype
struct MarkDimension
An individual dimension representing a mark’s width or height.
struct InterpolationMethod
The ways in which line or area marks interpolate their data.
struct BasicChartSymbolShape
A basic chart symbol shape.
protocol ChartSymbolShape
A type that can act as a shape for the marks that you add to a chart.
struct AnyChartSymbolShape
A type-erased plotting shape.
See Also
Mark configuration


## Page 3

struct MarkDimensions
init(floatLiteral: Double)
Creates a constant width or height from a floating point value.
init(integerLiteral: Int)
Creates a constant width or height from an integer.
static var automatic: MarkDimension
A dimension that determines its value automatically.
Topics
Supporting types
Initializers
Type Properties
Type Methods
Swift Charts / MarkDimension
Structure
MarkDimension
An individual dimension representing a mark’s width or height.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 9.0+


## Page 4

static func fixed(CGFloat) -> MarkDimension
A constant dimension.
static func inset(CGFloat) -> MarkDimension
A dimension that’s the step size minus the specified inset value on each side.
static func ratio(CGFloat) -> MarkDimension
A dimension that’s proportional to the scale step size, using the specified ratio.
BitwiseCopyable
Copyable
CustomStringConvertible
ExpressibleByFloatLiteral
ExpressibleByIntegerLiteral
Sendable
SendableMetatype
struct MarkStackingMethod
The ways in which you can stack marks in a chart.
struct InterpolationMethod
The ways in which line or area marks interpolate their data.
struct BasicChartSymbolShape
A basic chart symbol shape.
protocol ChartSymbolShape
A type that can act as a shape for the marks that you add to a chart.
Relationships
Conforms To
See Also
Mark configuration


## Page 5

struct AnyChartSymbolShape
A type-erased plotting shape.


## Page 6

static var cardinal: InterpolationMethod
Interpolate data points with cardinal spline.
static var catmullRom: InterpolationMethod
Interpolate data points with Catmull-Rom spline.
static var linear: InterpolationMethod
Interpolate data points linearly.
static var monotone: InterpolationMethod
Interpolate data points with a cubic spline that preserves monotonicity of the data.
static var stepCenter: InterpolationMethod
Interpolate data points with a step, or piece-wise constant function, where the data point is a
the center of the step.
static var stepEnd: InterpolationMethod
Interpolate data points with a step, or piece-wise constant function, where the data point is a
the end of the step.
Topics
Type Properties
Swift Charts / InterpolationMethod
Structure
InterpolationMethod
The ways in which line or area marks interpolate their data.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 9.0+


## Page 7

static var stepStart: InterpolationMethod
Interpolate data points with a step, or piece-wise constant function, where the data point is a
the start of the step.
static func cardinal(tension: CGFloat) -> InterpolationMethod
Interpolate data points with cardinal spline, using the given tension parameter.
static func catmullRom(alpha: CGFloat) -> InterpolationMethod
Interpolate data points with Catmull-Rom spline, using the given alpha parameter.
BitwiseCopyable
Copyable
CustomStringConvertible
Sendable
SendableMetatype
struct MarkStackingMethod
The ways in which you can stack marks in a chart.
struct MarkDimension
An individual dimension representing a mark’s width or height.
struct BasicChartSymbolShape
A basic chart symbol shape.
protocol ChartSymbolShape
Type Methods
Relationships
Conforms To
See Also
Mark configuration


## Page 8

A type that can act as a shape for the marks that you add to a chart.
struct AnyChartSymbolShape
A type-erased plotting shape.


## Page 9

func strokeBorder(lineWidth: CGFloat) -> some ChartSymbolShape
Creates a stroked symbol shape by inner-stroking the basic symbol shape.
Animatable
ChartSymbolShape
Sendable
SendableMetatype
Shape
View
Topics
Instance Methods
Relationships
Conforms To
Swift Charts / BasicChartSymbolShape
Structure
BasicChartSymbolShape
A basic chart symbol shape.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 9.0+


## Page 10

struct MarkStackingMethod
The ways in which you can stack marks in a chart.
struct MarkDimension
An individual dimension representing a mark’s width or height.
struct InterpolationMethod
The ways in which line or area marks interpolate their data.
protocol ChartSymbolShape
A type that can act as a shape for the marks that you add to a chart.
struct AnyChartSymbolShape
A type-erased plotting shape.
See Also
Mark configuration


## Page 11

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


## Page 12

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


## Page 13

The ways in which you can stack marks in a chart.
struct MarkDimension
An individual dimension representing a mark’s width or height.
struct InterpolationMethod
The ways in which line or area marks interpolate their data.
struct BasicChartSymbolShape
A basic chart symbol shape.
struct AnyChartSymbolShape
A type-erased plotting shape.


## Page 14

init(any ChartSymbolShape)
Animatable
ChartSymbolShape
Sendable
SendableMetatype
Shape
View
Topics
Initializers
Relationships
Conforms To
See Also
Swift Charts / AnyChartSymbolShape
Structure
AnyChartSymbolShape
A type-erased plotting shape.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 9.0+


## Page 15

struct MarkStackingMethod
The ways in which you can stack marks in a chart.
struct MarkDimension
An individual dimension representing a mark’s width or height.
struct InterpolationMethod
The ways in which line or area marks interpolate their data.
struct BasicChartSymbolShape
A basic chart symbol shape.
protocol ChartSymbolShape
A type that can act as a shape for the marks that you add to a chart.
Mark configuration


