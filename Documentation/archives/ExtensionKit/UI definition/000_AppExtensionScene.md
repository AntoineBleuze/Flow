# 000_AppExtensionScene.pdf

## Page 1

Including extension-based UI in your interface
When your app extension provides custom UI, use this type to define a specific scene for that UI.
An app extension can define multiple scene types in coordination with the host app. When the ho
app displays the app extension’s UI, it provides a unique string identifier for the scene it wants to
display. The app extension responds by providing an instance of this type that contains that
scene’s contents.
When defining a scene, provide the body of that scene using the PrimitiveAppExtension
Scene type. This type contains the unique identifier of the scene and the content to display. The
following code shows an implementation of a scene capable of displaying content you supply at
initialization time using a closure. The scene’s body property repackages that content inside the
PrimitiveAppExtensionScene structure. You can also use this type to accept a scene-
specific XPC connection, which you might use to communicate custom data related to managing
UI-related interactions.
Mentioned in
Overview
ExtensionKit / AppExtensionScene
Protocol
AppExtensionScene
An interface you use to provide a specific scene from your app extension’s UI.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 9.0+


## Page 2

For more information about creating UI-based app extensions, see Including extension-based UI 
your interface.
var body: Self.Body
The content and behavior of the scene’s interface.
Required
associatedtype Body : AppExtensionScene
The type for this scene’s body.
Required
PrimitiveAppExtensionScene
Topics
Configuring the app extension
Relationships
Conforming Types
See Also


## Page 3

struct PrimitiveAppExtensionScene
A type you use to deliver the contents of your app-extension-based UI.
struct AppExtensionSceneBuilder
A custom parameter attribute that constructs extension scenes from closures.
UI definition


