# 002_LinePlot.pdf

## Page 1

Use LinePlot when you want to visualize data in the same way as with LineMark, but you wan
to plot a function or visualize an entire data collection with a single plot.
You can initialize and style the plot with simple values or key paths. Add modifiers with KeyPath
before adding modifiers with simple values.
Overview
Plotting lines from a collection
Plotting functions
Swift Charts / LinePlot
Structure
LinePlot
Chart content that represents a function or a collection of data using a sequence
of connected line segments.
iOS 18.0+
iPadOS 18.0+
Mac Catalyst 18.0+
macOS 15.0+
tvOS 18.0+
visionOS 2.0+
watchOS 11.0+


## Page 2

In addition to providing data points, you can provide a function to a LinePlot to plot a function.
For example, you can plot the function y = x^2 with:
You can add multiple function plots in a chart and use different foreground styles to distinguish
among them.
You can plot a parametric function with the constructor with x, y, and t:
Topics
Plotting lines from a collection


## Page 3

init<Data>(Data, x: PlottableProjection<LinePlot<Content>.DataElement,
some Plottable>, y: PlottableProjection<LinePlot<Content>.DataElement,
some Plottable>)
init<Data>(Data, x: PlottableProjection<LinePlot<Content>.DataElement,
some Plottable>, y: PlottableProjection<LinePlot<Content>.DataElement,
some Plottable>, series: PlottableProjection<LinePlot<Content>.Data
Element, some Plottable>)
init(x: Text, y: Text, domain: ClosedRange<Double>?, function: (Double)
-> Double)
Creates a mark that graphs a function y = f(x).
init(x: LocalizedStringKey, y: LocalizedStringKey, domain: ClosedRange<
Double>?, function: (Double) -> Double)
Creates a mark that graphs a function y = f(x).
init(x: LocalizedStringResource, y: LocalizedStringResource, domain:
ClosedRange<Double>?, function: (Double) -> Double)
Creates a mark that graphs a function y = f(x).
init<S1, S2>(x: S1, y: S2, domain: ClosedRange<Double>?, function: (
Double) -> Double)
Creates a mark that graphs a function y = f(x).
init(x: Text, y: Text, t: Text, domain: ClosedRange<Double>, function: 
Double) -> (x: Double, y: Double))
Creates a mark that graphs a parametric function (x, y) = f(t).
init(x: LocalizedStringKey, y: LocalizedStringKey, t: LocalizedStringKe
, domain: ClosedRange<Double>, function: (Double) -> (x: Double, y:
Double))
Creates a mark that graphs a parametric function (x, y) = f(t).
init(x: LocalizedStringResource, y: LocalizedStringResource, t:
LocalizedStringResource, domain: ClosedRange<Double>, function: (Double
-> (x: Double, y: Double))
Creates a mark that graphs a parametric function (x, y) = f(t).
Plotting functions
Plotting parametric functions


## Page 4

init<S1, S2, S3>(x: S1, y: S2, t: S3, domain: ClosedRange<Double>,
function: (Double) -> (x: Double, y: Double))
Creates a mark that graphs a parametric function (x, y) = f(t).
var body: Self.Body
The content and behavior of the chart content.
Required
struct VectorizedLinePlotContent
An opaque vectorized chart content type.
struct FunctionLinePlotContent
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


