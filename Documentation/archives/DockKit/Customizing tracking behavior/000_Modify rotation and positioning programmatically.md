# 000_Modify rotation and positioning programmatically.pdf

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


