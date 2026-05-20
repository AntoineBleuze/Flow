# Marks.pdf

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


## Page 9

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


## Page 10

You can plot multiple lines in a chart either by explicitly specifying the series parameter in
init(x:y:series:) or by applying the foregroundStyle(_:) or lineStyle(_:)
modifiers. Line marks with the same series value will always be rendered together as a single lin
When series is unspecified line marks with the same value plotted to foreground style and line
style will be grouped together and plotted on their own line. The example below plots one line per
distinct value in city and colors each line based on the city it represents:
Plotting multiple lines


## Page 11

Note
Colors are repeated if the number of series is greater than the total number of colors.
Topics
Creating a line mark


## Page 12

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


## Page 13

A sector of a pie or donut chart, which shows how individual categories make up a meaningf
total.


## Page 14

Creating a chart using Swift Charts
You can create different kinds of point charts using the PointMark chart content. One common
chart you can build with point marks is a scatter plot which displays the relationship between two
numerical data properties. To build a scatter plot use the init(x:y:). Provide a .value for bot
the x and y parameters with a string, used as a label for the data, and the data element to be
plotted. The following example plots the wingLength and wingHeight properties with x and y,
respectively:
Mentioned in
Overview
Swift Charts / PointMark
Structure
PointMark
Chart content that represents data using points.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 9.0+


## Page 15

Swift Charts provides three additional modifiers for point mark that each allow you to plot an
additional property to a unique visual channel.
Modifier
Visual Channel
foregroundStyle(by:)
plot an additional property with color
symbol(by:)
plot an additional property with symbols
symbolSize(by:)
plot an additional property with size
For example, to plot the family property from the previous example’s Insect structure as a
color, add the foregroundStyle(by:) modifier:
Adding Additional Data Fields


## Page 16

The foreground style modifier automatically generates a color scale that provides each mark with
color that reflects its value property. To learn how to modify the default color scale, see Scale
Modifiers. The modifier also provides a default legend. To learn how to modify or disable the
legend, see ChartLegend.
Alternatively, you can distinguish families with different symbols by plotting the family property
using the symbol(by:) modifier:


## Page 17

To make a point in a 3D Chart, use the init(x:y:z:) initializer.
In addition to an x and y value, you can now position your PointMark along the z axis.
For example, in addition to plotting an insect’s wingLength and wingWidth you can also plot
their weight with the following Chart3D:
3D points also offer symbols, such as sphere, cylinder, cone, and cube. Combined with the
symbolSize(_:) and symbolRotation(_:) modifiers, you can provide rich customizations f
your 3D points:
PointMark in Chart3D
Styling a 3D PointMark


## Page 18

init<X, Y>(x: PlottableValue<X>, y: PlottableValue<Y>)
Creates a point mark that plots values to x and y.
init<Y>(x: CGFloat?, y: PlottableValue<Y>)
Creates a point mark with fixed x position and plots values with y.
init<X>(x: PlottableValue<X>, y: CGFloat?)
Creates a point mark that plots a value on x with fixed y position.
init(x: PlottableValue<some Plottable>, y: PlottableValue<some Plottabl
>, z: PlottableValue<some Plottable>)
Creates a 3D point mark that plots values to x, y and z.
Chart3DContent
ChartContent
Copyable
Sendable
SendableMetatype
Topics
Creating a point mark
Relationships
Conforms To
See Also
Marks


## Page 19

struct AreaMark
Chart content that represents data using the area of one or more regions.
struct LineMark
Chart content that represents data using a sequence of connected line segments.
struct RectangleMark
Chart content that represents data using rectangles.
struct RuleMark
Chart content that represents data using a single horizontal or vertical rule.
struct BarMark
Chart content that represents data using bars.
struct SectorMark
A sector of a pie or donut chart, which shows how individual categories make up a meaningf
total.


## Page 20

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


## Page 21

to plot, in this case num. A scale from values of num to color will be automatically generated and
used to color the rectangles based on the value.
You can annotate a specific region in a chart with a rectangle mark by providing the coordinates o
one or more rectangles. For example you can annotate point marks with rectangle marks using a
shared data source like in the example below:
Annotate a Rectangular Area with Rectangle Marks


## Page 22

To plot a rectangle in a 3D Chart, use the init(x:y:z:) initializer.
RectangleMark in Chart3D


## Page 23

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


## Page 24

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


## Page 25

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


## Page 26

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


## Page 27

You can annotate a chart with horizontal or vertically spanning rules. This allows viewers to easily
compare values over a range to a constant value. Use the init(xStart:xEnd:y:) initializer to
represent a constant y value or init(x:yStart:yEnd:) for a constant x value. To span the
plotting area of a chart with a line, omit the optional start and end parameters and plot a constant
value. The example below results in a line that spans the chart horizontally at the y position of
9000:
Annotate a chart with rule mark


## Page 28

To plot a rule in a 3D chart, use the init(x:y:z:) initializer.
The rule extends along the axis that you provide a range for, and is positioned at the single points
you specify for the other two axes.
Important
A 3D rule mark requires one parameter to be a numeric range and the other two parameters to
be single numeric values.
For example, the following Chart3D shows three rule marks. Each mark extends along one axis
and is fixed at 0 on the other two.
RuleMark in Chart3D


## Page 29

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


## Page 30

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


## Page 31

Chart content that represents data using bars.
struct SectorMark
A sector of a pie or donut chart, which shows how individual categories make up a meaningf
total.


## Page 32

Creating a chart using Swift Charts
You can create different kinds of bar charts using the BarMark chart content. To create a simple
vertical bar chart that plots categories with x positions and numbers with y positions, use init(x
y:width:height:stacking:). For example, you can display profit by department:
Mentioned in
Overview
Swift Charts / BarMark
Structure
BarMark
Chart content that represents data using bars.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 9.0+


## Page 33

Swift Charts provides several other initializers for BarMark. Below are a few more examples using
them. For a full list of initializers see the topic section.
BarkMark automatically stacks content when more than one bar maps to the same location. You
can see this if you split the profit data up by category:
Stacked Bar Chart


## Page 34

This results in a chart that looks identical to the chart seen in the Overview section because the
bars with the same department category are stacked on top of each other. To differentiate the
product categories, add a foregroundStyle(by:) modifer that specifies a visual encoding for
the productCategory:


## Page 35

You can use the optional stacking: parameter in the BarMark initializer to modify the stacking
mechanism. See MarkStackingMethod for the stacking options.
To build a one dimensional chart, use one of the initializers that only requires a PlottableValue
for one dimension, like init(x:yStart:yEnd:width:stacking:) for plotting with x. The
example below reuses the data from the previous example to get the production department
values:
Use BarMark to represent intervals by using the init(xStart:xEnd:y:height:), init(x
Start:xEnd:y:height:stacking:), init(x:yStart:yEnd:width:) or init(x:
yStart:yEnd:width:stacking:). The example below displays a Gantt chart by plotting the
start and end properties to x positions and the task property to y positions:
1D Bar Chart
Interval Bar Chart


## Page 36

init<X, Y>(x: PlottableValue<X>, yStart: PlottableValue<Y>, yEnd:
PlottableValue<Y>, width: MarkDimension)
Creates a bar mark that plots values with x and its y interval.
init<X, Y>(xStart: PlottableValue<X>, xEnd: PlottableValue<X>, y:
PlottableValue<Y>, height: MarkDimension)
Topics
Creating a bar mark


## Page 37

Creates a bar mark that plots values with its x interval and y.
init<X, Y>(x: PlottableValue<X>, y: PlottableValue<Y>, width: Mark
Dimension, height: MarkDimension, stacking: MarkStackingMethod)
Creates a bar mark that plots values with x and y.
init<X>(xStart: PlottableValue<X>, xEnd: PlottableValue<X>, yStart:
CGFloat?, yEnd: CGFloat?)
Creates a bar mark that plots values with its x interval and fixed y position.
init<Y>(xStart: CGFloat?, xEnd: CGFloat?, yStart: PlottableValue<Y>, y
End: PlottableValue<Y>)
Creates a bar mark with fixed x interval that plots values with its y interval.
init<X, Y>(x: PlottableValue<X>, y: PlottableValue<Y>, width: Mark
Dimension, height: MarkDimension, stacking: MarkStackingMethod)
Creates a bar mark that plots values with x and y.
init<X>(x: PlottableValue<X>, yStart: CGFloat?, yEnd: CGFloat?, width:
MarkDimension, stacking: MarkStackingMethod)
Creates a bar mark that plots a value on x with fixed y interval.
init<Y>(xStart: CGFloat?, xEnd: CGFloat?, y: PlottableValue<Y>, height:
MarkDimension, stacking: MarkStackingMethod)
Creates a bar mark that plots values on y with fixed x interval.
ChartContent
Copyable
Sendable
SendableMetatype
Relationships
Conforms To
See Also


## Page 38

struct AreaMark
Chart content that represents data using the area of one or more regions.
struct LineMark
Chart content that represents data using a sequence of connected line segments.
struct PointMark
Chart content that represents data using points.
struct RectangleMark
Chart content that represents data using rectangles.
struct RuleMark
Chart content that represents data using a single horizontal or vertical rule.
struct SectorMark
A sector of a pie or donut chart, which shows how individual categories make up a meaningf
total.
Marks


## Page 39

The relative size of per-category values that make up the total value are mapped to the angular
sizes of the sectors.
To ensure that the visualization is easy to read, design pie or donut charts with no more than 5-7
sectors. Sum any remaining values into an “Other” group if necessary, or consider horizontal bar
charts, which can scale to many bars, are easy to label with categories, and let users compare
items more accurately.
Make sure that your data contains only positive values. Also, very small proportions may not be
discernible in the chart, especially if an angular inset is specified.
To visualize the ratio of values to the total that they collectively add up to, specify the values, mos
often ordered by decreasing value. If needed, add an “Other” group as the last item.
Overview
Create a pie chart with sector marks
Swift Charts / SectorMark
Structure
SectorMark
A sector of a pie or donut chart, which shows how individual categories make up a
meaningful total.
iOS 17.0+
iPadOS 17.0+
Mac Catalyst 17.0+
macOS 14.0+
tvOS 17.0+
visionOS 1.0+
watchOS 10.0+


## Page 40

The inner and outer radii can be customized for your design. A non-zero inner radius yields a don
chart. A small angular inset helps accessibility and readability by adding contrast between sectors
which is useful for pie and donut charts. Limit the size of the angular inset and corner radius to
small values to avoid distorting the shape and relative size of the sectors.
init(angle: PlottableValue<some Plottable>, innerRadius: MarkDimension,
outerRadius: MarkDimension, angularInset: CGFloat?)
Creates a sector mark, which uses the angular size to represent the proportion of the value t
the sum of all values.
Create and style a donut chart with sector marks
Topics
Initializers


## Page 41

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
struct RuleMark
Chart content that represents data using a single horizontal or vertical rule.
struct BarMark
Chart content that represents data using bars.
Relationships
Conforms To
See Also
Marks


