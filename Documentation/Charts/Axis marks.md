# Axis marks.pdf

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


## Page 3

Customizing axes in Swift Charts
struct Length
Describes the length of a tick.
init(centered: Bool?, length: CGFloat, stroke: StrokeStyle?)
Creates an axis tick with the given properties.
init(centered: Bool?, length: AxisTick.Length, stroke: StrokeStyle?)
Creates an axis tick with the given properties.
Mentioned in
Topics
Structures
Initializers
Swift Charts / AxisTick
Structure
AxisTick
A mark that a chart draws on an axis to indicate a reference point along that axis.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 9.0+


## Page 4

AxisMark
protocol AxisMark
A type that serves as the basic building block for the elements of an axis.
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
Relationships
Conforms To
See Also
Axis marks


## Page 5

Customizing axes in Swift Charts
init(centered: Bool?, stroke: StrokeStyle?)
Creates an axis grid line with the given properties.
AxisMark
Mentioned in
Topics
Initializers
Relationships
Conforms To
Swift Charts / AxisGridLine
Structure
AxisGridLine
A line that a chart draws across its plot area to indicate a reference point along a
particular axis.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 9.0+


## Page 6

protocol AxisMark
A type that serves as the basic building block for the elements of an axis.
struct AxisTick
A mark that a chart draws on an axis to indicate a reference point along that axis.
struct AxisValueLabel
A label that describes the value for an axis mark.
struct AxisValue
A value for an axis mark.
struct AnyAxisMark
A type-erased axis mark.
struct AxisMarkBuilder
A result builder that constructs axis marks and overrides default marks.
See Also
Axis marks


## Page 7

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


## Page 8

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


## Page 9

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


## Page 10

var count: Int
The number of values on this axis.
var index: Int
The index of the value along the axis.
func `as`<P>(P.Type) -> P?
Sendable, SendableMetatype
Topics
Instance Properties
Instance Methods
Relationships
Conforms To
Swift Charts / AxisValue
Structure
AxisValue
A value for an axis mark.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 9.0+


## Page 11

protocol AxisMark
A type that serves as the basic building block for the elements of an axis.
struct AxisTick
A mark that a chart draws on an axis to indicate a reference point along that axis.
struct AxisGridLine
A line that a chart draws across its plot area to indicate a reference point along a particular
axis.
struct AxisValueLabel
A label that describes the value for an axis mark.
struct AnyAxisMark
A type-erased axis mark.
struct AxisMarkBuilder
A result builder that constructs axis marks and overrides default marks.
See Also
Axis marks


## Page 12

init(any AxisMark)
init(erasing: some AxisMark)
AxisMark
Topics
Initializers
Relationships
Conforms To
See Also
Axis marks
Swift Charts / AnyAxisMark
Structure
AnyAxisMark
A type-erased axis mark.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 9.0+


## Page 13

protocol AxisMark
A type that serves as the basic building block for the elements of an axis.
struct AxisTick
A mark that a chart draws on an axis to indicate a reference point along that axis.
struct AxisGridLine
A line that a chart draws across its plot area to indicate a reference point along a particular
axis.
struct AxisValueLabel
A label that describes the value for an axis mark.
struct AxisValue
A value for an axis mark.
struct AxisMarkBuilder
A result builder that constructs axis marks and overrides default marks.


## Page 14

static func buildBlock() -> some AxisMark
static func buildBlock<T>(T) -> T
Builds a result from a single component.
static func buildBlock<each T>(repeat each T) -> some AxisMark
Builds a result from multiple components.
static func buildEither<T1, T2>(first: T1) -> BuilderConditional<T1, T2
Provides support for “if-else” statements in multi-statement closures, producing conditional
content for the “then” branch.
static func buildEither<T1, T2>(second: T2) -> BuilderConditional<T1, T
>
Provides support for “if-else” statements in multi-statement closures, producing conditional
content for the “else” branch.
static func buildExpression<Content>(Content) -> Content
static func buildIf<T>(T?) -> T?
Topics
Type Methods
Swift Charts / AxisMarkBuilder
Structure
AxisMarkBuilder
A result builder that constructs axis marks and overrides default marks.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 9.0+


## Page 15

Provides support for “if” statements in multi-statement closures, producing an optional axis
content that is visible only when the condition evaluates to true.
static func buildLimitedAvailability<Content>(Content) -> AnyAxisMark
Provides support for “if” statements with #available() clauses in multi-statement
closures, producing conditional content for the “then” branch, i.e. the conditionally-available
branch.
static func buildPartialBlock(accumulated: some AxisMark, next: some 
AxisMark) -> some AxisMark
Deprecated
static func buildPartialBlock<T>(first: T) -> T
Deprecated
protocol AxisMark
A type that serves as the basic building block for the elements of an axis.
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
See Also
Axis marks


