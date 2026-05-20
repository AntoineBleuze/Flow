# 001_Detecting human actions in a live video feed.pdf

## Page 1

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


## Page 2

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


## Page 3

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


## Page 4

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


## Page 5

The sample processes each video frame, and its derivative data, with a series of methods that it
connects together into a chain of Combine publishers in the VideoProcessingChain class.
Each time the video capture creates a new frame publisher it notifies the main view controller,
which then assigns the publisher to the video-processing chain’s upstreamFramePublisher
property:
Each time the property’s value changes, the video-processing chain creates a new daisy chain of
publishers by calling its buildProcessingChain() method.
Build a Publisher Chain


## Page 6

The method creates each new publisher by calling one of the following Publisher methods:
map(_:)
compactMap(_:)
scan(_:_:)
filter(_:)
For example, the publisher that subscribes to the initial frame publisher is a Publishers
.CompactMap that converts each Frame (a type alias of CMSampleBuffer) it receives into a
CGImage by calling the video-processing chain’s imageFromFrame(_:) method.


## Page 7

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


## Page 8

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


## Page 9

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


## Page 10

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


## Page 11

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


## Page 12

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


## Page 13

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


## Page 14

Next, the method draws the poses by calling their drawWireframeToContext(_:applying:
method, which draws the pose as a wireframe of lines and circles.
The main view controller presents the finished image to the user by assigning it to its full-screen
image view.


