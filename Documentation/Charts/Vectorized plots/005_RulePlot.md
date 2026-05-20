# 005_RulePlot.pdf

## Page 1

Use RulePlot when you want to visualize data in the same way as with RuleMark, but you wan
to visualize an entire data collection with a single plot.
You can initialize and style the plot with simple values or key paths. Add modifiers with KeyPath
before adding modifiers with simple values.
Overview
Topics
Swift Charts / RulePlot
Structure
RulePlot
Chart content that represents a collection of data using a single horizontal or
vertical rule.
iOS 18.0+
iPadOS 18.0+
Mac Catalyst 18.0+
macOS 15.0+
tvOS 18.0+
visionOS 2.0+
watchOS 11.0+


## Page 2

init<Data>(Data, x: PlottableProjection<RulePlot<Content>.DataElement,
some Plottable>, yStart: CGFloat?, yEnd: CGFloat?)
init<Data, Y>(Data, x: KeyPath<RulePlot<Content>.DataElement, CGFloat>,
yStart: PlottableProjection<RulePlot<Content>.DataElement, Y>, yEnd:
PlottableProjection<RulePlot<Content>.DataElement, Y>)
init<Data>(Data, x: PlottableProjection<RulePlot<Content>.DataElement,
some Plottable>, yStart: KeyPath<RulePlot<Content>.DataElement, CGFloat
>, yEnd: KeyPath<RulePlot<Content>.DataElement, CGFloat>)
init<Data, Y>(Data, x: CGFloat?, yStart: PlottableProjection<RulePlot<
Content>.DataElement, Y>, yEnd: PlottableProjection<RulePlot<Content>.
DataElement, Y>)
init<Data, Y>(Data, x: PlottableProjection<RulePlot<Content>.DataElemen
, some Plottable>, yStart: PlottableProjection<RulePlot<Content>.Data
Element, Y>, yEnd: PlottableProjection<RulePlot<Content>.DataElement, Y
>)
init<Data>(Data, xStart: KeyPath<RulePlot<Content>.DataElement, CGFloat
>, xEnd: KeyPath<RulePlot<Content>.DataElement, CGFloat>, y: Plottable
Projection<RulePlot<Content>.DataElement, some Plottable>)
init<Data>(Data, xStart: CGFloat?, xEnd: CGFloat?, y: Plottable
Projection<RulePlot<Content>.DataElement, some Plottable>)
init<Data, X>(Data, xStart: PlottableProjection<RulePlot<Content>.Data
Element, X>, xEnd: PlottableProjection<RulePlot<Content>.DataElement, X
>, y: KeyPath<RulePlot<Content>.DataElement, CGFloat>)
init<Data, X>(Data, xStart: PlottableProjection<RulePlot<Content>.Data
Element, X>, xEnd: PlottableProjection<RulePlot<Content>.DataElement, X
>, y: PlottableProjection<RulePlot<Content>.DataElement, some Plottable
>)
init<Data, X>(Data, xStart: PlottableProjection<RulePlot<Content>.Data
Element, X>, xEnd: PlottableProjection<RulePlot<Content>.DataElement, X
>, y: CGFloat?)
var body: Self.Body
Plotting rules from a collection
Supporting types


## Page 3

The content and behavior of the chart content.
Required
struct VectorizedRulePlotContent
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
struct PointPlot
Chart content that represents a collection of data using points.
struct RectanglePlot
Chart content that represents a collection of data using rectangles.
Relationships
Conforms To
See Also
Vectorized plots


## Page 4

struct BarPlot
Chart content that represents a collection of data using bars.
struct SectorPlot
Chart content that represents a collection of data using a sector of a pie or donut chart, whic
shows how individual categories make up a meaningful total.
protocol VectorizedChartContent
A generic type that represents content conveyed via a chart.


