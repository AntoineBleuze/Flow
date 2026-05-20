# 000_Game Controller updates.pdf

## Page 1

Browse notable changes in Game Controller.
Add support for spatial game controllers. To determine if a controller is a spatial game controlle
check whether the product category is GCProductCategorySpatialController.
Add support for a physical stylus with a GCStylus object.
Add NSAccessoryTrackingUsageDescription to your information property list if your ap
requires access to accessory-tracking data for a spatial game controller or stylus.
Add GCSupportedGameControllers to your information property list — with a value of
SpatialGamepad — if your app supports spatial game controllers.
For UIKit apps, add a user interaction that determines whether the system delivers game
controller events through the Game Controller framework instead of the UIResponder chain. 
receive events through the Game Controller framework, add a GCEventInteraction object 
one or more views and set the handledEventTypes property to the types of events you wan
to handle.
Overview
June 2025
June 2024
visionOS
June 2023
Updates / Game Controller updates
Article
Game Controller updates
Learn about important changes to Game Controller.


## Page 2

Use the classes that conform to the GCDevicePhysicalInput protocol to poll for game
controller input in your game loop. For more information, see Handling input events.
Add support for arcade sticks. To determine if a controller is an arcade stick, check whether th
product category is GCProductCategoryArcadeStick.
Add GCRequiresControllerUserInteraction to your information property list if your ap
requires a game controller on visionOS or to recommend a game controller on iOS.
Accelerate updates
Learn about important changes to Accelerate.
Accessibility updates
Learn about important changes to Accessibility.
ActivityKit updates
Learn about important changes in ActivityKit.
AdAttributionKit Updates
Learn about important changes to AdAttributionKit.
App Clips updates
Learn about important changes in App Clips.
App Intents updates
Learn about important changes in App Intents.
AppKit updates
Learn about important changes to AppKit.
Apple Intelligence updates
Learn about important changes to Apple Intelligence.
AppleMapsServerAPI Updates
Learn about important changes to AppleMapsServerAPI.
Apple Pencil updates
Learn about important changes to Apple Pencil.
See Also
Technology updates


## Page 3

ARKit updates
Learn about important changes to ARKit.
Audio Toolbox updates
Learn about important changes to Audio Toolbox.
AuthenticationServices updates
Learn about important changes to AuthenticationServices.
AVFAudio updates
Learn about important changes to AVFAudio.
AVFoundation updates
Learn about important changes to AVFoundation.


