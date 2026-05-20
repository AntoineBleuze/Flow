# 001_CMTimeRange.pdf

## Page 1

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


## Page 2

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


## Page 3

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


## Page 4

CMTime
A structure that represents time.
CMTimeMapping
A structure that maps a segment of a source time range to a target time range.
See Also
Time Representation


