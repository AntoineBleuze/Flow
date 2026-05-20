# Scales.pdf

## Page 1

associatedtype VisualValue
Required
PositionScaleRange
PlotDimensionScaleRange
Topics
Associated Types
Relationships
Inherited By
Conforming Types
See Also
Swift Charts / ScaleRange
Protocol
ScaleRange
A type that you can use to configure the range of a chart.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 9.0+


## Page 2

protocol PositionScaleRange
A type that configures the x-axis and y-axis values.
struct PlotDimensionScaleRange
A range that represents the plot area’s width or height.
protocol ScaleDomain
A type that you can use to configure the domain of a chart.
struct AutomaticScaleDomain
A domain that the chart infers from its data.
struct ScaleType
The ways you can scale the domain or range of a plot.
Scales


## Page 3

static var plotDimension: PlotDimensionScaleRange
A scale range that fills the plot area.
static func plotDimension(padding: CGFloat) -> PlotDimensionScaleRange
A scale range that fills the plot area with the given padding value at start and end.
static func plotDimension(startPadding: CGFloat, endPadding: CGFloat) -
PlotDimensionScaleRange
A scale range that fills the plot area with the given padding values at start and end,
respectively.
Topics
Type Properties
Type Methods
Relationships
Inherits From
Swift Charts / PositionScaleRange
Protocol
PositionScaleRange
A type that configures the x-axis and y-axis values.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 9.0+


## Page 4

ScaleRange
PlotDimensionScaleRange
protocol ScaleRange
A type that you can use to configure the range of a chart.
struct PlotDimensionScaleRange
A range that represents the plot area’s width or height.
protocol ScaleDomain
A type that you can use to configure the domain of a chart.
struct AutomaticScaleDomain
A domain that the chart infers from its data.
struct ScaleType
The ways you can scale the domain or range of a plot.
Conforming Types
See Also
Scales


## Page 5

PositionScaleRange, ScaleRange
protocol ScaleRange
A type that you can use to configure the range of a chart.
protocol PositionScaleRange
A type that configures the x-axis and y-axis values.
protocol ScaleDomain
A type that you can use to configure the domain of a chart.
struct AutomaticScaleDomain
A domain that the chart infers from its data.
Relationships
Conforms To
See Also
Scales
Swift Charts / PlotDimensionScaleRange
Structure
PlotDimensionScaleRange
A range that represents the plot area’s width or height.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 9.0+


## Page 6

struct ScaleType
The ways you can scale the domain or range of a plot.


## Page 7

A type you use to configure the domain of a chart scale.
By default, number scales include zero in the domain to ensure charts follow the best practice to
include a zero baseline in bar charts.
For other marks, this zero baseline isn’t as important, but the framework includes zero by default
so the domain inference logic is consistent and deterministic. Changing the mark type won’t
suddenly affect scale domain.
Overview
Including zero in number scales
Swift Charts / ScaleDomain
Protocol
ScaleDomain
A type that you can use to configure the domain of a chart.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 9.0+


## Page 8

If you don’t want to include the zero baseline in certain cases, use automatic(includeszero
reversed:) to customize the scale domain and disable the automatic zero inclusion.
You can also reverse the order of the inferred domain:
Reversing the order of inferred domain
Topics
Type Properties


## Page 9

static var automatic: AutomaticScaleDomain
Creates a scale domain configuration that infers the scale domain from data.
static func automatic(includesZero: Bool?, reversed: Bool?) -> Automati
ScaleDomain
Creates a scale domain configuration that infers the scale domain from data.
static func automatic<DataValue>(includesZero: Bool?, reversed: Bool?,
dataType: DataValue.Type, modifyInferredDomain: (inout [DataValue]) ->
Void) -> AutomaticScaleDomain
Creates a scale domain configuration that infers the scale domain from data.
AutomaticScaleDomain
protocol ScaleRange
A type that you can use to configure the range of a chart.
protocol PositionScaleRange
A type that configures the x-axis and y-axis values.
struct PlotDimensionScaleRange
A range that represents the plot area’s width or height.
struct AutomaticScaleDomain
A domain that the chart infers from its data.
Type Methods
Relationships
Conforming Types
See Also
Scales


## Page 10

struct ScaleType
The ways you can scale the domain or range of a plot.


## Page 11

Use automatic to get an instance of this type.
ScaleDomain
protocol ScaleRange
A type that you can use to configure the range of a chart.
protocol PositionScaleRange
A type that configures the x-axis and y-axis values.
Overview
Relationships
Conforms To
See Also
Scales
Swift Charts / AutomaticScaleDomain
Structure
AutomaticScaleDomain
A domain that the chart infers from its data.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 9.0+


## Page 12

struct PlotDimensionScaleRange
A range that represents the plot area’s width or height.
protocol ScaleDomain
A type that you can use to configure the domain of a chart.
struct ScaleType
The ways you can scale the domain or range of a plot.


## Page 13

Use this type with the type: parameter of .chartXScale view modifiers to customize scale
types.
static var category: ScaleType
A scale that has discrete domain values as inputs.
static var date: ScaleType
A date scale where each range value y can be expressed as a function of the domain value x
timestamp, with y = a * x.timeIntervalSinceReferenceDate + b.
static var linear: ScaleType
A number scale where each range value y can be expressed as a linear function of the doma
value x, with y = a * x + b.
static var log: ScaleType
Overview
Topics
Type Properties
Swift Charts / ScaleType
Structure
ScaleType
The ways you can scale the domain or range of a plot.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 9.0+


## Page 14

A number scale where each range value y can be expressed as a logarithmic function of the
domain value x, with y = a * log(x) + b.
static var squareRoot: ScaleType
A number scale where each range value y can be expressed as a square root function of the
domain value x, with y = a * sqrt(x) + b. This is equivalent to a power scale with
exponent 0.5.
static var symmetricLog: ScaleType
A number scale where each range value y can be expressed as a symmetric log function of
the domain value x, with y = a * sign(x) * log(1 + |x * slopeAtZero|) + b.
The constant slopeAtZero defaults to 1. You can configure it with symmetricLog(slope
AtZero:).
static func power(exponent: Double) -> ScaleType
A number scale where each range value y can be expressed as a power function of the
domain value x, with y = a * pow(x, exponent) + b.
static func symmetricLog(slopeAtZero: Double) -> ScaleType
A number scale where each range value y can be expressed as a symmetric log function of
the domain value x, with y = a * sign(x) * log(1 + |x * slopeAtZero|) + b.
protocol ScaleRange
A type that you can use to configure the range of a chart.
protocol PositionScaleRange
A type that configures the x-axis and y-axis values.
struct PlotDimensionScaleRange
A range that represents the plot area’s width or height.
protocol ScaleDomain
A type that you can use to configure the domain of a chart.
Type Methods
See Also
Scales


## Page 15

struct AutomaticScaleDomain
A domain that the chart infers from its data.


