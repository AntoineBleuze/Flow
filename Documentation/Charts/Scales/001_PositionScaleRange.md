# 001_PositionScaleRange.pdf

## Page 1

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


## Page 2

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


