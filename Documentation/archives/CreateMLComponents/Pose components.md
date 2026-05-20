# Pose components.pdf

## Page 1

This sample app counts a person’s repetitive or periodic body movements (actions) by analyzing 
series of video frames and making a prediction with a human body action repetition counter. The
counter in this sample can count arbitrary body moves that occur at moderate speed, such as
jumping jacks, dance spins, and waving arms.
The app continually presents the current action repetition count on top of a live, full-screen video
feed from the camera in portrait orientation. When the app detects one or more people in the
frame, it overlays a wireframe body pose on each person. At the same time, the app predicts the
Overview
Create ML Components / Counting human body action repetitions in a live video feed
Sample Code
Counting human body action repetitions in
a live video feed
Use Create ML Components to analyze a series of video frames and count a
person’s repetitive or periodic body movements.
Download
iOS 16.0+
iPadOS 16.0+
Xcode 14.0+


## Page 2

action repetition count about the most prominent person across multiple frames, typically whoeve
is closest to the camera.
The app begins by configuring a camera to generate video frames, then directs the frames throug
a series of transformers it chains together with Create ML Components. These methods work
together to:
1. Read camera frames in real time using VideoReader.
2. Analyze each frame to locate any human body poses using HumanBodyPoseExtractor, and
redirect the pose stream with an AsyncChannel to allow multiple consumers.
3. Optionally, downsample the stream using a Downsampler to process the observed actions in
different speeds. To improve performance, you can move the downsampler to an earlier stage 
the pipeline if you don’t need to render poses on every frame.
4. Isolate the prominent pose using PoseSelector.
5. Optionally, use JointsSelector to select only joints of interest for counting.
6. Aggregate the prominent pose’s position data over time using SlidingWindowTransformer
7. Predict action repetitions by sending aggregate data to the HumanBodyActionCounter.
Note
This sample code project is associated with WWDC22 session 110332: What’s new in Create
ML.
This sample code project requires a device with iOS 16 or later, or iPadOS 16 or later. To build this
project:
1. Double-click the CountMyActions.xcodeproj project to open it in Xcode.
2. In Xcode, from the Project navigator, select the CountMyActions project and click the Signin
& Capabilities tab.
3. Select your development team from the Add Account pop-up menu.
4. Select your target device from the scheme menu, and choose Product > Run.
Configure the sample code project
Start a live video feed


## Page 3

The app uses VideoReader to configure the device’s camera and generate an asynchronous
video frame sequence. The VideoReader.CameraConfiguration specifies the front- or rear
facing camera, and configures its pixel format and resolution. This app supports portrait orientatio
only. Low lighting and other factors can vary the frame rate, which may affect the counting
performance, so ensure the person’s full body is visible in bright environments.
When the app first launches — or when the user toggles the camera — the video reader configure
a camera device, starts the video-processing pipeline, and produces a frame sequence output wi
readCamera(configuration:).
The HumanBodyPoseExtractor is a transformer that can locate any human body poses from a
image or a video frame.
Analyze each frame for body poses


## Page 4

When the transformation completes, the method creates and returns a Pose array that contains
one pose for every detected person in the same frame.
The Pose structure serves the following purposes:
Calculates the pose’s area within a frame (See the “Isolate a body pose” section below.).
Draws each detected pose as a wireframe of points and lines (See the “Present the poses to th
user” section below.).
For more information about the underlying human body pose model, see Detecting Human Body
Poses in Images.
AsyncChannel sends the extracted poses to a separate asynchronous stream. This allows
additional consumers to obtain poses from the upstream asynchronous sequence. AsyncChanne
requires the inclusion of the AsyncAlgorithms Swift package.
The ActionCounter structure consists of a pipeline of Create ML Components transformers to
achieve continuous action repetition counting. It takes a pose stream as input and returns an
asynchronous sequence of cumulative counts.
The first optional transformer in the pipeline, Downsampler, downsamples the incoming pose
sequence by an integer factor. This allows the pipeline to process and count much slower actions
For example, without downsampling, the original counter model can handle moderate speed
actions, about one repetition per second, such as jumping jacks. A downsampling factor of three
Create a pose stream
Create an action repetition counting pipeline
Downsample a pose stream


## Page 5

can effectively speed up slower actions, such as pushups or a complex dance sequence with abo
one repetition per 3 seconds, and still allow the model to count the actions.
The next transformer in the pipeline, PoseSelector, selects a single pose from the array of pos
by using the default strategy, namely, selecting the most prominent person by their maximum
bounding box area.
The goal of this strategy is to consistently select the same person’s pose from a crowd over time.
Important
Get the most accurate predictions by using whatever strategy best tracks a person from frame
to frame.
The next optional transformer in the pipeline, JointsSelector, selects or ignores a specified
subset of body joints from the pose.
For example, to count only upper-body movements, the transformer can ignore lower-body joints
the pose, such as knees and ankles, which can eliminate noise by ignoring any leg movements.
Isolate a body pose
Select a subset of body joints


## Page 6

The next transformer in the pipeline is a SlidingWindowTransformer that receives a pose
sequence from its upstream and gathers the frames into an array by providing the following
parameters:
A stride that determines the number of frames to count before updating the pose window
A length that determines the window size, namely, how many frames to group together
The action repetition counter assumes a fixed length of 90, where the sliding window transformer
groups 90 frames together to generate a single prediction count. The stride is adjustable. An
example is a stride of 10 frames, indicating the count updates every 10 frames, which is about 0.3
seconds if the frame rate is 30 frames per second. When the stride is smaller than the length, the
windows overlap.
The next transformer in the pipeline, HumanBodyActionCounter, takes a stream of grouped
pose windows as input and produces a HumanBodyActionCounter.CumulativeSum
Sequence where each result is a cumulative count of the actions in the sequence. Live counting
occurs by iterating each item in the resulted sequence.
The final count appears as a SwiftUI label on the screen using the OverlayView structure on the
main thread.
Gather a window of poses
Predict the person’s action repetition count
Present the count to the user
Present the poses to the user


## Page 7

The app visualizes the result of each detected human body pose by drawing the poses on top of
the frame that HumanBodyPoseExtractor finds them in. Each time the poseExtractor
creates an array of Pose instances, the PosesView iterates each detected pose and draws it by
calling its drawWireframe(to:applying:) method, which draws the pose as a wireframe of
connection lines and joint circles.
The ViewModel presents the image and poses onscreen by calling display(image:,
poses:) method.
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
See Also
Pose components


## Page 8

The human hand pose image feature extractor.
struct HumanBodyActionCounter
A human body action repetition counting transformer that takes window of human body pos
and produces cumulative human body action repetition counts.
struct HumanBodyActionPeriodPredictor
A human body action period predictor transformer that takes window of poses and produces
window of predictions.


## Page 9

init(VNRecognizedPointsObservation) throws
Creates a pose from a body or hand pose observation.
init(from: [JointKey : JointPoint])
Creates a pose from a dictionary of joint keypoints.
var keypoints: [JointKey : JointPoint]
A dictionary of all keypoints in the pose
func boundingBoxArea(confidenceThreshold: Float) -> Float
Computes the bounding box area of the pose.
Topics
Creating a pose
Getting the key points
Computing the bounding box
Default Implementations
Create ML Components / Pose
Structure
Pose
A pose that contains joint keypoints from a person, a hand, or a combination.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+


## Page 10

Decodable Implementations
Encodable Implementations
Copyable
Decodable
Encodable
Equatable
Sendable
SendableMetatype
Counting human body action repetitions in a live video feed
Use Create ML Components to analyze a series of video frames and count a person’s
repetitive or periodic body movements.
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
Relationships
Conforms To
See Also
Pose components


## Page 11

struct HumanBodyPoseExtractor
The human body pose image feature extractor.
struct HumanHandPoseExtractor
The human hand pose image feature extractor.
struct HumanBodyActionCounter
A human body action repetition counting transformer that takes window of human body pos
and produces cumulative human body action repetition counts.
struct HumanBodyActionPeriodPredictor
A human body action period predictor transformer that takes window of poses and produces
window of predictions.


## Page 12

static let leftElbow: JointKey
A key associated with left elbow joint in a body pose.
static let rightElbow: JointKey
A key associated with right elbow joint in a body pose.
static let leftEye: JointKey
A key associated with left eye joint in a body pose.
static let rightEye: JointKey
A key associated with right eye joint in a body pose.
static let leftEar: JointKey
A key associated with left ear joint in a body pose.
static let rightEar: JointKey
A key associated with right ear joint in a body pose.
Topics
Getting elbow properties
Getting head properties
Create ML Components / JointKey
Structure
JointKey
A key that uniquely identifies a joint.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+


## Page 13

static let nose: JointKey
A key associated with nose joint in a body pose.
static let indexDIP: JointKey
A key associated with index finger’s distal interphalangeal (DIP) joint in a hand pose.
static let indexMCP: JointKey
A key associated with index finger’s metacarpophalangeal (MCP) joint in a hand pose.
static let indexPIP: JointKey
A key associated with index finger’s proximal interphalangeal (PIP) joint in a hand pose.
static let indexTip: JointKey
A key associated with index finger tip joint in a hand pose.
static let littleDIP: JointKey
A key associated with ring finger’s distal interphalangeal (DIP) joint in a hand pose.
static let littleMCP: JointKey
A key associated with ring finger’s metacarpophalangeal (MCP) joint in a hand pose.
static let littlePIP: JointKey
A key associated with ring finger’s proximal interphalangeal (PIP) joint in a hand pose.
static let littleTip: JointKey
A key associated with ring finger tip joint in a hand pose.
static let middleDIP: JointKey
A key associated with middle finger’s distal interphalangeal (DIP) joint in a hand pose.
static let middleMCP: JointKey
A key associated with middle finger’s metacarpophalangeal (MCP) joint in a hand pose.
static let middlePIP: JointKey
A key associated with middle finger’s proximal interphalangeal (PIP) joint in a hand pose.
Getting index finger properties
Getting little finger properties
Getting middle finger properties


## Page 14

static let middleTip: JointKey
A key associated with middle finger tip joint in a hand pose.
static let ringDIP: JointKey
A key associated with ring finger’s distal interphalangeal (DIP) joint in a hand pose.
static let ringMCP: JointKey
A key associated with ring finger’s metacarpophalangeal (MCP) joint in a hand pose.
static let ringPIP: JointKey
A key associated with ring finger’s proximal interphalangeal (PIP) joint in a hand pose.
static let ringTip: JointKey
A key associated with ring finger tip joint in a hand pose.
static let thumbCMC: JointKey
A key associated with thumb carpometacarpal (CMC) joint in a hand pose.
static let thumbIP: JointKey
A key associated with thumb interphalangeal (IP) joint in a hand pose.
static let thumbMP: JointKey
A key associated with thumb metacarpophalangeal (MP) joint in a hand pose.
static let thumbTip: JointKey
A key associated with thumb tip joint in a hand pose.
static let leftWrist: JointKey
A key associated with left wrist joint in a body pose.
static let rightWrist: JointKey
A key associated with right wrist joint in a body pose.
static let wrist: JointKey
A key associated with hand wrist joint in a hand pose.
Getting ring finger properties
Getting thumb properties
Getting wrist properties


## Page 15

static let neck: JointKey
A key associated with neck joint in a body pose.
static let leftShoulder: JointKey
A key associated with left shoulder joint in a body pose.
static let rightShoulder: JointKey
A key associated with right shoulder joint in a body pose.
static let leftHip: JointKey
A key associated with left hip joint in a body pose.
static let leftKnee: JointKey
A key associated with left knee joint in a body pose.
static let rightHip: JointKey
A key associated with right hip joint in a body pose.
static let rightKnee: JointKey
A key associated with right knee joint in a body pose.
static let leftAnkle: JointKey
A key associated with left ankle joint in a body pose.
static let rightAnkle: JointKey
A key associated with right ankle joint in a body pose.
static let root: JointKey
A key associated with root joint in a body pose.
Getting neck and shoulder properties
Getting hip, knee, and ankle properties
Getting root and raw Properties
Relationships


## Page 16

Copyable
CustomDebugStringConvertible
Equatable
Hashable
RawRepresentable
Sendable
SendableMetatype
Counting human body action repetitions in a live video feed
Use Create ML Components to analyze a series of video frames and count a person’s
repetitive or periodic body movements.
struct Pose
A pose that contains joint keypoints from a person, a hand, or a combination.
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
Conforms To
See Also
Pose components


## Page 17

struct HumanBodyActionCounter
A human body action repetition counting transformer that takes window of human body pos
and produces cumulative human body action repetition counts.
struct HumanBodyActionPeriodPredictor
A human body action period predictor transformer that takes window of poses and produces
window of predictions.


## Page 18

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


## Page 19

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


## Page 20

struct HumanHandPoseExtractor
The human hand pose image feature extractor.
struct HumanBodyActionCounter
A human body action repetition counting transformer that takes window of human body pos
and produces cumulative human body action repetition counts.
struct HumanBodyActionPeriodPredictor
A human body action period predictor transformer that takes window of poses and produces
window of predictions.


## Page 21

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


## Page 22

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


## Page 23

The human body pose image feature extractor.
struct HumanHandPoseExtractor
The human hand pose image feature extractor.
struct HumanBodyActionCounter
A human body action repetition counting transformer that takes window of human body pos
and produces cumulative human body action repetition counts.
struct HumanBodyActionPeriodPredictor
A human body action period predictor transformer that takes window of poses and produces
window of predictions.


## Page 24

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


## Page 25

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


## Page 26

A human body action repetition counting transformer that takes window of human body pos
and produces cumulative human body action repetition counts.
struct HumanBodyActionPeriodPredictor
A human body action period predictor transformer that takes window of poses and produces
window of predictions.


## Page 27

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


## Page 28

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


## Page 29

struct HumanHandPoseExtractor
The human hand pose image feature extractor.
struct HumanBodyActionCounter
A human body action repetition counting transformer that takes window of human body pos
and produces cumulative human body action repetition counts.
struct HumanBodyActionPeriodPredictor
A human body action period predictor transformer that takes window of poses and produces
window of predictions.


## Page 30

init()
Creates a human body pose extractor transformer
func applied(to: CIImage, eventHandler: EventHandler?) async throws -> 
Pose]
Extracts human body poses from a pixel buffer.
Copyable
CustomDebugStringConvertible
Sendable
Topics
Creating the extractor
Extracting the body pose
Relationships
Conforms To
Create ML Components / HumanBodyPoseExtractor
Structure
HumanBodyPoseExtractor
The human body pose image feature extractor.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+


## Page 31

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
struct JointsSelector
Joints selector from a pose.
struct HumanHandPoseExtractor
The human hand pose image feature extractor.
struct HumanBodyActionCounter
A human body action repetition counting transformer that takes window of human body pos
and produces cumulative human body action repetition counts.
struct HumanBodyActionPeriodPredictor
A human body action period predictor transformer that takes window of poses and produces
window of predictions.
See Also
Pose components


## Page 32



## Page 33

init()
Creates a human hand pose extractor transformer
func applied(to: CIImage, eventHandler: EventHandler?) async throws -> 
Pose]
Extracts human hand poses from a pixel buffer.
Copyable
CustomDebugStringConvertible
Sendable
Topics
Creating the extractor
Extracting the hand pose
Relationships
Conforms To
Create ML Components / HumanHandPoseExtractor
Structure
HumanHandPoseExtractor
The human hand pose image feature extractor.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+


## Page 34

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
struct JointsSelector
Joints selector from a pose.
struct HumanBodyPoseExtractor
The human body pose image feature extractor.
struct HumanBodyActionCounter
A human body action repetition counting transformer that takes window of human body pos
and produces cumulative human body action repetition counts.
struct HumanBodyActionPeriodPredictor
A human body action period predictor transformer that takes window of poses and produces
window of predictions.
See Also
Pose components


## Page 35



## Page 36

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


## Page 37

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


## Page 38

A human body action period predictor transformer that takes window of poses and produces
window of predictions.


## Page 39

init()
Creates a human body action period predictor transformer.
func applied(to: [Pose], eventHandler: EventHandler?) async throws -> [
HumanBodyActionPeriodPredictor.Prediction]
Predicts human body action periods from an array of poses.
struct Prediction
A human body action period prediction.
Topics
Creating a transformer
Performing the transformation
Relationships
Conforms To
Create ML Components / HumanBodyActionPeriodPredictor
Structure
HumanBodyActionPeriodPredictor
A human body action period predictor transformer that takes window of poses an
produces a window of predictions.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+


## Page 40

Sendable, SendableMetatype, Transformer
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
struct HumanBodyActionCounter
A human body action repetition counting transformer that takes window of human body pos
and produces cumulative human body action repetition counts.
See Also
Pose components


