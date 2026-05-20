# Shader-Based Rendering Effects.pdf

## Page 1

Objects that implement the GLKNamedEffect protocol provide rendering support to shader-
based apps. An effect is expected to provide access to one or more shaders. The typical usage
pattern for an effect separates initialization tasks from rendering tasks, allowing the effect object 
be used efficiently inside an animation loop.
At initialization time, your app first creates a compatible context and makes it current. Then it
allocates and initializes a new effect object, configures its properties, and calls its prepareTo
Draw() method. Preparing an effect causes a shader to be compiled and bound to the current
context. When an effect requires vertex data to act as inputs to the shader, your app also creates
one or more vertex array objects. For each attribute required by the shader, the vertex array objec
should enable the attribute and point to data stored in a vertex buffer object.
At runtime, your app calls the effect’s prepareToDraw() method to bind the shader program as
the current program. Then, it binds a vertex array object (if necessary) and submits one or more
OpenGL drawing commands.
Overview
Topics
Binding the Shader Program
GLKit / GLKNamedEffect
Protocol
GLKNamedEffect
A standard interface for objects that provide shader-based OpenGL rendering
effects.
iOS 5.0+
iPadOS 5.0+
macOS 10.8+
tvOS 9.0+


## Page 2

func prepareToDraw()
Prepares an effect for OpenGL ES rendering.
Required
GLKBaseEffect, GLKReflectionMapEffect, GLKSkyboxEffect
class GLKBaseEffect
A simple lighting and shading system for use in shader-based OpenGL rendering.
Deprecated
class GLKReflectionMapEffect
A lighting and shading system that supports reflection mapping for use in shader-based
OpenGL rendering.
Deprecated
class GLKSkyboxEffect
A simple skybox visual effect for use in shader-based OpenGL rendering.
Deprecated
Relationships
Conforming Types
See Also
Shader-Based Rendering Effects


## Page 3

Deprecated
OpenGLES API deprecated. (Define GLES_SILENCE_DEPRECATION to silence these warnings)
The GLKBaseEffect class provides shaders that mimic many of the behaviors provided by the
OpenGL ES 1.1 lighting and shading model, including materials, lighting and texturing. The base
effect allows up to three lights and two textures to be applied to a scene.
At initialization time, your application first creates a compatible OpenGL or OpenGL ES context an
makes it current. Then, it allocates and initializes a new effect object, configures its properties, an
calls its prepareToDraw() method. Binding an effect causes a shader to be compiled and boun
to the current context. The base effect also requires vertex data to be supplied by your applicatio
To supply vertex data, create one or more vertex array objects. For each attribute required by the
shader, the vertex array object should enable the attribute and point to data stored in a vertex
buffer object.
At rendering time, your application calls the effect’s prepareToDraw() method to prepare the
effect. Then, it binds a vertex array object and submits one or more drawing commands.
Lighting calculations for the base effect are done in eye-space coordinates.  The light0, light
and light2 properties hold the position and spot direction of the base effect’s lights. The
transform property contains the model view matrix assigned to the scene. When a light is
Overview
GLKit / GLKBaseEffect Deprecated
Class
GLKBaseEffect Deprecated
A simple lighting and shading system for use in shader-based OpenGL rendering
iOS 5.0–12.0 Deprecated
iPadOS 5.0–12.0 Deprecated
macOS 10.8–10.14 Deprecated
tvOS 9.0–12.0 Deprecated


## Page 4

assigned a new position or spot direction, those values are immediately modified by the current
model view matrix. Thus, it is important to sequence changes to the model view matrix and
changes to the lights to achieve the desired light positioning.  Light positions that need to be
transformed in a manner similar to scene geometry should be set after the model view matrix is
updated.
Although this class can be subclassed, there are no methods your subclass can use to directly
override the underlying shader generation. Instead, your subclass should implement its
functionality by changing the values of existing properties declared by the base class.
var label: String?
A string used to name your effect.
var transform: GLKEffectPropertyTransform
The modelview, projection and texture transformations applied to the vertex data when the
effect is bound.
var lightingType: GLKLightingType
The strategy the effect uses to calculate light values at each fragment. See GLKLighting
Type.
var lightModelTwoSided: GLboolean
A Boolean value that indicates whether lighting is calculated for both sides of a primitive.
var material: GLKEffectPropertyMaterial
The material properties used when calculating the light values for a rendered primitive.
var lightModelAmbientColor: GLKVector4
The ambient color applied to all primitives rendered by the effect.
Subclassing
Topics
Naming the Effect
Configuring the Modelview Transform
Configuring Lights


## Page 5

var light0: GLKEffectPropertyLight
The lighting properties for the first light in the scene.
var light1: GLKEffectPropertyLight
The lighting properties for the second light in the scene.
var light2: GLKEffectPropertyLight
The lighting properties for the third light in the scene.
var texture2d0: GLKEffectPropertyTexture
The properties for the first texture.
var texture2d1: GLKEffectPropertyTexture
The properties for the second texture.
var textureOrder: [GLKEffectPropertyTexture]?
The order in which textures are applied to rendered primitives.
var fog: GLKEffectPropertyFog
The fog properties to apply to the scene.
var colorMaterialEnabled: GLboolean
A Boolean value that indicates whether or not to use the color vertex attribute when
calculating the light’s interaction with the material.
var useConstantColor: GLboolean
A Boolean value that indicates whether or not to use the constant color.
var constantColor: GLKVector4
A constant color, used when per-vertex color data is not provided.
func prepareToDraw()
Prepares an effect for rendering.
Configuring Textures
Configuring Fog
Configuring Color Information
Preparing the Effect for Drawing


## Page 6

typealias GLKEffectPropertyPrvPtr
NSObject
GLKReflectionMapEffect
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
GLKNamedEffect
Hashable
NSObjectProtocol
protocol GLKNamedEffect
A standard interface for objects that provide shader-based OpenGL rendering effects.
class GLKReflectionMapEffect
A lighting and shading system that supports reflection mapping for use in shader-based
OpenGL rendering.
Deprecated
Type Aliases
Relationships
Inherits From
Inherited By
Conforms To
See Also
Shader-Based Rendering Effects


## Page 7

class GLKSkyboxEffect
A simple skybox visual effect for use in shader-based OpenGL rendering.
Deprecated


## Page 8

Deprecated
OpenGLES API deprecated. (Define GLES_SILENCE_DEPRECATION to silence these warnings)
In addition to any of the properties provided by the GLKBaseEffect class, your application must
also configure the properties on the reflection map. The default value of the textureOrder
property provided by the base effect is modified to include the reflection map as a final texturing
stage; your application can modify the value of that property to change the order in which texturin
occurs.
The reflection map effect is calculated in accordance to section 2.11.4 of the OpenGL 2.1
specification GL_REFLECTION_MAP glTexGen() mode. It requires a cube map texture to define th
enclosing envelope from which to reflection map the scene.
Overview
Topics
Preparing the Reflection Effect
GLKit / GLKReflectionMapEffect Deprecated
Class
GLKReflectionMapEffect Deprecated
A lighting and shading system that supports reflection mapping for use in shader
based OpenGL rendering.
iOS 5.0–12.0 Deprecated
iPadOS 5.0–12.0 Deprecated
macOS 10.8–10.14 Deprecated
tvOS 9.0–12.0 Deprecated


## Page 9

func prepareToDraw()
Prepares an effect for rendering.
var textureCubeMap: GLKEffectPropertyTexture
The texture map to apply in the reflection stage.
var matrix: GLKMatrix3
The reflection matrix to apply to the normals of the submitted vertices.
GLKBaseEffect
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
Effect Properties
Relationships
Inherits From
Conforms To
See Also
Shader-Based Rendering Effects


## Page 10

Deprecated
class GLKSkyboxEffect
A simple skybox visual effect for use in shader-based OpenGL rendering.
Deprecated


## Page 11

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


## Page 12

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


## Page 13

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


