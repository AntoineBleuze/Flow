# 002_PointMark.pdf

## Page 1

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


## Page 2

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


## Page 3

The foreground style modifier automatically generates a color scale that provides each mark with
color that reflects its value property. To learn how to modify the default color scale, see Scale
Modifiers. The modifier also provides a default legend. To learn how to modify or disable the
legend, see ChartLegend.
Alternatively, you can distinguish families with different symbols by plotting the family property
using the symbol(by:) modifier:


## Page 4

To make a point in a 3D Chart, use the init(x:y:z:) initializer.
In addition to an x and y value, you can now position your PointMark along the z axis.
For example, in addition to plotting an insect’s wingLength and wingWidth you can also plot
their weight with the following Chart3D:
3D points also offer symbols, such as sphere, cylinder, cone, and cube. Combined with the
symbolSize(_:) and symbolRotation(_:) modifiers, you can provide rich customizations f
your 3D points:
PointMark in Chart3D
Styling a 3D PointMark


## Page 5

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


## Page 6

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


