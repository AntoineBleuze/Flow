# 002_AxisContent.pdf

## Page 1

func compositingLayer() -> some AxisContent
Creates a compositing layer for the axis content.
func compositingLayer<V>(style: (PlaceholderContentView<Self>) -> V) ->
some AxisContent
Creates a compositing layer for the axis content, and apply view modifiers to the compositin
layer.
AnyAxisContent
AxisMarks
BuilderConditional
Topics
Instance Methods
Relationships
Conforming Types
Swift Charts / AxisContent
Protocol
AxisContent
A type that represents the elements you use to build a chart’s axes.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 9.0+


## Page 2

Conforms when TrueContent conforms to AxisContent and FalseContent conforms to AxisContent.
Customizing axes in Swift Charts
Improve the clarity of your chart by configuring the appearance of its axes.
struct ChartAxisContent
A view that represents a chart’s axis.
struct AxisMarks
A group of visual marks that a chart draws to indicate the composition of a chart’s axes.
struct AnyAxisContent
A type-erased element of a chart’s axis.
struct AxisContentBuilder
A result builder that constructs axis content.
See Also
Axes


