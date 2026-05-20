# 003_GLKViewControllerDelegate.pdf

## Page 1

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


## Page 2

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


