# 000_TextureTopology.pdf

## Page 1

Metal supports multiple organizations for the textures you use for drawing. Use this type to identi
one of the organizations available to use in your app.
var textureType: MTLTextureType
The texture type value that specifies how the underlying texture organizes its views.
var arrayLength: UInt64
The number of items in the texture array.
init()
Overview
Topics
Getting the topology type
Getting the array length
Creating a topology
Compositor Services / TextureTopology
Structure
TextureTopology
A type that specifies the organization of one of the drawable’s textures.
macOS 26.0+
visionOS 1.0+


## Page 2

Creates a texture topology.
BitwiseCopyable
var textureTopologies: [TextureTopology]
The texture topologies available for the layer.
Relationships
Conforms To
See Also
Getting the layer’s texture topology


