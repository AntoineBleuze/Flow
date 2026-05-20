# 008_VectorizedChartContent.pdf

## Page 1

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


## Page 2

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


## Page 3

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


## Page 4

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


## Page 5

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


