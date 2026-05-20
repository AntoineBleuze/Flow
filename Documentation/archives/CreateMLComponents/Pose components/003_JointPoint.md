# 003_JointPoint.pdf

## Page 1

init(JointKey, location: CGPoint, confidence: Float)
Creates a joint point with its key, location and confidence.
var confidence: Float
A detection confidence of the joint
let key: JointKey
The key name for the joint
var location: CGPoint
Topics
Creating a joint point
Getting the detection confidence
Getting the key name
Getting the joint location
Create ML Components / JointPoint
Structure
JointPoint
A joint in a pose that contains a location and scoring information.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+


## Page 2

The location of the joint point
Copyable
Equatable
Sendable
SendableMetatype
Counting human body action repetitions in a live video feed
Use Create ML Components to analyze a series of video frames and count a person’s
repetitive or periodic body movements.
struct Pose
A pose that contains joint keypoints from a person, a hand, or a combination.
struct JointKey
A key that uniquely identifies a joint.
struct PoseSelector
A transformer that selects one pose from an array of poses.
enum PoseSelectionStrategy
Pose selection strategy.
struct JointsSelector
Joints selector from a pose.
struct HumanBodyPoseExtractor
The human body pose image feature extractor.
Relationships
Conforms To
See Also
Pose components


## Page 3

struct HumanHandPoseExtractor
The human hand pose image feature extractor.
struct HumanBodyActionCounter
A human body action repetition counting transformer that takes window of human body pos
and produces cumulative human body action repetition counts.
struct HumanBodyActionPeriodPredictor
A human body action period predictor transformer that takes window of poses and produces
window of predictions.


