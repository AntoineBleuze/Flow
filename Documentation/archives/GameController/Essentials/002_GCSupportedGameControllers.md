# 002_GCSupportedGameControllers.pdf

## Page 1

Name
Supported game controller types
Type
Array of dictionaries
ProfileName
string
Possible Values: DirectionalGamepad, SpatialGamepad,
ExtendedGamepad, MicroGamepad
The dictionary keys are ProfileName and the possible game controller values are:
ExtendedGamepad
The extended set of gamepad controls. See GCExtendedGamepad.
SpatialGamepad
The set of spatial gamepad controls.
MicroGamepad
The 1st Generation Siri Remote. See GCMicroGamepad.
DirectionalGamepad
Details
Properties
Discussion
Bundle Resources / Information Property List / GCSupportedGameControllers
Property List Key
GCSupportedGameControllers
The types of game controller profiles that the app supports or requires.
iOS 7.0+
iPadOS 7.0+
macOS 10.9+
tvOS 9.0+
visionOS 1.0+


## Page 2

The 2nd Generation Siri Remote. A directional pad without motion or rotation. See
GCDirectionalGamepad. Available in iOS 14.3+, macOS 11.1+, Mac Catalyst 14.3+, and tvO
14.3+.
AVGameBypassSystemSpatialAudio
A key that ignores the system spatial-audio toggle in Control Center.
GKGameCenterBadgingDisabled
A Boolean value indicating whether GameKit can add badges to a turn-based game icon.
GCSupportsControllerUserInteraction
A Boolean value indicating whether the app supports a game controller.
Name: Supports Controller User Interaction
GCRequiresControllerUserInteraction
The platforms for which your app requires or you recommend a game controller.
GCSupportsMultipleMicroGamepads
A Boolean value indicating whether the physical Apple TV Remote and the Apple TV Remote
app operate as separate game controllers.
LSSupportsGameMode
A Boolean value indicating whether the app supports Game Mode.
GCSupportsGameMode
A Boolean value indicating whether the app supports game mode.
Name: Supports Game Mode
Deprecated
GKShowChallengeBanners
A Boolean value that indicates whether GameKit can display challenge banners in a game.
Deprecated
See Also
Games


