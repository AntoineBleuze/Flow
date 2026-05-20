# 004_GLKEffectPropertyMaterial.pdf

## Page 1

Deprecated
OpenGLES API deprecated. (Define GLES_SILENCE_DEPRECATION to silence these warnings)
The GLKEffectPropertyMaterial class defines properties used to configure the
characteristics of the surface being lit. The material properties for an effect interact with light
properties on the same effect to determine how that surface is lit within the scene. The behavior o
this class matches the material properties and lighting calculations defined in the OpenGL ES 1.1
specification.
var ambientColor: GLKVector4
The ambient color of the material.
Overview
Topics
Material Properties
GLKit / GLKEffectPropertyMaterial Deprecated
Class
GLKEffectPropertyMaterial Deprecated
Surface appearance properties for use in GLKit rendering effects.
iOS 5.0–12.0 Deprecated
iPadOS 5.0–12.0 Deprecated
macOS 10.8–10.14 Deprecated
tvOS 9.0–12.0 Deprecated


## Page 2

var diffuseColor: GLKVector4
The diffuse color of the material.
var emissiveColor: GLKVector4
The emissive color of the material.
var shininess: GLfloat
The shininess of the material, used when calculating specular lighting effects.
var specularColor: GLKVector4
The specular color of the material.
GLKEffectProperty
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
class GLKEffectProperty
The abstract superclass for configuration information used in GLKit rendering effects.
Deprecated
class GLKEffectPropertyFog
Fog drawing information for use in GLKit rendering effects.
Relationships
Inherits From
Conforms To
See Also
Rendering Effect Parameters


## Page 3

Deprecated
class GLKEffectPropertyLight
Lighting information for use in GLKit rendering effects.
Deprecated
class GLKEffectPropertyTexture
Texture drawing parameters for use in GLKit rendering effects.
Deprecated
class GLKEffectPropertyTransform
Coordinate transform information for use in GLKit rendering effects.
Deprecated
GLKit Effects Constants


