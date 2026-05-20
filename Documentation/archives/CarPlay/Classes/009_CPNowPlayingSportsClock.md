# 009_CPNowPlayingSportsClock.pdf

## Page 1

Or, a representation of the amount of time remaining in the event, or a section of the event
(period/quarter/etc.) for events where the clock counts DOWN.
init(elapsedTime: TimeInterval, paused: Bool)
Represents a duration of time that has elapsed so far in this event, or play period of the even
(quarter/inning/period).
init(timeRemaining: TimeInterval, paused: Bool)
Represents an amount of time remaining in the event, or play period of the event
(quarter/inning/period).
Overview
Topics
Initializers
Instance Properties
CarPlay / CPNowPlayingSportsClock
Class
CPNowPlayingSportsClock
A representation of the amount of time elapsed so far in this event, for events
where the clock counts UP.
iOS 18.4+
iPadOS 18.4+
Mac Catalyst 18.4+


## Page 2

var countsUp: Bool
If true, the timer is counting UP, so as to indicate an amount of time elapsed so far in this
event.
var isPaused: Bool
Whether the clock should be paused, e.g. due to a stoppage in play.
var timeValue: TimeInterval
The time value in the clock; either elapsed time or time remaining.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCoding
NSObjectProtocol
NSSecureCoding
Sendable
Relationships
Inherits From
Conforms To


