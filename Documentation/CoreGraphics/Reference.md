# Reference.pdf

## Page 1

class CGPSConverter
An opaque data type used to convert PostScript data to PDF data.
struct CGCaptureOptions
Configuration parameters that are used when capturing displays.
struct CGConfigureOption
The scope of the changes in a display configuration transaction.
struct CGDeviceColor
struct CGDisplayChangeSummaryFlags
The configuration parameters that are passed to a display reconfiguration callback function.
struct CGEventFilterMask
Specify masks for classes of low-level events that can be filtered during event suppression
states.
struct CGEventFlags
Constants that indicate the modifier key state at the time an event is created, as well as othe
event-related states.
typealias CGEventTapInformation
Defines the structure used to report information about event taps.
struct CGScreenUpdateMoveDelta
The distance, in pixel units, that an onscreen region moves.
Topics
Structures
Core Graphics / Core Graphics Structures
API Collection
Core Graphics Structures


## Page 2

struct CGScreenUpdateOperation
Types of screen-update operations.
struct CGWindowImageOption
The data type to use to specify the type of image to be generated for a window.
struct CGWindowListOption
The data type used to specify the options for gathering a list of windows.
struct CGColorBufferFormat
struct CGColorDataFormat
struct CGPDFAccessPermissions
struct CGPSConverterCallbacks
A structure for holding the callbacks provided when you create a PostScript converter objec
class ColorSyncProfile
class IOSurfaceRef
Core Graphics Enumerations
Core Graphics Constants
Core Graphics Functions
Core Graphics Data Types
See Also
Reference


## Page 3

struct CGCaptureOptions
Configuration parameters that are used when capturing displays.
enum CGColorConversionInfoTransformType
Constants describing how a color conversion uses color spaces.
enum CGColorRenderingIntent
Handling options for colors that are not located within the destination color space of a
graphics context.
struct CGConfigureOption
The scope of the changes in a display configuration transaction.
struct CGDisplayChangeSummaryFlags
The configuration parameters that are passed to a display reconfiguration callback function.
enum CGDisplayStreamFrameStatus
Describes a frame update event.
enum CGDisplayStreamUpdateRectType
Use these constants to determine which rectangles your app is interested in.
enum CGError
A uniform type for result codes returned by functions in Core Graphics.
enum CGEventField
Topics
Enumerations
Core Graphics / Core Graphics Enumerations
API Collection
Core Graphics Enumerations


## Page 4

Constants used as keys to access specialized fields in low-level events.
struct CGEventFilterMask
Specify masks for classes of low-level events that can be filtered during event suppression
states.
struct CGEventFlags
Constants that indicate the modifier key state at the time an event is created, as well as othe
event-related states.
enum CGEventMouseSubtype
Constants used with the CGEventField.mouseEventSubtype event field.
enum CGEventSourceStateID
Constants that specify the possible source states of an event source.
enum CGEventSuppressionState
Specify the event suppression states that can occur after posting an event.
enum CGEventTapLocation
Constants that specify possible tapping points for events.
enum CGEventTapOptions
Constants that specify whether a new event tap is an active filter or a passive listener.
enum CGEventTapPlacement
Constants that specify where a new event tap is inserted into the list of active event taps.
enum CGEventType
Constants that specify the different types of input events.
enum CGGesturePhase
enum CGGlyphDeprecatedEnum
enum CGImageByteOrderInfo
enum CGMomentumScrollPhase
enum CGMouseButton
Constants that specify buttons on a one, two, or three-button mouse.
struct CGScreenUpdateOperation
Types of screen-update operations.


## Page 5

enum CGScrollEventUnit
Constants that specify the unit of measurement for a scrolling event.
enum CGScrollPhase
enum CGWindowBackingType
The data type used to specify the backing option for a given window.
struct CGWindowImageOption
The data type to use to specify the type of image to be generated for a window.
enum CGWindowLevelKey
Keys that represent the standard window levels in macOS. Quartz includes these keys to
support application frameworks like Cocoa. Applications do not need to use them directly.
struct CGWindowListOption
The data type used to specify the options for gathering a list of windows.
enum CGWindowSharingType
The data type used to specify the sharing mode used by a window.
enum CGImagePixelFormatInfo
enum CGLineCap
Styles for rendering the endpoint of a stroked line.
enum CGLineJoin
Junction types for stroked lines.
struct CGPDFAccessPermissions
enum CGPDFTagType
enum CGTextEncoding
Text encodings for fonts.
enum CGToneMapping
enum CGPathFillRule
Rules for determining which regions are interior to a path, used by the fillPath(using:)
and clip(using:) methods.
See Also


## Page 6

Core Graphics Structures
Core Graphics Constants
Core Graphics Functions
Core Graphics Data Types
Reference


## Page 7

class let colorSpace: CFString
This key specifies the color space of the output buffer. If this key is not included in the
dictionary, the output buffer uses the same color space as the display. The value associated
with this key must be a CGColorSpace for the desired color space.
Deprecated
class let conversionBlackPointCompensation: CFString
An option for whether to apply black point compensation when converting between color
profiles.
var kCGDisplayBitsPerPixel: String
Specifies a CFNumber integer value that represents the number of bits in a pixel.
var kCGDisplayBitsPerSample: String
Specifies a CFNumber integer value that represents the number of bits in an individual samp
(for example, a color value in an RGB pixel).
var kCGDisplayBlendNormal: Double
The blend color is not applied at the start or end of a fade operation.
var kCGDisplayBlendSolidColor: Double
The user sees only the blend color at the start or end of a fade operation.
var kCGDisplayBytesPerRow: String
Specifies a CFNumber integer value that represents the number of bytes in a row on the
display.
Topics
Constants
Core Graphics / Core Graphics Constants
API Collection
Core Graphics Constants


## Page 8

var kCGDisplayFadeReservationInvalidToken: Int32
var kCGDisplayHeight: String
Specifies a CFNumber integer value that represents the height of the display in pixels.
var kCGDisplayIOFlags: String
Specifies a CFNumber integer value that contains the I/O Kit display mode flags. For more
information, see the header file IOKit/IOGraphicsTypes.h.
var kCGDisplayMode: String
Specifies a CFNumber integer value that represents the I/O Kit display mode number.
var kCGDisplayModeIsInterlaced: String
Specifies a CFBoolean value indicating that the I/O Kit interlace mode flag is set.
var kCGDisplayModeIsSafeForHardware: String
Specifies a CFBoolean value indicating that the display mode doesn’t need a confirmation
dialog to be set.
Deprecated
var kCGDisplayModeIsStretched: String
Specifies a CFBoolean value indicating that the I/O Kit stretched mode flag is set.
var kCGDisplayModeIsTelevisionOutput: String
Specifies a CFBoolean value indicating that the I/O Kit television output mode flag is set.
var kCGDisplayModeUsableForDesktopGUI: String
Specifies a CFBoolean value that indicates whether the display is suitable for use with the
macOS graphical user interface. The criteria include factors such as sufficient width and
height and adequate pixel depth.
var kCGDisplayRefreshRate: String
Specifies a CFNumber double-precision floating point value that represents the refresh rate 
a CRT display.
var kCGDisplaySamplesPerPixel: String
Specifies a CFNumber integer value that represents the number of samples in a pixel.
let kCGDisplayShowDuplicateLowResolutionModes: CFString
class let destinationRect: CFString
This key specifies that the display stream outputs the frame data into a subset of the output
IOSurface object.
Deprecated


## Page 9

class let minimumFrameTime: CFString
This key specifies the desired minimum time between frame updates, allowing you to throttle
the rate at which updates are received. If this key is not included in the dictionary, the defaul
value is 0, meaning that updates are not throttled. The value must be specified as a
CFNumber.
Deprecated
class let queueDepth: CFString
This key specifies the number of frames to keep in the queue. If this key is not included in th
dictionary, the default value is 3 frames. Specifying more frames uses more memory, but ma
allow you to process frame data without stalling the display stream. The value associated wit
this key should be specified as a CFNumber, and should not exceed 8 frames.
Deprecated
class let showCursor: CFString
This key specifies whether the cursor should appear in the stream. If this key is not included
the dictionary, the cursor is visible. The value must be specified as a CFBoolean.
Deprecated
class let sourceRect: CFString
This key specifies that the display stream only samples a subset of the display’s framebuffer
Deprecated
class let yCbCrMatrix: CFString
This key should only be included if you the display stream is creating output frames in either
the 420v or 420f formats. It is used to specify the YCbCr matrix applied to the output surfac
Deprecated
class let yCbCrMatrix_ITU_R_601_4: CFString
Specifies the YCbCr to RGB conversion matrix for standard digital television (ITU R 601)
images.
class let yCbCrMatrix_ITU_R_709_2: CFString
Specifies the YCbCr to RGB conversion matrix for HDTV digital television (ITU R 709) images
class let yCbCrMatrix_SMPTE_240M_1995: CFString
Specifies the YCbCR to RGB conversion matrix for 1920 x 1135 HDTV (SMPTE 240M 1995).
var kCGDisplayWidth: String
Specifies a CFNumber integer value that represents the width of the display in pixels.
Deprecated


## Page 10

let kCGFontIndexInvalid: CGFontIndex
An invalid font index (a value which never represents a valid glyph).
let kCGFontIndexMax: CGFontIndex
The maximum allowed value of a CGFontIndex.
let kCGGlyphMax: CGFontIndex
The maximum allowed value of a CGGlyph.
var kCGIODisplayModeID: String
var kCGMouseDownEventMaskingDeadSwitchTimeout: Double
var kCGNotifyEventTapAdded: String
var kCGNotifyEventTapRemoved: String
var kCGNotifyGUIConsoleSessionChanged: String
var kCGNotifyGUISessionUserChanged: String
var kCGNumReservedWindowLevels: Int32
var kCGSessionConsoleSetKey: String
A CFNumber 32-bit unsigned integer value that represents a set of hardware composing a
console.
var kCGSessionLoginDoneKey: String
A CFBoolean value indicating whether the login operation has been done.
var kCGSessionOnConsoleKey: String
A CFBoolean value indicating whether the session is on a console.
var kCGSessionUserIDKey: String
A CFNumber 32-bit unsigned integer value that encodes a user ID for the session’s current
user.
var kCGSessionUserNameKey: String
A CFString value that encodes the session’s short user name as set by the login operation
let kCGWindowAlpha: CFString
let kCGWindowBackingLocationVideoMemory: CFString
let kCGWindowBounds: CFString
let kCGWindowIsOnscreen: CFString


## Page 11

let kCGWindowLayer: CFString
let kCGWindowMemoryUsage: CFString
let kCGWindowName: CFString
let kCGWindowNumber: CFString
let kCGWindowOwnerName: CFString
let kCGWindowOwnerPID: CFString
let kCGWindowSharingState: CFString
let kCGWindowStoreType: CFString
let CGPointZero: CGPoint
A point constant with location (0,0). The zero point is equivalent to CGPointMake(0,0).
let CGRectZero: CGRect
A rectangle constant with location (0,0), and width and height of 0. The zero rectangle is
equivalent to CGRectMake(0,0,0,0).
let CGSizeZero: CGSize
A size constant with width and height of 0. The zero size is equivalent to CGSizeMake(0,0
let kCGWindowWorkspace: CFString
Deprecated
class let preserveAspectRatio: CFString
This key specifies whether the display stream preserves the aspect ratio of the source pixel
data. If this key is not included in the dictionary, then the aspect ratio is preserved. If the
aspect ratio is preserved, then the display stream adds black bars to the output data. If the
aspect ratio is not preserved, then the pixel data is stretched to fit the output buffer’s
dimensions. The value associated with the key must be a CFBoolean.
Deprecated
var CG_HDR_BT_2100: Int32
let kCGBitmapByteOrder16Host: CGBitmapInfo
16-bit, host endian format.
let kCGBitmapByteOrder32Host: CGBitmapInfo
32-bit, host endian format.
let kCGColorSpaceExtendedRange: CFString
var kCGDefaultHDRImageContentHeadroom: Float


## Page 12

let kCGEXRToneMappingGammaDefog: CFString
let kCGEXRToneMappingGammaExposure: CFString
let kCGEXRToneMappingGammaKneeHigh: CFString
let kCGEXRToneMappingGammaKneeLow: CFString
var kCGNullDirectDisplay: CGDirectDisplayID
A value that will never correspond to actual hardware.
var kCGNullWindowID: CGWindowID
var kCGNumReservedBaseWindowLevels: Int32
let kCGPDFContextAccessPermissions: CFString
let kCGPDFContextCreateLinearizedPDF: CFString
let kCGPDFContextCreatePDFA: CFString
let kCGPDFOutlineChildren: CFString
let kCGPDFOutlineDestination: CFString
let kCGPDFOutlineDestinationRect: CFString
let kCGPDFOutlineTitle: CFString
let kCGSkipBoostToHDR: CFString
let kCGUse100nitsHLGOOTF: CFString
let kCGUseBT1886ForCoreVideoGamma: CFString
let kCGUseLegacyHDREcosystem: CFString
var kCGAssistiveTechHighWindowLevel: CGWindowLevel
var kCGBackstopMenuLevel: CGWindowLevel
var kCGDockWindowLevel: CGWindowLevel
var kCGDraggingWindowLevel: CGWindowLevel
var kCGFloatingWindowLevel: CGWindowLevel
var kCGHelpWindowLevel: CGWindowLevel
var kCGMainMenuWindowLevel: CGWindowLevel
var kCGModalPanelWindowLevel: CGWindowLevel
var kCGNormalWindowLevel: CGWindowLevel


## Page 13

var kCGOverlayWindowLevel: CGWindowLevel
var kCGPopUpMenuWindowLevel: CGWindowLevel
var kCGScreenSaverWindowLevel: CGWindowLevel
var kCGStatusWindowLevel: CGWindowLevel
var kCGTornOffMenuWindowLevel: CGWindowLevel
var kCGUtilityWindowLevel: CGWindowLevel
Core Graphics Structures
Core Graphics Enumerations
Core Graphics Functions
Core Graphics Data Types
See Also
Reference


## Page 14

func CGAcquireDisplayFadeReservation(CGDisplayReservationInterval,
UnsafeMutablePointer<CGDisplayFadeReservationToken>?) -> CGError
Reserves the fade hardware for a specified time interval.
func CGAssociateMouseAndMouseCursorPosition(boolean_t) -> CGError
Connects or disconnects the mouse and cursor while an application is in the foreground.
func CGBeginDisplayConfiguration(UnsafeMutablePointer<CGDisplayConfigRe
?>?) -> CGError
Begins a new set of display configuration changes.
func CGCancelDisplayConfiguration(CGDisplayConfigRef?) -> CGError
Cancels a set of display configuration changes.
func CGCaptureAllDisplays() -> CGError
Obtains exclusive use of all active displays, preventing other applications and system service
from using the display or changing its configuration.
func CGCaptureAllDisplaysWithOptions(CGCaptureOptions) -> CGError
Captures all attached displays, using the specified options.
func CGCompleteDisplayConfiguration(CGDisplayConfigRef?, CGConfigure
Option) -> CGError
Completes a set of display configuration changes.
Topics
Functions
Core Graphics / Core Graphics Functions
API Collection
Core Graphics Functions


## Page 15

func CGConfigureDisplayFadeEffect(CGDisplayConfigRef?, CGDisplayFade
Interval, CGDisplayFadeInterval, Float, Float, Float) -> CGError
Modifies the settings of the built-in fade effect that occurs during a display configuration.
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
func CGConfigureDisplayStereoOperation(CGDisplayConfigRef?, CGDirect
DisplayID, boolean_t, boolean_t) -> CGError
Enables or disables stereo operation for a display, as part of a display configuration.
func CGConfigureDisplayWithDisplayMode(CGDisplayConfigRef?, CGDirect
DisplayID, CGDisplayMode?, CFDictionary?) -> CGError
Configures the display mode of a display.
func CGCursorIsDrawnInFramebuffer() -> boolean_t
Returns a Boolean value indicating whether the mouse cursor is drawn in framebuffer memo
Deprecated
func CGCursorIsVisible() -> boolean_t
Returns a Boolean value indicating whether the mouse cursor is visible.
Deprecated
func CGDirectDisplayCopyCurrentMetalDevice(CGDirectDisplayID) -> (any
MTLDevice)?
Returns the GPU device instance that’s currently driving a display.
func CGDisplayAvailableModes(CGDirectDisplayID) -> CFArray?
Returns information about the currently available display modes.
Deprecated
func CGDisplayBestModeForParameters(CGDirectDisplayID, Int, Int, Int,
UnsafeMutablePointer<boolean_t>?) -> CFDictionary?


## Page 16

Returns information about the display mode closest to a specified depth and screen size.
Deprecated
func CGDisplayBestModeForParametersAndRefreshRate(CGDirectDisplayID, In
, Int, Int, CGRefreshRate, UnsafeMutablePointer<boolean_t>?) ->
CFDictionary?
Returns information about the display mode closest to a specified depth, screen size, and
refresh rate.
Deprecated
func CGDisplayBounds(CGDirectDisplayID) -> CGRect
Returns the bounds of a display in the global display coordinate space.
func CGDisplayCapture(CGDirectDisplayID) -> CGError
Obtains exclusive use of a display, preventing other applications and system services from
using the display or changing its configuration.
func CGDisplayCaptureWithOptions(CGDirectDisplayID, CGCaptureOptions) -
CGError
Obtains exclusive use of a display for an application using the options you specify.
func CGDisplayCopyAllDisplayModes(CGDirectDisplayID, CFDictionary?) ->
CFArray?
Returns information about the currently available display modes.
func CGDisplayCopyColorSpace(CGDirectDisplayID) -> CGColorSpace
Returns the color space for a display.
func CGDisplayCopyDisplayMode(CGDirectDisplayID) -> CGDisplayMode?
Returns information about a display’s current configuration.
func CGDisplayCreateImage(CGDirectDisplayID) -> CGImage?
Returns an image containing the contents of the specified display.
Deprecated
func CGDisplayCreateImage(CGDirectDisplayID, rect: CGRect) -> CGImage?
Returns an image containing the contents of a portion of the specified display.
Deprecated
func CGDisplayCurrentMode(CGDirectDisplayID) -> CFDictionary?
Returns information about the current display mode.
Deprecated


## Page 17

func CGDisplayFade(CGDisplayFadeReservationToken, CGDisplayFadeInterval
CGDisplayBlendFraction, CGDisplayBlendFraction, Float, Float, Float,
boolean_t) -> CGError
Performs a single fade operation.
func CGDisplayFadeOperationInProgress() -> boolean_t
Returns a Boolean value indicating whether a fade operation is currently in progress.
Deprecated
func CGDisplayGammaTableCapacity(CGDirectDisplayID) -> UInt32
Returns the capacity, or number of entries, in the gamma table for a display.
func CGDisplayGetDrawingContext(CGDirectDisplayID) -> CGContext?
Returns a graphics context suitable for drawing to a captured display.
func CGDisplayHideCursor(CGDirectDisplayID) -> CGError
Hides the mouse cursor, and increments the hide cursor count.
func CGDisplayIDToOpenGLDisplayMask(CGDirectDisplayID) -> CGOpen
GLDisplayMask
Maps a display ID to an OpenGL display mask.
func CGDisplayIOServicePort(CGDirectDisplayID) -> io_service_t
Returns the I/O Kit service port of the specified display.
Deprecated
func CGDisplayIsActive(CGDirectDisplayID) -> boolean_t
Returns a Boolean value indicating whether a display is active.
func CGDisplayIsAlwaysInMirrorSet(CGDirectDisplayID) -> boolean_t
Returns a Boolean value indicating whether a display is always in a mirroring set.
func CGDisplayIsAsleep(CGDirectDisplayID) -> boolean_t
Returns a Boolean value indicating whether a display is sleeping (and is therefore not
drawable).
func CGDisplayIsBuiltin(CGDirectDisplayID) -> boolean_t
Returns a Boolean value indicating whether a display is built-in, such as the internal display i
portable systems.
func CGDisplayIsCaptured(CGDirectDisplayID) -> boolean_t
Returns a Boolean value indicating whether a display is captured.
Deprecated


## Page 18

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
var pixelEncoding: CFString?
Returns the pixel encoding of the specified display mode.
Deprecated
var height: Int
Returns the height of the specified display mode.
var ioDisplayModeID: Int32
Returns the I/O Kit display mode ID of the specified display mode.
var ioFlags: UInt32
Returns the I/O Kit flags of the specified display mode.
var pixelWidth: Int
var refreshRate: Double
Returns the refresh rate of the specified display mode.
class var typeID: CFTypeID
Returns the type identifier of Quartz display modes.
var width: Int
Returns the width of the specified display mode.
func isUsableForDesktopGUI() -> Bool


## Page 19

Returns a Boolean value indicating whether the specified display mode is usable for a deskto
graphical user interface.
func CGDisplayModelNumber(CGDirectDisplayID) -> UInt32
Returns the model number of a display monitor.
func CGDisplayMoveCursorToPoint(CGDirectDisplayID, CGPoint) -> CGError
Moves the mouse cursor to a specified point relative to the upper-left corner of the display.
func CGDisplayPixelsHigh(CGDirectDisplayID) -> Int
Returns the display height in pixel units.
func CGDisplayPixelsWide(CGDirectDisplayID) -> Int
Returns the display width in pixel units.
func CGDisplayPrimaryDisplay(CGDirectDisplayID) -> CGDirectDisplayID
Returns the primary display in a hardware mirroring set.
func CGDisplayRegisterReconfigurationCallback(CGDisplayReconfiguration
CallBack?, UnsafeMutableRawPointer?) -> CGError
Registers a callback function to be invoked whenever a local display is reconfigured.
func CGDisplayRelease(CGDirectDisplayID) -> CGError
Releases a captured display.
func CGDisplayRemoveReconfigurationCallback(CGDisplayReconfigurationCal
Back?, UnsafeMutableRawPointer?) -> CGError
Removes the registration of a callback function that’s invoked whenever a local display is
reconfigured.
func CGDisplayRestoreColorSyncSettings()
Restores the gamma tables to the values in the user’s ColorSync display profile.
func CGDisplayRotation(CGDirectDisplayID) -> Double
Returns the rotation angle of a display in degrees.
func CGDisplayScreenSize(CGDirectDisplayID) -> CGSize
Returns the width and height of a display in millimeters.
func CGDisplaySerialNumber(CGDirectDisplayID) -> UInt32
Returns the serial number of a display monitor.
func CGDisplaySetDisplayMode(CGDirectDisplayID, CGDisplayMode?,
CFDictionary?) -> CGError


## Page 20

Switches a display to a different mode.
func CGDisplaySetStereoOperation(CGDirectDisplayID, boolean_t, boolean_
, CGConfigureOption) -> CGError
Immediately enables or disables stereo operation for a display.
func CGDisplayShowCursor(CGDirectDisplayID) -> CGError
Decrements the hide cursor count, and shows the mouse cursor if the count is 0.
init?(display: CGDirectDisplayID, outputWidth: Int, outputHeight: Int,
pixelFormat: Int32, properties: CFDictionary?, handler: CGDisplayStream
FrameAvailableHandler?)
Creates a new display stream to be used with a CFRunloop.
Deprecated
init?(dispatchQueueDisplay: CGDirectDisplayID, outputWidth: Int, output
Height: Int, pixelFormat: Int32, properties: CFDictionary?, queue:
dispatch_queue_t, handler: CGDisplayStreamFrameAvailableHandler?)
Creates a new display stream whose updates are delivered to a dispatch queue.
Deprecated
var runLoopSource: CFRunLoopSource?
Gets the run loop source for a display stream.
Deprecated
func start() -> CGError
Tells a stream to start sending updates.
Deprecated
func stop() -> CGError
Tells a stream to stop sending updates.
Deprecated
init?(mergedUpdateFirstUpdate: CGDisplayStreamUpdate?, secondUpdate:
CGDisplayStreamUpdate?)
Combines two updates into a new update that includes the metadata for both source update
Deprecated
var dropCount: Int
Returns the number of frames that have been dropped since the last call to your update
handler.
Deprecated


## Page 21

func getMovedRectsDelta(dx: UnsafeMutablePointer<CGFloat>, dy: Unsafe
MutablePointer<CGFloat>)
Return the movement delta values for a single update.
Deprecated
func getRects(CGDisplayStreamUpdateRectType, rectCount: UnsafeMutable
Pointer<Int>) -> UnsafePointer<CGRect>?
Returns an array of rectangles that describe where the frame has changed since the previou
frame.
Deprecated
class var typeID: CFTypeID
Returns the type identifier of a Quartz display stream update.
Deprecated
func CGDisplaySwitchToMode(CGDirectDisplayID, CFDictionary?) -> CGError
Switches a display to a different mode.
Deprecated
func CGDisplayUnitNumber(CGDirectDisplayID) -> UInt32
Returns the logical unit number of a display.
func CGDisplayUsesOpenGLAcceleration(CGDirectDisplayID) -> boolean_t
Returns a Boolean value indicating whether Quartz is using OpenGL-based window
acceleration (Quartz Extreme) to render in a display.
func CGDisplayVendorNumber(CGDirectDisplayID) -> UInt32
Returns the vendor number of the specified display’s monitor.
func CGEnableEventStateCombining(boolean_t) -> CGError
Enables or disables the merging of actual key and mouse state with the application-specified
state in a synthetic event.
Deprecated
init?(source: CGEventSource?)
Returns a new Quartz event.
func copy() -> CGEvent?
Returns a copy of an existing Quartz event.
init?(withDataAllocator: CFAllocator?, data: CFData?)
Returns a Quartz event created from a flattened data representation of the event.


## Page 22

init?(keyboardEventSource: CGEventSource?, virtualKey: CGKeyCode, key
Down: Bool)
Returns a new Quartz keyboard event.
init?(mouseEventSource: CGEventSource?, mouseType: CGEventType, mouse
CursorPosition: CGPoint, mouseButton: CGMouseButton)
Returns a new Quartz mouse event.
init?(event: CGEvent?)
Returns a Quartz event source created from an existing Quartz event.
func getDoubleValueField(CGEventField) -> Double
Returns the floating-point value of a field in a Quartz event.
var flags: CGEventFlags
Returns the event flags of a Quartz event.
func getIntegerValueField(CGEventField) -> Int64
Returns the integer value of a field in a Quartz event.
var location: CGPoint
Returns the location of a Quartz mouse event.
var timestamp: CGEventTimestamp
Returns the timestamp of a Quartz event.
var type: CGEventType
Returns the event type of a Quartz event (left mouse down, for example).
class var typeID: CFTypeID
Returns the type identifier for the opaque type CGEventRef.
var unflippedLocation: CGPoint
Returns the location of a Quartz mouse event.
func keyboardGetUnicodeString(maxStringLength: Int, actualStringLength:
UnsafeMutablePointer<Int>?, unicodeString: UnsafeMutablePointer<UniChar
>?)
Returns the Unicode string associated with a Quartz keyboard event.
func keyboardSetUnicodeString(stringLength: Int, unicodeString: Unsafe
Pointer<UniChar>?)
Sets the Unicode string associated with a Quartz keyboard event.


## Page 23

func post(tap: CGEventTapLocation)
Posts a Quartz event into the event stream at a specified location.
func postToPSN(processSerialNumber: UnsafeMutableRawPointer?)
Posts a Quartz event into the event stream for a specific application.
func postToPid(pid_t)
func setDoubleValueField(CGEventField, value: Double)
Sets the floating-point value of a field in a Quartz event.
func setIntegerValueField(CGEventField, value: Int64)
Sets the integer value of a field in a Quartz event.
func setSource(CGEventSource?)
Sets the event source of a Quartz event.
class func buttonState(CGEventSourceStateID, button: CGMouseButton) ->
Bool
Returns a Boolean value indicating the current button state of a Quartz event source.
class func counterForEventType(CGEventSourceStateID, eventType: CGEvent
Type) -> UInt32
Returns a count of events of a given type seen since the window server started.
init?(stateID: CGEventSourceStateID)
Returns a Quartz event source created with a specified source state.
class func flagsState(CGEventSourceStateID) -> CGEventFlags
Returns the current flags of a Quartz event source.
var keyboardType: CGEventSourceKeyboardType
Returns the keyboard type to be used with a Quartz event source.
func getLocalEventsFilterDuringSuppressionState(CGEventSuppressionState
-> CGEventFilterMask
Returns the mask that indicates which classes of local hardware events are enabled during
event suppression.
var pixelsPerLine: Double
Gets the scale of pixels per line in a scrolling event source.
var sourceStateID: CGEventSourceStateID
Returns the source state associated with a Quartz event source.


## Page 24

class var typeID: CFTypeID
Returns the type identifier for the opaque type CGEventSourceRef.
var userData: Int64
Returns the 64-bit user-specified data for a Quartz event source.
class func keyState(CGEventSourceStateID, key: CGKeyCode) -> Bool
Returns a Boolean value indicating the current keyboard state of a Quartz event source.
class func secondsSinceLastEventType(CGEventSourceStateID, eventType:
CGEventType) -> CFTimeInterval
Returns the elapsed time since the last event for a Quartz event source.
func setLocalEventsFilterDuringSuppressionState(CGEventFilterMask, stat
: CGEventSuppressionState)
Sets the mask that indicates which classes of local hardware events are enabled during even
suppression.
class func tapCreate(tap: CGEventTapLocation, place: CGEventTapPlacemen
, options: CGEventTapOptions, eventsOfInterest: CGEventMask, callback:
CGEventTapCallBack, userInfo: UnsafeMutableRawPointer?) -> CFMachPort?
Creates an event tap.
class func tapCreateForPSN(processSerialNumber: UnsafeMutableRawPointer
place: CGEventTapPlacement, options: CGEventTapOptions, eventsOfInteres
: CGEventMask, callback: CGEventTapCallBack, userInfo: UnsafeMutableRaw
Pointer?) -> CFMachPort?
Creates an event tap for a specified process.
class func tapCreateForPid(pid: pid_t, place: CGEventTapPlacement,
options: CGEventTapOptions, eventsOfInterest: CGEventMask, callback:
CGEventTapCallBack, userInfo: UnsafeMutableRawPointer?) -> CFMachPort?
class func tapEnable(tap: CFMachPort, enable: Bool)
Enables or disables an event tap.
class func tapIsEnabled(tap: CFMachPort) -> Bool
Returns a Boolean value indicating whether an event tap is enabled.
func tapPostEvent(CGEventTapProxy?)
Posts a Quartz event from an event tap into the event stream.
func CGGetActiveDisplayList(UInt32, UnsafeMutablePointer<CGDirectDispla
ID>?, UnsafeMutablePointer<UInt32>?) -> CGError


## Page 25

Provides a list of displays that are active for drawing.
func CGGetDisplayTransferByFormula(CGDirectDisplayID, UnsafeMutable
Pointer<CGGammaValue>?, UnsafeMutablePointer<CGGammaValue>?, Unsafe
MutablePointer<CGGammaValue>?, UnsafeMutablePointer<CGGammaValue>?,
UnsafeMutablePointer<CGGammaValue>?, UnsafeMutablePointer<CGGammaValue
>?, UnsafeMutablePointer<CGGammaValue>?, UnsafeMutablePointer<CGGamma
Value>?, UnsafeMutablePointer<CGGammaValue>?) -> CGError
Gets the coefficients of the gamma transfer formula for a display.
func CGGetDisplayTransferByTable(CGDirectDisplayID, UInt32, Unsafe
MutablePointer<CGGammaValue>?, UnsafeMutablePointer<CGGammaValue>?,
UnsafeMutablePointer<CGGammaValue>?, UnsafeMutablePointer<UInt32>?) ->
CGError
Gets the values in the RGB gamma tables for a display.
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
func CGGetEventTapList(UInt32, UnsafeMutablePointer<CGEventTap
Information>?, UnsafeMutablePointer<UInt32>?) -> CGError
Gets a list of currently installed event taps.
func CGGetLastMouseDelta() -> (x: Int32, y: Int32)
Reports the change in mouse position since the last mouse movement event received by the
application.
func CGGetOnlineDisplayList(UInt32, UnsafeMutablePointer<CGDirectDispla
ID>?, UnsafeMutablePointer<UInt32>?) -> CGError
Provides a list of displays that are online (active, mirrored, or sleeping).
var utType: CFString?
The Universal Type Identifier for the image.


## Page 26

func CGInhibitLocalEvents(boolean_t) -> CGError
Turns off local hardware events in the current session.
Deprecated
func CGMainDisplayID() -> CGDirectDisplayID
Returns the display ID of the main display.
func CGOpenGLDisplayMaskToDisplayID(CGOpenGLDisplayMask) -> CGDirect
DisplayID
Maps an OpenGL display mask to a display ID.
func CGPointEqualToPoint(CGPoint, CGPoint) -> Bool
Returns whether two points are equal.
Deprecated
func CGPostKeyboardEvent(CGCharCode, CGKeyCode, boolean_t) -> CGError
Synthesizes a low-level keyboard event on the local machine.
Deprecated
func CGRegisterScreenRefreshCallback(CGScreenRefreshCallback, Unsafe
MutableRawPointer?) -> CGError
Registers a callback function to be invoked when local displays are refreshed or modified.
Deprecated
func CGReleaseAllDisplays() -> CGError
Releases all captured displays.
func CGReleaseDisplayFadeReservation(CGDisplayFadeReservationToken) ->
CGError
Releases a display fade reservation, and unfades the display if needed.
func CGReleaseScreenRefreshRects(UnsafeMutablePointer<CGRect>?)
Deallocates a list of rectangles that represent changed areas on local displays.
Deprecated
func CGRestorePermanentDisplayConfiguration()
Restores the permanent display configuration settings for the current user.
func CGScreenRegisterMoveCallback(CGScreenUpdateMoveCallback, Unsafe
MutableRawPointer?) -> CGError
Registers a callback function to be invoked when an area of the display is moved.
Deprecated


## Page 27

func CGScreenUnregisterMoveCallback(CGScreenUpdateMoveCallback, Unsafe
MutableRawPointer?)
Removes a previously registered callback function invoked when an area of the display is
moved.
Deprecated
func CGSessionCopyCurrentDictionary() -> CFDictionary?
Returns information about the caller’s window server session.
func CGSetDisplayTransferByByteTable(CGDirectDisplayID, UInt32, Unsafe
Pointer<UInt8>, UnsafePointer<UInt8>, UnsafePointer<UInt8>) -> CGError
Sets the byte values in the 8-bit RGB gamma tables for a display.
func CGSetDisplayTransferByFormula(CGDirectDisplayID, CGGammaValue,
CGGammaValue, CGGammaValue, CGGammaValue, CGGammaValue, CGGammaValue,
CGGammaValue, CGGammaValue, CGGammaValue) -> CGError
Sets the gamma function for a display by specifying the coefficients of the gamma transfer
formula.
func CGSetDisplayTransferByTable(CGDirectDisplayID, UInt32, Unsafe
Pointer<CGGammaValue>?, UnsafePointer<CGGammaValue>?, UnsafePointer<
CGGammaValue>?) -> CGError
Sets the color gamma function for a display by specifying the values in the RGB gamma
tables.
func CGSetLocalEventsFilterDuringSuppressionState(CGEventFilterMask,
CGEventSuppressionState) -> CGError
Filters local hardware events from the keyboard and mouse during the short interval after a
synthetic event is posted.
Deprecated
func CGSetLocalEventsSuppressionInterval(CFTimeInterval) -> CGError
Sets the time interval in seconds that local hardware events are suppressed after posting a
synthetic event.
Deprecated
func CGShieldingWindowID(CGDirectDisplayID) -> CGWindowID
Returns the window ID of the shield window for a captured display.
func CGShieldingWindowLevel() -> CGWindowLevel
Returns the window level of the shield window for a captured display.
func CGSizeEqualToSize(CGSize, CGSize) -> Bool


## Page 28

Returns whether two sizes are equal.
Deprecated
func CGUnregisterScreenRefreshCallback(CGScreenRefreshCallback, Unsafe
MutableRawPointer?)
Removes a previously registered callback function invoked when local displays are refreshed
or modified.
Deprecated
func CGWaitForScreenRefreshRects(UnsafeMutablePointer<UnsafeMutable
Pointer<CGRect>?>?, UnsafeMutablePointer<UInt32>?) -> CGError
Waits for screen refresh operations.
Deprecated
func CGWaitForScreenUpdateRects(CGScreenUpdateOperation, UnsafeMutable
Pointer<CGScreenUpdateOperation>?, UnsafeMutablePointer<UnsafeMutable
Pointer<CGRect>?>?, UnsafeMutablePointer<Int>?, UnsafeMutablePointer<
CGScreenUpdateMoveDelta>?) -> CGError
Waits for screen update operations.
Deprecated
func CGWarpMouseCursorPosition(CGPoint) -> CGError
Moves the mouse cursor without generating events.
func CGWindowLevelForKey(CGWindowLevelKey) -> CGWindowLevel
Returns the window level that corresponds to one of the standard window types.
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


## Page 29

func CGWindowServerCFMachPort() -> CFMachPort?
Returns a Core Foundation Mach port (CFMachPort) that corresponds to the macOS window
server.
Deprecated
func CGWindowServerCreateServerPort() -> CFMachPort?
func acos(CGFloat) -> CGFloat
func acosh(CGFloat) -> CGFloat
func asin(CGFloat) -> CGFloat
func asinh(CGFloat) -> CGFloat
func atan(CGFloat) -> CGFloat
func atan2(CGFloat, CGFloat) -> CGFloat
func atanh(CGFloat) -> CGFloat
func cbrt(CGFloat) -> CGFloat
func copysign(CGFloat, CGFloat) -> CGFloat
func cos(CGFloat) -> CGFloat
func cosh(CGFloat) -> CGFloat
func erf(CGFloat) -> CGFloat
func erfc(CGFloat) -> CGFloat
func exp(CGFloat) -> CGFloat
func exp2(CGFloat) -> CGFloat
func expm1(CGFloat) -> CGFloat
func fdim(CGFloat, CGFloat) -> CGFloat
func fmax(CGFloat, CGFloat) -> CGFloat
func fmin(CGFloat, CGFloat) -> CGFloat
func hypot(CGFloat, CGFloat) -> CGFloat
func ilogb(CGFloat) -> Int
func CGColorSpaceCreateLinearized(CGColorSpace) -> CGColorSpace?
init?(src: CGColorSpace, dst: CGColorSpace)


## Page 30

Creates a conversion between two specified color spaces.
func j0(CGFloat) -> CGFloat
func j1(CGFloat) -> CGFloat
func jn(Int, CGFloat) -> CGFloat
func ldexp(CGFloat, Int) -> CGFloat
func lgamma(CGFloat) -> (CGFloat, Int)
func log(CGFloat) -> CGFloat
func log10(CGFloat) -> CGFloat
func log1p(CGFloat) -> CGFloat
func log2(CGFloat) -> CGFloat
func logb(CGFloat) -> CGFloat
func nan(String) -> CGFloat
func nearbyint(CGFloat) -> CGFloat
func nextafter(CGFloat, CGFloat) -> CGFloat
func pow(CGFloat, CGFloat) -> CGFloat
func remquo(CGFloat, CGFloat) -> (CGFloat, Int)
func rint(CGFloat) -> CGFloat
func sin(CGFloat) -> CGFloat
func sinh(CGFloat) -> CGFloat
func tan(CGFloat) -> CGFloat
func tanh(CGFloat) -> CGFloat
func tgamma(CGFloat) -> CGFloat
var localEventsSuppressionInterval: CFTimeInterval
Returns the interval that local hardware events may be suppressed following the posting of a
Quartz event.
var pixelHeight: Int
class var typeID: CFTypeID
Returns the type identifier of a Quartz display stream.


## Page 31

Deprecated
class var typeID: CFTypeID
Returns the Core Foundation type identifier for a color conversion info data type.
func y0(CGFloat) -> CGFloat
func y1(CGFloat) -> CGFloat
func yn(Int, CGFloat) -> CGFloat
func CGAffineTransformMake(CGFloat, CGFloat, CGFloat, CGFloat, CGFloat,
CGFloat) -> CGAffineTransform
Returns an affine transformation matrix constructed from values you provide.
func CGColorSpaceCopyBaseColorSpace(CGColorSpace) -> CGColorSpace
func CGColorSpaceCreateCopyWithStandardRange(CGColorSpace) -> CGColor
Space
func CGColorSpaceCreateExtended(CGColorSpace) -> CGColorSpace?
func CGColorSpaceCreateExtendedLinearized(CGColorSpace) -> CGColorSpace
func CGColorSpaceCreateWithColorSyncProfile(ColorSyncProfile?,
CFDictionary?) -> CGColorSpace?
func CGColorSpaceIsHLGBased(CGColorSpace) -> Bool
func CGColorSpaceIsPQBased(CGColorSpace) -> Bool
func CGColorSpaceUsesITUR_2100TF(CGColorSpace) -> Bool
func CGContextDrawConicGradient(CGContext, CGGradient?, CGPoint, CGFloa
)
func CGContextGetEDRTargetHeadroom(CGContext) -> Float
func CGConvertColorDataWithFormat(Int, Int, UnsafeMutableRawPointer!,
CGColorDataFormat, UnsafeMutableRawPointer!, CGColorDataFormat,
CFDictionary!) -> Bool
func CGEnableEventStateCombining(boolean_t) -> CGError
Enables or disables the merging of actual key and mouse state with the application-specified
state in a synthetic event.
Deprecated
func CGErrorSetCallback(CGErrorCallback!)
func CGImageCreateCopyWithContentHeadroom(Float, CGImage) -> CGImage?


## Page 32

func CGInhibitLocalEvents(boolean_t) -> CGError
Turns off local hardware events in the current session.
Deprecated
func CGPDFArrayApplyBlock(CGPDFArrayRef, (Int, CGPDFObjectRef, Unsafe
MutableRawPointer?) -> Bool, UnsafeMutableRawPointer?)
func CGPDFContextBeginTag(CGContext, CGPDFTagType, CFDictionary)
func CGPDFContextEndTag(CGContext)
func CGPDFContextSetIDTree(CGContext, CGPDFDictionaryRef)
func CGPDFContextSetOutline(CGContext, CFDictionary?)
func CGPDFContextSetPageTagStructureTree(CGContext, CFDictionary)
func CGPDFContextSetParentTree(CGContext, CGPDFDictionaryRef)
func CGPDFDictionaryApplyBlock(CGPDFDictionaryRef, (UnsafePointer<CChar
>, CGPDFObjectRef, UnsafeMutableRawPointer?) -> Bool, UnsafeMutableRaw
Pointer?)
func CGPDFScannerStop(CGPDFScannerRef)
func CGPointMake(CGFloat, CGFloat) -> CGPoint
Returns a point with the specified coordinates.
func CGPointMakeWithDictionaryRepresentation(CFDictionary, UnsafeMutabl
Pointer<CGPoint>) -> Bool
Fills in a point using the contents of the specified dictionary.
func CGPostKeyboardEvent(CGCharCode, CGKeyCode, boolean_t) -> CGError
Synthesizes a low-level keyboard event on the local machine.
Deprecated
func CGPreflightListenEventAccess() -> Bool
func CGPreflightPostEventAccess() -> Bool
func CGPreflightScreenCaptureAccess() -> Bool
func CGRectMake(CGFloat, CGFloat, CGFloat, CGFloat) -> CGRect
Returns a rectangle with the specified coordinate and size values.
func CGRectMakeWithDictionaryRepresentation(CFDictionary, UnsafeMutable
Pointer<CGRect>) -> Bool
Fills in a rectangle using the contents of the specified dictionary.


## Page 33

func CGRegisterScreenRefreshCallback(CGScreenRefreshCallback, Unsafe
MutableRawPointer?) -> CGError
Registers a callback function to be invoked when local displays are refreshed or modified.
Deprecated
func CGReleaseScreenRefreshRects(UnsafeMutablePointer<CGRect>?)
Deallocates a list of rectangles that represent changed areas on local displays.
Deprecated
func CGRequestListenEventAccess() -> Bool
func CGRequestPostEventAccess() -> Bool
func CGRequestScreenCaptureAccess() -> Bool
func CGScreenRegisterMoveCallback(CGScreenUpdateMoveCallback, Unsafe
MutableRawPointer?) -> CGError
Registers a callback function to be invoked when an area of the display is moved.
Deprecated
func CGScreenUnregisterMoveCallback(CGScreenUpdateMoveCallback, Unsafe
MutableRawPointer?)
Removes a previously registered callback function invoked when an area of the display is
moved.
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
func CGSizeMake(CGFloat, CGFloat) -> CGSize
Returns a size with the specified dimension values.
func CGSizeMakeWithDictionaryRepresentation(CFDictionary, UnsafeMutable
Pointer<CGSize>) -> Bool
Fills in a size using the contents of the specified dictionary.


## Page 34

func CGUnregisterScreenRefreshCallback(CGScreenRefreshCallback, Unsafe
MutableRawPointer?)
Removes a previously registered callback function invoked when local displays are refreshed
or modified.
Deprecated
func CGVectorMake(CGFloat, CGFloat) -> CGVector
Returns a vector with the specified dimension values.
func CGWaitForScreenRefreshRects(UnsafeMutablePointer<UnsafeMutable
Pointer<CGRect>?>?, UnsafeMutablePointer<UInt32>?) -> CGError
Waits for screen refresh operations.
Deprecated
func CGWaitForScreenUpdateRects(CGScreenUpdateOperation, UnsafeMutable
Pointer<CGScreenUpdateOperation>?, UnsafeMutablePointer<UnsafeMutable
Pointer<CGRect>?>?, UnsafeMutablePointer<Int>?, UnsafeMutablePointer<
CGScreenUpdateMoveDelta>?) -> CGError
Waits for screen update operations.
Deprecated
var accessPermissions: CGPDFAccessPermissions
func applyWithBlock((UnsafePointer<CGPathElement>) -> Void)
var byteOrderInfo: CGImageByteOrderInfo
var containsImageSpecificToneMappingMetadata: Bool
var contentHeadroom: Float
func convert(width: Int, height: Int, to: UnsafeMutableRawPointer,
format: CGColorBufferFormat, from: UnsafeRawPointer, format: CGColor
BufferFormat, options: CFDictionary?) -> Bool
func copyPropertyList() -> CFPropertyList?
Returns a copy of the color space’s properties.
var info: UnsafeMutableRawPointer?
init(genericGrayGamma2_2Gray: CGFloat, alpha: CGFloat)
Creates a color in the Generic gray color space with a gamma ramp of 2.2.
init?(headroom: Float, width: Int, height: Int, bitsPerComponent: Int,
bitsPerPixel: Int, bytesPerRow: Int, space: CGColorSpace, bitmapInfo:


## Page 35

CGBitmapInfo, provider: CGDataProvider, decode: UnsafePointer<CGFloat>?
shouldInterpolate: Bool, intent: CGColorRenderingIntent)
init?(iccData: CFTypeRef)
Creates an ICC-based color space using the ICC profile contained in the specified data.
init?(optionsSrc: CGColorSpace, dst: CGColorSpace, options: CFDictionar
?)
init?(propertyListPlist: CFPropertyList)
Creates a color space from a property list.
init?(scrollWheelEvent2Source: CGEventSource?, units: CGScrollEventUnit
wheelCount: UInt32, wheel1: Int32, wheel2: Int32, wheel3: Int32)
func isHDR() -> Bool
var name: UnsafePointer<CChar>
var outline: CFDictionary?
var pixelFormatInfo: CGImagePixelFormatInfo
func resetClip()
func setEDRTargetHeadroom(Float) -> Bool
var shouldToneMap: Bool
func CGColorSpaceUsesExtendedRange(CGColorSpace) -> Bool
Core Graphics Structures
Core Graphics Enumerations
Core Graphics Constants
Core Graphics Data Types
See Also
Reference


## Page 36

typealias CGButtonCount
Represents the number of buttons being set in a synthetic mouse event.
typealias CGCharCode
Represents a character generated by pressing one or more keys on a keyboard.
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
Topics
Data Types
Core Graphics / Core Graphics Data Types
API Collection
Core Graphics Data Types


## Page 37

typealias CGDisplayFadeReservationToken
A token issued by Quartz when reserving one or more displays for a fade operation during a
specified interval.
class CGDisplayMode
A reference to a display mode object.
typealias CGDisplayReconfigurationCallBack
A client-supplied callback function that’s invoked whenever the configuration of a local displ
is changed.
typealias CGDisplayReservationInterval
The time interval for a fade reservation.
class CGDisplayStream
A reference to a display stream object.
typealias CGDisplayStreamFrameAvailableHandler
A block called when a data stream has a new frame event to process.
class CGDisplayStreamUpdate
A reference to frame update’s metadata.
class CGEvent
Defines an opaque type that represents a low-level hardware event.
typealias CGEventErr
typealias CGEventMask
Defines a mask that identifies the set of Quartz events to be observed in an event tap.
class CGEventSource
Defines an opaque type that represents the source of a Quartz event.
typealias CGEventSourceKeyboardType
Defines a code that represents the type of keyboard used with a specified event source.
typealias CGEventTapCallBack
A client-supplied callback function that’s invoked whenever an associated event tap receives
a Quartz event.
typealias CGEventTapInformation
Defines the structure used to report information about event taps.


## Page 38

typealias CGEventTapProxy
Defines an opaque type that represents state within the client application that’s associated
with an event tap.
typealias CGEventTimestamp
Defines the elapsed time in nanoseconds since startup that a Quartz event occurred.
typealias CGGammaValue
A value used to map a color generated in software to a color supported by the display
hardware.
typealias CGKeyCode
Represents the virtual key codes used in keyboard events.
typealias CGOpenGLDisplayMask
A bitmask used in OpenGL to specify a set of attached displays.
typealias CGRectCount
The size of an array of Quartz rectangles.
typealias CGRefreshRate
A display’s refresh rate in frames per second.
typealias CGScreenRefreshCallback
A client-supplied callback function that’s invoked when an area of the display is modified or
refreshed.
typealias CGScreenUpdateMoveCallback
A client-supplied callback function invoked when an area of the display is moved.
typealias CGWheelCount
Represents the number of wheels being set in a scroll wheel event.
typealias CGWindowID
The data type used to store window identifiers.
typealias CGWindowLevel
A level assigned to a window by an application framework.
typealias CGErrorCallback
typealias CGPDFArrayApplierBlock
typealias CGPDFDictionaryApplierBlock


## Page 39

struct CGPDFTagProperty
typealias CGPSConverterBeginDocumentCallback
Performs custom tasks at the beginning of a PostScript conversion process.
typealias CGPSConverterBeginPageCallback
Performs custom tasks at the beginning of each page in a PostScript conversion process.
typealias CGPSConverterEndDocumentCallback
Performs custom tasks at the end of a PostScript conversion process.
typealias CGPSConverterEndPageCallback
Performs custom tasks at the end of each page of a PostScript conversion process.
typealias CGPSConverterMessageCallback
Passes messages generated during a PostScript conversion process.
typealias CGPSConverterProgressCallback
Reports progress periodically during a PostScript conversion process.
typealias CGPSConverterReleaseInfoCallback
Performs custom tasks when a PostScript converter is released.
typealias CGPathApplyBlock
Core Graphics Structures
Core Graphics Enumerations
Core Graphics Constants
Core Graphics Functions
See Also
Reference


