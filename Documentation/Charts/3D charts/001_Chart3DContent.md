# 001_Chart3DContent.pdf

## Page 1

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


## Page 2

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


