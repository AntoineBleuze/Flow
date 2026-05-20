# Services.pdf

## Page 1

You can use Quartz Display Services to:
Examine and change display mode properties such as width, height, and pixel depth
Configure a set of displays in a single operation
Capture one or more displays for exclusive use
Stream the contents of a display
Perform fade effects
Activate display mirroring
Configure gamma color correction tables
Receive notification of screen update operations
func CGMainDisplayID() -> CGDirectDisplayID
Returns the display ID of the main display.
func CGGetOnlineDisplayList(UInt32, UnsafeMutablePointer<CGDirectDispla
ID>?, UnsafeMutablePointer<UInt32>?) -> CGError
Overview
Topics
Finding Displays
Core Graphics / Quartz Display Services
API Collection
Quartz Display Services
Provides direct access to features in the macOS window server for configuring an
controlling display hardware.


## Page 2

Provides a list of displays that are online (active, mirrored, or sleeping).
func CGGetActiveDisplayList(UInt32, UnsafeMutablePointer<CGDirectDispla
ID>?, UnsafeMutablePointer<UInt32>?) -> CGError
Provides a list of displays that are active for drawing.
func CGGetDisplaysWithOpenGLDisplayMask(CGOpenGLDisplayMask, UInt32,
UnsafeMutablePointer<CGDirectDisplayID>?, UnsafeMutablePointer<UInt32>?
-> CGError
Provides a list of displays that corresponds to the bits set in an OpenGL display mask.
func CGGetDisplaysWithPoint(CGPoint, UInt32, UnsafeMutablePointer<
CGDirectDisplayID>?, UnsafeMutablePointer<UInt32>?) -> CGError
Provides a list of online displays with bounds that include the specified point.
func CGGetDisplaysWithRect(CGRect, UInt32, UnsafeMutablePointer<CGDirec
DisplayID>?, UnsafeMutablePointer<UInt32>?) -> CGError
Gets a list of online displays with bounds that intersect the specified rectangle.
func CGOpenGLDisplayMaskToDisplayID(CGOpenGLDisplayMask) -> CGDirect
DisplayID
Maps an OpenGL display mask to a display ID.
func CGDisplayIDToOpenGLDisplayMask(CGDirectDisplayID) -> CGOpen
GLDisplayMask
Maps a display ID to an OpenGL display mask.
func CGDisplayCapture(CGDirectDisplayID) -> CGError
Obtains exclusive use of a display, preventing other applications and system services from
using the display or changing its configuration.
func CGDisplayCaptureWithOptions(CGDirectDisplayID, CGCaptureOptions) -
CGError
Obtains exclusive use of a display for an application using the options you specify.
func CGDisplayRelease(CGDirectDisplayID) -> CGError
Releases a captured display.
func CGDisplayIsCaptured(CGDirectDisplayID) -> boolean_t
Returns a Boolean value indicating whether a display is captured.
Deprecated
Capturing and Releasing Displays


## Page 3

func CGCaptureAllDisplays() -> CGError
Obtains exclusive use of all active displays, preventing other applications and system service
from using the display or changing its configuration.
func CGCaptureAllDisplaysWithOptions(CGCaptureOptions) -> CGError
Captures all attached displays, using the specified options.
func CGReleaseAllDisplays() -> CGError
Releases all captured displays.
func CGShieldingWindowID(CGDirectDisplayID) -> CGWindowID
Returns the window ID of the shield window for a captured display.
func CGShieldingWindowLevel() -> CGWindowLevel
Returns the window level of the shield window for a captured display.
func CGDisplayGetDrawingContext(CGDirectDisplayID) -> CGContext?
Returns a graphics context suitable for drawing to a captured display.
func CGDisplayCreateImage(CGDirectDisplayID) -> CGImage?
Returns an image containing the contents of the specified display.
Deprecated
func CGDisplayCreateImage(CGDirectDisplayID, rect: CGRect) -> CGImage?
Returns an image containing the contents of a portion of the specified display.
Deprecated
func CGBeginDisplayConfiguration(UnsafeMutablePointer<CGDisplayConfigRe
?>?) -> CGError
Begins a new set of display configuration changes.
func CGCancelDisplayConfiguration(CGDisplayConfigRef?) -> CGError
Cancels a set of display configuration changes.
func CGCompleteDisplayConfiguration(CGDisplayConfigRef?, CGConfigure
Option) -> CGError
Completes a set of display configuration changes.
Creating Images from the Display
Configuring Displays


## Page 4

func CGConfigureDisplayMirrorOfDisplay(CGDisplayConfigRef?, CGDirect
DisplayID, CGDirectDisplayID) -> CGError
Changes the configuration of a mirroring set.
func CGConfigureDisplayMode(CGDisplayConfigRef?, CGDirectDisplayID,
CFDictionary?) -> CGError
Configures the display mode of a display.
Deprecated
func CGConfigureDisplayOrigin(CGDisplayConfigRef?, CGDirectDisplayID,
Int32, Int32) -> CGError
Configures the origin of a display relative to the global display coordinate space.
func CGRestorePermanentDisplayConfiguration()
Restores the permanent display configuration settings for the current user.
func CGConfigureDisplayStereoOperation(CGDisplayConfigRef?, CGDirect
DisplayID, boolean_t, boolean_t) -> CGError
Enables or disables stereo operation for a display, as part of a display configuration.
func CGDisplaySetStereoOperation(CGDirectDisplayID, boolean_t, boolean_
, CGConfigureOption) -> CGError
Immediately enables or disables stereo operation for a display.
func CGConfigureDisplayWithDisplayMode(CGDisplayConfigRef?, CGDirect
DisplayID, CGDisplayMode?, CFDictionary?) -> CGError
Configures the display mode of a display.
func CGDisplayCopyColorSpace(CGDirectDisplayID) -> CGColorSpace
Returns the color space for a display.
func CGDisplayIOServicePort(CGDirectDisplayID) -> io_service_t
Returns the I/O Kit service port of the specified display.
Deprecated
func CGDisplayIsActive(CGDirectDisplayID) -> boolean_t
Returns a Boolean value indicating whether a display is active.
func CGDisplayIsAlwaysInMirrorSet(CGDirectDisplayID) -> boolean_t
Returns a Boolean value indicating whether a display is always in a mirroring set.
Getting the Display Configuration


## Page 5

func CGDisplayIsAsleep(CGDirectDisplayID) -> boolean_t
Returns a Boolean value indicating whether a display is sleeping (and is therefore not
drawable).
func CGDisplayIsBuiltin(CGDirectDisplayID) -> boolean_t
Returns a Boolean value indicating whether a display is built-in, such as the internal display i
portable systems.
func CGDisplayIsInHWMirrorSet(CGDirectDisplayID) -> boolean_t
Returns a Boolean value indicating whether a display is in a hardware mirroring set.
func CGDisplayIsInMirrorSet(CGDirectDisplayID) -> boolean_t
Returns a Boolean value indicating whether a display is in a mirroring set.
func CGDisplayIsMain(CGDirectDisplayID) -> boolean_t
Returns a Boolean value indicating whether a display is the main display.
func CGDisplayIsOnline(CGDirectDisplayID) -> boolean_t
Returns a Boolean value indicating whether a display is connected or online.
func CGDisplayIsStereo(CGDirectDisplayID) -> boolean_t
Returns a Boolean value indicating whether a display is running in a stereo graphics mode.
func CGDisplayMirrorsDisplay(CGDirectDisplayID) -> CGDirectDisplayID
For a secondary display in a mirroring set, returns the primary display.
func CGDisplayModelNumber(CGDirectDisplayID) -> UInt32
Returns the model number of a display monitor.
func CGDisplayPrimaryDisplay(CGDirectDisplayID) -> CGDirectDisplayID
Returns the primary display in a hardware mirroring set.
func CGDisplayRotation(CGDirectDisplayID) -> Double
Returns the rotation angle of a display in degrees.
func CGDisplayScreenSize(CGDirectDisplayID) -> CGSize
Returns the width and height of a display in millimeters.
func CGDisplaySerialNumber(CGDirectDisplayID) -> UInt32
Returns the serial number of a display monitor.
func CGDisplayUnitNumber(CGDirectDisplayID) -> UInt32
Returns the logical unit number of a display.


## Page 6

func CGDisplayUsesOpenGLAcceleration(CGDirectDisplayID) -> boolean_t
Returns a Boolean value indicating whether Quartz is using OpenGL-based window
acceleration (Quartz Extreme) to render in a display.
func CGDisplayVendorNumber(CGDirectDisplayID) -> UInt32
Returns the vendor number of the specified display’s monitor.
These functions are used to register and unregister a callback function for notification of display
configuration changes.
func CGDisplayRegisterReconfigurationCallback(CGDisplayReconfiguration
CallBack?, UnsafeMutableRawPointer?) -> CGError
Registers a callback function to be invoked whenever a local display is reconfigured.
func CGDisplayRemoveReconfigurationCallback(CGDisplayReconfigurationCal
Back?, UnsafeMutableRawPointer?) -> CGError
Removes the registration of a callback function that’s invoked whenever a local display is
reconfigured.
func CGDisplayBounds(CGDirectDisplayID) -> CGRect
Returns the bounds of a display in the global display coordinate space.
func CGDisplayPixelsHigh(CGDirectDisplayID) -> Int
Returns the display height in pixel units.
func CGDisplayPixelsWide(CGDirectDisplayID) -> Int
Returns the display width in pixel units.
func CGDisplayAvailableModes(CGDirectDisplayID) -> CFArray?
Returns information about the currently available display modes.
Deprecated
func CGDisplayBestModeForParameters(CGDirectDisplayID, Int, Int, Int,
UnsafeMutablePointer<boolean_t>?) -> CFDictionary?
Returns information about the display mode closest to a specified depth and screen size.
Registering for Notification of Display Configuration Changes
Retrieving Display Parameters
Creating and Managing Display Modes


## Page 7

Deprecated
func CGDisplayBestModeForParametersAndRefreshRate(CGDirectDisplayID, In
, Int, Int, CGRefreshRate, UnsafeMutablePointer<boolean_t>?) ->
CFDictionary?
Returns information about the display mode closest to a specified depth, screen size, and
refresh rate.
Deprecated
func CGDisplayCurrentMode(CGDirectDisplayID) -> CFDictionary?
Returns information about the current display mode.
Deprecated
func CGDisplaySwitchToMode(CGDirectDisplayID, CFDictionary?) -> CGError
Switches a display to a different mode.
Deprecated
func CGDisplayCopyDisplayMode(CGDirectDisplayID) -> CGDisplayMode?
Returns information about a display’s current configuration.
func CGDisplayCopyAllDisplayModes(CGDirectDisplayID, CFDictionary?) ->
CFArray?
Returns information about the currently available display modes.
func CGDisplaySetDisplayMode(CGDirectDisplayID, CGDisplayMode?,
CFDictionary?) -> CGError
Switches a display to a different mode.
var width: Int
Returns the width of the specified display mode.
var height: Int
Returns the height of the specified display mode.
var pixelEncoding: CFString?
Returns the pixel encoding of the specified display mode.
Deprecated
var refreshRate: Double
Returns the refresh rate of the specified display mode.
Getting Information About a Display Mode


## Page 8

var ioFlags: UInt32
Returns the I/O Kit flags of the specified display mode.
var ioDisplayModeID: Int32
Returns the I/O Kit display mode ID of the specified display mode.
func isUsableForDesktopGUI() -> Bool
Returns a Boolean value indicating whether the specified display mode is usable for a deskto
graphical user interface.
class var typeID: CFTypeID
Returns the type identifier of Quartz display modes.
func CGSetDisplayTransferByFormula(CGDirectDisplayID, CGGammaValue,
CGGammaValue, CGGammaValue, CGGammaValue, CGGammaValue, CGGammaValue,
CGGammaValue, CGGammaValue, CGGammaValue) -> CGError
Sets the gamma function for a display by specifying the coefficients of the gamma transfer
formula.
func CGGetDisplayTransferByFormula(CGDirectDisplayID, UnsafeMutable
Pointer<CGGammaValue>?, UnsafeMutablePointer<CGGammaValue>?, Unsafe
MutablePointer<CGGammaValue>?, UnsafeMutablePointer<CGGammaValue>?,
UnsafeMutablePointer<CGGammaValue>?, UnsafeMutablePointer<CGGammaValue
>?, UnsafeMutablePointer<CGGammaValue>?, UnsafeMutablePointer<CGGamma
Value>?, UnsafeMutablePointer<CGGammaValue>?) -> CGError
Gets the coefficients of the gamma transfer formula for a display.
func CGSetDisplayTransferByTable(CGDirectDisplayID, UInt32, Unsafe
Pointer<CGGammaValue>?, UnsafePointer<CGGammaValue>?, UnsafePointer<
CGGammaValue>?) -> CGError
Sets the color gamma function for a display by specifying the values in the RGB gamma
tables.
func CGGetDisplayTransferByTable(CGDirectDisplayID, UInt32, Unsafe
MutablePointer<CGGammaValue>?, UnsafeMutablePointer<CGGammaValue>?,
UnsafeMutablePointer<CGGammaValue>?, UnsafeMutablePointer<UInt32>?) ->
CGError
Gets the values in the RGB gamma tables for a display.
func CGSetDisplayTransferByByteTable(CGDirectDisplayID, UInt32, Unsafe
Pointer<UInt8>, UnsafePointer<UInt8>, UnsafePointer<UInt8>) -> CGError
Adjusting the Display Gamma


## Page 9

Sets the byte values in the 8-bit RGB gamma tables for a display.
func CGDisplayRestoreColorSyncSettings()
Restores the gamma tables to the values in the user’s ColorSync display profile.
func CGDisplayGammaTableCapacity(CGDirectDisplayID) -> UInt32
Returns the capacity, or number of entries, in the gamma table for a display.
func CGConfigureDisplayFadeEffect(CGDisplayConfigRef?, CGDisplayFade
Interval, CGDisplayFadeInterval, Float, Float, Float) -> CGError
Modifies the settings of the built-in fade effect that occurs during a display configuration.
func CGAcquireDisplayFadeReservation(CGDisplayReservationInterval,
UnsafeMutablePointer<CGDisplayFadeReservationToken>?) -> CGError
Reserves the fade hardware for a specified time interval.
func CGDisplayFade(CGDisplayFadeReservationToken, CGDisplayFadeInterval
CGDisplayBlendFraction, CGDisplayBlendFraction, Float, Float, Float,
boolean_t) -> CGError
Performs a single fade operation.
func CGDisplayFadeOperationInProgress() -> boolean_t
Returns a Boolean value indicating whether a fade operation is currently in progress.
Deprecated
func CGReleaseDisplayFadeReservation(CGDisplayFadeReservationToken) ->
CGError
Releases a display fade reservation, and unfades the display if needed.
func CGDisplayHideCursor(CGDirectDisplayID) -> CGError
Hides the mouse cursor, and increments the hide cursor count.
func CGDisplayShowCursor(CGDirectDisplayID) -> CGError
Decrements the hide cursor count, and shows the mouse cursor if the count is 0.
func CGDisplayMoveCursorToPoint(CGDirectDisplayID, CGPoint) -> CGError
Moves the mouse cursor to a specified point relative to the upper-left corner of the display.
Display Fade Effects
Controlling the Mouse Cursor


## Page 10

func CGCursorIsVisible() -> boolean_t
Returns a Boolean value indicating whether the mouse cursor is visible.
Deprecated
func CGCursorIsDrawnInFramebuffer() -> boolean_t
Returns a Boolean value indicating whether the mouse cursor is drawn in framebuffer memo
Deprecated
func CGAssociateMouseAndMouseCursorPosition(boolean_t) -> CGError
Connects or disconnects the mouse and cursor while an application is in the foreground.
func CGWarpMouseCursorPosition(CGPoint) -> CGError
Moves the mouse cursor without generating events.
func CGGetLastMouseDelta() -> (x: Int32, y: Int32)
Reports the change in mouse position since the last mouse movement event received by the
application.
func CGSessionCopyCurrentDictionary() -> CFDictionary?
Returns information about the caller’s window server session.
func CGWindowServerCFMachPort() -> CFMachPort?
Returns a Core Foundation Mach port (CFMachPort) that corresponds to the macOS window
server.
Deprecated
func CGWindowLevelForKey(CGWindowLevelKey) -> CGWindowLevel
Returns the window level that corresponds to one of the standard window types.
You can use these functions to find out what areas on local displays are changing their appearanc
as the result of operations such as drawing, window movement or scrolling, and display
reconfiguration.
func CGRegisterScreenRefreshCallback(CGScreenRefreshCallback, Unsafe
MutableRawPointer?) -> CGError
Registers a callback function to be invoked when local displays are refreshed or modified.
Deprecated
Getting Window Server Information
Getting Information About Refresh and Move Operations


## Page 11

func CGUnregisterScreenRefreshCallback(CGScreenRefreshCallback, Unsafe
MutableRawPointer?)
Removes a previously registered callback function invoked when local displays are refreshed
or modified.
Deprecated
func CGWaitForScreenRefreshRects(UnsafeMutablePointer<UnsafeMutable
Pointer<CGRect>?>?, UnsafeMutablePointer<UInt32>?) -> CGError
Waits for screen refresh operations.
Deprecated
func CGScreenRegisterMoveCallback(CGScreenUpdateMoveCallback, Unsafe
MutableRawPointer?) -> CGError
Registers a callback function to be invoked when an area of the display is moved.
Deprecated
func CGScreenUnregisterMoveCallback(CGScreenUpdateMoveCallback, Unsafe
MutableRawPointer?)
Removes a previously registered callback function invoked when an area of the display is
moved.
Deprecated
func CGWaitForScreenUpdateRects(CGScreenUpdateOperation, UnsafeMutable
Pointer<CGScreenUpdateOperation>?, UnsafeMutablePointer<UnsafeMutable
Pointer<CGRect>?>?, UnsafeMutablePointer<Int>?, UnsafeMutablePointer<
CGScreenUpdateMoveDelta>?) -> CGError
Waits for screen update operations.
Deprecated
func CGReleaseScreenRefreshRects(UnsafeMutablePointer<CGRect>?)
Deallocates a list of rectangles that represent changed areas on local displays.
Deprecated
init?(display: CGDirectDisplayID, outputWidth: Int, outputHeight: Int,
pixelFormat: Int32, properties: CFDictionary?, handler: CGDisplayStream
FrameAvailableHandler?)
Creates a new display stream to be used with a CFRunloop.
Deprecated
Streaming the Contents of a Display


## Page 12

init?(dispatchQueueDisplay: CGDirectDisplayID, outputWidth: Int, output
Height: Int, pixelFormat: Int32, properties: CFDictionary?, queue:
dispatch_queue_t, handler: CGDisplayStreamFrameAvailableHandler?)
Creates a new display stream whose updates are delivered to a dispatch queue.
Deprecated
func start() -> CGError
Tells a stream to start sending updates.
Deprecated
func stop() -> CGError
Tells a stream to stop sending updates.
Deprecated
var runLoopSource: CFRunLoopSource?
Gets the run loop source for a display stream.
Deprecated
func getRects(CGDisplayStreamUpdateRectType, rectCount: UnsafeMutable
Pointer<Int>) -> UnsafePointer<CGRect>?
Returns an array of rectangles that describe where the frame has changed since the previou
frame.
Deprecated
init?(mergedUpdateFirstUpdate: CGDisplayStreamUpdate?, secondUpdate:
CGDisplayStreamUpdate?)
Combines two updates into a new update that includes the metadata for both source update
Deprecated
func getMovedRectsDelta(dx: UnsafeMutablePointer<CGFloat>, dy: Unsafe
MutablePointer<CGFloat>)
Return the movement delta values for a single update.
Deprecated
var dropCount: Int
Returns the number of frames that have been dropped since the last call to your update
handler.
Deprecated
class var typeID: CFTypeID
Returns the type identifier of a Quartz display stream.
Deprecated


## Page 13

class var typeID: CFTypeID
Returns the type identifier of a Quartz display stream update.
Deprecated
typealias CGDisplayReconfigurationCallBack
A client-supplied callback function that’s invoked whenever the configuration of a local displ
is changed.
typealias CGScreenRefreshCallback
A client-supplied callback function that’s invoked when an area of the display is modified or
refreshed.
typealias CGScreenUpdateMoveCallback
A client-supplied callback function invoked when an area of the display is moved.
typealias CGDirectDisplayID
A unique identifier for an attached display.
typealias CGDisplayBlendFraction
The percentage of blend color used in a fade operation.
typealias CGDisplayConfigRef
A reference to a display configuration transaction.
typealias CGDisplayCount
The number of displays in various lists.
Deprecated
typealias CGDisplayErr
A uniform type for result codes returned by functions in Quartz Display Services.
Deprecated
typealias CGDisplayFadeInterval
The duration in seconds of a fade operation or a fade hardware reservation.
typealias CGDisplayFadeReservationToken
Callbacks
Data Types


## Page 14

A token issued by Quartz when reserving one or more displays for a fade operation during a
specified interval.
class CGDisplayMode
A reference to a display mode object.
typealias CGDisplayReservationInterval
The time interval for a fade reservation.
typealias CGGammaValue
A value used to map a color generated in software to a color supported by the display
hardware.
typealias CGOpenGLDisplayMask
A bitmask used in OpenGL to specify a set of attached displays.
typealias CGRectCount
The size of an array of Quartz rectangles.
typealias CGRefreshRate
A display’s refresh rate in frames per second.
struct CGScreenUpdateMoveDelta
The distance, in pixel units, that an onscreen region moves.
typealias CGWindowLevel
A level assigned to a window by an application framework.
class CGDisplayStream
A reference to a display stream object.
class CGDisplayStreamUpdate
A reference to frame update’s metadata.
typealias CGDisplayStreamFrameAvailableHandler
A block called when a data stream has a new frame event to process.
struct CGCaptureOptions
Configuration parameters that are used when capturing displays.
struct CGDisplayChangeSummaryFlags
Constants


## Page 15

The configuration parameters that are passed to a display reconfiguration callback function.
struct CGConfigureOption
The scope of the changes in a display configuration transaction.
Display Fade Blend Fractions
The lower and upper bounds for blend color fractions during a display fade operation.
Display Fade Constants
Values relating to fade operations.
Display ID Defaults
Default values for a display ID.
Display Mode Standard Properties
Keys for the standard properties in a display mode dictionary.
Display Mode Optional Properties
Keys for optional properties in a display mode dictionary.
Reserved Window Levels
Window level constants.
struct CGScreenUpdateOperation
Types of screen-update operations.
enum CGWindowLevelKey
Keys that represent the standard window levels in macOS. Quartz includes these keys to
support application frameworks like Cocoa. Applications do not need to use them directly.
Window Server Session Properties
The keys for the standard properties in a window server session dictionary.
enum CGDisplayStreamUpdateRectType
Use these constants to determine which rectangles your app is interested in.
enum CGDisplayStreamFrameStatus
Describes a frame update event.
Display Stream Optional Property Keys
These keys are used to populate the properties dictionary used when creating a new
display stream.
Display Stream YCbCr to RGB conversion Matrix Options


## Page 16

These strings are used to specify a matrix for the yCbCrMatrix option.
Quartz Display Services Programming Topics
Quartz Event Services
Provides features for managing event taps—filters for observing and altering the stream of
low-level user input events in macOS.
Quartz Window Services
Provides information about the windows managed by the macOS window server.
See Also
Related Documentation
Services


## Page 17

Event taps make it possible to monitor and filter input events from several points within the system
prior to their delivery to a foreground application. Event taps complement and extend the
capabilities of the Carbon event monitor mechanism, which allows an application to observe input
events delivered to other processes.
Event taps are designed to serve as a Section 508 enabling technology. For example, consider a
software system to assist a person with language impairments, designed to perform keyboard
filtering with spoken review. Such a system could use an event tap to monitor all keystrokes,
perform dictionary checks and matches, and recite the assembled word back to the user on
detection of a word break in the input stream. If acceptable to the user, as indicated by an
additional input keystroke or other gesture, the events would be posted into the system for delive
to the foreground application.
Introduced in OS X version 10.4, event taps provide functionality similar to the Win32 functions Se
WinEventHook when used to establish an out-of-context event hook, and SendInput. Quartz
Event Services also includes an older set of event-related functions declared in the file CGRemote
Operation.h. These functions are still supported, but they are not recommended for new
development.
class var typeID: CFTypeID
Overview
Topics
Working With Events
Core Graphics / Quartz Event Services
API Collection
Quartz Event Services
Provides features for managing event taps—filters for observing and altering the
stream of low-level user input events in macOS.


## Page 18

Returns the type identifier for the opaque type CGEventRef.
init?(source: CGEventSource?)
Returns a new Quartz event.
init?(withDataAllocator: CFAllocator?, data: CFData?)
Returns a Quartz event created from a flattened data representation of the event.
init?(mouseEventSource: CGEventSource?, mouseType: CGEventType, mouse
CursorPosition: CGPoint, mouseButton: CGMouseButton)
Returns a new Quartz mouse event.
init?(keyboardEventSource: CGEventSource?, virtualKey: CGKeyCode, key
Down: Bool)
Returns a new Quartz keyboard event.
func copy() -> CGEvent?
Returns a copy of an existing Quartz event.
init?(event: CGEvent?)
Returns a Quartz event source created from an existing Quartz event.
func setSource(CGEventSource?)
Sets the event source of a Quartz event.
var type: CGEventType
Returns the event type of a Quartz event (left mouse down, for example).
var timestamp: CGEventTimestamp
Returns the timestamp of a Quartz event.
var location: CGPoint
Returns the location of a Quartz mouse event.
var unflippedLocation: CGPoint
Returns the location of a Quartz mouse event.
var flags: CGEventFlags
Returns the event flags of a Quartz event.
func keyboardGetUnicodeString(maxStringLength: Int, actualStringLength:
UnsafeMutablePointer<Int>?, unicodeString: UnsafeMutablePointer<UniChar
>?)
Returns the Unicode string associated with a Quartz keyboard event.


## Page 19

func keyboardSetUnicodeString(stringLength: Int, unicodeString: Unsafe
Pointer<UniChar>?)
Sets the Unicode string associated with a Quartz keyboard event.
func getIntegerValueField(CGEventField) -> Int64
Returns the integer value of a field in a Quartz event.
func setIntegerValueField(CGEventField, value: Int64)
Sets the integer value of a field in a Quartz event.
func getDoubleValueField(CGEventField) -> Double
Returns the floating-point value of a field in a Quartz event.
func setDoubleValueField(CGEventField, value: Double)
Sets the floating-point value of a field in a Quartz event.
class func tapCreate(tap: CGEventTapLocation, place: CGEventTapPlacemen
, options: CGEventTapOptions, eventsOfInterest: CGEventMask, callback:
CGEventTapCallBack, userInfo: UnsafeMutableRawPointer?) -> CFMachPort?
Creates an event tap.
class func tapCreateForPSN(processSerialNumber: UnsafeMutableRawPointer
place: CGEventTapPlacement, options: CGEventTapOptions, eventsOfInteres
: CGEventMask, callback: CGEventTapCallBack, userInfo: UnsafeMutableRaw
Pointer?) -> CFMachPort?
Creates an event tap for a specified process.
class func tapEnable(tap: CFMachPort, enable: Bool)
Enables or disables an event tap.
class func tapIsEnabled(tap: CFMachPort) -> Bool
Returns a Boolean value indicating whether an event tap is enabled.
func tapPostEvent(CGEventTapProxy?)
Posts a Quartz event from an event tap into the event stream.
func post(tap: CGEventTapLocation)
Posts a Quartz event into the event stream at a specified location.
func postToPSN(processSerialNumber: UnsafeMutableRawPointer?)
Posts a Quartz event into the event stream for a specific application.
Working With Event Taps


## Page 20

func CGGetEventTapList(UInt32, UnsafeMutablePointer<CGEventTap
Information>?, UnsafeMutablePointer<UInt32>?) -> CGError
Gets a list of currently installed event taps.
class var typeID: CFTypeID
Returns the type identifier for the opaque type CGEventSourceRef.
init?(stateID: CGEventSourceStateID)
Returns a Quartz event source created with a specified source state.
var keyboardType: CGEventSourceKeyboardType
Returns the keyboard type to be used with a Quartz event source.
var sourceStateID: CGEventSourceStateID
Returns the source state associated with a Quartz event source.
class func buttonState(CGEventSourceStateID, button: CGMouseButton) ->
Bool
Returns a Boolean value indicating the current button state of a Quartz event source.
class func keyState(CGEventSourceStateID, key: CGKeyCode) -> Bool
Returns a Boolean value indicating the current keyboard state of a Quartz event source.
class func flagsState(CGEventSourceStateID) -> CGEventFlags
Returns the current flags of a Quartz event source.
class func secondsSinceLastEventType(CGEventSourceStateID, eventType:
CGEventType) -> CFTimeInterval
Returns the elapsed time since the last event for a Quartz event source.
class func counterForEventType(CGEventSourceStateID, eventType: CGEvent
Type) -> UInt32
Returns a count of events of a given type seen since the window server started.
var userData: Int64
Returns the 64-bit user-specified data for a Quartz event source.
func getLocalEventsFilterDuringSuppressionState(CGEventSuppressionState
-> CGEventFilterMask
Returns the mask that indicates which classes of local hardware events are enabled during
event suppression.
Working With Event Sources


## Page 21

func setLocalEventsFilterDuringSuppressionState(CGEventFilterMask, stat
: CGEventSuppressionState)
Sets the mask that indicates which classes of local hardware events are enabled during even
suppression.
var localEventsSuppressionInterval: CFTimeInterval
Returns the interval that local hardware events may be suppressed following the posting of a
Quartz event.
var pixelsPerLine: Double
Gets the scale of pixels per line in a scrolling event source.
typealias CGEventTapCallBack
A client-supplied callback function that’s invoked whenever an associated event tap receives
a Quartz event.
typealias CGButtonCount
Represents the number of buttons being set in a synthetic mouse event.
typealias CGCharCode
Represents a character generated by pressing one or more keys on a keyboard.
typealias CGEventMask
Defines a mask that identifies the set of Quartz events to be observed in an event tap.
class CGEvent
Defines an opaque type that represents a low-level hardware event.
typealias CGEventSourceKeyboardType
Defines a code that represents the type of keyboard used with a specified event source.
class CGEventSource
Defines an opaque type that represents the source of a Quartz event.
typealias CGEventTapInformation
Defines the structure used to report information about event taps.
typealias CGEventTapProxy
Callbacks
Data Types


## Page 22

Defines an opaque type that represents state within the client application that’s associated
with an event tap.
typealias CGEventTimestamp
Defines the elapsed time in nanoseconds since startup that a Quartz event occurred.
typealias CGKeyCode
Represents the virtual key codes used in keyboard events.
typealias CGWheelCount
Represents the number of wheels being set in a scroll wheel event.
enum CGEventField
Constants used as keys to access specialized fields in low-level events.
struct CGEventFilterMask
Specify masks for classes of low-level events that can be filtered during event suppression
states.
struct CGEventFlags
Constants that indicate the modifier key state at the time an event is created, as well as othe
event-related states.
enum CGEventSourceStateID
Constants that specify the possible source states of an event source.
Event Source Token
Specifies any input event type.
enum CGEventSuppressionState
Specify the event suppression states that can occur after posting an event.
enum CGEventTapLocation
Constants that specify possible tapping points for events.
enum CGEventTapOptions
Constants that specify whether a new event tap is an active filter or a passive listener.
enum CGEventTapPlacement
Constants that specify where a new event tap is inserted into the list of active event taps.
Constants


## Page 23

enum CGEventType
Constants that specify the different types of input events.
Event Type Mask
Specifies an event mask that represents all event types.
enum CGMouseButton
Constants that specify buttons on a one, two, or three-button mouse.
enum CGEventMouseSubtype
Constants used with the CGEventField.mouseEventSubtype event field.
enum CGScrollEventUnit
Constants that specify the unit of measurement for a scrolling event.
func CGPostKeyboardEvent(CGCharCode, CGKeyCode, boolean_t) -> CGError
Synthesizes a low-level keyboard event on the local machine.
Deprecated
func CGEnableEventStateCombining(boolean_t) -> CGError
Enables or disables the merging of actual key and mouse state with the application-specified
state in a synthetic event.
Deprecated
func CGInhibitLocalEvents(boolean_t) -> CGError
Turns off local hardware events in the current session.
Deprecated
func CGSetLocalEventsFilterDuringSuppressionState(CGEventFilterMask,
CGEventSuppressionState) -> CGError
Filters local hardware events from the keyboard and mouse during the short interval after a
synthetic event is posted.
Deprecated
func CGSetLocalEventsSuppressionInterval(CFTimeInterval) -> CGError
Sets the time interval in seconds that local hardware events are suppressed after posting a
synthetic event.
Deprecated
Deprecated Functions


## Page 24

Quartz Display Services
Provides direct access to features in the macOS window server for configuring and controllin
display hardware.
Quartz Window Services
Provides information about the windows managed by the macOS window server.
See Also
Services


## Page 25

This includes the onscreen windows seen on the user’s desktop and any offscreen windows used
by the running applications. You can also use Quartz Window Services to generate images based
on the contents of windows.
func CGWindowListCopyWindowInfo(CGWindowListOption, CGWindowID) ->
CFArray?
Generates and returns information about the selected windows in the current user session.
func CGWindowListCreateDescriptionFromArray(CFArray?) -> CFArray?
Generates and returns information about windows with the specified window IDs.
func CGWindowListCreateImage(CGRect, CGWindowListOption, CGWindowID,
CGWindowImageOption) -> CGImage?
Returns a composite image based on a dynamically generated list of windows.
Deprecated
init?(windowListFromArrayScreenBounds: CGRect, windowArray: CFArray,
imageOption: CGWindowImageOption)
Returns a composite image of the specified windows.
Deprecated
Overview
Topics
Getting Window Information
Core Graphics / Quartz Window Services
API Collection
Quartz Window Services
Provides information about the windows managed by the macOS window server.


## Page 26

typealias CGWindowID
The data type used to store window identifiers.
struct CGWindowListOption
The data type used to specify the options for gathering a list of windows.
struct CGWindowImageOption
The data type to use to specify the type of image to be generated for a window.
enum CGWindowSharingType
The data type used to specify the sharing mode used by a window.
enum CGWindowBackingType
The data type used to specify the backing option for a given window.
Window Sharing Constants
Specifies whether and how windows are shared between applications.
Backing Store Types
Specifies how the window device buffers drawing commands.
Window List Option Constants
Specifies which windows in the current user session to include in a generated list.
Window Image Types
Specifies the options for capturing an image of a window.
CGWindowID Encoding Type
Defines the encoding type for window IDs.
Null Window
Defines a guaranteed invalid window ID.
Window Sharing Encoding Type
Defines the encoding type for window sharing values.
Window Backing Encoding Type
Data Types
Constants


## Page 27

Defines the encoding type for window backing types.
Required Window List Keys
The keys that are guaranteed to be available in a window’s information dictionary.
Optional Window List Keys
The keys that may optionally be available inside a window’s information dictionary.
Quartz Display Services
Provides direct access to features in the macOS window server for configuring and controllin
display hardware.
Quartz Event Services
Provides features for managing event taps—filters for observing and altering the stream of
low-level user input events in macOS.
See Also
Services


