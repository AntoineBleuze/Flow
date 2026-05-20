# 003_ChartContent.pdf

## Page 1

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


## Page 2

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


## Page 3

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


## Page 4

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


## Page 5

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


## Page 6

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


## Page 7

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


## Page 8

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


