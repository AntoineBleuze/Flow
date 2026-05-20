# 001_GCSupportsControllerUserInteraction.pdf

## Page 1

Name
Supports Controller User Interaction
Type
Boolean
To add this key to the information property list, enable the Game Controllers capability in Xcode. I
you set this key to YES and check ExtendedGamepad under the Game Controllers capability in yo
project, App Store adds a game controller support badge to your app. Then users can customize
their game controller mappings in Settings and Preferences.
Important
To recommend the use of a game controller on iOS or if your app requires a game controller on
visionOS, add an entry into the GCRequiresControllerUserInteraction dictionary for
that platform and set the value to YES.
Details
Discussion
See Also
Games
Bundle Resources / Information Property List / GCSupportsControllerUserInteraction
Property List Key
GCSupportsControllerUserInteraction
A Boolean value indicating whether the app supports a game controller.
iOS 2.0+
iPadOS 2.0+
macOS 10.0+
tvOS 9.0+
visionOS 1.0+


## Page 2

AVGameBypassSystemSpatialAudio
A key that ignores the system spatial-audio toggle in Control Center.
GKGameCenterBadgingDisabled
A Boolean value indicating whether GameKit can add badges to a turn-based game icon.
GCSupportedGameControllers
The types of game controller profiles that the app supports or requires.
Name: Supported game controller types
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


