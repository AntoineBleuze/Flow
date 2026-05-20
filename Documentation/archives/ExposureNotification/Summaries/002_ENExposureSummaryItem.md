# 002_ENExposureSummaryItem.pdf

## Page 1

Important
This class is available in iOS 12.5, iOS 13.7, and later.
The exposure summary item provides a summary of exposures for a particular day. The framewor
computes this summary by compiling values for a weightedDurationSum, a maximumScore
(the maximum of the exposure risk values), and a scoreSum. This summary of exposures can be
for a specific report type (confirmedTestSummary) or a combination across all report types
(daySummary). An instance of ENExposureDaySummary contains the exposure summary item.
To illustrate how the framework computes this value, assume Alice encounters Bob, Carol, and
Dave on a particular day; each person has weights set by their respective Public Health Authority.
Bob’s minutes-at-attenuation weight is 50, his infectiousness weight is 100%, and his report type
weight is 200% (a confirmed test). His exposure risk value is 100 as dictated by his Public Health
Authority.
Overview
Exposure Notification / ENExposureSummaryItem
Class
ENExposureSummaryItem
The summary of exposures for a specific time period or report type.
iOS 12.5+
iPadOS 12.5+
Mac Catalyst 12.5+


## Page 2

Carol’s minutes-at-attenuation weight is 30, her infectiousness weight is 100%, and her report typ
weight is 100% (a confirmed clinical diagnosis). Her exposure risk value is 30 as dictated by her
Public Health Authority.
Dave’s minutes-at-attenuation weight is 40, his infectiousness weight is 0%, and his report type
weight is 80% (a self-diagnosis). His exposure risk value is 0 as dictated by his Public Health
Authority.


## Page 3

Alice’s exposure summary item for that day would be a weightedDurationSum of 120 (50 + 30
40), a maximumScore of 100 (the maximum of the exposure risk values), and a scoreSum of 130
(100 + 30).
var maximumScore: Double
The highest score of all exposures for this item.
var scoreSum: Double
The sum of scores for all exposure for this item.
var weightedDurationSum: TimeInterval
The sum of exposure durations weighted by their attenuation.
NSObject
CVarArg
Topics
Getting Summary Properties
Relationships
Inherits From
Conforms To


## Page 4

CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
class ENExposureDetectionSummary
A summary of exposures.
class ENExposureDaySummary
The summary of exposure information for a single day.
See Also
Summaries


