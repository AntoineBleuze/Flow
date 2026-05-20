# 001_DateBins.pdf

## Page 1

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


## Page 2

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


