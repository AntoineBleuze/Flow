# 009_HumanBodyActionCounter.pdf

## Page 1

init()
Creates a human body action counter.
func applied<S>(to: S, eventHandler: EventHandler?) async throws ->
HumanBodyActionCounter.OutputSequence
Predicts cumulative human body action counts from a sequence of human body pose
windows.
struct CumulativeSumSequence
Cumulative human body action count sequence.
Topics
Creating a transformer
Performing the transformation
Relationships
Create ML Components / HumanBodyActionCounter
Structure
HumanBodyActionCounter
A human body action repetition counting transformer that takes window of huma
body poses and produces cumulative human body action repetition counts.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+


## Page 2

Sendable, SendableMetatype, TemporalTransformer
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
struct JointsSelector
Joints selector from a pose.
struct HumanBodyPoseExtractor
The human body pose image feature extractor.
struct HumanHandPoseExtractor
The human hand pose image feature extractor.
struct HumanBodyActionPeriodPredictor
Conforms To
See Also
Pose components


## Page 3

A human body action period predictor transformer that takes window of poses and produces
window of predictions.


