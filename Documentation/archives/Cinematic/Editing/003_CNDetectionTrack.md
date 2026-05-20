# 003_CNDetectionTrack.pdf

## Page 1

var detectionGroupID: CNDetectionGroupID
The detection group ID of the subject detected by the track.
var detectionID: CNDetectionID
The unique ID of the subject detected during this track.
var detectionType: CNDetectionType
The type of object that’s detected.
var isDiscrete: Bool
A flag determining if the detection track has discrete detections, otherwise continuous.
var isUserCreated: Bool
A flag indicating if the client created the detection track.
func detection(atOrBefore: CMTime) -> CNDetection?
Returns the array of detections in the detection track before a given time.
Topics
Instance Properties
Instance Methods
Cinematic / CNDetectionTrack
Class
CNDetectionTrack
An object representing a series of detections of the same subject over time.
iOS 17.0+
iPadOS 17.0+
Mac Catalyst
macOS 14.0+
tvOS 17.0+


## Page 2

func detection(nearest: CMTime) -> CNDetection?
Returns the array of detections in the detection track nearest a given time.
func detections(in: CMTimeRange) -> [CNDetection]
Returns the array of detections in the detection track within the given time range.
CNCustomDetectionTrack, CNFixedDetectionTrack
Editing Spatial Audio with an audio mix
Add Spatial Audio editing capabilities with the Audio Mix API in the Cinematic framework.
struct CNDetection
A structure that represents a detected subject, face, torso or pet at a particular time.
struct CNDecision
An object that represents a decision to focus on a particular detection, or group of detection
at a particular time.
class CNFixedDetectionTrack
An object representing the fixed detection track.
class CNCustomDetectionTrack
An object representing a discrete detection track composed of individual detections.
enum CNDetectionType
The type of object detected, such as face, torso, cat, dog and so on.
Relationships
Inherited By
See Also
Editing


