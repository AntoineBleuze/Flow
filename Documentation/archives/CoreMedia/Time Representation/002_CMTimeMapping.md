# 002_CMTimeMapping.pdf

## Page 1

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


## Page 2

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


