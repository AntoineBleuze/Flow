# 004_ChartContentBuilder.pdf

## Page 1

This Result Builder combines any number of ChartContent instances into a single composite
instance, including support for conditionals.
You don’t call the methods of the result builder directly. Instead, Swift uses them to combine the
elements that you declare in any closure that has the @ChartContentBuilder attribute. In
particular, you rely on this behavior when you declare the content inside a Chart initializer like
init(content:).
static func buildPartialBlock<T>(first: T) -> T
Builds a partial result from a single, first component.
Deprecated
static func buildPartialBlock(accumulated: some ChartContent, next: som
 ChartContent) -> some ChartContent
Builds a partial result by combining an accumulated component and a new component.
Overview
Topics
Building chart content
Swift Charts / ChartContentBuilder
Structure
ChartContentBuilder
A result builder that you use to compose the contents of a chart.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 9.0+


## Page 2

Deprecated
static func buildBlock() -> some ChartContent
Produces empty chart content.
static func buildIf<T>(T?) -> T?
Builds a partial result that’s conditionally present.
static func buildEither<T1, T2>(first: T1) -> BuilderConditional<T1, T2
Builds a partial result from a condition that’s true.
static func buildEither<T1, T2>(second: T2) -> BuilderConditional<T1, T
>
Builds a partial result from a condition that’s false.
static func buildLimitedAvailability(some ChartContent) -> AnyChart
Content
Builds a partial result that propagates or erases type information outside a compiler-controll
availability check.
struct BuilderConditional
A conditional result from a result builder.
static func buildBlock<each C>(repeat each C) -> some ChartContent
Builds a result from multiple components.
static func buildBlock<C>(C) -> C
Builds a result from a single component.
static func buildExpression<Content>(Content) -> Content
Building conditionally
Building with conditional availability
Supporting types
Type Methods


## Page 3

Creating a chart using Swift Charts
Make a chart by combining chart building blocks in SwiftUI.
Visualizing your app’s data
Build complex and interactive charts using Swift Charts.
struct Chart
A SwiftUI view that displays a chart.
protocol ChartContent
A type that represents the content that you draw on a chart.
struct Plot
A mechanism for grouping chart contents into a single entity.
See Also
Charts


