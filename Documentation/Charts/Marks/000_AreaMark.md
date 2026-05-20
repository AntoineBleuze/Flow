# 000_AreaMark.pdf

## Page 1

Use AreaMark to represent data as filled regions on a chart. To create a simple area mark chart,
plot a date or an ordered string property on the x-axis, and a number on the y-axis. For example,
suppose you have data that represents the cost of a cheeseburger over time, stored in an array o
Food structures:
Overview
Swift Charts / AreaMark
Structure
AreaMark
Chart content that represents data using the area of one or more regions.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 9.0+


## Page 2

You can create labeled data in the form of PlottableValue instances for each of the x and y
inputs to an area mark:
The resulting chart automatically scales and labels the axes based on the data, and fills the area
under the data points with a default color:
If you want only the line without filling in the area below the line, use LineMark instead.
To represent an additional dimension of information, you can create a stacked area chart. For
example, suppose you have another data set that represents the same cost data from the previou
example, but which is broken into the component costs for the burger, bun, and cheese:
Add detail with a stacked area chart


## Page 3

You can again create an area mark with the data, but in this case add the foreground
Style(by:) modifier to create a stacked area chart that divides the information into distinct
regions based on the data’s name property:
The chart automatically assigns a different color to each region, and adds a legend that indicates
what each color represents based on the names that you provide to the modifier:
Stack the data in different ways


## Page 4

You can highlight different aspects of the data by stacking it in different ways. For example, the
previous chart shows the absolute contributions of each ingredient to the cheeseburger’s total
cost. To see the relative contributions instead, you can create a normalized chart by setting the
area mark’s stacking parameter to normalized:
Alternatively, you can use center stacking to create a streamgraph, which shifts the area chart’s
baseline to the center of the chart’s plotting area:


## Page 5

You can also use area marks to create a range area chart, where you provide an interval to fill in fo
each data point. To do this, you provide either a date or ordered string category for the x-axis and
range of values for the y-axis, or vice versa. For example, suppose you record the minimum and
maximum temperatures every day in a Weather structure:
If you load a collection of these structures into a data array, you can use the date on the x-axis,
and each day’s minimum and maximum temperature as the start and end points for the y-axis:
This creates a filled region that’s shaped by the start and end points on each date:
Create a range area chart


## Page 6

init<X, Y>(x: PlottableValue<X>, y: PlottableValue<Y>, stacking: Mark
StackingMethod)
Creates an area mark using the specified horizontal and vertical positions.
init<X, Y, S>(x: PlottableValue<X>, y: PlottableValue<Y>, series:
PlottableValue<S>, stacking: MarkStackingMethod)
Creates an area mark and associates it with the specified series.
init<X, Y>(x: PlottableValue<X>, yStart: PlottableValue<Y>, yEnd:
PlottableValue<Y>)
Creates an area mark that plots values with a vertical interval.
init<X, Y, S>(x: PlottableValue<X>, yStart: PlottableValue<Y>, yEnd:
PlottableValue<Y>, series: PlottableValue<S>)
Creates an area mark that plots values with a vertical interval and associates it with the
specified series.
init<X, Y>(xStart: PlottableValue<X>, xEnd: PlottableValue<X>, y:
PlottableValue<Y>)
Topics
Creating an area mark
Creating a range area chart


## Page 7

Creates an area mark that plots values with a horizontal interval.
init<X, Y, S>(xStart: PlottableValue<X>, xEnd: PlottableValue<X>, y:
PlottableValue<Y>, series: PlottableValue<S>)
Creates an area mark that plots values with a horizontal interval and associates it with the
specified series.
ChartContent
Copyable
Sendable
SendableMetatype
struct LineMark
Chart content that represents data using a sequence of connected line segments.
struct PointMark
Chart content that represents data using points.
struct RectangleMark
Chart content that represents data using rectangles.
struct RuleMark
Chart content that represents data using a single horizontal or vertical rule.
struct BarMark
Chart content that represents data using bars.
struct SectorMark
Relationships
Conforms To
See Also
Marks


## Page 8

A sector of a pie or donut chart, which shows how individual categories make up a meaningf
total.


