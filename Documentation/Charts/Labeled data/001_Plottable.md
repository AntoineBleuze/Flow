# 001_Plottable.pdf

## Page 1

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


## Page 2

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


## Page 3

PrimitivePlottableProtocol
struct PlottableValue
Labeled data that you plot in a chart using marks.
See Also
Labeled data


