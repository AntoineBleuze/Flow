# 002_Chart3DContentBuilder.pdf

## Page 1

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


## Page 2

struct Chart3D
A SwiftUI view that displays interactive 3D charts and visualizations.
protocol Chart3DContent
A type that represents the three-dimensional content that you draw on a chart.
struct SurfacePlot
Chart content that represents a mathematical function of two variables using a 3D surface.
See Also
3D charts


