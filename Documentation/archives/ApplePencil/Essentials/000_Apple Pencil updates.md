# 000_Apple Pencil updates.pdf

## Page 1

Browse notable changes in Apple Pencil.
Implement custom low-latency drawing if your app doesn’t use PencilKit. Participate in UI
updates and influence UI update behavior using UIUpdateLink.
Offer a wider variety of marking tools by creating a configurable tool picker. Create a PKTool
Picker, add standard system tools or define your own custom tools with PKToolPicker
CustomItem, and specify which order the tools appear in. Include an optional accessoryIte
in the tool picker to provide quick access to additional features directly from the picker.
Perform actions in your app in response to squeeze interactions on Apple Pencil Pro. People ca
choose their preferred squeeze action in Settings > Apple Pencil > Actions > Squeeze, such as
switching drawing tools, showing a contextual palette, or performing an App Shortcut. You can
also implement a custom action for squeeze and give people the choice to use your app’s
Overview
June 2024
UIKit
PencilKit
May 2024
SwiftUI and UIKit
Updates / Apple Pencil updates
Article
Apple Pencil updates
Learn about important changes to Apple Pencil.


## Page 2

custom behavior instead. In SwiftUI, use onPencilSqueeze(perform:). In UIKit, use
pencilInteraction(_:didReceiveSqueeze:).
Perform actions in your app in response to double-tap interactions on Apple Pencil. People can
choose their preferred double-tap action in Settings > Apple Pencil > Actions > Double Tap. In
SwiftUI, use onPencilDoubleTap(perform:). In UIKit, update your implementation to use
pencilInteraction(_:didReceiveTap:), which replaces the deprecated pencil
InteractionDidTap(_:).
Leverage the hover pose of Apple Pencil to support more complex interactions in response to a
double tap or squeeze. Information about the hover pose — such as azimuth, altitude, and hove
distance — is available when a person holds a supported model of Apple Pencil close to the
screen during a double tap or squeeze. In SwiftUI, use PencilHoverPose. In UIKit, use
UIPencilHoverPose.
Provide tactile feedback on Apple Pencil Pro by playing haptics in response to certain actions,
such as snapping objects to a grid. In SwiftUI, use SensoryFeedback. In UIKit, use
UIFeedbackGenerator.
Track the barrel-roll angle of Apple Pencil Pro to create more expressive drawing experiences
and hover previews using rollAngle.
Check the value of the hover tool preview preference from the Apple Pencil section of the
Settings app using prefersHoverToolPreview.
Take advantage of barrel-roll tracking for Apple Pencil Pro when a person makes marker and
fountain pen strokes. Support PKContentVersion.version3, which includes the version o
the inks that incorporate barrel-roll data.
Accelerate updates
Learn about important changes to Accelerate.
Accessibility updates
Learn about important changes to Accessibility.
ActivityKit updates
Learn about important changes in ActivityKit.
PencilKit
See Also
Technology updates


## Page 3

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
Background Tasks updates
Learn about important changes in Background Tasks.


