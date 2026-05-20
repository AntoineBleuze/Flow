# Charts.pdf

## Page 1

Help people understand complex data by focusing on what you want to communicate and who
you’re communicating to. For example, suppose that you have a collection of colorful toy shapes:
You can formulate questions about this data that you’d like to answer, like which toy shape appea
the most, or how many toys are green? One way to represent your data is to collect it into a table.
table organizes the data into columns and rows so it can be easily inspected. For example, you ca
record how many shapes of each color you have:
Cube
Sphere
Pyramid
Total
Pink
1
2
0
3
Overview
Swift Charts / Creating a chart using Swift Charts
Article
Creating a chart using Swift Charts
Make a chart by combining chart building blocks in SwiftUI.


## Page 2

Cube
Sphere
Pyramid
Total
Yellow
1
1
2
4
Purple
1
1
1
3
Green
2
0
1
3
Total
5
4
4
13
However, in many cases, a more effective data representation is a chart. A chart allows you to
communicate large amounts of information all at once. The kind of chart that you create and the
way you configure the chart depend on what you want to show. To create a chart with Swift Chart
define your data and initialize a Chart view with marks and data properties. Then use modifiers t
customize different components of the chart, like the legend, axes, and scale.
Think about a chart as an answer to your questions. Suppose you want to know which toy shape
appears the most. Start by visualizing how many of each shape you have. To display this
information with a chart, create a ToyShape structure that represents the information that you
want to visualize:
Then, initialize an array of ToyShape structures to hold the data from the table:
In a real app, you might download this data from a network connection, or load it from a file.
Define the data source
Initialize a chart view and create marks


## Page 3

Create a Chart view that serves as a container for the data series that you want to draw:
Inside the chart, specify the graphical marks that represent the data. You can populate it with a
variety of kinds of marks, like BarMark, PointMark or LineMark, that plot your data. The kind 
mark that you choose depends on how you want to visualize the data. For example, you can use
LineMark to create a line chart or PointMark to produce a scatter plot. In this case, creating a
bar chart is a good way to convey the number of each type of toy shape, so you use BarMark:
The resulting chart clearly communicates that the cube toy shape appears the most:


## Page 4

Scale determines the position, height, and color of each BarMark. As you plot data on the y-
dimension, the framework automatically generates axis labels for the y-axis to map the data value
The scale for the y-dimension is adjusted to match the range of totals for the shape’s group.
The above code lists each BarMark individually. However, for regular, repetitive data, you can use
a ForEach structure to represent the same chart more concisely:
The above bar chart shows how much of each type of toy shape there are, but the earlier table
separates each toy shape by color as well. A stacked bar chart can visualize not only the amount 
each toy shape type, but also the distribution of colors among the shapes. Before you can plot th
new information, you need to represent color in your data structure:
Explore additional data properties


## Page 5

Then update the initialized data to include the color information:
To represent this additional dimension of information, add the foregroundStyle(by:) method
to the BarMark, and indicate the data’s color property as the plottable value:
The chart now splits the bars into different parts that represent the number of colors for each
shape:


## Page 6

The stacked bar chart chooses colors to represent the new data, and adds a legend to indicate
which color represents which kind of data.
For many charts, the default configuration works well. However, in this case, the colors that the
framework assigns to each mark don’t match the shape colors that they represent. You can
customize the chart to override the default color scale by adding the chartForegroundStyle
Scale(_:) chart modifier:
Customize your chart


## Page 7

Now the names of the colors match the colors used in the chart, making the chart easier to
understand:
This chart makes the relationship between shape counts and colors clear. You can customize
charts in many other ways. For example, you can set the bar width, choose different legend
symbols, and control the axes.
Visualizing your app’s data
Build complex and interactive charts using Swift Charts.
struct Chart
A SwiftUI view that displays a chart.
protocol ChartContent
A type that represents the content that you draw on a chart.
struct ChartContentBuilder
A result builder that you use to compose the contents of a chart.
struct Plot
See Also
Charts


## Page 8

A mechanism for grouping chart contents into a single entity.


## Page 9

Note
This sample code project is associated with WWDC23 session 10037: Explore pie charts and
interactivity in Swift Charts.
Creating a chart using Swift Charts
Make a chart by combining chart building blocks in SwiftUI.
struct Chart
A SwiftUI view that displays a chart.
protocol ChartContent
A type that represents the content that you draw on a chart.
struct ChartContentBuilder
A result builder that you use to compose the contents of a chart.
Overview
See Also
Charts
Swift Charts / Visualizing your app’s data
Sample Code
Visualizing your app’s data
Build complex and interactive charts using Swift Charts.
Download
iOS 17.0+
iPadOS 17.0+
Xcode 15.0+


## Page 10

struct Plot
A mechanism for grouping chart contents into a single entity.


## Page 11

Creating a chart using Swift Charts
To create a chart, instantiate a Chart structure with marks that display the properties of your dat
For example, suppose you have an array of ValuePerCategory structures that define data poin
composed of a category and a value:
You can use BarMark inside a chart to represent the category property as different bars in the
chart and the value property as the y value for each bar:
Mentioned in
Overview
Swift Charts / Chart
Structure
Chart
A SwiftUI view that displays a chart.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 9.0+


## Page 12

This chart initializer behaves a lot like a SwiftUI ForEach, creating a mark — in this case, a bar —
for each of the values in the data array:
You can compose more sophisticated charts by providing more than one series of marks to the
chart. For example, suppose you have profit data for two companies:
The following chart creates two different series of LineMark instances with different colors to
represent the data for each company. In effect, it moves the ForEach construct from the chart’s
initializer into the body of the chart, enabling you to represent multiple different series:
Controlling data series inside a chart


## Page 13

You indicate which series a line mark belongs to by specifying its series input parameter. The
above chart also uses a RuleMark to produce a horizontal line segment that displays a constant
threshold value across the width of the chart:
Topics


## Page 14

init(content: () -> Content)
Creates a chart composed of any number of data series and individual marks.
init<Data, C>(Data, content: (Data.Element) -> C)
Creates a chart composed of a series of identifiable marks.
init<Data, ID, C>(Data, id: KeyPath<Data.Element, ID>, content: (Data.
Element) -> C)
Creates a chart composed of a series of marks.
var body: Self.Body
The content and behavior of the chart content.
Required
Sendable, SendableMetatype, View
Creating a chart using Swift Charts
Make a chart by combining chart building blocks in SwiftUI.
Visualizing your app’s data
Build complex and interactive charts using Swift Charts.
protocol ChartContent
Creating a chart
Supporting types
Relationships
Conforms To
See Also
Charts


## Page 15

A type that represents the content that you draw on a chart.
struct ChartContentBuilder
A result builder that you use to compose the contents of a chart.
struct Plot
A mechanism for grouping chart contents into a single entity.


## Page 16

You build a Chart by adding instances that conform to the ChartContent protocol to the chart
content closure. The following example adds three explicit BarMark instances to a chart:
The chart draws marks that correspond to the instances that you specify:
Overview
Swift Charts / ChartContent
Protocol
ChartContent
A type that represents the content that you draw on a chart.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 9.0+


## Page 17

You can combine any number of marks or types of marks in a single chart by listing them
individually as shown in the above example, wrapping them in a ForEach, or any combination of
these. For some mark types, like LineMark, you can group the marks into series using the mark’
series initialization parameter.
The ChartContent protocol provides a set of modifiers that you use to configure the properties
of chart content. These behave like SwiftUI view modifiers, except that they act on chart content
rather than views. Any of the types that conform to the protocol can use these modifiers. For
example, you can add the foregroundStyle(_:) modifier to the bar representing the number 
spheres in the previous example to make it red:
Configure chart content


## Page 18

func foregroundStyle<S>(S) -> some ChartContent
Sets the foreground style for the chart content.
func opacity(Double) -> some ChartContent
Sets the opacity for the chart content.
func blur(radius: CGFloat) -> some ChartContent
Applies a Gaussian blur to this chart content.
func cornerRadius(CGFloat, style: RoundedCornerStyle) -> some Chart
Content
Sets the corner radius of the chart content.
func lineStyle(StrokeStyle) -> some ChartContent
Sets the style for line marks.
func shadow(color: Color, radius: CGFloat, x: CGFloat, y: CGFloat) ->
some ChartContent
A chart content that adds a shadow to this chart content.
func interpolationMethod(InterpolationMethod) -> some ChartContent
Plots line and area marks with the interpolation method that you specify.
Topics
Styling marks


## Page 19

func offset(CGSize) -> some ChartContent
Applies an offset that you specify as a size to the chart content.
func offset(x: CGFloat, y: CGFloat) -> some ChartContent
Applies a vertical and horizontal offset to the chart content.
func offset(x: CGFloat, yStart: CGFloat, yEnd: CGFloat) -> some Chart
Content
Applies an offset to the chart content.
func offset(xStart: CGFloat, xEnd: CGFloat, y: CGFloat) -> some Chart
Content
Applies an offset to the chart content.
func offset(xStart: CGFloat, xEnd: CGFloat, yStart: CGFloat, yEnd:
CGFloat) -> some ChartContent
Applies an offset to the chart content.
func alignsMarkStylesWithPlotArea(Bool) -> some ChartContent
Aligns this item’s styles with the chart’s plot area.
func symbol<S>(S) -> some ChartContent
Sets a plotting symbol type for the chart content.
func symbol<V>(symbol: () -> V) -> some ChartContent
Sets a SwiftUI view to use as the symbol for the chart content.
func symbolSize(CGSize) -> some ChartContent
Sets the plotting symbol size for the chart content.
func symbolSize(CGFloat) -> some ChartContent
Sets the plotting symbol size for the chart content according to a perceived area.
func foregroundStyle<D>(by: PlottableValue<D>) -> some ChartContent
Represents data using a foreground style.
Positioning marks
Setting symbol appearance
Encoding data into mark characteristics


## Page 20

func lineStyle<D>(by: PlottableValue<D>) -> some ChartContent
Represents data using line styles.
func position<P>(by: PlottableValue<P>, axis: Axis?, span: MarkDimensio
) -> some ChartContent
Represents data using position.
func symbol<D>(by: PlottableValue<D>) -> some ChartContent
Represents data using different kinds of symbols.
func symbolSize<D>(by: PlottableValue<D>) -> some ChartContent
Represents data using symbol sizes.
func annotation<C>(position: AnnotationPosition, alignment: Alignment,
spacing: CGFloat?, content: () -> C) -> some ChartContent
Annotates this mark or collection of marks with a view positioned relative to its bounds.
func annotation<C>(position: AnnotationPosition, alignment: Alignment,
spacing: CGFloat?, content: (AnnotationContext) -> C) -> some Chart
Content
Annotates this mark or collection of marks with a view positioned relative to its bounds.
func annotation<C>(position: AnnotationPosition, alignment: Alignment,
spacing: CGFloat?, overflowResolution: AnnotationOverflowResolution,
content: () -> C) -> some ChartContent
Annotates this mark or collection of marks with a view positioned relative to its bounds.
func annotation<C>(position: AnnotationPosition, alignment: Alignment,
spacing: CGFloat?, overflowResolution: AnnotationOverflowResolution,
content: (AnnotationContext) -> C) -> some ChartContent
Annotates this mark or collection of marks with a view positioned relative to its bounds.
func compositingLayer() -> some ChartContent
func compositingLayer<V>(style: (PlaceholderContentView<Self>) -> V) ->
some ChartContent
func zIndex(Double) -> some ChartContent
Controls the display order of overlapping chart content.
Annotating marks
Layering chart content


## Page 21

func mask<C>(content: () -> C) -> some ChartContent
Masks chart content using the alpha channel of the specified content.
func clipShape(some Shape, style: FillStyle) -> some ChartContent
Sets a clip shape for the chart content.
func accessibilityHidden(Bool) -> some ChartContent
Specifies whether to hide this chart content from system accessibility features.
func accessibilityIdentifier(String) -> some ChartContent
Adds an identifier string to the chart content.
func accessibilityLabel(LocalizedStringKey) -> some ChartContent
Adds a label to the chart content that describes its contents.
func accessibilityLabel<S>(S) -> some ChartContent
Adds a label to the chart content that describes its contents.
func accessibilityLabel(Text) -> some ChartContent
Adds a label to the chart content that describes its contents.
func accessibilityLabel(LocalizedStringResource) -> some ChartContent
Adds a label to the chart content that describes its contents.
func accessibilityValue(LocalizedStringKey) -> some ChartContent
Adds a description of the value that the chart content contains.
func accessibilityValue<S>(S) -> some ChartContent
Adds a description of the value that the chart content contains.
func accessibilityValue(Text) -> some ChartContent
Adds a description of the value that the chart content contains.
func accessibilityValue(LocalizedStringResource) -> some ChartContent
Adds a description of the value that the chart content contains.
Masking and clipping
Configuring accessibility
Implementing chart content


## Page 22

var body: Self.Body
The content and behavior of the chart content.
Required
associatedtype Body : ChartContent
The type of chart content contained in the body of this instance.
Required
struct AnyChartContent
A type-erased chart content.
VectorizedChartContent
AnyChartContent
AreaMark
AreaPlot
Conforms when Content conforms to ChartContent.
BarMark
BarPlot
Conforms when Content conforms to ChartContent.
BuilderConditional
Conforms when TrueContent conforms to ChartContent and FalseContent conforms to ChartContent.
FunctionAreaPlotContent
FunctionLinePlotContent
LineMark
LinePlot
Conforms when Content conforms to ChartContent.
Plot
Conforms when Content conforms to ChartContent.
PointMark
Supporting types
Relationships
Inherited By
Conforming Types


## Page 23

PointPlot
Conforms when Content conforms to ChartContent.
RectangleMark
RectanglePlot
Conforms when Content conforms to ChartContent.
RuleMark
RulePlot
Conforms when Content conforms to ChartContent.
SectorMark
SectorPlot
Conforms when Content conforms to ChartContent.
VectorizedAreaPlotContent
VectorizedBarPlotContent
VectorizedLinePlotContent
VectorizedPointPlotContent
VectorizedRectanglePlotContent
VectorizedRulePlotContent
VectorizedSectorPlotContent
Creating a chart using Swift Charts
Make a chart by combining chart building blocks in SwiftUI.
Visualizing your app’s data
Build complex and interactive charts using Swift Charts.
struct Chart
A SwiftUI view that displays a chart.
struct ChartContentBuilder
A result builder that you use to compose the contents of a chart.
struct Plot
A mechanism for grouping chart contents into a single entity.
See Also
Charts


## Page 24

This Result Builder combines any number of ChartContent instances into a single composite
instance, including support for conditionals.
You don’t call the methods of the result builder directly. Instead, Swift uses them to combine the
elements that you declare in any closure that has the @ChartContentBuilder attribute. In
particular, you rely on this behavior when you declare the content inside a Chart initializer like
init(content:).
static func buildPartialBlock<T>(first: T) -> T
Builds a partial result from a single, first component.
Deprecated
static func buildPartialBlock(accumulated: some ChartContent, next: som
 ChartContent) -> some ChartContent
Builds a partial result by combining an accumulated component and a new component.
Overview
Topics
Building chart content
Swift Charts / ChartContentBuilder
Structure
ChartContentBuilder
A result builder that you use to compose the contents of a chart.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 9.0+


## Page 25

Deprecated
static func buildBlock() -> some ChartContent
Produces empty chart content.
static func buildIf<T>(T?) -> T?
Builds a partial result that’s conditionally present.
static func buildEither<T1, T2>(first: T1) -> BuilderConditional<T1, T2
Builds a partial result from a condition that’s true.
static func buildEither<T1, T2>(second: T2) -> BuilderConditional<T1, T
>
Builds a partial result from a condition that’s false.
static func buildLimitedAvailability(some ChartContent) -> AnyChart
Content
Builds a partial result that propagates or erases type information outside a compiler-controll
availability check.
struct BuilderConditional
A conditional result from a result builder.
static func buildBlock<each C>(repeat each C) -> some ChartContent
Builds a result from multiple components.
static func buildBlock<C>(C) -> C
Builds a result from a single component.
static func buildExpression<Content>(Content) -> Content
Building conditionally
Building with conditional availability
Supporting types
Type Methods


## Page 26

Creating a chart using Swift Charts
Make a chart by combining chart building blocks in SwiftUI.
Visualizing your app’s data
Build complex and interactive charts using Swift Charts.
struct Chart
A SwiftUI view that displays a chart.
protocol ChartContent
A type that represents the content that you draw on a chart.
struct Plot
A mechanism for grouping chart contents into a single entity.
See Also
Charts


## Page 27

init(content: () -> Content)
ChartContent
Conforms when Content conforms to ChartContent.
Copyable
Sendable
SendableMetatype
Topics
Initializers
Relationships
Conforms To
See Also
Swift Charts / Plot
Structure
Plot
A mechanism for grouping chart contents into a single entity.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 9.0+


## Page 28

Creating a chart using Swift Charts
Make a chart by combining chart building blocks in SwiftUI.
Visualizing your app’s data
Build complex and interactive charts using Swift Charts.
struct Chart
A SwiftUI view that displays a chart.
protocol ChartContent
A type that represents the content that you draw on a chart.
struct ChartContentBuilder
A result builder that you use to compose the contents of a chart.
Charts


