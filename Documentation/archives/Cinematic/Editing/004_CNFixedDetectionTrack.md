# 004_CNFixedDetectionTrack.pdf

## Page 1

init(focusDisparity: Float)
Creates a detection track with fixed focus at the given disparity.
init(originalDetection: CNDetection)
Creates a detection track with fixed focus at the disparity of an existing detection.
var focusDisparity: Float
The disparity to use in order to focus on the object.
var originalDetection: CNDetection?
The original detection based on the fixed detection track.
Topics
Initializers
Instance Properties
Relationships
Cinematic / CNFixedDetectionTrack
Class
CNFixedDetectionTrack
An object representing the fixed detection track.
iOS 17.0+
iPadOS 17.0+
Mac Catalyst
macOS 14.0+
tvOS 17.0+


## Page 2

CNDetectionTrack
Editing Spatial Audio with an audio mix
Add Spatial Audio editing capabilities with the Audio Mix API in the Cinematic framework.
struct CNDetection
A structure that represents a detected subject, face, torso or pet at a particular time.
struct CNDecision
An object that represents a decision to focus on a particular detection, or group of detection
at a particular time.
class CNDetectionTrack
An object representing a series of detections of the same subject over time.
class CNCustomDetectionTrack
An object representing a discrete detection track composed of individual detections.
enum CNDetectionType
The type of object detected, such as face, torso, cat, dog and so on.
Inherits From
See Also
Editing


