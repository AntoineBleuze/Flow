# 000_Integrating CarPlay with Your Music App.pdf

## Page 1

CarPlay Music is a sample music app that demonstrates how to display a custom UI from a
CarPlay–enabled vehicle. CarPlay Music integrates with the CarPlay framework by implementing
the CPNowPlayingTemplate and CPListTemplate. This sample’s iOS app component
provides a logging interface to help you understand the life cycle of a CarPlay app, as well as a
music controller.
To configure the sample code project, perform the following:
1. Complete the steps in Requesting CarPlay Entitlements to request the CarPlay audio entitlemen
and configure the Xcode project.
2. Create a key and developer token for the MusicKit service. For more information, see Getting
Keys and Creating Tokens.
3. Update the developerToken variable in the AppleMusicAPIController.swift file to us
the developer token you create.
The app is responsible for adding and removing the root view controller of the CarPlay window in
response to connections and disconnections.
The following code shows an example implementation of setting a root template:
Overview
Configure the Sample Code Project
Handle Communication with CarPlay
CarPlay / Integrating CarPlay with Your Music App
Sample Code
Integrating CarPlay with Your Music App
Configure your music app to work with CarPlay by displaying a custom UI.
Download
iOS 14.0+
Xcode 15.0+


## Page 2



## Page 3

Like other Music apps, CarPlay Music is eligible to participate in App Selection to improve its
interactions with Siri. This allows the system to automatically select the app for playing music on
the device. See Improving Siri Media Interaction and App Selection.
The following code demonstrates how to declare an app as eligible for App Selection:
A good way to ensure an app UI updates automatically in response to changes is to listen for
changes in the Now Playing item, as well as in the playing state. CarPlay Music uses the
applicationMusicPlayer, so it subscribes to the MPMusicPlayerControllerPlayback
StateDidChange and MPMusicPlayerControllerNowPlayingItemDidChange
notifications.
Prepare for App Selection
Listen for Changes with the Music Player


## Page 4

class CPNowPlayingTemplate
A shared system template that displays Now Playing information.
See Also
Audio


