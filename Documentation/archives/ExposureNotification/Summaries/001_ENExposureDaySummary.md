# 001_ENExposureDaySummary.pdf

## Page 1

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


## Page 2

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


