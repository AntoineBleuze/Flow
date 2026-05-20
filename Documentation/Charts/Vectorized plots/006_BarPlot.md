# 006_BarPlot.pdf

## Page 1

Use BarPlot when you want to visualize data in the same way as with BarMark, but you want to
visualize an entire data collection with a single plot.
You can initialize and style the plot with simple values or key paths. Add modifiers with KeyPath
before adding modifiers with simple values.
init<Data>(Data, x: PlottableProjection<BarPlot<Content>.DataElement,
some Plottable>, y: PlottableProjection<BarPlot<Content>.DataElement,
Overview
Topics
Plotting bars from a collection
Swift Charts / BarPlot
Structure
BarPlot
Chart content that represents a collection of data using bars.
iOS 18.0+
iPadOS 18.0+
Mac Catalyst 18.0+
macOS 15.0+
tvOS 18.0+
visionOS 2.0+
watchOS 11.0+


## Page 2

some Plottable>, width: MarkDimensions<BarPlot<Content>.DataElement>,
height: MarkDimensions<BarPlot<Content>.DataElement>, stacking: Mark
StackingMethod)
init<Data, Y>(Data, x: PlottableProjection<BarPlot<Content>.DataElement
some Plottable>, yStart: PlottableProjection<BarPlot<Content>.Data
Element, Y>, yEnd: PlottableProjection<BarPlot<Content>.DataElement, Y>
width: MarkDimensions<BarPlot<Content>.DataElement>)
init<Data>(Data, x: PlottableProjection<BarPlot<Content>.DataElement,
some Plottable>, yStart: CGFloat?, yEnd: CGFloat?, width: MarkDimension
<BarPlot<Content>.DataElement>, stacking: MarkStackingMethod)
init<Data>(Data, x: PlottableProjection<BarPlot<Content>.DataElement,
some Plottable>, yStart: KeyPath<BarPlot<Content>.DataElement, CGFloat>
yEnd: KeyPath<BarPlot<Content>.DataElement, CGFloat>, width: Mark
Dimensions<BarPlot<Content>.DataElement>, stacking: MarkStackingMethod)
init<Data>(Data, xStart: KeyPath<BarPlot<Content>.DataElement, CGFloat>
xEnd: KeyPath<BarPlot<Content>.DataElement, CGFloat>, y: Plottable
Projection<BarPlot<Content>.DataElement, some Plottable>, height: Mark
Dimensions<BarPlot<Content>.DataElement>, stacking: MarkStackingMethod)
init<Data>(Data, xStart: CGFloat?, xEnd: CGFloat?, y: Plottable
Projection<BarPlot<Content>.DataElement, some Plottable>, height: Mark
Dimensions<BarPlot<Content>.DataElement>, stacking: MarkStackingMethod)
init<Data, X>(Data, xStart: PlottableProjection<BarPlot<Content>.Data
Element, X>, xEnd: PlottableProjection<BarPlot<Content>.DataElement, X>
y: PlottableProjection<BarPlot<Content>.DataElement, some Plottable>,
height: MarkDimensions<BarPlot<Content>.DataElement>)
init<Data, X>(Data, xStart: PlottableProjection<BarPlot<Content>.Data
Element, X>, xEnd: PlottableProjection<BarPlot<Content>.DataElement, X>
yStart: CGFloat?, yEnd: CGFloat?)
init<Data, Y>(Data, xStart: KeyPath<BarPlot<Content>.DataElement,
CGFloat>, xEnd: KeyPath<BarPlot<Content>.DataElement, CGFloat>, yStart:
PlottableProjection<BarPlot<Content>.DataElement, Y>, yEnd: Plottable
Projection<BarPlot<Content>.DataElement, Y>)
init<Data, X>(Data, xStart: PlottableProjection<BarPlot<Content>.Data
Element, X>, xEnd: PlottableProjection<BarPlot<Content>.DataElement, X>
yStart: KeyPath<BarPlot<Content>.DataElement, CGFloat>, yEnd: KeyPath<
BarPlot<Content>.DataElement, CGFloat>)
init<Data, Y>(Data, xStart: CGFloat?, xEnd: CGFloat?, yStart: Plottable
Projection<BarPlot<Content>.DataElement, Y>, yEnd: PlottableProjection<


## Page 3

BarPlot<Content>.DataElement, Y>)
var body: Self.Body
The content and behavior of the chart content.
Required
struct VectorizedBarPlotContent
An opaque vectorized chart content type.
ChartContent
Conforms when Content conforms to ChartContent.
Copyable
VectorizedChartContent
Conforms when Content conforms to VectorizedChartContent.
Creating a data visualization dashboard with Swift Charts
Visualize an entire data collection efficiently by instantiating a single vectorized plot in Swift
Charts.
struct AreaPlot
Chart content that represents a function or a collection of data using the area of one or more
regions.
struct LinePlot
Chart content that represents a function or a collection of data using a sequence of
connected line segments.
Supporting types
Relationships
Conforms To
See Also
Vectorized plots


## Page 4

struct PointPlot
Chart content that represents a collection of data using points.
struct RectanglePlot
Chart content that represents a collection of data using rectangles.
struct RulePlot
Chart content that represents a collection of data using a single horizontal or vertical rule.
struct SectorPlot
Chart content that represents a collection of data using a sector of a pie or donut chart, whic
shows how individual categories make up a meaningful total.
protocol VectorizedChartContent
A generic type that represents content conveyed via a chart.


