# Customizing tracking behavior.pdf

## Page 1

You can implement your own inference and tracking to directly control the velocity or position of
the docking station. To do this, use setSystemTrackingEnabled(_:) to prevent system from
automatically tracking subjects.
After disabling tracking, use accessoryStateChanges to iterate through the available
accessories and find the one you wish to interact with.
Once you identify the accessory of interest use setAngularVelocity(_:), set
Orientation(_:duration:relative:) and setOrientation(_:duration:
relative:) to directly control the speed and position of the accessory:
Overview
DockKit / Modify rotation and positioning programmatically
Article
Modify rotation and positioning
programmatically
Perform custom control of the dock accessory.


## Page 2

The system tracking enabled state isn’t guaranteed to persist across reboots, app
launch/termination, or background/foreground states. Enable or disable system tracking wheneve
your app needs the value to change.
Changes to the tracking are local to the app, and are changeable dynamically anytime during app
lifecycle.
Track custom objects in a frame
Use your machine learning model to focus on a specific subject.
See Also
Customizing tracking behavior


## Page 3

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


## Page 4

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


