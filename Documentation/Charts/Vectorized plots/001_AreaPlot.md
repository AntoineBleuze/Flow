# 001_AreaPlot.pdf

## Page 1

Use AreaPlot when you want to visualize data in the same way as with AreaMark, but you wan
to plot a function or visualize an entire data collection with a single plot.
You can initialize and style the plot with simple values or key paths. Add modifiers with KeyPath
before adding modifiers with simple values.
Overview
Plotting areas from a collection
Plotting functions
Swift Charts / AreaPlot
Structure
AreaPlot
Chart content that represents a function or a collection of data using the area of
one or more regions.
iOS 18.0+
iPadOS 18.0+
Mac Catalyst 18.0+
macOS 15.0+
tvOS 18.0+
visionOS 2.0+
watchOS 11.0+


## Page 2

In addition to providing data points, you can provide a function to an AreaPlot to plot a function
For example, you can plot the area between y = x and y = x^2 - 1 with:
You can also provide a single function to an AreaPlot. In this case it will plot the area between
zero and the given function.
init<Data>(Data, x: PlottableProjection<AreaPlot<Content>.DataElement,
some Plottable>, y: PlottableProjection<AreaPlot<Content>.DataElement,
some Plottable>, stacking: MarkStackingMethod)
init<Data>(Data, x: PlottableProjection<AreaPlot<Content>.DataElement,
some Plottable>, y: PlottableProjection<AreaPlot<Content>.DataElement,
some Plottable>, series: PlottableProjection<AreaPlot<Content>.Data
Element, some Plottable>, stacking: MarkStackingMethod)
init<Data, X>(Data, xStart: PlottableProjection<AreaPlot<Content>.Data
Element, X>, xEnd: PlottableProjection<AreaPlot<Content>.DataElement, X
>, y: PlottableProjection<AreaPlot<Content>.DataElement, some Plottable
>)
init<Data, X>(Data, xStart: PlottableProjection<AreaPlot<Content>.Data
Element, X>, xEnd: PlottableProjection<AreaPlot<Content>.DataElement, X
>, y: PlottableProjection<AreaPlot<Content>.DataElement, some Plottable
>, series: PlottableProjection<AreaPlot<Content>.DataElement, some 
Plottable>)
Topics
Plotting areas from a collection


## Page 3

init<Data, Y>(Data, x: PlottableProjection<AreaPlot<Content>.DataElemen
, some Plottable>, yStart: PlottableProjection<AreaPlot<Content>.Data
Element, Y>, yEnd: PlottableProjection<AreaPlot<Content>.DataElement, Y
>)
init<Data, Y>(Data, x: PlottableProjection<AreaPlot<Content>.DataElemen
, some Plottable>, yStart: PlottableProjection<AreaPlot<Content>.Data
Element, Y>, yEnd: PlottableProjection<AreaPlot<Content>.DataElement, Y
>, series: PlottableProjection<AreaPlot<Content>.DataElement, some 
Plottable>)
init(x: Text, y: Text, domain: ClosedRange<Double>?, function: (Double)
-> Double)
Creates a mark that fills the area between zero and the given function.
init(x: LocalizedStringResource, y: LocalizedStringResource, domain:
ClosedRange<Double>?, function: (Double) -> Double)
Creates a mark that fills the area between zero and the given function.
init(x: LocalizedStringKey, y: LocalizedStringKey, domain: ClosedRange<
Double>?, function: (Double) -> Double)
Creates a mark that fills the area between zero and the given function.
init<S1, S2>(x: S1, y: S2, domain: ClosedRange<Double>?, function: (
Double) -> Double)
Creates a mark that fills the area between zero and the given function.
init(x: Text, yStart: Text, yEnd: Text, domain: ClosedRange<Double>?,
function: (Double) -> (yStart: Double, yEnd: Double))
Creates a mark that fills the area between two functions (yStart, yEnd) = f(x).
init(x: LocalizedStringResource, yStart: LocalizedStringResource, yEnd:
LocalizedStringResource, domain: ClosedRange<Double>?, function: (Doubl
) -> (yStart: Double, yEnd: Double))
Creates a mark that fills the area between two functions (yStart, yEnd) = f(x).
init(x: LocalizedStringKey, yStart: LocalizedStringKey, yEnd: Localized
StringKey, domain: ClosedRange<Double>?, function: (Double) -> (yStart:
Double, yEnd: Double))
Creates a mark that fills the area between two functions (yStart, yEnd) = f(x).
Plotting functions


## Page 4

init<S1, S2, S3>(x: S1, yStart: S2, yEnd: S3, domain: ClosedRange<Doubl
>?, function: (Double) -> (yStart: Double, yEnd: Double))
Creates a mark that fills the area between two functions (yStart, yEnd) = f(x).
var body: Self.Body
The content and behavior of the chart content.
Required
struct VectorizedAreaPlotContent
An opaque vectorized chart content type.
struct FunctionAreaPlotContent
ChartContent
Conforms when Content conforms to ChartContent.
Copyable
VectorizedChartContent
Conforms when Content conforms to VectorizedChartContent.
Creating a data visualization dashboard with Swift Charts
Visualize an entire data collection efficiently by instantiating a single vectorized plot in Swift
Charts.
struct LinePlot
Chart content that represents a function or a collection of data using a sequence of
connected line segments.
Supporting types
Relationships
Conforms To
See Also
Vectorized plots


## Page 5

struct PointPlot
Chart content that represents a collection of data using points.
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


