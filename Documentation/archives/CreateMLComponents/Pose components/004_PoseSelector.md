# 004_PoseSelector.pdf

## Page 1

init()
Creates a pose selector.
init(strategy: PoseSelectionStrategy)
Creates a pose selector.
init(strategy: PoseSelectionStrategy, confidenceThreshold: Float)
Creates a pose selector.
var confidenceThreshold: Float
A threshold confidence between 0 to 1 for the joints to be considered valid in pose selection
The default value is 0.2.
var strategy: PoseSelectionStrategy
Pose selection strategy.
Topics
Creating a selector
Getting the properties
Performing the transformation
Create ML Components / PoseSelector
Structure
PoseSelector
A transformer that selects one pose from an array of poses.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+


## Page 2

func applied(to: [Pose], eventHandler: EventHandler?) -> Pose
Select a pose if multiple poses are detected on the same frame.
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
enum PoseSelectionStrategy
Pose selection strategy.
struct JointsSelector
Joints selector from a pose.
struct HumanBodyPoseExtractor
Relationships
Conforms To
See Also
Pose components


## Page 3

The human body pose image feature extractor.
struct HumanHandPoseExtractor
The human hand pose image feature extractor.
struct HumanBodyActionCounter
A human body action repetition counting transformer that takes window of human body pos
and produces cumulative human body action repetition counts.
struct HumanBodyActionPeriodPredictor
A human body action period predictor transformer that takes window of poses and produces
window of predictions.


