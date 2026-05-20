# Editing.pdf

## Page 1

Beginning with iPhone 16, you can use Spatial Audio capture to record video with 3D audio, and
edit the audio mix in the Photos app. With Audio Mix, you have creative control of the background
and foreground sounds in a recording. It isolates speech as foreground and ambience as
background, and you can select between multiple creative rendering styles to adjust the mix.
The SpatialAudioCLI sample project is a command-line tool that demonstrates three differen
methods for applying an audio mix: using AVPlayer, using AVAssetWriter, and using AUAudi
Mix.
Note
This sample code project is associated with WWDC25 session 251: Enhance your app’s audio
content creation capabilities.
For best results, use SpatialAudioCLI with media that contains a Spatial Audio track. On all
iPhone 16 models, Spatial Audio recording is available when capturing video with the Camera app
See the iPhone User Guide for how to change sound recording options.
You can record Spatial Audio in your app by setting the multichannelAudioMode property of
the AVCaptureDeviceInput to a value of firstOrderAmbisonics.
Overview
Configure the sample code project
Cinematic / Editing Spatial Audio with an audio mix
Sample Code
Editing Spatial Audio with an audio mix
Add Spatial Audio editing capabilities with the Audio Mix API in the Cinematic
framework.
Download
macOS 26.0+
Xcode 26.0+


## Page 2

The simplest way to adjust the audio mix is to play Spatial Audio assets with AVPlayer.
First, the sample loads the specified input file into an AVPlayerItem:
Then the sample uses the AVAsset to initialize an instance of CNAssetSpatialAudioInfo:
The two primary mix parameters are effectIntensity and renderingStyle. The sample
creates an AVAudioMix with the specified mix parameters and sets it on the AVPlayerItem:
struct CNDetection
A structure that represents a detected subject, face, torso or pet at a particular time.
struct CNDecision
Adjust the audio mix in AVPlayer
See Also
Editing


## Page 3

An object that represents a decision to focus on a particular detection, or group of detection
at a particular time.
class CNDetectionTrack
An object representing a series of detections of the same subject over time.
class CNFixedDetectionTrack
An object representing the fixed detection track.
class CNCustomDetectionTrack
An object representing a discrete detection track composed of individual detections.
enum CNDetectionType
The type of object detected, such as face, torso, cat, dog and so on.


## Page 4

Specifies the type, distance bounds, and time of the detection. Detections obtained from the
Cinematic script include a unique number that can tracks the detection over time.
Some types of detections also include a unique group number that associates related detections
(for example, the face and torso of the same person).
init(time: CMTime, detectionType: CNDetectionType, normalizedRect:
CGRect, focusDisparity: Float)
Creates a Cinematic detection of a subject.
var detectionGroupID: CNDetectionGroupID?
A unique number representing the detection to focus on if this is a group decision.
Overview
Topics
Initializers
Instance Properties
Cinematic / CNDetection
Structure
CNDetection
A structure that represents a detected subject, face, torso or pet at a particular
time.
iOS 17.0+
iPadOS 17.0+
Mac Catalyst
macOS 14.0+
tvOS 17.0+


## Page 5

var detectionID: CNDetectionID?
An unique identifier assigned by the Cinematic script to all detections of the same subject an
detection type across time.
var detectionType: CNDetectionType
The type of object detected, such as the face, torso, cat, dog, and so on.
var focusDisparity: Float
The disparity to use in order to focus on the object.
var normalizedRect: CGRect
The rectangle within the image where the object occurs, normalized such that (0.0, 0.0) is th
top-left and (1.0, 1.0) is the bottom-right.
var time: CMTime
The first presentation time which the subject should be in focus.
static func accessibilityLabel(for: CNDetectionType) -> String
A localized accessibility label converting a specific detection type into a broad category suc
as a person, pet, and so on.
static func disparity(in: CGRect, sourceDisparity: CVPixelBuffer,
detectionType: CNDetectionType, priorDisparity: Float?) -> Float
Determines the disparity to use to focus on the object in the rectangle.
Sendable, SendableMetatype
Type Methods
Relationships
Conforms To
See Also
Editing


## Page 6

Editing Spatial Audio with an audio mix
Add Spatial Audio editing capabilities with the Audio Mix API in the Cinematic framework.
struct CNDecision
An object that represents a decision to focus on a particular detection, or group of detection
at a particular time.
class CNDetectionTrack
An object representing a series of detections of the same subject over time.
class CNFixedDetectionTrack
An object representing the fixed detection track.
class CNCustomDetectionTrack
An object representing a discrete detection track composed of individual detections.
enum CNDetectionType
The type of object detected, such as face, torso, cat, dog and so on.


## Page 7

init(time: CMTime, detectionGroupID: CNDetectionGroupID, strong: Bool)
Makes a decision to focus on the detection with the given unique detection.
init(time: CMTime, detectionID: CNDetectionID, strong: Bool)
Makes a decision to focus on the best among those detections with the same detection grou
ID.
var focusDetectionID: CNDecision.FocusDetectionID
var isStrongDecision: Bool
A flag representing whether this is a strong decision.
var isUserDecision: Bool
A flag representing whether this is a user-created decision or a base decision.
var time: CMTime
The first presentation time that the subject should be in focus.
Topics
Initializers
Instance Properties
Cinematic / CNDecision
Structure
CNDecision
An object that represents a decision to focus on a particular detection, or group of
detections, at a particular time.
iOS 17.0+
iPadOS 17.0+
Mac Catalyst
macOS 14.0+
tvOS 17.0+


## Page 8

enum FocusDetectionID
Equatable, Sendable, SendableMetatype
Editing Spatial Audio with an audio mix
Add Spatial Audio editing capabilities with the Audio Mix API in the Cinematic framework.
struct CNDetection
A structure that represents a detected subject, face, torso or pet at a particular time.
class CNDetectionTrack
An object representing a series of detections of the same subject over time.
class CNFixedDetectionTrack
An object representing the fixed detection track.
class CNCustomDetectionTrack
An object representing a discrete detection track composed of individual detections.
enum CNDetectionType
The type of object detected, such as face, torso, cat, dog and so on.
Enumerations
Relationships
Conforms To
See Also
Editing


## Page 9

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


## Page 10

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


## Page 11

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


## Page 12

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


## Page 13

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


## Page 14

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


## Page 15

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


## Page 16

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


## Page 17

An object representing a discrete detection track composed of individual detections.


