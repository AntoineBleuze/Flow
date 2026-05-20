# 005_CNCustomDetectionTrack.pdf

## Page 1

init(detections: [CNDetection], smooth: Bool)
Initializes a custom detection track object with an array of detections and optionally applying
smoothing.
var allDetections: [CNDetection]
All detected objects in the track.
CNDetectionTrack
Topics
Initializers
Instance Properties
Relationships
Inherits From
Cinematic / CNCustomDetectionTrack
Class
CNCustomDetectionTrack
An object representing a discrete detection track composed of individual
detections.
iOS 17.0+
iPadOS 17.0+
Mac Catalyst
macOS 14.0+
tvOS 17.0+


## Page 2

Editing Spatial Audio with an audio mix
Add Spatial Audio editing capabilities with the Audio Mix API in the Cinematic framework.
struct CNDetection
A structure that represents a detected subject, face, torso or pet at a particular time.
struct CNDecision
An object that represents a decision to focus on a particular detection, or group of detection
at a particular time.
class CNDetectionTrack
An object representing a series of detections of the same subject over time.
class CNFixedDetectionTrack
An object representing the fixed detection track.
enum CNDetectionType
The type of object detected, such as face, torso, cat, dog and so on.
See Also
Editing


