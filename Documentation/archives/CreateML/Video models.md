# Video models.pdf

## Page 1

An action classifier is a machine learning model that identifies a person’s body movements in a
video. For example, an action classifier you train to classify exercise movements can predict
“jumping jacks” when you provide it with a video of a person doing jumping jacks.
Create an action classifier with Create ML by gathering example videos of individuals performing
each action you want the classifier to recognize and identify. For example, to train an exercise
action classifier, gather videos of individuals performing various exercises, such as jumping jacks
squats, and lunges.
Create ML uses Vision during training to find significant points on a person’s body, called
landmarks, in each frame of a video. Action classifiers learn to recognize the movement patterns o
these points over time. For more information about how to use Vision to locate body landmarks, s
Detecting Human Body Poses in Images.
Overview
Create ML / Creating an Action Classifier Model
Article
Creating an Action Classifier Model
Train a machine learning model to recognize a person’s body movements.


## Page 2

The Create ML developer tool helps you train, assess, and preview an action classifier model. You
can train multiple models in a single project by configuring a model source — a combination of
training data and parameters — for each. Once you’re satisfied with an action classifier, export it a
a Core ML model file to add it to your Xcode project.
At runtime, your app uses the action classifier to identify a person’s action by analyzing a series o
video frames from a camera or file.
Training an action classifier with the Create ML developer tool follows the same general workflow
as other model types, such as an image classifier (see Creating an Image Classifier Model).
However, the workflow for an action classifier has some important differences, including:
Configuring the action classifier’s frame rate based on its destination app
Acquiring videos that meet or exceed that frame rate
Acquiring videos of humans clearly performing actions in a suitable environment
Acquiring videos of related but irrelevant actions
Note
Session 10043: Build an Action Classifier with Create ML
Before you create an action classifier, decide what frame rate — the number of video frames, per
second — the destination app uses from a camera or file.
Important
Your app’s frame rate is a significant factor that affects your action classifier and the training
data you’ll need to collect.
Plan to match your action classifier’s frame rate to the destination app’s frame rate. For example, 
your app acquires video from a camera at 30 frames per second (fps), plan to configure your acti
classifier to 30 fps.
Choose a Frame Rate


## Page 3

Once you’ve determined your action classifier’s frame rate, collect training videos. Unlike the
classifier and destination app frame rates that need to match, the frame rates of these videos can
be greater than or equal to the classifier’s frame rate. For example, you can use videos at 30, 50, 
60 frames per second to train an action classifier you configure to 30 fps.
Collect at least 50 example videos for each action you want the action classifier to identify. Make
sure each example video clearly shows a single person performing the action. For videos of
multiple people, ensure the individual performing the action is the largest and most dominant
person in the frame.
Additionally, collect example videos for a negative class, which is a group of related actions the
action classifier might see but aren’t relevant to your app. Negative classes help action classifiers
avoid mistaking irrelevant actions for relevant ones.
See Gathering Training Videos for an Action Classifier for more details on collecting high-quality
training videos and creating negative classes.
The Create ML developer tool supports several types of data sources, each with its own
arrangement of files within a parent folder. For example, two common data-source types are:
Single-action video files sorted into labeled folders
Single- or multiple-action video files and one annotation file
See Building an Action Classifier Data Source for detailed instructions on organizing your video fil
into one of these arrangements.
Collect Example Action Videos
Organize the Example Videos


## Page 4

Open the developer tool by choosing Xcode > Open Developer Tool > Create ML, and create a ne
Action Classification project.
In the Data section of the model source’s Settings tab, drag the parent folder of your training data
source onto the Training Data box.
Configure an Action Classification Project


## Page 5

If applicable, drag your validation and testing data sources’ folders onto the Validation Data and
Testing Data boxes, respectively. If you don’t provide a data source for validation, Create ML
automatically configures Validation Data to use a portion of Training Data’s data source.
Configure the action classifier’s model source by setting the values in the Parameters section. Se
the Frame Rate parameter to the same value as your destination app’s frame rate. For example, if
the action classifier’s destination app captures and analyzes video at 30 frames per second, set
Frame Rate to 30 fps.
Choose an Action Duration based on the time it takes to complete most of the data source’s
actions. For example, if the majority of actions in the training video files take about two seconds,
set Action Duration to 2 seconds.


## Page 6

Create ML calculates the model’s prediction window size — the number of frames it needs to mak
a prediction — by multiplying the Frame Rate and Action Duration settings. In this example, the
prediction window is 60 frames long, or 30 fps multiplied by 2 seconds.
If all the actions are equally valid from the camera’s left or right, you can effectively double your
training data by enabling the Horizontal Flip augmentation. When you enable Horizontal Flip, Crea
ML makes a horizontally mirrored copy of the landmark position outputs for each video frame
Vision analyzes.
To begin the training session, click Train. Create ML starts with the feature-extraction phase, usin
a VNDetectHumanBodyPoseRequest to find the person’s body landmarks in each frame.
The feature-extraction phase can take some time, depending on the size of the training data and
your Mac’s performance. Upon completion, Create ML starts the training phase, where it teaches
the action classifier to recognize the actions from sequences of landmark outputs. As it learns,
Create ML displays a plot of the model’s accuracy against training iteration.
Train the Action Classifier


## Page 7

If you need to temporarily suspend the training session for any reason, such as to save battery
power, click Pause. When you’re ready to continue training, click Resume.
If you want to try a preliminary version of the model before it’s finished training, click Snapshot. Yo
can create a Core ML model file from a snapshot by selecting the snapshot and then exporting it 
the Output tab. See Export the Action Classifier section below for more details about the Output
tab.
Evaluate the model’s prediction accuracy by inspecting its Recall and Precision metrics for the
training, validation, or testing phases in the Evaluation tab.
If the action classifier doesn’t meet your needs, click Train More to further train the model. If the
additional training iterations don’t improve the action classifier’s performance, you can select File
New Model Source to train a model with either or both of the following:
A new or modified training-data source
Different parameters
Assess the Action Classifier


## Page 8

If you need an action classifier with better accuracy, try adjusting the Action Duration parameter o
enabling the Horizontal Flip augmentation. If the action classifier struggles to identify specific
actions, create or modify a data source with additional, high-quality example videos of those
actions.
If an action classifier misidentifies a nonaction as an action, create or augment a negative class
with examples of that irrelevant action. See Gathering Training Videos for an Action Classifier for
more information about creating a negative class.
Once you’ve configured the new model source, click Train to create a new action classifier with th
configuration. Repeat the process of evaluating, adjusting, and training action classifiers until
you’re satisfied with the performance of one of them.
Use the Preview tab to quickly test your action classifier before you add it to an Xcode project. Ge
a visual sense of how the model works by dragging in a video and clicking the Play button to see
the model’s predictions.
When you drag in a video file, Create ML uses the action classifier to analyze the entire file at onc
When you play the video, Create ML shows the action classifier’s predictions for each frame in rea
time.
Tip
Quickly test an action classifier’s ability to recognize all of its action classes by previewing an
action montage video.
To save an action classifier as a Core ML file, select the Output tab and click the Get, Xcode, or
Share button. You can export a model from any model source that’s finished training or from any
snapshot you created while training the model.
For an example app that integrates and applies an action classifier, see the related sample code
projects:
Detecting human actions in a live video feed
Building a feature-rich app for sports analysis
Preview the Action Classifier
Export the Action Classifier


## Page 9

Gathering Training Videos for an Action Classifier
Collect quality example videos that effectively train action classifiers.
Building an Action Classifier Data Source
Arrange your training videos in multiple folders with labels that describe actions, or in a sing
folder with an annotation file.
Detecting human actions in a live video feed
Identify body movements by sending a person’s pose data from a series of video frames to a
action-classification model.
struct MLActionClassifier
A model you train with videos to classify a person’s body movements.
struct MLHandActionClassifier
A task that creates a hand action classification model by training with videos of people’s han
movements that you provide.
struct MLStyleTransfer
A model you train to apply an image’s style to other images or videos.
Topics
Action Classifier Data Sources
See Also
Video models


## Page 10

This sample app recognizes a person’s body moves, called actions, by analyzing a series of video
frames with Vision and predicting the name of the movement by applying an action classifier. The
action classifier in this sample recognizes three exercises:
Jumping jacks
Lunges
Burpees
Overview
Create ML / Detecting human actions in a live video feed
Sample Code
Detecting human actions in a live video
feed
Identify body movements by sending a person’s pose data from a series of video
frames to an action-classification model.
Download
iOS 14.0+
iPadOS 14.0+
Xcode 12.3+


## Page 11

The app continually presents its current action prediction on top of a live, full-screen video feed
from the device’s camera. When the app recognizes one or more people in the frame, it overlays a
wireframe body pose on each person. At the same time, the app predicts the prominent person’s
current action; typically this is the person closest to the camera.
At launch, the app configures the device’s camera to generate video frames and then directs the
frames through a series of methods it chains together with Combine. These methods work
together to analyze the frames and make action predictions by performing the following sequenc
of steps:
1. Locate all human body poses in each frame.
2. Isolate the prominent pose.
3. Aggregate the prominent pose’s position data over time.
4. Make action predictions by sending the aggregate data to the action classifier.
This sample app uses a camera, so you can’t run it in Simulator — you need to run it on an iOS or
iPadOS device.
Configure the Sample Code Project
Start a Video Capture Session


## Page 12

The app’s VideoCaptureclass configures the device’s camera to generate video frames by
creating an AVCaptureSession.
When the app first launches, or when the user rotates the device or switches between cameras,
video capture configures a camera input, a frame output, and the connection between them in its
configureCaptureSession() method.
The createCameraInput(position:frameRate:) method selects the front- or rear-facing
camera and configures its frame rate so it matches that of the action classifier.
Important
If you replace the ExerciseClassifier.mlmodel file with your own action classifier
model, set the frameRate property to match the Frame Rate training parameter you used in
the Create ML developer tool.
The AVCaptureVideoDataOutput.withPixelFormatType(_:) method creates an
AVCaptureVideoDataOutput that produces frames with a specific pixel format.
The configureCaptureConnection(_:_:) method configures the relationship between the
capture session’s camera input and video output by:
Selecting a video orientation
Deciding whether to horizontally flip the video
Enabling image stabilization when applicable


## Page 13

The method keeps the app operating in real time — and avoids building up a frame backlog — by
setting the video output’s alwaysDiscardsLateVideoFrames property to true.
See Setting up a capture session for more information on how to configure capture sessions and
connect their inputs and outputs.
The video capture publishes frames from its capture session by creating a PassthroughSubjec
in its createVideoFramePublisher() method.
A passthrough subject is a concrete implementation of Subject that adapts imperative code to
work with Combine. It immediately publishes the instance you pass to its send(_:) method, if it
has a subscriber at that time.
Next, the video capture registers itself as the video output’s delegate so it receives the video
frames from the capture session by calling the output’s setSampleBufferDelegate(_:
queue:) method.
The video capture forwards each frame it receives to its framePublisher by passing the frame
to its send(_:) method.
Create a Frame Publisher


## Page 14

The sample processes each video frame, and its derivative data, with a series of methods that it
connects together into a chain of Combine publishers in the VideoProcessingChain class.
Each time the video capture creates a new frame publisher it notifies the main view controller,
which then assigns the publisher to the video-processing chain’s upstreamFramePublisher
property:
Each time the property’s value changes, the video-processing chain creates a new daisy chain of
publishers by calling its buildProcessingChain() method.
Build a Publisher Chain


## Page 15

The method creates each new publisher by calling one of the following Publisher methods:
map(_:)
compactMap(_:)
scan(_:_:)
filter(_:)
For example, the publisher that subscribes to the initial frame publisher is a Publishers
.CompactMap that converts each Frame (a type alias of CMSampleBuffer) it receives into a
CGImage by calling the video-processing chain’s imageFromFrame(_:) method.


## Page 16

The next sections explain the remaining publishers in the chain and the methods they use to
transform their inputs.
The next publisher in the chain is a Publishers.Map that receives each CGImage from the
previous publisher (the compact map) by subscribing to it. The map publisher locates any human
body poses in the frame by using the video-processing chain’s findPosesInFrame(_:)
method. The method invokes a VNDetectHumanBodyPoseRequest by creating a VNImage
RequestHandler with the image and submitting the video-processing chain’s humanBodyPose
Request property to the handler’s perform(_:)
method.
Important
Improve your app’s efficiency by creating and reusing a single VNDetectHumanBodyPose
Request instance.
When the request completes, the method creates and returns a Pose array that contains one pos
for every VNHumanBodyPoseObservation instance in the request’s results property.
The Pose structure in this sample serves three main purposes:
Calculating the observation’s area within a frame (see “Isolate A Body Pose”)
Storing the the observation’s multiarray (see “Retrieve the Multiarray”)
Drawing an observation as a wireframe of points and lines (see “Present the Poses to the User
For more information about using a VNDetectHumanBodyPoseRequest, see Detecting Human
Body Poses in Images.
Analyze Each Frame for Body Poses


## Page 17

The next publisher in the chain is a map that chooses a single pose from the array of poses by
using the video-processing chain’s isolateLargestPose(_:) method. This method selects t
the most prominent pose by passing a closure to the pose array’s max(by:) method.
The closure compares the poses’ area estimates, with the goal of consistently selecting the same
person’s pose over time, when multiple people are in frame.
Important
Get the most accurate predictions from an action classifier by using whatever technique you
think best tracks a person from frame to frame, and use the multiarray from that person’s
VNHumanBodyPoseObservation result.
The next publisher in the chain is a map that publishes the MLMultiArray from the pose’s mult
Array property by using the video processing chain’s multiArrayFromPose(_:) method.
The Pose initializer copies the multiarray from its VNHumanBodyPoseObservation parameter 
calling the observation’s keypointsMultiArray() method.
The next publisher in the chain is a Publishers.Scan that receives each multiarray from its
upstream publisher and gathers them into an array by providing two arguments:
Isolate a Body Pose
Retrieve the Multiarray
Gather a Window of Multiarrays


## Page 18

An empty multiarray-optional array as the scan publisher’s initial value.
The video-processing chain’s gatherWindow(previousWindow:multiArray:) method a
the scan publisher’s transform.
A scan publisher behaves similarly to a map, but it also maintains a state. The following scan
publisher’s state is an array of multiarray optionals that’s initially empty. As the scan publisher
receives multiarray optionals from its upstream publisher, the scan publisher passes its previous
state and the incoming multiarray optional as arguments to its transform.
The method:
1. Copies the previousWindow parameter to currentWindow
2. Removes windowStride elements from the front of currentWindow, if it’s full
3. Appends the multiArray parameter to the end of currentWindow


## Page 19

4. Returns currentWindow, which becomes the new state of the scan publisher and the next
value for previousWindow when the scan publisher receives the next value from its upstream
publisher and invokes the method
The video-processing chain considers a window to be full if it contains predictionWindowSiz
elements. When the window is full, this method removes (in step 2) the oldest elements to make
room for newer elements, effectively sliding the window forward in time.
The Exercise Classifier’s calculatePredictionWindowSize() method determines the value
of the prediction window size at runtime by inspecting the model’s modelDescription propert
The next publisher in the chain is a Publishers.Filter, which only publishes an array window
when the gateWindow(_:) method returns true.
The method returns true if the window array contains exactly the number of elements defined in
predictionWindowSize. Otherwise, the method returns false, which instructs the filter
publisher to discard the current window and not publish it.
This filter publisher, in combination with its upstream scan publisher, publishes an array of
multiarray optionals once per each number of frames defined in windowStride.
The next publisher in the chain makes an ActionPrediction from the multiarray window by
using the predictActionWithWindow(_:) method as its transform.
Monitor the Window Size
Predict the Person’s Action


## Page 20

The method’s input array contains multiarray optionals where each nil element represents a fram
in which Vision wasn’t able to find any human body poses. An action classifier requires a valid, no
nil multiarray for every frame. To remove the nil elements in the array, the method creates a ne
multiarray, filledWindow, by:
Copying each each valid element in currentWindow
Replacing each nil element in currentWindow with an emptyPoseMultiArray
The empty pose multiarray has:
Every element set to zero
The same value for its shape property as a multiarray from a human body-pose observation
As the method iterates through each element in currentWindow, it tallies the number of non-ni
elements with poseCount.
If the value of poseCount is too low, the method directly creates a noPersonPrediction actio
prediction.


## Page 21

Otherwise, the method merges the array of multiarrays into a single, combined multiarray by callin
the init(byConcatenatingMultiArrays:alongAxis:dataType:) initializer.
The method generates an action prediction by passing the combined multiarray to the action
classifier’s predictActionFromWindow(_:) helper method.
The method checks the prediction’s confidence by passing the prediction to the check
Confidence(_:) helper method, which returns the same prediction if its confidence is high
enough; otherwise lowConfidencePrediction.
The final component in the chain is a subscriber that notifies the video-processing chain’s delega
with the prediction using the sendPrediction(_:) method.
The method sends the action prediction and the number of frames the prediction represents
(windowStride) to the video-processing chain’s delegate, the main view controller.
Present the Prediction to the User


## Page 22

Each time the main view controller receives an action prediction, it updates the app’s UI with the
prediction and confidence in a helper method.
The main view controller also updates its actionFrameCounts property for action labels that
come from the model, which it later sends to the Summary View Controller when the user taps the
Summary button.
The app visualizes the result of each human body-pose request by drawing the poses on top of th
frame in which Vision found them. Each time the video-processing chain’s findPosesIn
Frame(_:) creates an array of Pose instances, it sends the poses to its delegate, the main view
controller.
The main view controller’s drawPoses(_:onto:) method uses the frame as the background by
first drawing the frame.
Present the Poses to the User


## Page 23

Next, the method draws the poses by calling their drawWireframeToContext(_:applying:
method, which draws the pose as a wireframe of lines and circles.
The main view controller presents the finished image to the user by assigning it to its full-screen
image view.


## Page 24

static func train(trainingData: MLActionClassifier.DataSource,
parameters: MLActionClassifier.ModelParameters, sessionParameters:
MLTrainingSessionParameters) throws -> MLJob<MLActionClassifier>
Begins an asynchronous action classifier training session.
static func makeTrainingSession(trainingData: MLActionClassifier.Data
Source, parameters: MLActionClassifier.ModelParameters, session
Parameters: MLTrainingSessionParameters) throws -> MLTrainingSession<
MLActionClassifier>
Creates an asynchronous training session for an action classifier.
static func resume(MLTrainingSession<MLActionClassifier>) throws ->
MLJob<MLActionClassifier>
Begins or continues an asynchronous action classifier training session.
static func restoreTrainingSession(sessionParameters: MLTrainingSession
Parameters) throws -> MLTrainingSession<MLActionClassifier>
Creates an asynchronous training session for an action classifier by restoring an existing
training session’s state from its parameters.
Topics
Training an action classifier asynchronously
Create ML / MLActionClassifier
Structure
MLActionClassifier
A model you train with videos to classify a person’s body movements.
macOS 11.0+


## Page 25

init(checkpoint: MLCheckpoint) throws
Creates an action classifier from a training session checkpoint.
init(trainingData: MLActionClassifier.DataSource, parameters: MLAction
Classifier.ModelParameters) throws
Creates an action classifier with a training dataset represented by a data source.
func evaluation(on: MLActionClassifier.DataSource) throws ->
MLClassifierMetrics
Generates metrics describing the action classifier’s performance on labeled videos
represented by a data source.
var trainingMetrics: MLClassifierMetrics
Measurements of the action classifier’s performance on the training dataset.
var validationMetrics: MLClassifierMetrics
Measurements of the action classifier’s performance on the validation dataset.
func prediction(from: URL) throws -> [MLActionClassifier.Prediction]
Generates a prediction for each action the classifier recognizes in the video.
func predictions(from: [URL]) throws -> [[MLActionClassifier.Prediction
]]
Generates a sequence of predictions for each video input.
struct Prediction
A collection of predictions, each paired with its confidence, for a range of video frames.
func write(to: URL, metadata: MLModelMetadata?) throws
Creating an action classifier from a checkpoint
Training an action classifier synchronously
Evaluating an action classifier
Testing an action classifier
Saving an action classifier


## Page 26

Exports the action classifier as a Core ML model file to a location in the file system.
func write(toFile: String, metadata: MLModelMetadata?) throws
Exports the action classifier as a Core ML model file to the file path.
var model: MLModel
The underlying Core ML model of the action classifier stored in memory.
let modelParameters: MLActionClassifier.ModelParameters
The model configuration parameters the action classifier used during its training session.
var description: String
A text representation of the action classifier.
var debugDescription: String
A text representation of the action classifier that’s suitable for output during debugging.
var playgroundDescription: Any
A description of the action classifier shown in a playground.
enum DataSource
A data source for an action classifier.
struct ModelParameters
Parameters that affect the training process of an action classifier.
struct VideoAugmentationOptions
The video augmentations for an action classifier training session.
CustomDebugStringConvertible Implementations
CustomPlaygroundDisplayConvertible Implementations
Inspecting an action classifier model
Describing an action classifier
Supporting types
Default Implementations


## Page 27

CustomStringConvertible Implementations
Copyable
CustomDebugStringConvertible
CustomPlaygroundDisplayConvertible
CustomStringConvertible
Sendable
SendableMetatype
Creating an Action Classifier Model
Train a machine learning model to recognize a person’s body movements.
Detecting human actions in a live video feed
Identify body movements by sending a person’s pose data from a series of video frames to a
action-classification model.
struct MLHandActionClassifier
A task that creates a hand action classification model by training with videos of people’s han
movements that you provide.
struct MLStyleTransfer
A model you train to apply an image’s style to other images or videos.
Relationships
Conforms To
See Also
Video models


## Page 28

static func train(trainingData: MLHandActionClassifier.DataSource,
parameters: MLHandActionClassifier.ModelParameters, sessionParameters:
MLTrainingSessionParameters) throws -> MLJob<MLHandActionClassifier>
Begins an asynchronous hand action classifier’s training session.
static func makeTrainingSession(trainingData: MLHandActionClassifier.
DataSource, parameters: MLHandActionClassifier.ModelParameters, session
Parameters: MLTrainingSessionParameters) throws -> MLTrainingSession<
MLHandActionClassifier>
Creates an asynchronous hand action classifier’s training session.
static func resume(MLTrainingSession<MLHandActionClassifier>) throws ->
MLJob<MLHandActionClassifier>
Begins or continues an asynchronous hand action classifier’s training session.
static func restoreTrainingSession(sessionParameters: MLTrainingSession
Parameters) throws -> MLTrainingSession<MLHandActionClassifier>
Recreates an asynchronous hand action classifier’s training session by restoring its saved
state from the file system.
Topics
Training a hand action classifier asynchronously
Create ML / MLHandActionClassifier
Structure
MLHandActionClassifier
A task that creates a hand action classification model by training with videos of
people’s hand movements that you provide.
iOS 15.0+
iPadOS 15.0+
Mac Catalyst 15.0+
macOS 12.0+
visionOS 1.0+


## Page 29

init(checkpoint: MLCheckpoint) throws
Creates a hand action classifier from a training session checkpoint.
init(trainingData: MLHandActionClassifier.DataSource, parameters: MLHan
ActionClassifier.ModelParameters) throws
Creates a hand action classifier by starting a synchronous training session.
func evaluation(on: MLHandActionClassifier.DataSource) throws ->
MLClassifierMetrics
Generates metrics describing the hand action classifier’s performance on labeled videos.
var trainingMetrics: MLClassifierMetrics
Measurements of the hand action classifier’s performance on the training dataset.
var validationMetrics: MLClassifierMetrics
Measurements of the hand action classifier’s performance on the validation dataset.
func prediction(from: URL) throws -> [MLHandActionClassifier.Prediction
Generates a hand action prediction for a video.
func predictions(from: [URL]) throws -> [[MLHandActionClassifier.
Prediction]]
Generates an array of hand action predictions for each video in a URL array.
struct Prediction
A collection of predictions, each paired with its confidence, for a range of video frames.
func write(to: URL, metadata: MLModelMetadata?) throws
Exports the hand action classifier as a CoreML model file.
Creating a hand action classifier from a checkpoint
Training a hand action classifier synchronously
Evaluating a hand action classifier
Testing a hand action classifier
Saving a hand action classifier


## Page 30

func write(toFile: String, metadata: MLModelMetadata?) throws
Exports the hand action classifier as a Core ML model file.
var model: MLModel
The underlying Core ML model of the hand action classifier stored in memory.
let modelParameters: MLHandActionClassifier.ModelParameters
The hand action model’s configuration parameters.
var description: String
A text representation of the hand action classifier.
var debugDescription: String
A text representation of the hand action classifier suitable for debugging.
var playgroundDescription: Any
A description of the hand action classifier that’s viewable in a playground.
enum DataSource
A hand action classifier dataset that contains annotated videos or hand joint location data.
struct ModelParameters
A set of parameters that affect the training process of a hand action classifier task.
struct VideoAugmentationOptions
Options a hand action classification training session can use to generate additional training
data from the videos you provide.
CustomDebugStringConvertible Implementations
CustomPlaygroundDisplayConvertible Implementations
Inspecting a hand action classifier model
Describing a hand action classifier
Supporting types
Default Implementations


## Page 31

CustomStringConvertible Implementations
Copyable
CustomDebugStringConvertible
CustomPlaygroundDisplayConvertible
CustomStringConvertible
Creating an Action Classifier Model
Train a machine learning model to recognize a person’s body movements.
Detecting human actions in a live video feed
Identify body movements by sending a person’s pose data from a series of video frames to a
action-classification model.
struct MLActionClassifier
A model you train with videos to classify a person’s body movements.
struct MLStyleTransfer
A model you train to apply an image’s style to other images or videos.
Relationships
Conforms To
See Also
Video models


## Page 32

static func train(trainingData: MLStyleTransfer.DataSource, parameters:
MLStyleTransfer.ModelParameters, sessionParameters: MLTrainingSession
Parameters) throws -> MLJob<MLStyleTransfer>
Begins an asynchronous style transfer model-training session.
static func makeTrainingSession(trainingData: MLStyleTransfer.DataSourc
, parameters: MLStyleTransfer.ModelParameters, sessionParameters:
MLTrainingSessionParameters) throws -> MLTrainingSession<MLStyleTransfe
>
Creates an asynchronous training session for a style transfer model.
static func resume(MLTrainingSession<MLStyleTransfer>) throws -> MLJob<
MLStyleTransfer>
Begins or continues an asynchronous style transfer model-training session.
static func restoreTrainingSession(sessionParameters: MLTrainingSession
Parameters) throws -> MLTrainingSession<MLStyleTransfer>
Creates an asynchronous training session for a style transfer model by restoring an existing
training session’s state from its parameters.
Topics
Training a style transfer model asynchronously
Create ML / MLStyleTransfer
Structure
MLStyleTransfer
A model you train to apply an image’s style to other images or videos.
iOS 15.0+
iPadOS 15.0+
Mac Catalyst 15.0+
macOS 11.0+
visionOS 1.0+


## Page 33

init(checkpoint: MLCheckpoint) throws
Creates a style transfer model from a training session checkpoint.
init(trainingData: MLStyleTransfer.DataSource, parameters: MLStyle
Transfer.ModelParameters) throws
Creates a style transfer model with a training dataset represented by a data source.
func stylize(image: CGImage) throws -> CGImage?
Applies the style the model learned to an image.
func write(to: URL, metadata: MLModelMetadata?) throws
Exports the style transfer model as a Core ML model file to a location in the file system.
func write(toFile: String, metadata: MLModelMetadata?) throws
Exports the style transfer model as a Core ML model file to the file path.
static func downloadAssets() throws
Initiates a download of the mlmodel assets required for Style Transfer training. This will be
performed automatically if needed at training time, but can be run independently prior to
training.
var description: String
A text representation of the style transfer model.
var debugDescription: String
A text representation of the style transfer model that’s suitable for output during debugging.
Creating a style transfer model from a checkpoint
Training a style transfer model synchronously
Stylizing an image
Saving a style transfer model
Downloading model assets
Describing a style transfer model


## Page 34

var playgroundDescription: Any
A description of the style transfer model shown in a playground.
enum DataSource
A data source for a style transfer model.
struct ModelParameters
Parameters that affect the training process of a style transfer model.
CustomDebugStringConvertible Implementations
CustomPlaygroundDisplayConvertible Implementations
CustomStringConvertible Implementations
Copyable
CustomDebugStringConvertible
CustomPlaygroundDisplayConvertible
CustomStringConvertible
Sendable
SendableMetatype
Creating an Action Classifier Model
Train a machine learning model to recognize a person’s body movements.
Supporting types
Default Implementations
Relationships
Conforms To
See Also
Video models


## Page 35

Detecting human actions in a live video feed
Identify body movements by sending a person’s pose data from a series of video frames to a
action-classification model.
struct MLActionClassifier
A model you train with videos to classify a person’s body movements.
struct MLHandActionClassifier
A task that creates a hand action classification model by training with videos of people’s han
movements that you provide.


