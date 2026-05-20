# 001_PrimitiveAppExtensionScene.pdf

## Page 1

Including extension-based UI in your interface
When defining an AppExtensionScene type, provide a PrimitiveAppExtensionScene
structure as the body of that type. This type facilitates the delivery of the scene’s UI views back t
the host app for incorporation into the host view controller. When constructing this type, specify
one of the defined scene identifiers that the host app supports.
For more information about creating scenes for your app extension, see Including extension-base
UI in your interface.
init<Content>(id: String, content: () -> Content, onConnection: (
NSXPCConnection) -> Bool)
Initializes the primitive app extension scene with the specified ID and closure for the content
Mentioned in
Overview
Topics
Creating a primitive extension scene
ExtensionKit / PrimitiveAppExtensionScene
Structure
PrimitiveAppExtensionScene
A type you use to deliver the contents of your app-extension-based UI.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 9.0+


## Page 2

var body: Never
The scene’s user interface.
var debugDescription: String
A string that provides information about the scene.
CustomDebugStringConvertible Implementations
AppExtensionScene
Copyable
CustomDebugStringConvertible
Sendable
SendableMetatype
protocol AppExtensionScene
An interface you use to provide a specific scene from your app extension’s UI.
struct AppExtensionSceneBuilder
A custom parameter attribute that constructs extension scenes from closures.
Defining the scene contents
Describing the scene
Default Implementations
Relationships
Conforms To
See Also
UI definition


## Page 3



