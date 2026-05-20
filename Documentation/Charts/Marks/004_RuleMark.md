# 004_RuleMark.pdf

## Page 1

You can use RuleMark to plot a horizontal or vertical rule in your chart.
To create a horizontal line at a y position from xStart to xEnd you use the init(xStart:xEnd
y:) or init(xStart:xEnd:y:). To create a vertical line at an x position from yStart to yEnd
you use init(x:yStart:yEnd:) or init(x:yStart:yEnd:). The example below uses the
Pollen structure and the init(xStart:xEnd:y:) to map horizontal lines that span from the
value of the startDate to the value of the endDate for x positions to a pollen source property
y position:
Overview
Show Range with Rule Marks
Swift Charts / RuleMark
Structure
RuleMark
Chart content that represents data using a single horizontal or vertical rule.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 9.0+


## Page 2

You can annotate a chart with horizontal or vertically spanning rules. This allows viewers to easily
compare values over a range to a constant value. Use the init(xStart:xEnd:y:) initializer to
represent a constant y value or init(x:yStart:yEnd:) for a constant x value. To span the
plotting area of a chart with a line, omit the optional start and end parameters and plot a constant
value. The example below results in a line that spans the chart horizontally at the y position of
9000:
Annotate a chart with rule mark


## Page 3

To plot a rule in a 3D chart, use the init(x:y:z:) initializer.
The rule extends along the axis that you provide a range for, and is positioned at the single points
you specify for the other two axes.
Important
A 3D rule mark requires one parameter to be a numeric range and the other two parameters to
be single numeric values.
For example, the following Chart3D shows three rule marks. Each mark extends along one axis
and is fixed at 0 on the other two.
RuleMark in Chart3D


## Page 4

init(x: PlottableValue<some Plottable>, y: PlottableValue<some Plottabl
>, z: PlottableValue<some Plottable>)
Creates a horizontal or vertical rule mark for a 3D chart.
init<X, Y>(x: PlottableValue<X>, yStart: PlottableValue<Y>, yEnd:
PlottableValue<Y>)
Creates a vertical rule mark with an x encoding and y interval encoding.
init<X>(x: PlottableValue<X>, yStart: CGFloat?, yEnd: CGFloat?)
Creates a vertical rule mark with value plotted with x.
init<Y>(x: CGFloat?, yStart: PlottableValue<Y>, yEnd: PlottableValue<Y>
Creates a vertical rule mark with a fixed x position and y interval encoding.
Topics
Initializers


## Page 5

init<X, Y>(xStart: PlottableValue<X>, xEnd: PlottableValue<X>, y:
PlottableValue<Y>)
Creates a horizontal rule mark that plots values on its x interval and on y.
init<Y>(xStart: CGFloat?, xEnd: CGFloat?, y: PlottableValue<Y>)
Creates a horizontal rule mark that plots a value on y.
init<X>(xStart: PlottableValue<X>, xEnd: PlottableValue<X>, y: CGFloat?
Creates a horizontal rule mark that plots values on its x interval.
Chart3DContent
ChartContent
Copyable
Sendable
SendableMetatype
struct AreaMark
Chart content that represents data using the area of one or more regions.
struct LineMark
Chart content that represents data using a sequence of connected line segments.
struct PointMark
Chart content that represents data using points.
struct RectangleMark
Chart content that represents data using rectangles.
struct BarMark
Relationships
Conforms To
See Also
Marks


## Page 6

Chart content that represents data using bars.
struct SectorMark
A sector of a pie or donut chart, which shows how individual categories make up a meaningf
total.


