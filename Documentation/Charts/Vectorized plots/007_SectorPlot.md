# 007_SectorPlot.pdf

## Page 1

Use SectorPlot when you want to visualize data in the same way as with SectorMark, but you
want to visualize an entire data collection with a single plot.
You can initialize and style the plot with simple values or key paths. Add modifiers with KeyPath
before adding modifiers with simple values.
Overview
Topics
Plotting sectors from a collection
Swift Charts / SectorPlot
Structure
SectorPlot
Chart content that represents a collection of data using a sector of a pie or donut
chart, which shows how individual categories make up a meaningful total.
iOS 18.0+
iPadOS 18.0+
Mac Catalyst 18.0+
macOS 15.0+
tvOS 18.0+
visionOS 2.0+
watchOS 11.0+


## Page 2

init<Data>(Data, angle: PlottableProjection<SectorPlot<Content>.Data
Element, some Plottable>, innerRadius: MarkDimensions<SectorPlot<Conten
>.DataElement>, outerRadius: MarkDimensions<SectorPlot<Content>.Data
Element>, angularInset: CGFloat?)
init<Data>(Data, angle: PlottableProjection<SectorPlot<Content>.Data
Element, some Plottable>, innerRadius: MarkDimensions<SectorPlot<Conten
>.DataElement>, outerRadius: MarkDimensions<SectorPlot<Content>.Data
Element>, angularInset: KeyPath<SectorPlot<Content>.DataElement, CGFloa
>)
var body: Self.Body
The content and behavior of the chart content.
Required
struct VectorizedSectorPlotContent
An opaque vectorized chart content type.
ChartContent
Conforms when Content conforms to ChartContent.
Copyable
VectorizedChartContent
Conforms when Content conforms to VectorizedChartContent.
Creating a data visualization dashboard with Swift Charts
Supporting types
Relationships
Conforms To
See Also
Vectorized plots


## Page 3

Visualize an entire data collection efficiently by instantiating a single vectorized plot in Swift
Charts.
struct AreaPlot
Chart content that represents a function or a collection of data using the area of one or more
regions.
struct LinePlot
Chart content that represents a function or a collection of data using a sequence of
connected line segments.
struct PointPlot
Chart content that represents a collection of data using points.
struct RectanglePlot
Chart content that represents a collection of data using rectangles.
struct RulePlot
Chart content that represents a collection of data using a single horizontal or vertical rule.
struct BarPlot
Chart content that represents a collection of data using bars.
protocol VectorizedChartContent
A generic type that represents content conveyed via a chart.


