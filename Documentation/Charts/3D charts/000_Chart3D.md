# 000_Chart3D.pdf

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


