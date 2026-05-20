# Time Management.pdf

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


## Page 3

A Core Video display link provides a separate high-priority thread to notify your application when 
given display will need each frame. You can use a display link to easily synchronize with the refres
rate of a display. The display link API uses the Core Foundation class system internally to provide
reference counting behavior and other useful properties.
func CVDisplayLinkCreateWithCGDisplay(CGDirectDisplayID, UnsafeMutable
Pointer<CVDisplayLink?>) -> CVReturn
Creates a display link for a single display.
Deprecated
func CVDisplayLinkCreateWithCGDisplays(UnsafeMutablePointer<CGDirect
DisplayID>, CFIndex, UnsafeMutablePointer<CVDisplayLink?>) -> CVReturn
Creates a display link for an array of displays.
Deprecated
func CVDisplayLinkCreateWithActiveCGDisplays(UnsafeMutablePointer<
CVDisplayLink?>) -> CVReturn
Creates a display link capable of being used with all active displays.
Deprecated
Overview
Topics
Creating Display Links
Core Video / CVDisplayLink
API Collection
CVDisplayLink
A high-priority thread that notifies your app when a given display will need each
frame.


## Page 4

func CVDisplayLinkCreateWithOpenGLDisplayMask(CGOpenGLDisplayMask,
UnsafeMutablePointer<CVDisplayLink?>) -> CVReturn
Creates a display link from an OpenGL display mask.
Deprecated
func CVDisplayLinkSetCurrentCGDisplay(CVDisplayLink, CGDirectDisplayID)
-> CVReturn
Sets the current display of a display link.
Deprecated
func CVDisplayLinkSetCurrentCGDisplayFromOpenGLContext(CVDisplayLink,
CGLContextObj, CGLPixelFormatObj) -> CVReturn
Selects the display link most optimal for the current renderer of an OpenGL context.
Deprecated
func CVDisplayLinkSetOutputCallback(CVDisplayLink, CVDisplayLinkOutput
Callback?, UnsafeMutableRawPointer?) -> CVReturn
Sets the renderer output callback function.
Deprecated
func CVDisplayLinkSetOutputHandler(CVDisplayLink, CVDisplayLinkOutput
Handler) -> CVReturn
Deprecated
typealias CVDisplayLinkOutputHandler
func CVDisplayLinkGetCurrentCGDisplay(CVDisplayLink) -> CGDirectDisplay
ID
Gets the current display associated with a display link.
Deprecated
func CVDisplayLinkGetCurrentTime(CVDisplayLink, UnsafeMutablePointer<
CVTimeStamp>) -> CVReturn
Retrieves the current (“now”) time of a given display link.
Deprecated
func CVDisplayLinkTranslateTime(CVDisplayLink, UnsafePointer<CVTimeStam
>, UnsafeMutablePointer<CVTimeStamp>) -> CVReturn
Configuring Display Links
Inspecting Display Links


## Page 5

Translates the time in the display link’s time base from one representation to another.
Deprecated
func CVDisplayLinkGetActualOutputVideoRefreshPeriod(CVDisplayLink) ->
Double
Retrieves the actual output refresh period of a display as measured by the system time.
Deprecated
func CVDisplayLinkGetNominalOutputVideoRefreshPeriod(CVDisplayLink) ->
CVTime
Retrieves the nominal refresh period of a display link.
Deprecated
func CVDisplayLinkGetOutputVideoLatency(CVDisplayLink) -> CVTime
Retrieves the nominal latency of a display link.
Deprecated
func CVDisplayLinkIsRunning(CVDisplayLink) -> Bool
Indicates whether a given display link is running.
Deprecated
func CVDisplayLinkGetTypeID() -> CFTypeID
Obtains the Core Foundation ID for the display link data type.
Deprecated
func CVDisplayLinkStart(CVDisplayLink) -> CVReturn
Activates a display link.
Deprecated
func CVDisplayLinkStop(CVDisplayLink) -> CVReturn
Stops a display link.
Deprecated
class CVDisplayLink
A reference to a display link object.
typealias CVOptionFlags
Managing Display Links
Data Types


## Page 6

The flags to be used for the display link output callback function.
typealias CVDisplayLinkOutputCallback
A type for a display link callback function that the system invokes when it’s time for the app t
output a video frame.
typealias CVDisplayLinkOutputHandler
CVTime
A structure used for storing Core Video time values.
Callbacks
See Also
Time Management


