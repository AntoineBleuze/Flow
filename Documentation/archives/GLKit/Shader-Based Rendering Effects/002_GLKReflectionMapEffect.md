# 002_GLKReflectionMapEffect.pdf

## Page 1

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


## Page 2

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


## Page 3

Deprecated
class GLKSkyboxEffect
A simple skybox visual effect for use in shader-based OpenGL rendering.
Deprecated


