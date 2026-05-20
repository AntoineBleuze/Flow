# Errors.pdf

## Page 1

case excessiveActivities
The calling process is monitoring too many activities.
case intervalTooLong
The activity’s schedule has an interval that is too long.
case intervalTooShort
The activity’s schedule has an interval that is too short.
case invalidDateComponents
The schedule’s date range is invalid.
case unauthorized
The calling process isn’t authorized to monitor device activity.
var errorDescription: String?
A localized message that describes what error occurred.
Topics
Checking for Errors
Getting the Localized Message
DeviceActivity / DeviceActivityCenter / DeviceActivityCenter.MonitoringError
Enumeration
DeviceActivityCenter.MonitoringError
Errors that may occur when starting to monitor an activity.
iOS 15.0+
iPadOS 15.0+
Mac Catalyst 15.0+


## Page 2

var recoverySuggestion: String?
A localized message that describes how to recover from the failure.
Copyable
Equatable
Error
Hashable
LocalizedError
Sendable
SendableMetatype
Relationships
Conforms To


