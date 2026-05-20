# Time Representation.pdf

## Page 1

Core Media represents time as a rational value, with a time value as the numerator and timescale 
the denominator. The structure can represent a specific numeric time in the media timeline, and
can also represent nonnumeric values like invalid and indefinite times or positive and negative
infinity.
func CMTimeMake(value: Int64, timescale: Int32) -> CMTime
Creates a time with a value and timescale.
func CMTimeMakeWithEpoch(value: Int64, timescale: Int32, epoch: Int64) 
> CMTime
Creates a time with a value, timescale, and epoch.
func CMTimeMakeWithSeconds(Float64, preferredTimescale: Int32) -> CMTim
Creates a time that represents a number of seconds in a preferred timescale.
func CMTimeMakeFromDictionary(CFDictionary?) -> CMTime
Creates a time from a dictionary representation of its fields.
Overview
Topics
Creating a Time
Inspecting a Time
Core Media / CMTime
API Collection
CMTime
A structure that represents time.


## Page 2

func CMTimeGetSeconds(CMTime) -> Float64
Returns a representation of the time in seconds.
func CMTimeAbsoluteValue(CMTime) -> CMTime
Returns the absolute value of a time.
func CMTIME_IS_VALID(CMTime) -> Bool
Returns a Boolean value that indicates whether a given time is valid.
func CMTIME_IS_INVALID(CMTime) -> Bool
Returns a Boolean value that indicates whether a given time is invalid.
func CMTIME_IS_POSITIVEINFINITY(CMTime) -> Bool
Returns a Boolean value that indicates whether a given time is positive infinity.
func CMTIME_IS_NEGATIVEINFINITY(CMTime) -> Bool
Returns a Boolean value that indicates whether a given time is negative infinity.
func CMTIME_IS_INDEFINITE(CMTime) -> Bool
Returns a Boolean value that indicates whether a given time is indefinite.
func CMTIME_IS_NUMERIC(CMTime) -> Bool
Returns a Boolean value that indicates whether a given time is numeric.
func CMTIME_HAS_BEEN_ROUNDED(CMTime) -> Bool
Returns a Boolean value that indicates whether the system rounded the time value.
func CMTimeAdd(CMTime, CMTime) -> CMTime
Returns the sum of two times.
func CMTimeSubtract(CMTime, CMTime) -> CMTime
Returns the difference between two times.
func CMTimeMultiply(CMTime, multiplier: Int32) -> CMTime
Returns the result of multiplying a time by an integer multiplier.
func CMTimeMultiplyByFloat64(CMTime, multiplier: Float64) -> CMTime
Returns the result of multiplying a time by a floating-point multiplier.
func CMTimeMultiplyByRatio(CMTime, multiplier: Int32, divisor: Int32) -
CMTime
Performing Time Calculations


## Page 3

Returns the result of multiplying a time by an integer multiplier, and then dividing the result b
the divisor.
func CMTimeConvertScale(CMTime, timescale: Int32, method: CMTimeRoundin
Method) -> CMTime
Converts the source time to a new timescale using the specified rounding method.
enum CMTimeRoundingMethod
An enumeration of rounding methods to use when performing time calculations.
func CMTimeCompare(CMTime, CMTime) -> Int32
Returns the numerical relationship of two times.
func CMTimeMaximum(CMTime, CMTime) -> CMTime
Returns the greater of two time values.
func CMTimeMinimum(CMTime, CMTime) -> CMTime
Returns the lesser of two time values.
func CMTimeShow(CMTime)
Prints a description of the time to the console.
func CMTimeCopyDescription(allocator: CFAllocator?, time: CMTime) ->
CFString?
Creates a string representation of the time.
func CMTimeCopyAsDictionary(CMTime, allocator: CFAllocator?) ->
CFDictionary?
Creates a dictionary representation of the time.
struct CMTime
A structure that represents time.
Changing the Timescale
Comparing Times
Representing Times
Data Types


## Page 4

typealias CMTimeValue
An integer time value.
typealias CMTimeScale
An integer timescale.
typealias CMTimeEpoch
An epoch for a time.
struct CMTimeFlags
A structure that defines the flags for a time value.
Time
Defined time values.
Timescale
Defined timescale values.
Dictionary Keys
Keys to use when working with dictionary representations of time.
CMTimeRange
A structure that represents a range of time.
CMTimeMapping
A structure that maps a segment of a source time range to a target time range.
Constants
See Also
Time Representation


## Page 5

This document describes the API for creating and manipulating CMTimeRange structures.
The system represents a CMTimeRange as a non-opaque, mutable structure by using two CMTim
values that specify the start time and duration of the range. A time range doesn’t include the end
time because you calculate it by adding the duration to the start time.
Convert CMTimeRanges to and from CFDictionaries (see CFDictionary) using CMTime
RangeCopyAsDictionary(_:allocator:) and CMTimeRangeMakeFromDictionary(_:
to use in annotations and various Core Foundation containers.
The epoch in a CMTime that represents a duration must be 0, and the value must be nonnegative
The epoch in a CMTime that represents a timestamp can be nonzero, but functions (such as
CMTimeRangeGetUnion(_:otherRange:)) can only perform operations on ranges whose sta
fields have the same epoch. CMTimeRanges can’t span different epochs.
For information about additional functions for managing dates and times, see Time Utilities.
func CMTimeRangeMake(start: CMTime, duration: CMTime) -> CMTimeRange
Overview
Topics
Creating Time Ranges
Core Media / CMTimeRange
API Collection
CMTimeRange
A structure that represents a range of time.


## Page 6

Creates a valid time range with a start time and duration.
func CMTimeRangeMakeFromDictionary(CFDictionary) -> CMTimeRange
Creates a time range from a dictionary representation of its fields.
func CMTimeRangeFromTimeToTime(start: CMTime, end: CMTime) -> CMTime
Range
Creates a valid time range from a start and end time.
func CMTimeRangeEqual(CMTimeRange, CMTimeRange) -> Bool
Returns a Boolean value that indicates whether two time ranges are equal.
func CMTimeRangeContainsTime(CMTimeRange, time: CMTime) -> Bool
Returns a Boolean value that indicates whether a time range contains a time.
func CMTimeRangeContainsTimeRange(CMTimeRange, otherRange: CMTimeRange)
-> Bool
Returns a Boolean value that indicates whether a time range contains another time range.
func CMTIMERANGE_IS_EMPTY(CMTimeRange) -> Bool
Returns a Boolean value that indicates whether a time range has a duration of zero.
func CMTIMERANGE_IS_INDEFINITE(CMTimeRange) -> Bool
Returns a Boolean value that indicates whether a time range is indefinite.
func CMTIMERANGE_IS_INVALID(CMTimeRange) -> Bool
Returns a Boolean value that indicates whether a time range is invalid.
func CMTIMERANGE_IS_VALID(CMTimeRange) -> Bool
Returns a Boolean value that indicates whether a time range is valid.
func CMTimeRangeGetEnd(CMTimeRange) -> CMTime
Returns a time value that represents the end of a time range.
func CMTimeRangeGetIntersection(CMTimeRange, otherRange: CMTimeRange) -
CMTimeRange
Returns a new time range with the time elements that are common between the input.
Comparing Time Ranges
Inspecting Time Ranges


## Page 7

func CMTimeRangeGetUnion(CMTimeRange, otherRange: CMTimeRange) -> CMTim
Range
Returns a new time range with the time elements of the input.
func CMTimeClampToRange(CMTime, range: CMTimeRange) -> CMTime
Returns the nearest time value inside the time range.
func CMTimeMapDurationFromRangeToRange(CMTime, fromRange: CMTimeRange,
toRange: CMTimeRange) -> CMTime
Translates a duration through a mapping from two time ranges.
func CMTimeMapTimeFromRangeToRange(CMTime, fromRange: CMTimeRange, to
Range: CMTimeRange) -> CMTime
Translates a time through a mapping from two time ranges.
func CMTimeRangeCopyAsDictionary(CMTimeRange, allocator: CFAllocator?) 
> CFDictionary?
Returns a dictionary representation of a time range.
func CMTimeRangeCopyDescription(allocator: CFAllocator?, range: CMTime
Range) -> CFString?
Returns a string with a description of a time range.
func CMTimeRangeShow(CMTimeRange)
Prints a description of the time range to standard error.
struct CMTimeRange
A structure that represents a time range.
Dictionary Keys
Keys to use when working with dictionary representations of a time range.
Pre-Specified Time Ranges
Constants that specify zero and invalid time ranges.
Utility Functions
Data Types
Constants


## Page 8

CMTime
A structure that represents time.
CMTimeMapping
A structure that maps a segment of a source time range to a target time range.
See Also
Time Representation


## Page 9

func CMTimeMappingMake(source: CMTimeRange, target: CMTimeRange) ->
CMTimeMapping
Creates a time mapping with a source and target time range.
func CMTimeMappingMakeEmpty(target: CMTimeRange) -> CMTimeMapping
Creates a valid time mapping with an empty source.
func CMTimeMappingMakeFromDictionary(CFDictionary) -> CMTimeMapping
Creates a time mapping from a dictionary representation.
func CMTimeMappingCopyAsDictionary(CMTimeMapping, allocator: CFAllocato
?) -> CFDictionary?
Returns a dictionary representation of a time mapping.
func CMTimeMappingCopyDescription(allocator: CFAllocator?, mapping:
CMTimeMapping) -> CFString?
Copies a string description of a time mapping.
func CMTimeMappingShow(CMTimeMapping)
Prints a description of a time mapping to standard output.
Topics
Creating Time Mappings
Representing Time Mappings
Core Media / CMTimeMapping
API Collection
CMTimeMapping
A structure that maps a segment of a source time range to a target time range.


## Page 10

struct CMTimeMapping
A structure that maps a segment of a source time range to a target time range.
static let invalid: CMTimeMapping
An invalid time mapping.
let kCMTimeMappingSourceKey: CFString
A dictionary key for a source time range.
let kCMTimeMappingTargetKey: CFString
A dictionary key for a target time range.
CMTime
A structure that represents time.
CMTimeRange
A structure that represents a range of time.
Data Types
Constants
See Also
Time Representation


