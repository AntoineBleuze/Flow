# 001_Track custom objects in a frame.pdf

## Page 1

You can use your own custom machine learning model, also known as inference. This allows
DockKit to track a custom subject, such as a dog or a cat. Once you’ve applied your machine
learning model on a set of video frames, use DockKit to generate and provide tracking vectors.
Begin by obtaining images from the video capture source.
Once you’ve passed your video frames to your custom machine learning model, supply these
observations to the accessory using track(_:cameraInformation:).
Overview
Obtain video images
Provide observations
DockKit / Track custom objects in a frame
Article
Track custom objects in a frame
Use your machine learning model to focus on a specific subject.


## Page 2

Format the output of your object detections as an array of DockAccessory.Observation
objects. If you want to write your own custom tracking logic, or generate your own position and
velocity-based vectors, see Modify rotation and positioning programmatically.
Call track(_:cameraInformation:) at an interval between 10 and 30 times per second.
When calling this method , the tracking system analyzes the subjects and determines which one t
focus on and how to frame it. The tracking vector derives from these two choices, and the
accessory keeps the subjects framed appropriately.
The tracking vector arrives at the accessory which controls the motors. This work occurs in the
background and can take some time to complete.
In some cases, the call to track(_:cameraInformation:) might not generate a vector, or th
vector may only keep the accessory at rest.
Modify rotation and positioning programmatically
Perform custom control of the dock accessory.
See Also
Customizing tracking behavior


