# Rendering Effect Parameters.pdf

## Page 1

Deprecated
OpenGLES API deprecated. (Define GLES_SILENCE_DEPRECATION to silence these warnings)
Subclasses of GLKEffectProperty provide one or more Objective-C properties that define how
that state can be configured for an effect.
NSObject
GLKEffectPropertyFog
Overview
Relationships
Inherits From
Inherited By
GLKit / GLKEffectProperty Deprecated
Class
GLKEffectProperty Deprecated
The abstract superclass for configuration information used in GLKit rendering
effects.
iOS 5.0–12.0 Deprecated
iPadOS 5.0–12.0 Deprecated
macOS 10.8–10.14 Deprecated
tvOS 9.0–12.0 Deprecated


## Page 2

GLKEffectPropertyLight
GLKEffectPropertyMaterial
GLKEffectPropertyTexture
GLKEffectPropertyTransform
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
class GLKEffectPropertyFog
Fog drawing information for use in GLKit rendering effects.
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
Conforms To
See Also
Rendering Effect Parameters


## Page 3

GLKit Effects Constants


## Page 4

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


## Page 5

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


## Page 6

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


## Page 7

Deprecated
OpenGLES API deprecated. (Define GLES_SILENCE_DEPRECATION to silence these warnings)
The lighting model implemented by GLKEffectPropertyLight is identical to the lighting mod
implemented in OpenGL ES 1.1; each light interacts with any material properties on the effect to
determine the intensity and color that particular light contributes to the scene at a fragment.
There are three basic kinds of lights: directional, point and spotlights.
A directional light is considered to be infinitely far away, and always directs light in the same
direction. To create a directional light, set the position property to a vector whose x, y, and 
components specify the direction to the light (that is, the negation of the direction the light is
travelling in), and whose w component is set to 0.0.
A point light is placed at a position within the scene, and emits light in all directions. To create a
directional light, set the position property to a vector whose x, y, z and w components
specify the homogenous coordinates for the position of the light in the scene. The w componen
is typically set to 1.0 and must not be set to 0.0.
The intensity of a point light is adjusted using an distance attenuation function. This function is
controlled by adjusting the constantAttenuation, linearAttenuation or quadratic
Overview
GLKit / GLKEffectPropertyLight Deprecated
Class
GLKEffectPropertyLight Deprecated
Lighting information for use in GLKit rendering effects.
iOS 5.0–12.0 Deprecated
iPadOS 5.0–12.0 Deprecated
macOS 10.8–10.14 Deprecated
tvOS 9.0–12.0 Deprecated


## Page 8

Attenuation properties. The default values for these properties create a light whose intensity i
constant over distance.
A spotlight is placed at a position within the scene, and emits light in a specific direction in a
cone. To create a spotlight, set the position property to a vector whose x, y, z and w
components specify the homogenous coordinates for the position of the light in the scene. The
w component must not be set to 0.0. Then, set the spotDirection property to a vector that
specifies the direction of the light and the spotCutoff to a value less than 180.0.
Like a point light, a spotlight’s intensity can be adjusted using the distance attenuation properties
A spotlight’s intensity can also be changed as a function of the spotlight angle by setting the spo
Exponent property. The default value for a spotlight creates a spotlight whose intensity is not
affected by the angle. That is, the spotlight radiates the same amount of light at the center and at
the edge of the cone.
Lighting calculations are performed in eye-space coordinates.  The eye-space coordinates for the
position and the spot direction are calculated at the precise moment that new position values are
specified and may be affected by other properties of the effect. For more information, see
GLKBaseEffect.
var enabled: GLboolean
A Boolean value that indicates whether calculations should be performed on this light.
var position: GLKVector4
The position of the light in world coordinates.
var transform: GLKEffectPropertyTransform
A transform applied to the light’s position and direction before calculating the contribution o
the light.
var ambientColor: GLKVector4
The ambient portion of the light.
var diffuseColor: GLKVector4
The diffuse portion of the light.
var specularColor: GLKVector4
Topics
Configuring Common Lighting Properties
Configuring Light Colors


## Page 9

The specular portion of the light.
var constantAttenuation: GLfloat
A constant factor applied to the attenuation of a point light or spotlight.
var linearAttenuation: GLfloat
A linear factor applied to the attenuation of a point light or spotlight.
var quadraticAttenuation: GLfloat
A quadratic factor applied to the attenuation of a point light or spotlight.
var spotCutoff: GLfloat
The angle in degrees where the spotlight is cut off.
var spotDirection: GLKVector3
A vector indicating the direction the spotlight is projecting.
var spotExponent: GLfloat
A value indicating how focused the spotlight is.
enum GLKLightingType
A constant that describes how lighting is calculated by an effect.
GLKEffectProperty
CVarArg
Configuring Lighting Attenuation
Configuring Spotlight Properties
Constants
Relationships
Inherits From
Conforms To


## Page 10

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


## Page 11

Deprecated
OpenGLES API deprecated. (Define GLES_SILENCE_DEPRECATION to silence these warnings)
The GLKEffectPropertyTexture class defines properties that are used to configure an
OpenGL texturing operation. The texturing operation combines an input color and a color sampled
from the texture and outputs a new color to the next stage of calculations. The envMode property
determines the function used to calculate the output color from the two input colors.
If an effect only includes a single texture property, then the input color is the lighting color
calculated by the lighting stage of the graphics pipeline. An effect can also include multiple
GLKEffectPropertyTexture objects. When an effect includes multiple properties, the first
texture stage uses the lighting color as the first input color. Each texture stage after that uses the
output of the previous stage as the input color.
Overview
Topics
Configuring Texture Properties
GLKit / GLKEffectPropertyTexture Deprecated
Class
GLKEffectPropertyTexture Deprecated
Texture drawing parameters for use in GLKit rendering effects.
iOS 5.0–12.0 Deprecated
iPadOS 5.0–12.0 Deprecated
macOS 10.8–10.14 Deprecated
tvOS 9.0–12.0 Deprecated


## Page 12

var enabled: GLboolean
A Boolean value that indicates whether this texture is used to texture drawn primitives.
var envMode: GLKTextureEnvMode
The mode the texture uses to compute its output fragment color. See GLKTextureEnvMod
var name: GLuint
The OpenGL name for the texture being sampled by this texture stage.
var target: GLKTextureTarget
The kind of texture pointed to by the texture stage. See GLKTextureTarget.
enum GLKTextureTarget
The kind of texture pointed to by the property.
enum GLKTextureEnvMode
The mode used to combine the texture with other color components.
GLKEffectProperty
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Constants
Relationships
Inherits From
Conforms To
See Also


## Page 13

class GLKEffectProperty
The abstract superclass for configuration information used in GLKit rendering effects.
Deprecated
class GLKEffectPropertyFog
Fog drawing information for use in GLKit rendering effects.
Deprecated
class GLKEffectPropertyLight
Lighting information for use in GLKit rendering effects.
Deprecated
class GLKEffectPropertyMaterial
Surface appearance properties for use in GLKit rendering effects.
Deprecated
class GLKEffectPropertyTransform
Coordinate transform information for use in GLKit rendering effects.
Deprecated
GLKit Effects Constants
Rendering Effect Parameters


## Page 14

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


## Page 15

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


## Page 16

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


## Page 17

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


## Page 18

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


## Page 19

class GLKEffectPropertyTexture
Texture drawing parameters for use in GLKit rendering effects.
Deprecated
class GLKEffectPropertyMaterial
Surface appearance properties for use in GLKit rendering effects.
Deprecated
GLKit Effects Constants


## Page 20

GLKit effects implement shaders to perform their calculations. These shaders require vertex data
to be provided by your application. All of the effects provided by GLKit use a consistent set of
indices to reference vertex data provided by your application. When your application enables a
vertex attribute array by calling the glEnableVertexAttribArray function, or specifies the
vertex attribute pointer by calling the glVertexAttribPointer function, it uses one of these
constants to specify the index parameter.
enum GLKVertexAttrib
Values used as indices in OpenGL code to associate vertex data with an attribute in a named
shader effect.
class GLKEffectProperty
The abstract superclass for configuration information used in GLKit rendering effects.
Deprecated
Overview
Topics
Constants
See Also
Rendering Effect Parameters
GLKit / GLKit Effects Constants
API Collection
GLKit Effects Constants


## Page 21

class GLKEffectPropertyFog
Fog drawing information for use in GLKit rendering effects.
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


