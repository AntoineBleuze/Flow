# 000_CVTime.pdf

## Page 1

Core video uses the CVTime and CVTimeStamp structures for storing Core Video time values. Yo
use them to interact with the Core Video display link.
func CVGetCurrentHostTime() -> UInt64
Returns the current system time.
func CVGetHostClockFrequency() -> Double
Returns the frequency of updates to the system time.
func CVGetHostClockMinimumTimeDelta() -> UInt32
Returns the smallest possible increment in the system time.
struct CVTime
A structure for reporting Core Video time values.
CVTimeStamp
A structure for representing a display timestamp.
Overview
Topics
Inspecting the Host Clock
Data Types
Core Video / CVTime
API Collection
CVTime
A structure used for storing Core Video time values.


## Page 2

struct CVSMPTETime
A structure for holding an SMPTE time.
CVTime Values
Keys that represent Core Video time values.
enum CVSMPTETimeType
struct CVSMPTETimeFlags
struct CVTimeFlags
struct CVTimeStampFlags
Core Video Programming Guide
CVDisplayLink
A high-priority thread that notifies your app when a given display will need each frame.
Constants
Enumerations
See Also
Related Documentation
Time Management


