# 003_RectangleMark.pdf

## Page 1

Use rectangle mark to map data fields to rectangles. You can use the rectangle mark to create he
map charts or to annotate rectangular areas in a chart.
When presenting data about the effectiveness of a machine learning model, you typically organiz
the data using a confusion matrix which shows the predicted versus the actual results of the mod
To create a 2D heat map that represents a machine learning model you use init(x:y:width:
height:). The example below uses a 2D heat map to visualize a basic confusion matrix with the
following layout:
Negative
Positive
Negative
True Negative
False Negative
Positive
False Positive
True Positive
The number of records in each cell, num, is represented by the color of its corresponding rectang
This is done by applying the foregroundStyle(by:) modifier to the rectangle mark and
passing it a PlottableValue constructed with value(_:_:) which takes a label and the value
Overview
Create a Heat Map with Rectangle Marks
Swift Charts / RectangleMark
Structure
RectangleMark
Chart content that represents data using rectangles.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 9.0+


## Page 2

to plot, in this case num. A scale from values of num to color will be automatically generated and
used to color the rectangles based on the value.
You can annotate a specific region in a chart with a rectangle mark by providing the coordinates o
one or more rectangles. For example you can annotate point marks with rectangle marks using a
shared data source like in the example below:
Annotate a Rectangular Area with Rectangle Marks


## Page 3

To plot a rectangle in a 3D Chart, use the init(x:y:z:) initializer.
RectangleMark in Chart3D


## Page 4

Important
A 3D RectangleMark requires one parameter to be a single numeric value and the other two
parameters to be numeric ranges.
The rectangle extends along the two axes that you provide ranges for, and is positioned at a point
that you specify for the third axis.
For example, the following Chart3D shows three rectangle marks. Each mark extends along two
axes, and is fixed at 0 on the third axis.
init<X, Y>(x: PlottableValue<X>, yStart: PlottableValue<Y>, yEnd:
PlottableValue<Y>, width: MarkDimension)
Topics
Creating a rectangle mark


## Page 5

Creates a rectangle mark with an y interval encoding and an x encoding.
init<X>(x: PlottableValue<X>, yStart: CGFloat?, yEnd: CGFloat?, width:
MarkDimension)
Creates a rectangle mark that plots values on x and has a fixed y interval.
init<X, Y>(xStart: PlottableValue<X>, xEnd: PlottableValue<X>, y:
PlottableValue<Y>, height: MarkDimension)
Creates a rectangle mark with an x interval encoding and a y encoding.
init<Y>(xStart: CGFloat?, xEnd: CGFloat?, y: PlottableValue<Y>, height:
MarkDimension)
Creates a rectangle mark with a fixed x interval and y encoding.
init<X, Y>(xStart: PlottableValue<X>, xEnd: PlottableValue<X>, yStart:
PlottableValue<Y>, yEnd: PlottableValue<Y>)
Creates a rectangle mark with x and y interval encodings.
init(xStart: CGFloat?, xEnd: CGFloat?, yStart: CGFloat?, yEnd: CGFloat?
Creates a rectangle mark with fixed x and y intervals.
init<Y>(xStart: CGFloat?, xEnd: CGFloat?, yStart: PlottableValue<Y>, y
End: PlottableValue<Y>)
Creates a rectangle mark with a y interval encoding and a fixed x interval.
init<X>(xStart: PlottableValue<X>, xEnd: PlottableValue<X>, yStart:
CGFloat?, yEnd: CGFloat?)
Creates a rectangle mark with an x interval encoding and a fixed y interval.
init<X, Y>(x: PlottableValue<X>, y: PlottableValue<Y>, width: Mark
Dimension, height: MarkDimension)
Creates a rectangle that plots values with x and y.
init(x: PlottableValue<some Plottable>, y: PlottableValue<some Plottabl
>, z: PlottableValue<some Plottable>)
Creates a rectangle mark for a 3D chart.
Relationships
Conforms To


## Page 6

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
struct RuleMark
Chart content that represents data using a single horizontal or vertical rule.
struct BarMark
Chart content that represents data using bars.
struct SectorMark
A sector of a pie or donut chart, which shows how individual categories make up a meaningf
total.
See Also
Marks


