# Scrolling.pdf

## Page 1

struct MajorValueAlignment
A type that defines how the valigned aligned chart scroll target behavior aligns to major valu
on swipe.
struct ValueAlignedLimitBehavior
A type that defines the amount of marks that can be scrolled at a time.
struct ValueAlignedChartScrollTargetBehavior
A scroll target behavior that aligns to values spaced at regular intervals along the scrollable
axes.
func updateTarget(inout ScrollTarget, context: ChartScrollTargetBehavio
Context)
Required Default implementation provided.
Topics
Supporting types
Instance Methods
Type Methods
Swift Charts / ChartScrollTargetBehavior
Protocol
ChartScrollTargetBehavior
A type that configures the scroll behavior of charts.
iOS 17.0+
iPadOS 17.0+
Mac Catalyst 17.0+
macOS 14.0+
tvOS 17.0+
visionOS 1.0+
watchOS 10.0+


## Page 2

static func valueAligned(matching: DateComponents, majorAlignment: Majo
ValueAlignment<Date>?, limitBehavior: ValueAlignedLimitBehavior) ->
ValueAlignedChartScrollTargetBehavior
Creates a scroll target behavior that aligns to values spaced at regular intervals along the
scrollable axes.
static func valueAligned<P>(unit: P, majorAlignment: MajorValueAlignmen
<P>?, limitBehavior: ValueAlignedLimitBehavior) -> ValueAlignedChart
ScrollTargetBehavior
Creates a scroll target behavior that aligns to values spaced at regular intervals along the
scrollable axes.
static func valueAligned(xMatching: DateComponents, yMatching: Date
Components, xMajorAlignment: MajorValueAlignment<Date>?, yMajorAlignmen
: MajorValueAlignment<Date>?, limitBehavior: ValueAlignedLimitBehavior)
-> ValueAlignedChartScrollTargetBehavior
Creates a scroll target behavior that aligns to values spaced at regular intervals along the
scrollable axes.
static func valueAligned<Y>(xMatching: DateComponents, yUnit: Y, xMajor
Alignment: MajorValueAlignment<Date>?, yMajorAlignment: MajorValue
Alignment<Y>?, limitBehavior: ValueAlignedLimitBehavior) -> ValueAligne
ChartScrollTargetBehavior
Creates a scroll target behavior that aligns to values spaced at regular intervals along the
scrollable axes.
static func valueAligned<X>(xUnit: X, yMatching: DateComponents, xMajor
Alignment: MajorValueAlignment<X>?, yMajorAlignment: MajorValueAlignmen
<Date>?, limitBehavior: ValueAlignedLimitBehavior) -> ValueAlignedChart
ScrollTargetBehavior
Creates a scroll target behavior that aligns to values spaced at regular intervals along the
scrollable axes.
static func valueAligned<X, Y>(xUnit: X, yUnit: Y, xMajorAlignment:
MajorValueAlignment<X>?, yMajorAlignment: MajorValueAlignment<Y>?, limi
Behavior: ValueAlignedLimitBehavior) -> ValueAlignedChartScrollTarget
Behavior
Creates a scroll target behavior that aligns to values spaced at regular intervals along the
scrollable axes.
Default Implementations


## Page 3

ScrollTargetBehavior Implementations
ScrollTargetBehavior
ValueAlignedChartScrollTargetBehavior
struct ChartScrollTargetBehaviorContext
Contextual information that you can use to determine how to best adjust how charts scroll.
Relationships
Inherits From
Conforming Types
See Also
Scrolling


## Page 4

var chartProxy: ChartProxy
The chart proxy that you use to access the scales and plot area of the chart.
subscript<T>(dynamicMember _: KeyPath<ScrollTargetBehaviorContext, T>) 
> T
protocol ChartScrollTargetBehavior
Topics
Instance Properties
Subscripts
See Also
Scrolling
Swift Charts / ChartScrollTargetBehaviorContext
Structure
ChartScrollTargetBehaviorContext
Contextual information that you can use to determine how to best adjust how
charts scroll.
iOS 17.0+
iPadOS 17.0+
Mac Catalyst 17.0+
macOS 14.0+
tvOS 17.0+
visionOS 1.0+
watchOS 10.0+


## Page 5

A type that configures the scroll behavior of charts.


