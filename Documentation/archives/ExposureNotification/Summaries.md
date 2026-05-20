# Summaries.pdf

## Page 1

Important
This class is available in iOS 12.5, and in iOS 13.5 and later.
var attenuationDurations: [NSNumber]
An array of durations at specific radio signal attenuations.
var daysSinceLastExposure: Int
Number of days since the most recent exposure.
var matchedKeyCount: UInt64
The number of keys that matched for an exposure detection.
var maximumRiskScore: ENRiskScore
The vaue that represents the highest risk score of all exposure incidents.
Overview
Topics
Exposure Criteria
Exposure Notification / ENExposureDetectionSummary
Class
ENExposureDetectionSummary
A summary of exposures.
iOS 12.5+
iPadOS 12.5+
Mac Catalyst 12.5+


## Page 2

var maximumRiskScoreFullRange: Double
The value that represents the highest, full-range risk score of all the exposures for the user.
var riskScoreSumFullRange: Double
The sum of the full-range risk scores for all exposures for the user.
var metadata: [AnyHashable : Any]?
The metadata associated with the summary.
var daySummaries: [ENExposureDaySummary]
The summary of each day that contains an exposure.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
class ENExposureDaySummary
The summary of exposure information for a single day.
class ENExposureSummaryItem
Relationships
Inherits From
Conforms To
See Also
Summaries


## Page 3

The summary of exposures for a specific time period or report type.


## Page 4

Important
This class is available in iOS 12.5, and in iOS 13.7 and later.
var date: Date
The date that the exposure occurred.
var confirmedClinicalDiagnosisSummary: ENExposureSummaryItem?
The summary of exposures from a clinically-originated diagnosis.
var confirmedTestSummary: ENExposureSummaryItem?
The summary of exposures with a confirmed diagnosis.
var recursiveSummary: ENExposureSummaryItem?
The summary of exposures that came from someone else who was exposed.
Overview
Topics
Getting Exposure Summary Information
Exposure Notification / ENExposureDaySummary
Class
ENExposureDaySummary
The summary of exposure information for a single day.
iOS 12.5+
iPadOS 12.5+
Mac Catalyst 12.5+


## Page 5

var selfReportedSummary: ENExposureSummaryItem?
The summary of self-reported exposures.
var daySummary: ENExposureSummaryItem
The summary of all exposures for the day.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
class ENExposureDetectionSummary
A summary of exposures.
class ENExposureSummaryItem
The summary of exposures for a specific time period or report type.
Relationships
Inherits From
Conforms To
See Also
Summaries


## Page 6

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


## Page 7

Carol’s minutes-at-attenuation weight is 30, her infectiousness weight is 100%, and her report typ
weight is 100% (a confirmed clinical diagnosis). Her exposure risk value is 30 as dictated by her
Public Health Authority.
Dave’s minutes-at-attenuation weight is 40, his infectiousness weight is 0%, and his report type
weight is 80% (a self-diagnosis). His exposure risk value is 0 as dictated by his Public Health
Authority.


## Page 8

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


## Page 9

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


