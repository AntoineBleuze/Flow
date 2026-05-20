# 004_RectanglePlot.pdf

## Page 1

Use RectanglePlot when you want to visualize data in the same way as with RectangleMark
but you want to visualize an entire data collection with a single plot.
You can initialize and style the plot with simple values or key paths. Add modifiers with KeyPath
before adding modifiers with simple values.
Overview
Topics
Plotting rectangles from a collection
Swift Charts / RectanglePlot
Structure
RectanglePlot
Chart content that represents a collection of data using rectangles.
iOS 18.0+
iPadOS 18.0+
Mac Catalyst 18.0+
macOS 15.0+
tvOS 18.0+
visionOS 2.0+
watchOS 11.0+


## Page 2

init<Data>(Data, x: PlottableProjection<RectanglePlot<Content>.Data
Element, some Plottable>, y: PlottableProjection<RectanglePlot<Content>
DataElement, some Plottable>, width: MarkDimensions<RectanglePlot<
Content>.DataElement>, height: MarkDimensions<RectanglePlot<Content>.
DataElement>)
init<Data, Y>(Data, x: PlottableProjection<RectanglePlot<Content>.Data
Element, some Plottable>, yStart: PlottableProjection<RectanglePlot<
Content>.DataElement, Y>, yEnd: PlottableProjection<RectanglePlot<
Content>.DataElement, Y>, width: MarkDimensions<RectanglePlot<Content>.
DataElement>)
init<Data>(Data, x: PlottableProjection<RectanglePlot<Content>.Data
Element, some Plottable>, yStart: KeyPath<RectanglePlot<Content>.Data
Element, CGFloat>, yEnd: KeyPath<RectanglePlot<Content>.DataElement,
CGFloat>, width: MarkDimensions<RectanglePlot<Content>.DataElement>)
init<Data>(Data, x: PlottableProjection<RectanglePlot<Content>.Data
Element, some Plottable>, yStart: CGFloat?, yEnd: CGFloat?, width: Mark
Dimensions<RectanglePlot<Content>.DataElement>)
init<Data>(Data, xStart: CGFloat?, xEnd: CGFloat?, y: Plottable
Projection<RectanglePlot<Content>.DataElement, some Plottable>, height:
MarkDimensions<RectanglePlot<Content>.DataElement>)
init<Data>(Data, xStart: KeyPath<RectanglePlot<Content>.DataElement,
CGFloat>, xEnd: KeyPath<RectanglePlot<Content>.DataElement, CGFloat>, y
PlottableProjection<RectanglePlot<Content>.DataElement, some Plottable>
height: MarkDimensions<RectanglePlot<Content>.DataElement>)
init<Data, X>(Data, xStart: PlottableProjection<RectanglePlot<Content>.
DataElement, X>, xEnd: PlottableProjection<RectanglePlot<Content>.Data
Element, X>, y: PlottableProjection<RectanglePlot<Content>.DataElement,
some Plottable>, height: MarkDimensions<RectanglePlot<Content>.Data
Element>)
init<Data, X>(Data, xStart: PlottableProjection<RectanglePlot<Content>.
DataElement, X>, xEnd: PlottableProjection<RectanglePlot<Content>.Data
Element, X>, yStart: CGFloat?, yEnd: CGFloat?)
init<Data, X, Y>(Data, xStart: PlottableProjection<RectanglePlot<Conten
>.DataElement, X>, xEnd: PlottableProjection<RectanglePlot<Content>.Dat
Element, X>, yStart: PlottableProjection<RectanglePlot<Content>.Data
Element, Y>, yEnd: PlottableProjection<RectanglePlot<Content>.Data
Element, Y>)


## Page 3

init<Data, Y>(Data, xStart: CGFloat?, xEnd: CGFloat?, yStart: Plottable
Projection<RectanglePlot<Content>.DataElement, Y>, yEnd: Plottable
Projection<RectanglePlot<Content>.DataElement, Y>)
init<Data, X>(Data, xStart: PlottableProjection<RectanglePlot<Content>.
DataElement, X>, xEnd: PlottableProjection<RectanglePlot<Content>.Data
Element, X>, yStart: KeyPath<RectanglePlot<Content>.DataElement, CGFloa
>, yEnd: KeyPath<RectanglePlot<Content>.DataElement, CGFloat>)
init<Data, Y>(Data, xStart: KeyPath<RectanglePlot<Content>.DataElement,
CGFloat>, xEnd: KeyPath<RectanglePlot<Content>.DataElement, CGFloat>, y
Start: PlottableProjection<RectanglePlot<Content>.DataElement, Y>, yEnd
PlottableProjection<RectanglePlot<Content>.DataElement, Y>)
init<Data>(Data, xStart: KeyPath<RectanglePlot<Content>.DataElement,
CGFloat>, xEnd: KeyPath<RectanglePlot<Content>.DataElement, CGFloat>, y
Start: KeyPath<RectanglePlot<Content>.DataElement, CGFloat>, yEnd: Key
Path<RectanglePlot<Content>.DataElement, CGFloat>)
var body: Self.Body
The content and behavior of the chart content.
Required
struct VectorizedRectanglePlotContent
An opaque vectorized chart content type.
ChartContent
Conforms when Content conforms to ChartContent.
Copyable
VectorizedChartContent
Conforms when Content conforms to VectorizedChartContent.
Supporting types
Relationships
Conforms To


## Page 4

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


