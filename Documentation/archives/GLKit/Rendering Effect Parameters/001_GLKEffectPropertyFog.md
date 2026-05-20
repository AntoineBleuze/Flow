# 001_GLKEffectPropertyFog.pdf

## Page 1

Deprecated
OpenGLES API deprecated. (Define GLES_SILENCE_DEPRECATION to silence these warnings)
These properties are specifically designed to mimic the fog calculations provided by OpenGL ES
1.1.
When fog is enabled, the fog component is calculated and clamped to a range from 0.0 to 1.0.
Then, the fog value is used as a blending factor between the computed fragment color and the fo
color.
var enabled: GLboolean
A Boolean value that indicates whether fog is applied to the fragment color.
Overview
Topics
Enabling Fog
GLKit / GLKEffectPropertyFog Deprecated
Class
GLKEffectPropertyFog Deprecated
Fog drawing information for use in GLKit rendering effects.
iOS 5.0–12.0 Deprecated
iPadOS 5.0–12.0 Deprecated
macOS 10.8–10.14 Deprecated
tvOS 9.0–12.0 Deprecated


## Page 2

var mode: GLint
The algorithm used to compute the density of the fog applied to the fragment color.
var color: GLKVector4
The color of the fog at maximum density.
var density: GLfloat
The rate at which the fog exponent increases.
var start: GLfloat
The minimum distance in eye coordinates before fog is applied to the fragment color.
var end: GLfloat
The distance in eye coordinates where fog completely covers the color fragment.
enum GLKFogMode
A mode that describes how the fog component is calculated for the fragment.
GLKEffectProperty
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
Choosing the Fog Mode
Fog Properties
Constants
Relationships
Inherits From
Conforms To


## Page 3

NSObjectProtocol
class GLKEffectProperty
The abstract superclass for configuration information used in GLKit rendering effects.
Deprecated
class GLKEffectPropertyLight
Lighting information for use in GLKit rendering effects.
Deprecated
class GLKEffectPropertyTexture
Texture drawing parameters for use in GLKit rendering effects.
Deprecated
class GLKEffectPropertyMaterial
Surface appearance properties for use in GLKit rendering effects.
Deprecated
class GLKEffectPropertyTransform
Coordinate transform information for use in GLKit rendering effects.
Deprecated
GLKit Effects Constants
See Also
Rendering Effect Parameters


