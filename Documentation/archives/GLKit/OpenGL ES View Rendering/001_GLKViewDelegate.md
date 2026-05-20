# 001_GLKViewDelegate.pdf

## Page 1

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


## Page 2

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


