# 002_DataProvider.pdf

## Page 1

Most providers supply an asynchronous sequence of updated anchors for the provider’s data typ
For example, a HandTrackingProvider instance’s anchorUpdates property gives updates
over time for hand anchors.
var state: DataProviderState
The current status of data coming from this provider.
Required
static var requiredAuthorizations: [ARKitSession.AuthorizationType]
The kinds of authorization you need to use a particular data provider type.
Required
static var isSupported: Bool
Overview
Topics
Inspecting a data provider
Inspecting a data provider type
ARKit / DataProvider
Protocol
DataProvider
A source of live data from ARKit.
macOS 26.0+
visionOS 1.0+


## Page 2

A Boolean value that indicates whether the current runtime environment supports a particula
provider type.
Required
CustomStringConvertible, Sendable, SendableMetatype
AccessoryTrackingProvider
BarcodeDetectionProvider
CameraFrameProvider
CameraRegionProvider
EnvironmentLightEstimationProvider
HandTrackingProvider
ImageTrackingProvider
ObjectTrackingProvider
PlaneDetectionProvider
RoomTrackingProvider
SceneReconstructionProvider
SharedCoordinateSpaceProvider
StereoPropertiesProvider
WorldTrackingProvider
Setting up access to ARKit data
Check whether your app can use ARKit and respect people’s privacy.
class ARKitSession
The main entry point for receiving data from ARKit.
Relationships
Inherits From
Conforming Types
See Also
visionOS


## Page 3

protocol Anchor
The identity, location, and orientation of an object in world space.
ARKit in visionOS
Create immersive augmented reality experiences.


