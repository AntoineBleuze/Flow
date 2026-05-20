# 006_AxisMarkBuilder.pdf

## Page 1

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


## Page 2

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


