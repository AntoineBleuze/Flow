# 001_LineMark.pdf

## Page 1

Creating a chart using Swift Charts
You create a line chart by plotting a category or date property, typically with the x position, and
plotting a number category, typically with the y position. The example below plots the date
property to the x position and the hoursOfSunshine property to the y position using init(x:
y:):
Mentioned in
Overview
Swift Charts / LineMark
Structure
LineMark
Chart content that represents data using a sequence of connected line segments
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 9.0+


## Page 2

You can plot multiple lines in a chart either by explicitly specifying the series parameter in
init(x:y:series:) or by applying the foregroundStyle(_:) or lineStyle(_:)
modifiers. Line marks with the same series value will always be rendered together as a single lin
When series is unspecified line marks with the same value plotted to foreground style and line
style will be grouped together and plotted on their own line. The example below plots one line per
distinct value in city and colors each line based on the city it represents:
Plotting multiple lines


## Page 3

Note
Colors are repeated if the number of series is greater than the total number of colors.
Topics
Creating a line mark


## Page 4

init<X, Y>(x: PlottableValue<X>, y: PlottableValue<Y>)
Creates a line mark.
init<X, Y, S>(x: PlottableValue<X>, y: PlottableValue<Y>, series:
PlottableValue<S>)
Creates a separate line for each unique value of series.
ChartContent
Copyable
Sendable
SendableMetatype
struct AreaMark
Chart content that represents data using the area of one or more regions.
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


## Page 5

A sector of a pie or donut chart, which shows how individual categories make up a meaningf
total.


