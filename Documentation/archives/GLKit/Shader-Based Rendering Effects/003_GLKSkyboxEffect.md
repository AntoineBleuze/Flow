# 003_GLKSkyboxEffect.pdf

## Page 1

Deprecated
OpenGLES API deprecated. (Define GLES_SILENCE_DEPRECATION to silence these warnings)
The GLKSkyboxEffect provides a standard skybox effect for your application. Unlike the
GLKBaseEffect class, the skybox does not require your application to configure and submit
vertex data. Instead, it creates its own vertex data based on the configuration data you supply.
At initialization time, your application first creates a compatible context and makes it current. The
it creates new skybox effect, configures its properties, and calls its prepareToDraw() method.
Binding the effect causes a shader to be compiled and bound to the current context.
At rendering time, your application calls the effect’s prepareToDraw() method to prepare the
effect and then calls its draw() method to draw the sky box.
Overview
Topics
Naming the Effect
GLKit / GLKSkyboxEffect Deprecated
Class
GLKSkyboxEffect Deprecated
A simple skybox visual effect for use in shader-based OpenGL rendering.
iOS 5.0–12.0 Deprecated
iPadOS 5.0–12.0 Deprecated
macOS 10.8–10.14 Deprecated
tvOS 9.0–12.0 Deprecated


## Page 2

var label: String?
A string used to name your effect.
func prepareToDraw()
Prepares an effect for rendering.
func draw()
Draws the skybox.
var textureCubeMap: GLKEffectPropertyTexture
The texture to apply to the skybox.
var center: GLKVector3
The center of the skybox.
var xSize: GLfloat
The width of the skybox.
var ySize: GLfloat
The height of the skybox.
var zSize: GLfloat
The depth of the skybox.
var transform: GLKEffectPropertyTransform
The transform applied before drawing the skybox.
Preparing the Effect for Rendering
Drawing the Skybox
Configuring the Skybox
Setting the Skybox Transform
Relationships


## Page 3

NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
GLKNamedEffect
Hashable
NSObjectProtocol
protocol GLKNamedEffect
A standard interface for objects that provide shader-based OpenGL rendering effects.
class GLKBaseEffect
A simple lighting and shading system for use in shader-based OpenGL rendering.
Deprecated
class GLKReflectionMapEffect
A lighting and shading system that supports reflection mapping for use in shader-based
OpenGL rendering.
Deprecated
Inherits From
Conforms To
See Also
Shader-Based Rendering Effects


