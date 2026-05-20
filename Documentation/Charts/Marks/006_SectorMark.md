# 006_SectorMark.pdf

## Page 1

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


## Page 2

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


## Page 3

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


