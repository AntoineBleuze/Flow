# 003_ScaleDomain.pdf

## Page 1

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


## Page 2

If you don’t want to include the zero baseline in certain cases, use automatic(includeszero
reversed:) to customize the scale domain and disable the automatic zero inclusion.
You can also reverse the order of the inferred domain:
Reversing the order of inferred domain
Topics
Type Properties


## Page 3

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


## Page 4

struct ScaleType
The ways you can scale the domain or range of a plot.


