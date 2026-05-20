# 005_BarMark.pdf

## Page 1

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


## Page 2

Swift Charts provides several other initializers for BarMark. Below are a few more examples using
them. For a full list of initializers see the topic section.
BarkMark automatically stacks content when more than one bar maps to the same location. You
can see this if you split the profit data up by category:
Stacked Bar Chart


## Page 3

This results in a chart that looks identical to the chart seen in the Overview section because the
bars with the same department category are stacked on top of each other. To differentiate the
product categories, add a foregroundStyle(by:) modifer that specifies a visual encoding for
the productCategory:


## Page 4

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


## Page 5

init<X, Y>(x: PlottableValue<X>, yStart: PlottableValue<Y>, yEnd:
PlottableValue<Y>, width: MarkDimension)
Creates a bar mark that plots values with x and its y interval.
init<X, Y>(xStart: PlottableValue<X>, xEnd: PlottableValue<X>, y:
PlottableValue<Y>, height: MarkDimension)
Topics
Creating a bar mark


## Page 6

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


## Page 7

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


