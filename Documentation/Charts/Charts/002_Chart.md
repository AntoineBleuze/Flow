# 002_Chart.pdf

## Page 1

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


## Page 2

This chart initializer behaves a lot like a SwiftUI ForEach, creating a mark — in this case, a bar —
for each of the values in the data array:
You can compose more sophisticated charts by providing more than one series of marks to the
chart. For example, suppose you have profit data for two companies:
The following chart creates two different series of LineMark instances with different colors to
represent the data for each company. In effect, it moves the ForEach construct from the chart’s
initializer into the body of the chart, enabling you to represent multiple different series:
Controlling data series inside a chart


## Page 3

You indicate which series a line mark belongs to by specifying its series input parameter. The
above chart also uses a RuleMark to produce a horizontal line segment that displays a constant
threshold value across the width of the chart:
Topics


## Page 4

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


## Page 5

A type that represents the content that you draw on a chart.
struct ChartContentBuilder
A result builder that you use to compose the contents of a chart.
struct Plot
A mechanism for grouping chart contents into a single entity.


