# 005_GLKEffectPropertyTransform.pdf

## Page 1

Deprecated
OpenGLES API deprecated. (Define GLES_SILENCE_DEPRECATION to silence these warnings)
The GLKEffectPropertyTransform class defines properties that provide the coordinate
transformations to be performed when rendering the effect.
var modelviewMatrix: GLKMatrix4
The matrix used to transform position coordinates from world space to eye space.
var normalMatrix: GLKMatrix3
The matrix used to transform normal coordinates from world space to eye space.
Overview
Topics
Configuring Modelview Properties
GLKit / GLKEffectPropertyTransform Deprecated
Class
GLKEffectPropertyTransform Deprecated
Coordinate transform information for use in GLKit rendering effects.
iOS 5.0–12.0 Deprecated
iPadOS 5.0–12.0 Deprecated
macOS 10.8–10.14 Deprecated
tvOS 9.0–12.0 Deprecated


## Page 2

var projectionMatrix: GLKMatrix4
The matrix used to transform position coordinates from eye space to projection space.
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
Deprecated
class GLKEffectPropertyLight
Lighting information for use in GLKit rendering effects.
Deprecated
Configuring the Projection Matrix
Relationships
Inherits From
Conforms To
See Also
Rendering Effect Parameters


## Page 3

class GLKEffectPropertyTexture
Texture drawing parameters for use in GLKit rendering effects.
Deprecated
class GLKEffectPropertyMaterial
Surface appearance properties for use in GLKit rendering effects.
Deprecated
GLKit Effects Constants


