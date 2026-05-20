# 3D charts.pdf

## Page 1

Use Chart3D to create three-dimensional data visualizations with compatible mark types. To add
content to your chart, use the 3D-only SurfacePlot or the 3D initializers of PointMark, Rule
Mark, and RectangleMark.
For example, you can use a SurfacePlot to visualize a 3D surface for the function y = cos(2
* x) * sin(2 * x):
You can also use the 3D initializers for PointMark init(x:y:z:), RuleMark init(x:y:z:)
RectangleMark init(x:y:z:) to plot 3D visualizations of your data.
For example, suppose you have an array of Penguin structures that define datapoints composed
of beakLength, weight flipperLength:
Overview
Swift Charts / Chart3D
Structure
Chart3D
A SwiftUI view that displays interactive 3D charts and visualizations.
iOS 26.0+
iPadOS 26.0+
Mac Catalyst 26.0+
macOS 26.0+
visionOS 26.0+


## Page 2

You can also use the 3D initializer ofPointMark init(x:y:z:) to represent the flipper
Length property as the x value, the weight property as the y value, and the beakLength
property as the z value:
To make your 3D Chart interactive, declare a @State property of type Chart3DPose and pass it
as a binding to the chart3DPose(_:)-(Binding<Chart3DPose>) view modifier:
On available platforms, you can use the chart3DCameraProjection(_:) modifier to switch
from orthographic to perspective projection.
Customizing interactivity


## Page 3

A SwiftUI view that displays a three-dimensional chart.
init<Data, C>(Data, content: (Data.Element) -> C)
Creates a 3D chart composed of a series of identifiable marks.
init<Data, ID, C>(Data, id: KeyPath<Data.Element, ID>, content: (Data.
Element) -> C)
Creates a 3D chart composed of a series of marks.
init(content: () -> Content)
protocol Chart3DSymbolShape
A type that can act as a shape for the marks that you add to a chart.
struct BasicChart3DSymbolShape
A basic chart symbol shape.
protocol Chart3DSurfaceStyle
struct BasicChart3DSurfaceStyle
struct Chart3DCameraProjection
struct Chart3DPose
Topics
Creating 3D charts
Configuring chart shapes
Configuring surfaces
Customizing chart presentation


## Page 4

Sendable, SendableMetatype, View
protocol Chart3DContent
A type that represents the three-dimensional content that you draw on a chart.
struct Chart3DContentBuilder
A result builder that you use to compose the three-dimensional contents of a chart.
struct SurfacePlot
Chart content that represents a mathematical function of two variables using a 3D surface.
Relationships
Conforms To
See Also
3D charts


## Page 5

associatedtype Body : Chart3DContent
Required
var body: Self.Body
Required
func foregroundStyle(some Chart3DSurfaceStyle) -> some Chart3DContent
func foregroundStyle(some ShapeStyle) -> some Chart3DContent
func foregroundStyle<D>(by: PlottableValue<D>) -> some Chart3DContent
func metalness(Double) -> some Chart3DContent
A value that controls whether the surface has a metallic look.
Topics
Associated Types
Instance Properties
Instance Methods
Swift Charts / Chart3DContent
Protocol
Chart3DContent
A type that represents the three-dimensional content that you draw on a chart.
iOS 26.0+
iPadOS 26.0+
Mac Catalyst 26.0+
macOS 26.0+
visionOS 26.0+


## Page 6

func roughness(Double) -> some Chart3DContent
A value that controls the degree of surface roughness.
func symbol<S>(S) -> some Chart3DContent
func symbolRotation(Rotation3D) -> some Chart3DContent
Set the rotation of a 3D symbol.
func symbolSize(CGFloat) -> some Chart3DContent
BuilderConditional
Conforms when TrueContent conforms to Chart3DContent and FalseContent conforms to
Chart3DContent.
PointMark
RectangleMark
RuleMark
SurfacePlot
struct Chart3D
A SwiftUI view that displays interactive 3D charts and visualizations.
struct Chart3DContentBuilder
A result builder that you use to compose the three-dimensional contents of a chart.
struct SurfacePlot
Chart content that represents a mathematical function of two variables using a 3D surface.
Relationships
Conforming Types
See Also
3D charts


## Page 7

static func buildBlock() -> some Chart3DContent
static func buildBlock<Content>(Content) -> Content
static func buildBlock<each Content>(repeat each Content) -> some 
Chart3DContent
static func buildEither<C1, C2>(first: C1) -> BuilderConditional<C1, C2
static func buildEither<C1, C2>(second: C2) -> BuilderConditional<C1, C
>
static func buildExpression<Content>(Content) -> Content
static func buildLimitedAvailability<Content>(Content) -> some 
Chart3DContent
static func buildOptional<Content>(Content) -> Content
Topics
Type Methods
Swift Charts / Chart3DContentBuilder
Structure
Chart3DContentBuilder
A result builder that you use to compose the three-dimensional contents of a
chart.
iOS 26.0+
iPadOS 26.0+
Mac Catalyst 26.0+
macOS 26.0+
visionOS 26.0+


## Page 8

struct Chart3D
A SwiftUI view that displays interactive 3D charts and visualizations.
protocol Chart3DContent
A type that represents the three-dimensional content that you draw on a chart.
struct SurfacePlot
Chart content that represents a mathematical function of two variables using a 3D surface.
See Also
3D charts


## Page 9

Use SurfacePlot to visualize a 3D surface for functions of the form y = f(x, z)
To create a SurfacePlot, provide a closure that takes x and z values as input and returns a y
value. For example, to draw the function y = sin(2 * x) * cos(2 * z), you write:
You can also explicitly define the plotting space of your Chart3D using the Chart/chart
XScale(domain:range:type:)->View, Chart/chartYScale(domain:range:type:)-
Overview
Overview
Swift Charts / SurfacePlot
Structure
SurfacePlot
Chart content that represents a mathematical function of two variables using a 3D
surface.
iOS 26.0+
iPadOS 26.0+
Mac Catalyst 26.0+
macOS 26.0+
visionOS 26.0+


## Page 10

>View, and Chart/chartYScale(domain:range:type:)->View modifiers.
You can style the surface using standard Swift Charts modifiers like foregroundStyle(_:)-
(Chart3DSurfaceStyle)->Chart3DContent. You may find this useful for Charts that conta
more than one SurfacePlot. A common and effective style for surfaces is heightBased, whic
creates a gradient using colors based on the y-value of your surface, making it easier to perceive
its shape. You can also use normalBased to color points on the SurfacePlot based on the
direction that it is facing.
Chart content that represents a collection of data using three-dimensional data.
init(x: Text, y: Text, z: Text, function: (Double, Double) -> Double)
Creates a SurfacePlot that represents a function y = f(x, z).
init(x: LocalizedStringKey, y: LocalizedStringKey, z: LocalizedStringKe
, function: (Double, Double) -> Double)
Creates a SurfacePlot that represents a function y = f(x, z).
Styling the Surface
Topics
Initializers


## Page 11

init(x: LocalizedStringResource, y: LocalizedStringResource, z:
LocalizedStringResource, function: (Double, Double) -> Double)
Creates a SurfacePlot that represents a function y = f(x, z).
init(x: some StringProtocol, y: some StringProtocol, z: some String
Protocol, function: (Double, Double) -> Double)
Creates a SurfacePlot that represents a function y = f(x, z).
Chart3DContent, Sendable, SendableMetatype
struct Chart3D
A SwiftUI view that displays interactive 3D charts and visualizations.
protocol Chart3DContent
A type that represents the three-dimensional content that you draw on a chart.
struct Chart3DContentBuilder
A result builder that you use to compose the three-dimensional contents of a chart.
Relationships
Conforms To
See Also
3D charts


