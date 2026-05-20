# Data bins.pdf

## Page 1

init(data: [Value], desiredCount: Int?, minimumStride: Value)
Automatically determine the bins from data.
init(data: [Value], desiredCount: Int?, minimumStride: Value)
Automatically determine the bins from data.
init(range: ClosedRange<Value>, count: Int)
Creates the given number of bins for the range. Expects that the range length is a multiple o
count to allow uniform integer bins.
init(range: ClosedRange<Value>, count: Int)
Creates the given number of bins for the range.
init(range: ClosedRange<Value>, desiredCount: Int, minimumStride: Value
Automatically determine the bins from a range of data.
init(range: ClosedRange<Value>, desiredCount: Int, minimumStride: Value
Automatically determine the bins from a range of data.
init(size: Value, range: ClosedRange<Value>)
Topics
Initializers
Swift Charts / NumberBins
Structure
NumberBins
A collection of bins for a chart that plots data against numbers.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 9.0+


## Page 2

Creates uniform bins covering the given range.
init(size: Value, range: ClosedRange<Value>)
Creates uniform bins covering the given range.
init(thresholds: [Value])
Creates N-1 bins with the given N thresholds.
var thresholds: [Value]
Find the bin thresholds.
func index(for: Value) -> Int
Returns the bin index for the given value.
Collection
Copyable
Equatable
Sequence
struct DateBins
A collection of bins for a chart that plots data against dates.
struct ChartBinRange
Instance Properties
Instance Methods
Relationships
Conforms To
See Also
Data bins


## Page 3

The range of data that a single bin of a chart represents.


## Page 4

init(data: [Date], desiredCount: Int?, calendar: Calendar)
Automatically determine the bins from data.
init(range: ClosedRange<Date>, desiredCount: Int, calendar: Calendar)
Automatically determine the bins from a range of data.
init(thresholds: [Date])
Creates N-1 bins with the given N thresholds.
init(timeInterval: TimeInterval, range: ClosedRange<Date>)
Creates uniform bins covering the given range. The first bin starts at the lower bound of the
range.
init(unit: Calendar.Component, by: Int, range: ClosedRange<Date>,
calendar: Calendar)
Creates uniform bins covering the given range.
Topics
Initializers
Instance Properties
Swift Charts / DateBins
Structure
DateBins
A collection of bins for a chart that plots data against dates.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 9.0+


## Page 5

var thresholds: [Date]
Find the bin thresholds.
func index(for: Date) -> Int
Returns the bin index for the given value.
Collection
Copyable
Equatable
Sequence
struct NumberBins
A collection of bins for a chart that plots data against numbers.
struct ChartBinRange
The range of data that a single bin of a chart represents.
Instance Methods
Relationships
Conforms To
See Also
Data bins


## Page 6

All bins except the last for a particular chart represent an open range, meaning that the range
doesn’t include the upper bound. The last range of the last bin is closed, so that it does include th
upper bound. The system keeps track of the open or closed state of a particular range.
let lowerBound: Bound
let upperBound: Bound
Overview
Topics
Instance Properties
Relationships
Conforms To
Swift Charts / ChartBinRange
Structure
ChartBinRange
The range of data that a single bin of a chart represents.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 9.0+


## Page 7

RangeExpression
struct NumberBins
A collection of bins for a chart that plots data against numbers.
struct DateBins
A collection of bins for a chart that plots data against dates.
See Also
Data bins


