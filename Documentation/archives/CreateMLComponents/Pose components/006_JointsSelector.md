# 006_JointsSelector.pdf

## Page 1

init(ignoredJoints: [JointKey])
Creates a joint selector transformer using a list of joint keys to be ignored.
init(selectedJoints: [JointKey])
Creates a joint selector transformer using a list of joint keys to be selected.
var ignoredJoints: [JointKey]?
A list of joint keys to be ignored.
var selectedJoints: [JointKey]?
A list of joint keys to be selected.
func applied(to: Pose, eventHandler: EventHandler?) -> Pose
Topics
Creating a selector
Getting the properties
Performing the selector
Create ML Components / JointsSelector
Structure
JointsSelector
Joints selector from a pose.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+


## Page 2

Select joints to be included in the pose. Ignored joints will be reset to zero in all fields.
Copyable
CustomDebugStringConvertible
Sendable
SendableMetatype
Transformer
Counting human body action repetitions in a live video feed
Use Create ML Components to analyze a series of video frames and count a person’s
repetitive or periodic body movements.
struct Pose
A pose that contains joint keypoints from a person, a hand, or a combination.
struct JointKey
A key that uniquely identifies a joint.
struct JointPoint
A joint in a pose that contains a location and scoring information.
struct PoseSelector
A transformer that selects one pose from an array of poses.
enum PoseSelectionStrategy
Pose selection strategy.
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


