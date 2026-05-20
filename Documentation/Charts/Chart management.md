# Chart management.pdf

## Page 1

Sendable, SendableMetatype, View
struct ChartProxy
A proxy that you use to access the scales and plot area of a chart.
Relationships
Conforms To
See Also
Chart management
Swift Charts / ChartPlotContent
Structure
ChartPlotContent
A view that represents a chart’s plot area.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 9.0+


## Page 2

You get a chart proxy from the chartOverlay(alignment:content:) and chart
Background(alignment:content:) modifiers. You can use the chart proxy to convert data
values to screen coordinates or vice-versa.
Below is an example where we convert the screen coordinates from a drag gesture to data values
Overview
Swift Charts / ChartProxy
Structure
ChartProxy
A proxy that you use to access the scales and plot area of a chart.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 9.0+


## Page 3

var plotAreaFrame: Anchor<CGRect>
An anchor to the frame of the chart’s plot.
var plotAreaSize: CGSize
The size of the plot in the chart.
var plotContainerFrame: Anchor<CGRect>?
An anchor to the frame of the chart’s plot container, or nil if there is no chart in the context
of the chart proxy.
var plotFrame: Anchor<CGRect>?
An anchor to the frame of the chart’s plot, or nil if there is no chart in the context of the
chart proxy.
var plotSize: CGSize
The size of the plot in the chart.
func angle(at: CGPoint) -> Angle
Returns the angle relative to the plot area center, where the 12 o’clock position is interpreted
as zero degrees, increasing clockwise.
func foregroundStyle<P>(for: P) -> AnyShapeStyle?
Returns the foreground style for the given data value. Returns nil if the foreground style
scale is unavailable, or the value is invalid.
func foregroundStyleDomain<P>(dataType: P.Type) -> [P]
Topics
Instance Properties
Instance Methods


## Page 4

func lineStyle<P>(for: P) -> StrokeStyle?
Returns the line style for the given data value. Returns nil if the line style scale is unavailab
or the value is invalid.
func lineStyleDomain<P>(dataType: P.Type) -> [P]
func position<X, Y>(for: (x: X, y: Y)) -> CGPoint?
Returns the x and y positions as a CGPoint for the given data values, or nil if either the X o
the y scale is unavailable or if any data value is invalid. The returned position is relative to the
plot.
func position<P>(forX: P) -> CGFloat?
Returns the x position for the given data value, or nil if the x scale is unavailable or if the da
value is invalid. The returned position is relative to the plot.
func position<P>(forY: P) -> CGFloat?
Returns the y position for the given data value, or nil if the y scale is unavailable or if the da
value is invalid. The returned position is relative to the plot.
func positionRange<X, Y>(for: (x: X, y: Y)) -> CGRect?
Returns the range of x and y positions for the given pair of data values, or nil if the y scale 
unavailable or if the value is invalid.
func positionRange<P>(forX: P) -> ClosedRange<CGFloat>?
Returns the range of x position for the given data value, or nil if the x scale is unavailable o
the value is invalid. The returned position range is relative to the plot.
func positionRange<P>(forY: P) -> ClosedRange<CGFloat>?
Returns the range of y position for the given data value, or nil if the x scale is unavailable o
the value is invalid. The returned position range is relative to the plot.
func selectAngleValue(at: Angle)
func selectXRange(from: CGFloat, to: CGFloat)
func selectXValue(at: CGFloat)
func selectYRange(from: CGFloat, to: CGFloat)
func selectYValue(at: CGFloat)
func symbol<P>(for: P) -> AnyChartSymbolShape?
Returns the symbol for the given data value. Returns nil if the symbol scale is unavailable, o
the value is invalid.
func symbolDomain<P>(dataType: P.Type) -> [P]


## Page 5

func symbolSize<P>(for: P) -> CGFloat?
Returns the symbol size for the given data value. Returns nil if the symbol size scale is
unavailable, or the value is invalid.
func symbolSizeDomain<P>(dataType: P.Type) -> [P]
func value<X, Y>(at: CGPoint, as: (X, Y).Type) -> (X, Y)?
Returns the data values at the given position, or nil if the position does not correspond to a
valid Y value.
func value<P>(atAngle: Angle, as: P.Type) -> P?
Returns the data value at the given angle, or nil if the angle does not correspond to a valid
data value.
func value<P>(atX: CGFloat, as: P.Type) -> P?
Returns the data value at the given x position, or nil if the position does not correspond to 
valid X value.
func value<P>(atY: CGFloat, as: P.Type) -> P?
Returns the data value at the given y position, or nil if the position does not correspond to 
valid Y value.
func xDomain<P>(dataType: P.Type) -> [P]
func yDomain<P>(dataType: P.Type) -> [P]
struct ChartPlotContent
A view that represents a chart’s plot area.
See Also
Chart management


