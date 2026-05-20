# 005_AxisContentBuilder.pdf

## Page 1

static func buildBlock() -> some AxisContent
static func buildBlock<T>(T) -> T
Builds a result from a single component.
static func buildBlock<each T>(repeat each T) -> some AxisContent
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
Swift Charts / AxisContentBuilder
Structure
AxisContentBuilder
A result builder that constructs axis content.
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
static func buildLimitedAvailability<Content>(Content) -> AnyAxisConten
Provides support for “if” statements with #available() clauses in multi-statement
closures, producing conditional content for the “then” branch, i.e. the conditionally-available
branch.
static func buildPartialBlock(accumulated: some AxisContent, next: some
AxisContent) -> some AxisContent
Deprecated
static func buildPartialBlock<T>(first: T) -> T
Deprecated
Customizing axes in Swift Charts
Improve the clarity of your chart by configuring the appearance of its axes.
struct ChartAxisContent
A view that represents a chart’s axis.
protocol AxisContent
A type that represents the elements you use to build a chart’s axes.
struct AxisMarks
A group of visual marks that a chart draws to indicate the composition of a chart’s axes.
struct AnyAxisContent
A type-erased element of a chart’s axis.
See Also
Axes


