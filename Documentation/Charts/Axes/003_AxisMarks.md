# 003_AxisMarks.pdf

## Page 1

Customizing axes in Swift Charts
struct AxisMarkPreset
Describes preset styles for axis markers.
struct AxisMarkValues
Describes the values the axis markers will present (one for each value).
struct AxisMarkPosition
Describes the position of axis markers.
Mentioned in
Topics
Supporting types
Initializers
Swift Charts / AxisMarks
Structure
AxisMarks
A group of visual marks that a chart draws to indicate the composition of a chart’s
axes.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 9.0+


## Page 2

init<Format>(format: Format, preset: AxisMarkPreset, position: AxisMark
Position, values: AxisMarkValues, stroke: StrokeStyle?)
Creates axis markers with the given properties, will override default markers. Default content
will be used for the axis markers.
init<Value, Format>(format: Format, preset: AxisMarkPreset, position:
AxisMarkPosition, values: [Value], stroke: StrokeStyle?)
Creates axis markers with the given properties, will override default markers. Default content
will be used for the axis markers.
init<Value>(preset: AxisMarkPreset, position: AxisMarkPosition, values:
[Value], content: (AxisValue) -> Content)
Creates axis markers with the given properties, will override default markers.
init<Value>(preset: AxisMarkPreset, position: AxisMarkPosition, values:
[Value], content: () -> Content)
Creates axis markers with the given properties, will override default markers.
init(preset: AxisMarkPreset, position: AxisMarkPosition, values: Axis
MarkValues, content: () -> Content)
Creates axis markers with the given properties,will override default markers.
init(preset: AxisMarkPreset, position: AxisMarkPosition, values: Axis
MarkValues, content: (AxisValue) -> Content)
Creates axis markers with the given properties,will override default markers.
init(preset: AxisMarkPreset, position: AxisMarkPosition, values: Axis
MarkValues, stroke: StrokeStyle?)
Creates axis markers with the given properties, will override default markers. Default content
will be used for the axis markers.
init<Value>(preset: AxisMarkPreset, position: AxisMarkPosition, values:
[Value], stroke: StrokeStyle?)
Creates axis markers with the given properties, will override default markers. Default content
will be used for the axis markers.
Relationships
Conforms To


## Page 3

AxisContent
Customizing axes in Swift Charts
Improve the clarity of your chart by configuring the appearance of its axes.
struct ChartAxisContent
A view that represents a chart’s axis.
protocol AxisContent
A type that represents the elements you use to build a chart’s axes.
struct AnyAxisContent
A type-erased element of a chart’s axis.
struct AxisContentBuilder
A result builder that constructs axis content.
See Also
Axes


