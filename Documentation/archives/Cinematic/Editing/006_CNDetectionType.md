# 006_CNDetectionType.pdf

## Page 1

case autoFocus
case catBody
case catHead
case custom
case dogBody
case dogHead
case fixedFocus
case humanFace
case humanHead
case humanTorso
case sportsBall
case unknown
Topics
Enumeration Cases
Cinematic / CNDetectionType
Enumeration
CNDetectionType
The type of object detected, such as face, torso, cat, dog and so on.
iOS 17.0+
iPadOS 17.0+
Mac Catalyst 17.0+
macOS 14.0+
tvOS 17.0+


## Page 2

init?(rawValue: Int)
BitwiseCopyable
Equatable
Hashable
RawRepresentable
Sendable
SendableMetatype
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
class CNCustomDetectionTrack
Initializers
Relationships
Conforms To
See Also
Editing


## Page 3

An object representing a discrete detection track composed of individual detections.


