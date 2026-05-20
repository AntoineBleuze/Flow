# Vectorized plots.pdf

## Page 1

Note
This sample code project is associated with WWDC24 session 10155: Swift Charts: Vectorized
and function plots.
This sample shows how to visualize a dataset using a variety of chart types including histograms,
scatterplots, heatmaps, and more. The sample takes advantage of vectorized plots to enable
efficient plotting data of an entire RandomAccessCollection, and function plotting to visualize
meaningful trends in that data. The app is a dashboard that visualizes large-scale solar
photovoltaic facilities in the contiguous United States by consuming data from the U.S. Geologica
Survey and Lawrence Berkeley National Laboratory.
The Scatterplot view displays a scatterplot that maps the capacity density of each facility by 
location. The sample app allows toggling between using longitude or latitude as the basis for
location.
Overview
Plot entire collections with vectorized plots
Swift Charts / Creating a data visualization dashboard with Swift Charts
Sample Code
Creating a data visualization dashboard
with Swift Charts
Visualize an entire data collection efficiently by instantiating a single vectorized
plot in Swift Charts.
Download
iOS 18.0+
iPadOS 18.0+
macOS 15.0+
visionOS 2.0+
Xcode 16.0+


## Page 2

The scatterplot uses the PointPlot type to plot the data efficiently, enabling a smooth animatio
in the chart as the underlying data changes.
The Scatterplot view displays a scatterplot that maps the capacity density (the ratio of power
generating capacity to the area) of each facility by its location. The sample applies quadratic
regression to the data to generate the regression equation:
The scatterplot uses the LinePlot type to draw the regression equation as a trend line on top of
the datapoints:
Visualize data trends with function plotting


## Page 3

The ThematicMap view displays a chart that shows the datapoints in an outline of a map of the
contiguous United States.
The sample uses LinePlot to draw the outline of a simple thematic map, connecting longitude
and latitude points of the federal borders of the contiguous United States:
The sample uses PointPlot to plot the location of each facility on the thematic map, using colo
to distinguish categorical data. The point size correlates with each facility’s capacity:
Add custom shapes to a chart


## Page 4

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
struct SectorPlot
Chart content that represents a collection of data using a sector of a pie or donut chart, whic
shows how individual categories make up a meaningful total.
protocol VectorizedChartContent
A generic type that represents content conveyed via a chart.
See Also
Vectorized plots


## Page 5

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


## Page 6

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


## Page 7

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


## Page 8

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


## Page 9

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


## Page 10

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


## Page 11

In addition to providing data points, you can provide a function to a LinePlot to plot a function.
For example, you can plot the function y = x^2 with:
You can add multiple function plots in a chart and use different foreground styles to distinguish
among them.
You can plot a parametric function with the constructor with x, y, and t:
Topics
Plotting lines from a collection


## Page 12

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


## Page 13

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


## Page 14

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


## Page 15

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


## Page 16

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


## Page 17

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


## Page 18

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


## Page 19

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


## Page 20

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


## Page 21

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


## Page 22

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


## Page 23

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


## Page 24

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


## Page 25

struct BarPlot
Chart content that represents a collection of data using bars.
struct SectorPlot
Chart content that represents a collection of data using a sector of a pie or donut chart, whic
shows how individual categories make up a meaningful total.
protocol VectorizedChartContent
A generic type that represents content conveyed via a chart.


## Page 26

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


## Page 27

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


## Page 28

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


## Page 29

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


## Page 30

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


## Page 31

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


## Page 32

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


## Page 33

Its primary associated type represents the data element, sometimes called data point, observatio
or aggregate.
Usually, DataElement has properties to determine visual attributes directly, or indirectly by
encoding Plottable values through a chart scale.
func foregroundStyle(KeyPath<Self.DataElement, some ShapeStyle>) -> som
 VectorizedChartContent<Self.DataElement>
Represents data using a foreground style.
func opacity(KeyPath<Self.DataElement, CGFloat>) -> some VectorizedChar
Content<Self.DataElement>
func lineStyle(KeyPath<Self.DataElement, StrokeStyle>) -> some 
VectorizedChartContent<Self.DataElement>
Represents data using line styles.
Overview
Topics
Styling marks
Swift Charts / VectorizedChartContent
Protocol
VectorizedChartContent
A generic type that represents content conveyed via a chart.
iOS 18.0+
iPadOS 18.0+
Mac Catalyst 18.0+
macOS 15.0+
tvOS 18.0+
visionOS 2.0+
watchOS 11.0+


## Page 34

func position(by: PlottableProjection<Self.DataElement, some Plottable>
axis: Axis?, span: MarkDimension) -> some VectorizedChartContent<Self.
DataElement>
func symbol(by: PlottableProjection<Self.DataElement, some Plottable>) 
> some VectorizedChartContent<Self.DataElement>
Represents data using different kinds of symbols.
func symbolSize(KeyPath<Self.DataElement, CGSize>) -> some Vectorized
ChartContent<Self.DataElement>
Sets the plotting symbol size for the chart content.
func symbolSize(KeyPath<Self.DataElement, CGFloat>) -> some Vectorized
ChartContent<Self.DataElement>
Sets the plotting symbol size for the chart content according to a perceived area.
func foregroundStyle(by: PlottableProjection<Self.DataElement, some 
Plottable>) -> some VectorizedChartContent<Self.DataElement>
Represents data using a foreground style.
func lineStyle(by: PlottableProjection<Self.DataElement, some Plottable
>) -> some VectorizedChartContent<Self.DataElement>
Represents data using line styles.
func symbol(by: PlottableProjection<Self.DataElement, some Plottable>) 
> some VectorizedChartContent<Self.DataElement>
Represents data using different kinds of symbols.
func symbolSize(by: PlottableProjection<Self.DataElement, some Plottabl
>) -> some VectorizedChartContent<Self.DataElement>
Represents data using symbol sizes.
func accessibilityHidden(KeyPath<Self.DataElement, Bool>) -> some 
VectorizedChartContent<Self.DataElement>
Specifies whether to hide this chart content from system accessibility features.
Setting symbol appearance
Encoding data into mark characteristics
Configuring accessibility


## Page 35

func accessibilityIdentifier(KeyPath<Self.DataElement, String>) -> some
VectorizedChartContent<Self.DataElement>
Adds an identifier string to the chart content.
func accessibilityLabel(KeyPath<Self.DataElement, LocalizedStringKey>) 
> some VectorizedChartContent<Self.DataElement>
Adds a label to the chart content that describes its contents.
func accessibilityLabel(KeyPath<Self.DataElement, some StringProtocol>)
-> some VectorizedChartContent<Self.DataElement>
Adds a label to the chart content that describes its contents.
func accessibilityLabel(KeyPath<Self.DataElement, Text>) -> some 
VectorizedChartContent<Self.DataElement>
Adds a label to the chart content that describes its contents.
func accessibilityValue(KeyPath<Self.DataElement, some StringProtocol>)
-> some VectorizedChartContent<Self.DataElement>
Adds a description of the value that the chart content contains.
func accessibilityValue(KeyPath<Self.DataElement, Text>) -> some 
VectorizedChartContent<Self.DataElement>
Adds a description of the value that the chart content contains.
func accessibilityValue(KeyPath<Self.DataElement, LocalizedStringKey>) 
> some VectorizedChartContent<Self.DataElement>
Adds a description of the value that the chart content contains.
struct PlottableProjection
associatedtype DataElement
Required
Supporting types
Associated Types
Relationships


## Page 36

ChartContent
AreaPlot
Conforms when Content conforms to VectorizedChartContent.
BarPlot
Conforms when Content conforms to VectorizedChartContent.
LinePlot
Conforms when Content conforms to VectorizedChartContent.
PointPlot
Conforms when Content conforms to VectorizedChartContent.
RectanglePlot
Conforms when Content conforms to VectorizedChartContent.
RulePlot
Conforms when Content conforms to VectorizedChartContent.
SectorPlot
Conforms when Content conforms to VectorizedChartContent.
VectorizedAreaPlotContent
VectorizedBarPlotContent
VectorizedLinePlotContent
VectorizedPointPlotContent
VectorizedRectanglePlotContent
VectorizedRulePlotContent
VectorizedSectorPlotContent
Creating a data visualization dashboard with Swift Charts
Visualize an entire data collection efficiently by instantiating a single vectorized plot in Swift
Charts.
Inherits From
Conforming Types
See Also
Vectorized plots


## Page 37

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
struct SectorPlot
Chart content that represents a collection of data using a sector of a pie or donut chart, whic
shows how individual categories make up a meaningful total.


