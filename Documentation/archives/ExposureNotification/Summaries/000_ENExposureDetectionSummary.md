# 000_ENExposureDetectionSummary.pdf

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


