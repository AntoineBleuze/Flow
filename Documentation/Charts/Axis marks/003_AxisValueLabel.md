# 003_AxisValueLabel.pdf

## Page 1

Customizing axes in Swift Charts
struct AxisValueLabelOrientation
Describes the orientation of a label.
struct AxisValueLabelCollisionResolution
init(LocalizedStringResource, centered: Bool?, anchor: UnitPoint?, mult
LabelAlignment: Alignment?, collisionResolution: AxisValueLabelCollisio
Resolution, offsetsMarks: Bool?, orientation: AxisValueLabelOrientation
horizontalSpacing: CGFloat?, verticalSpacing: CGFloat?)
Constructs an axis value label with the given properties to display the given string.
Mentioned in
Topics
Supporting types
Initializers
Swift Charts / AxisValueLabel
Structure
AxisValueLabel
A label that describes the value for an axis mark.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 9.0+


## Page 2

init(LocalizedStringKey, centered: Bool?, anchor: UnitPoint?, multiLabe
Alignment: Alignment?, collisionResolution: AxisValueLabelCollision
Resolution, offsetsMarks: Bool?, orientation: AxisValueLabelOrientation
horizontalSpacing: CGFloat?, verticalSpacing: CGFloat?)
Constructs an axis value label with the given properties to display the given string.
init<S>(S, centered: Bool?, anchor: UnitPoint?, multiLabelAlignment:
Alignment?, collisionResolution: AxisValueLabelCollisionResolution,
offsetsMarks: Bool?, orientation: AxisValueLabelOrientation, horizontal
Spacing: CGFloat?, verticalSpacing: CGFloat?)
Constructs an axis value label with the given properties to display the given string.
init(centered: Bool?, anchor: UnitPoint?, multiLabelAlignment: Alignmen
?, collisionResolution: AxisValueLabelCollisionResolution, offsetsMarks
Bool?, orientation: AxisValueLabelOrientation, horizontalSpacing:
CGFloat?, verticalSpacing: CGFloat?)
Constructs axis value labels with the given properties and default text.
init(centered: Bool?, anchor: UnitPoint?, multiLabelAlignment: Alignmen
?, collisionResolution: AxisValueLabelCollisionResolution, offsetsMarks
Bool?, orientation: AxisValueLabelOrientation, horizontalSpacing:
CGFloat?, verticalSpacing: CGFloat?, content: () -> Content)
Constructs an axis value label with the given properties to display the given content.
init<Format>(format: Format, centered: Bool?, anchor: UnitPoint?, multi
LabelAlignment: Alignment?, collisionResolution: AxisValueLabelCollisio
Resolution, offsetsMarks: Bool?, orientation: AxisValueLabelOrientation
horizontalSpacing: CGFloat?, verticalSpacing: CGFloat?)
Constructs an axis value label with the given properties to display the given content.
AxisMark
Relationships
Conforms To
See Also


## Page 3

protocol AxisMark
A type that serves as the basic building block for the elements of an axis.
struct AxisTick
A mark that a chart draws on an axis to indicate a reference point along that axis.
struct AxisGridLine
A line that a chart draws across its plot area to indicate a reference point along a particular
axis.
struct AxisValue
A value for an axis mark.
struct AnyAxisMark
A type-erased axis mark.
struct AxisMarkBuilder
A result builder that constructs axis marks and overrides default marks.
Axis marks


