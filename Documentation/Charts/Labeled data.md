# Labeled data.pdf

## Page 1

Provide a PlottableValue to a Mark property (e.g., x, y, foregroundStyle) to plot data values
with the mark property.
Important
The data type must conform to Plottable. This is a numeric value like a Double or Int16
for quantitative data, Date for temporal data, or String for categorical data.
You can use the .value("Category", \.category) shorthand to create a Plottable
Value. The example below plots category, value, and group with the bar mark’s x, y, and
foregroundStyle.
Overview
Swift Charts / PlottableValue
Structure
PlottableValue
Labeled data that you plot in a chart using marks.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 9.0+


## Page 2

static func value<S>(S, Value) -> PlottableValue<Value>
Creates a parameter value with label and value.
static func value(LocalizedStringKey, Range<Value>) -> PlottableValue<
Value>
Creates a parameter value with label key and value.
static func value(Text, Range<Value>) -> PlottableValue<Value>
Creates a parameter value with label and value.
static func value<S>(S, ChartBinRange<Value>) -> PlottableValue<Value>
Creates a parameter value with label and value.
static func value(LocalizedStringResource, Value) -> PlottableValue<
Value>
Creates a parameter value with label and value.
static func value(LocalizedStringKey, Value) -> PlottableValue<Value>
Creates a parameter value with label key and value.
static func value(LocalizedStringResource, ChartBinRange<Value>) ->
PlottableValue<Value>
Topics
Type Methods


## Page 3

Creates a parameter value with label and value.
static func value(Text, Value) -> PlottableValue<Value>
Creates a parameter value with label and value.
static func value(LocalizedStringKey, ChartBinRange<Value>) -> Plottabl
Value<Value>
Creates a parameter value with label key and value.
static func value(LocalizedStringResource, Range<Value>) -> Plottable
Value<Value>
Creates a parameter value with label and value.
static func value(Text, ChartBinRange<Value>) -> PlottableValue<Value>
Creates a parameter value with label and value.
static func value<S>(S, Range<Value>) -> PlottableValue<Value>
Creates a parameter value with label and value.
static func value(LocalizedStringResource, Date, unit: Calendar.
Component, calendar: Calendar?) -> PlottableValue<Value>
Creates a parameter value with label and value.
static func value<S>(S, Date, unit: Calendar.Component, calendar:
Calendar?) -> PlottableValue<Value>
Creates a parameter value with label and value.
static func value(LocalizedStringKey, Date, unit: Calendar.Component,
calendar: Calendar?) -> PlottableValue<Value>
Creates a parameter value with label key and value.
static func value(Text, Date, unit: Calendar.Component, calendar:
Calendar?) -> PlottableValue<Value>
Creates a parameter value with label and value.
protocol Plottable
See Also
Labeled data


## Page 4

A type that can serve as data to plot in a chart.


## Page 5

You create PlottableValue items from data that conforms to Plottable using a method like
value(_:_:). You then use those items as the values in a chart, like for the BarMark chart in th
following example:
You can create a custom plottable type by conforming it to this protocol. For example:
In addition, you can make an enum work as a categorical data value by using String as its raw
value and conforming the type to Plottable. The string values will be used as localized string keys
when the categories are displayed as text in a chart (for example, on an axis).
Overview
Swift Charts / Plottable
Protocol
Plottable
A type that can serve as data to plot in a chart.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 9.0+


## Page 6

protocol PrimitivePlottableProtocol
A type that represents the primitive plottable types supported by the framework. Don’t use
this type directly.
associatedtype PrimitivePlottable : PrimitivePlottableProtocol
A primitive plottable type.
Required
init?(primitivePlottable: Self.PrimitivePlottable)
Creates the plottable value for the underlying type, if any, that corresponds to the primitive
plottable value.
Required Default implementations provided.
var primitivePlottable: Self.PrimitivePlottable
The primitive plottable value that corresponds to the plottable value of the underlying type.
Required Default implementations provided.
Topics
Supporting types
Associated Types
Initializers
Instance Properties
Relationships
Inherited By


## Page 7

PrimitivePlottableProtocol
struct PlottableValue
Labeled data that you plot in a chart using marks.
See Also
Labeled data


