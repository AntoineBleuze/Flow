# 000_NumberBins.pdf

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


