# 003_SurfacePlot.pdf

## Page 1

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


## Page 2

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


## Page 3

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


