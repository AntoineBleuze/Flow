# 000_AxisMark.pdf

## Page 1

Customizing axes in Swift Charts
func font(Font?) -> some AxisMark
Sets the default font for text in this axis content.
func foregroundStyle<S>(S) -> some AxisMark
Sets the axis content’s foreground elements to use a given style.
func offset(CGSize) -> some AxisMark
func offset(x: CGFloat, y: CGFloat) -> some AxisMark
Mentioned in
Topics
Instance Methods
Relationships
Swift Charts / AxisMark
Protocol
AxisMark
A type that serves as the basic building block for the elements of an axis.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 9.0+


## Page 2

AnyAxisMark
AxisGridLine
AxisTick
AxisValueLabel
BuilderConditional
Conforms when TrueContent conforms to AxisMark and FalseContent conforms to AxisMark.
struct AxisTick
A mark that a chart draws on an axis to indicate a reference point along that axis.
struct AxisGridLine
A line that a chart draws across its plot area to indicate a reference point along a particular
axis.
struct AxisValueLabel
A label that describes the value for an axis mark.
struct AxisValue
A value for an axis mark.
struct AnyAxisMark
A type-erased axis mark.
struct AxisMarkBuilder
A result builder that constructs axis marks and overrides default marks.
Conforming Types
See Also
Axis marks


