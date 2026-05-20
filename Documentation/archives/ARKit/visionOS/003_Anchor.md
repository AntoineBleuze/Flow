# 003_Anchor.pdf

## Page 1

var id: UUID
A unique identifier that distinguishes this anchor from all other anchors.
Required
var timestamp: TimeInterval
Required Default implementation provided.
var originFromAnchorTransform: simd_float4x4
The position and orientation of this anchor in world space.
Required
struct AnchorUpdate
Information about the event that updated an anchor.
struct AnchorUpdateSequence
An asynchronous sequence of updates to anchors.
Topics
Inspecting an anchor
Tracking anchors over time
ARKit / Anchor
Protocol
Anchor
The identity, location, and orientation of an object in world space.
macOS 26.0+
visionOS 1.0+


## Page 2

CustomStringConvertible
Identifiable
Sendable
SendableMetatype
TrackableAnchor
AccessoryAnchor
BarcodeAnchor
CameraRegionAnchor
DeviceAnchor
EnvironmentProbeAnchor
HandAnchor
ImageAnchor
MeshAnchor
ObjectAnchor
PlaneAnchor
RoomAnchor
WorldAnchor
Setting up access to ARKit data
Check whether your app can use ARKit and respect people’s privacy.
class ARKitSession
The main entry point for receiving data from ARKit.
Relationships
Inherits From
Inherited By
Conforming Types
See Also
visionOS


## Page 3

protocol DataProvider
A source of live data from ARKit.
ARKit in visionOS
Create immersive augmented reality experiences.


