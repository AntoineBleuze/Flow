# 000_Quartz Display Services.pdf

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


