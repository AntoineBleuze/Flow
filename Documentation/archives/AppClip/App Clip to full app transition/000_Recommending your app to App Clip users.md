# 000_Recommending your app to App Clip users.pdf

## Page 1

App Clips only remain on a device for a limited amount of time. If someone uses an App Clip
regularly, they might want to get the corresponding app to use additional features and have the a
on their home screen. With SKOverlay, you can recommend your full app to users and enable
them to install it from within your App Clip.
Note
Don’t require users to install your app to complete a task. For user experience and design
guidance, see Human Interface Guidelines > App Clips.
If you’re using SwiftUI, make use of the appStoreOverlay(isPresented:configuration:
modifier. For example usage, see Fruta: Building a feature-rich app with SwiftUI.
To display an overlay when using UIKit:
1. Create an SKOverlay.AppClipConfiguration object.
2. Initialize SKOverlay with the configuration object.
3. Present the overlay.
The following code displays the overlay at the bottom of the visible scene:
Overview
App Clips / Recommending your app to App Clip users
Article
Recommending your app to App Clip users
Display an overlay in your App Clip to recommend your app to users.


## Page 2

To respond to the overlay’s appearance, dismissal, or failure to load, set the delegate, and
implement the methods defined in SKOverlayDelegate.
Sharing data between your App Clip and your full app
Use CloudKit, Sign in with Apple, shared user defaults or containers, and the keychain to offe
a smooth transition from your App Clip to your app.
See Also
App Clip to full app transition


