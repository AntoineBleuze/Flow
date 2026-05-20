# 004_CMTremorResult.pdf

## Page 1

Getting movement disorder symptom data
The following equation is always true: percentUnknown + percentNone + percentSlight +
percentMild + percentModerate + percentStrong = 1.0.
var startDate: Date
The result’s start time and date.
var endDate: Date
The result’s end time and date.
Mentioned in
Overview
Topics
Reading the Time Interval
Core Motion / CMTremorResult
Class
CMTremorResult
A result object that contains data about the presence and strength of tremors
during a one-minute interval.
iOS 12.0+
iPadOS 12.0+
Mac Catalyst 13.1+
visionOS 1.0+
watchOS 5.0+


## Page 2

var percentUnknown: Float
The percentage of time when the algorithm couldn’t make a determination.
var percentNone: Float
The percentage of time when no tremor was detected.
var percentSlight: Float
The percentage of time when a tremor was likely, and the displacement amplitude was slight
var percentMild: Float
The percentage of time when a tremor was likely, and the displacement amplitude was mild.
var percentModerate: Float
The percentage of time when a tremor was likely, and the displacement amplitude was
moderate.
var percentStrong: Float
The percentage of time when a tremor was likely, and the displacement amplitude was stron
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCoding
NSCopying
NSObjectProtocol
Accessing Tremor Data
Relationships
Inherits From
Conforms To


## Page 3

NSSecureCoding
Getting movement disorder symptom data
Retrieve data from the Apple Watch’s movement disorder manager.
Adhering to the movement disorder data collection requirements
Ensure that your users understand and have control over the data your app collects.
Movement disorder algorithm changelog
A chronological log of notable changes to the movement disorder algorithm.
class CMMovementDisorderManager
A manager for recording and querying movement disorder data.
class CMDyskineticSymptomResult
A result object that contains data about the likely presence of dyskinetic symptoms during a
one-minute interval.
See Also
Movement disorder


