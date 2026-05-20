# OpenGL ES View Rendering.pdf

## Page 1

Deprecated
OpenGLES API deprecated. (Define GLES_SILENCE_DEPRECATION to silence these warnings)
The GLKView class simplifies the effort required to create an OpenGL ES application by directly
managing a framebuffer object on your behalf; your application simply needs to draw into the
framebuffer when the contents need to be updated.
To use this class in your application, create a new GLKView object and provide it an OpenGL ES
context. Then, modify the view’s drawableColorFormat, drawableDepthFormat, drawabl
StencilFormat, and drawableMultisample properties to configure the format of the
drawable’s framebuffer object. After this, the view automatically creates or updates the
framebuffer object whenever the view must be redrawn. A GLKView object uses the regular view
drawing cycle for a UIViewobject, calling its draw(_:) method whenever the contents of the
view need to be updated. Before calling its draw method, the view makes its EAGLContext
object the current OpenGL ES context and binds its framebuffer object to the OpenGL ES context
as the target for rendering commands. Your application’s implementation of the draw method
should call one or more OpenGL ES functions to render an image into the framebuffer object. The
the view resolves any multisampling that you may have enabled and delivers the finished results.
Overview
GLKit / GLKView Deprecated
Class
GLKView Deprecated
A default implementation for views that draw their content using OpenGL ES.
iOS 5.0–12.0 Deprecated
iPadOS 5.0–12.0 Deprecated
tvOS 9.0–12.0 Deprecated


## Page 2

Important
Your drawing method should only modify the contents of the framebuffer object. Never
attempt to read the pixel information from the underlying framebuffer object, modify or
dispose of the framebuffer object, or read its other properties by calling OpenGL ES functions.
Instead, rely on the properties and methods provided by the GLKView class.
The GLKView class can be used in conjunction with a GLKViewController object to create an
animation rendering loop that redraws the contents of the view at a specified frame rate.
Typically, there is no need to subclass the GLKView class. Instead, provide a delegate object to
draw the view’s contents. See GLKViewDelegate.
init(frame: CGRect, context: EAGLContext)
Initializes a new view.
var delegate: (any GLKViewDelegate)?
The view’s delegate.
var drawableColorFormat: GLKViewDrawableColorFormat
The format of the color renderbuffer.
var drawableDepthFormat: GLKViewDrawableDepthFormat
The format of the depth renderbuffer
var drawableStencilFormat: GLKViewDrawableStencilFormat
The format of the stencil renderbuffer.
var drawableMultisample: GLKViewDrawableMultisample
Subclassing Notes
Topics
Initializing the View
Delegate
Configuring the Framebuffer Object


## Page 3

The format of the multisampling buffer.
var drawableHeight: Int
The height, in pixels, of the underlying framebuffer object.
var drawableWidth: Int
The width, in pixels, of the underlying framebuffer object.
var context: EAGLContext
The OpenGL ES context used when drawing the view’s contents.
func bindDrawable()
Binds the underlying framebuffer object to OpenGL ES.
var enableSetNeedsDisplay: Bool
A Boolean value that indicates whether the view responds to messages that invalidate the
view’s contents.
func display()
Redraws the view’s contents immediately.
var snapshot: UIImage
Draws the contents of the view and returns them as a new image object.
func deleteDrawable()
Deletes the drawable object associated with the view.
enum GLKViewDrawableColorFormat
The format of the color renderbuffer.
enum GLKViewDrawableDepthFormat
The format of the depth renderbuffer.
Read-only Framebuffer Properties
Drawing Your View’s Contents
Deleting the View’s Underlying Framebuffer Object
Constants


## Page 4

enum GLKViewDrawableStencilFormat
The format of the stencil renderbuffer.
enum GLKViewDrawableMultisample
The format of the multisampling buffer.
UIView
CALayerDelegate
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCoding
NSObjectProtocol
Sendable
SendableMetatype
UIAccessibilityIdentification
UIActivityItemsConfigurationProviding
UIAppearance
UIAppearanceContainer
UICoordinateSpace
UIDynamicItem
UIFocusEnvironment
UIFocusItem
UIFocusItemContainer
UILargeContentViewerItem
UIPasteConfigurationSupporting
UIPopoverPresentationControllerSourceItem
UIResponderStandardEditActions
UITraitChangeObservable
UITraitEnvironment
Relationships
Inherits From
Conforms To


## Page 5

UIUserActivityRestoring
protocol GLKViewDelegate
Drawing callback methods for use with a GLKView object.
class GLKViewController
A view controller that manages an OpenGL ES rendering loop.
Deprecated
protocol GLKViewControllerDelegate
Rendering loop callback methods for use with a GLKViewController object.
See Also
OpenGL ES View Rendering


## Page 6

An object that implements the GLKViewDelegate protocol can be set as a GLKView object’s
delegate. A delegate allows your application to provide a drawing method to a GLKView object
without subclassing the GLKView class.
func glkView(GLKView, drawIn: CGRect)
Draws the view’s contents.
Required
NSObjectProtocol
Overview
Topics
Drawing the View’s Contents
Relationships
Inherits From
GLKit / GLKViewDelegate
Protocol
GLKViewDelegate
Drawing callback methods for use with a GLKView object.
iOS 5.0+
iPadOS 5.0+
tvOS 9.0+


## Page 7

GLKViewController
class GLKView
A default implementation for views that draw their content using OpenGL ES.
Deprecated
class GLKViewController
A view controller that manages an OpenGL ES rendering loop.
Deprecated
protocol GLKViewControllerDelegate
Rendering loop callback methods for use with a GLKViewController object.
Conforming Types
See Also
OpenGL ES View Rendering


## Page 8

Deprecated
OpenGLES API deprecated. (Define GLES_SILENCE_DEPRECATION to silence these warnings)
A GLKViewController object works in conjunction with a GLKView object to display frames of
animation in the view, and also provides standard view controller functionality.
To use this class, allocate and initialize a new GLKViewController subclass and set its view
property to point to a GLKView object. Then, configure the view controller’s preferredFrames
PerSecond property to the desired frame rate your application requires. You can set a delegate o
configure other properties on the view controller, such as whether the animation loop is
automatically paused or resumed when the application moves into the background.
Note
When you set the view property to point to a GLKView object, if the view does not already
have a delegate, then the view controller is automatically set as the view’s delegate.
When active, rendering loop automatically updates the view’s contents each time a new frame
must be displayed. Each frame is rendered by the view controller using these steps:
Overview
GLKit / GLKViewController Deprecated
Class
GLKViewController Deprecated
A view controller that manages an OpenGL ES rendering loop.
iOS 5.0–12.0 Deprecated
iPadOS 5.0–12.0 Deprecated
tvOS 9.0–12.0 Deprecated


## Page 9

1. The view controller calls its delegate’s glkViewControllerUpdate(_:) method. Your
delegate should update frame data that does not involve rendering the results to the screen.
2. The view controller calls its view’s display() method. Your view should redraw the frame.
Your application should subclass GLKViewController and override the viewDidLoad() and
viewDidUnload methods. Your viewDidLoad method should set up your context and any
drawable properties and can perform other resource allocation and initialization. Similarly, your
class’s viewDidUnload method should delete the drawable object and free any unneeded
resources.
As an alternative to implementing a glkViewControllerUpdate(_:) method in a delegate,
your subclass can provide an update method instead. The method must have the following
signature:
var preferredFramesPerSecond: Int
The rate you want the view controller to call the view to update the contents of the view.
var framesPerSecond: Int
The actual rate that the view controller attempts to call the view to update its contents.
var delegate: (any GLKViewControllerDelegate)?
The view controller’s delegate.
var isPaused: Bool
A Boolean value that indicates whether the rendering loop is paused.
var pauseOnWillResignActive: Bool
Subclassing Notes
Topics
Configuring the Frame rate
Configuring the Delegate
Controlling Frame Updates


## Page 10

A Boolean value that indicates whether the view controller automatically pauses the renderin
loop when the application resigns the active state.
var resumeOnDidBecomeActive: Bool
A Boolean value that indicates whether the view controller automatically resumes the
rendering loop when the application becomes active.
var framesDisplayed: Int
The number of frame updates that have been sent by the view controller since it was created
var timeSinceFirstResume: TimeInterval
The amount of time that has passed since first time the view controller resumed sending
update events.
var timeSinceLastResume: TimeInterval
The amount of time that has passed since the last time the view controller resumed sending
update events.
var timeSinceLastUpdate: TimeInterval
The amount of time that has passed since the last time the view controller called the
delegate’s glkViewControllerUpdate(_:) method.
var timeSinceLastDraw: TimeInterval
The amount of time that has passed since the last time the view controller called the view’s
display() method.
UIViewController
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Obtaining Information About View Updates
Relationships
Inherits From
Conforms To


## Page 11

GLKViewDelegate
Hashable
NSCoding
NSExtensionRequestHandling
NSObjectProtocol
UIActivityItemsConfigurationProviding
UIAppearanceContainer
UIContentContainer
UIFocusEnvironment
UIPasteConfigurationSupporting
UIResponderStandardEditActions
UIStateRestoring
UITraitChangeObservable
UITraitEnvironment
UIUserActivityRestoring
class GLKView
A default implementation for views that draw their content using OpenGL ES.
Deprecated
protocol GLKViewDelegate
Drawing callback methods for use with a GLKView object.
protocol GLKViewControllerDelegate
Rendering loop callback methods for use with a GLKViewController object.
See Also
OpenGL ES View Rendering


## Page 12

A delegate is called each time the controller is about to display a new frame of animation. It is also
called before the view controller’s rendering loop pauses or resumes sending updates.
func glkViewControllerUpdate(GLKViewController)
Called before each frame is displayed.
Required
func glkViewController(GLKViewController, willPause: Bool)
Called before the rendering loop is paused or resumed.
Overview
Topics
Handling an Update Event
Pause and Resume Notifications
GLKit / GLKViewControllerDelegate
Protocol
GLKViewControllerDelegate
Rendering loop callback methods for use with a GLKViewController object.
iOS 5.0+
iPadOS 5.0+
tvOS 9.0+


## Page 13

NSObjectProtocol
class GLKView
A default implementation for views that draw their content using OpenGL ES.
Deprecated
protocol GLKViewDelegate
Drawing callback methods for use with a GLKView object.
class GLKViewController
A view controller that manages an OpenGL ES rendering loop.
Deprecated
Relationships
Inherits From
See Also
OpenGL ES View Rendering


