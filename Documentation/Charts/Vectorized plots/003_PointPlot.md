# 003_PointPlot.pdf

## Page 1

Use PointPlot when you want to visualize data in the same way as with PointMark, but you
want to visualize an entire data collection with a single plot.
You can initialize and style the plot with simple values or key paths. Add modifiers with KeyPath
before adding modifiers with simple values.
Overview
Topics
Swift Charts / PointPlot
Structure
PointPlot
Chart content that represents a collection of data using points.
iOS 18.0+
iPadOS 18.0+
Mac Catalyst 18.0+
macOS 15.0+
tvOS 18.0+
visionOS 2.0+
watchOS 11.0+


## Page 2

init<Data>(Data, x: KeyPath<Data.Element, CGFloat>, y: Plottable
Projection<PointPlot<Content>.DataElement, some Plottable>)
init<Data>(Data, x: CGFloat?, y: PlottableProjection<PointPlot<Content>
DataElement, some Plottable>)
init<Data>(Data, x: PlottableProjection<PointPlot<Content>.DataElement,
some Plottable>, y: CGFloat?)
init<Data>(Data, x: PlottableProjection<PointPlot<Content>.DataElement,
some Plottable>, y: PlottableProjection<PointPlot<Content>.DataElement,
some Plottable>)
init<Data>(Data, x: PlottableProjection<PointPlot<Content>.DataElement,
some Plottable>, y: KeyPath<PointPlot<Content>.DataElement, CGFloat>)
var body: Self.Body
The content and behavior of the chart content.
Required
struct VectorizedPointPlotContent
An opaque vectorized chart content type.
ChartContent
Conforms when Content conforms to ChartContent.
Copyable
VectorizedChartContent
Conforms when Content conforms to VectorizedChartContent.
Plotting points from a collection
Supporting types
Relationships
Conforms To


## Page 3

Creating a data visualization dashboard with Swift Charts
Visualize an entire data collection efficiently by instantiating a single vectorized plot in Swift
Charts.
struct AreaPlot
Chart content that represents a function or a collection of data using the area of one or more
regions.
struct LinePlot
Chart content that represents a function or a collection of data using a sequence of
connected line segments.
struct RectanglePlot
Chart content that represents a collection of data using rectangles.
struct RulePlot
Chart content that represents a collection of data using a single horizontal or vertical rule.
struct BarPlot
Chart content that represents a collection of data using bars.
struct SectorPlot
Chart content that represents a collection of data using a sector of a pie or donut chart, whic
shows how individual categories make up a meaningful total.
protocol VectorizedChartContent
A generic type that represents content conveyed via a chart.
See Also
Vectorized plots


