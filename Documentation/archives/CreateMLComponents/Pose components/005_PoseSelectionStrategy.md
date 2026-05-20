# 005_PoseSelectionStrategy.pdf

## Page 1

case maximumBoundingBoxArea
The strategy to choose a pose with the maximum bounding box area.
case highestJointLocation
The strategy to choose a pose where a joint in it has the higest y coordinate location.
case leftmostJointLocation
The strategy to choose a pose where a joint in it has the leftmost x coordinate location.
case lowestJointLocation
The strategy to choose a pose where a joint in it has the lowest y coordinate location.
case rightmostJointLocation
The strategy to choose a pose where a joint in it has the leftmost x coordinate location.
Topics
Selection strategies
Relationships
Create ML Components / PoseSelectionStrategy
Enumeration
PoseSelectionStrategy
Pose selection strategy.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+


## Page 2

Copyable
Equatable
Hashable
Sendable
SendableMetatype
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
struct JointsSelector
Joints selector from a pose.
struct HumanBodyPoseExtractor
The human body pose image feature extractor.
struct HumanHandPoseExtractor
The human hand pose image feature extractor.
struct HumanBodyActionCounter
Conforms To
See Also
Pose components


## Page 3

A human body action repetition counting transformer that takes window of human body pos
and produces cumulative human body action repetition counts.
struct HumanBodyActionPeriodPredictor
A human body action period predictor transformer that takes window of poses and produces
window of predictions.


