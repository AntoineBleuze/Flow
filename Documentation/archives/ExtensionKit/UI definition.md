# UI definition.pdf

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


## Page 4

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


## Page 5

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


## Page 6



## Page 7

static func buildBlock<Content>(Content) -> some AppExtensionScene
Passes through a single extension scene unmodified.
static func buildBlock<C0, C1>(C0, C1) -> some AppExtensionScene
Builds an extension scene by combining two scenes.
static func buildBlock<C0, C1, C2>(C0, C1, C2) -> some AppExtensionScen
Builds an extension scene by combining three scenes.
static func buildBlock<C0, C1, C2, C3>(C0, C1, C2, C3) -> some App
ExtensionScene
Builds an extension scene by combining four scenes.
static func buildBlock<C0, C1, C2, C3, C4>(C0, C1, C2, C3, C4) -> some 
AppExtensionScene
Builds an extension scene by combining five scenes.
static func buildBlock<C0, C1, C2, C3, C4, C5>(C0, C1, C2, C3, C4, C5) 
> some AppExtensionScene
Topics
Building the scene’s content
ExtensionKit / AppExtensionSceneBuilder
Structure
AppExtensionSceneBuilder
A custom parameter attribute that constructs extension scenes from closures.
iOS 16.0+
iPadOS 16.0+
Mac Catalyst 16.0+
macOS 13.0+
tvOS 16.0+
visionOS 1.0+
watchOS 9.0+


## Page 8

Builds an extension scene by combining six scenes.
static func buildBlock<C0, C1, C2, C3, C4, C5, C6>(C0, C1, C2, C3, C4,
C5, C6) -> some AppExtensionScene
Builds an extension scene by combining seven scenes.
static func buildBlock<C0, C1, C2, C3, C4, C5, C6, C7>(C0, C1, C2, C3,
C4, C5, C6, C7) -> some AppExtensionScene
Builds an extension scene by combining eight scenes.
static func buildBlock<C0, C1, C2, C3, C4, C5, C6, C7, C8>(C0, C1, C2,
C3, C4, C5, C6, C7, C8) -> some AppExtensionScene
Builds an extension scene by combining nine scenes.
static func buildBlock<C0, C1, C2, C3, C4, C5, C6, C7, C8, C9>(C0, C1,
C2, C3, C4, C5, C6, C7, C8, C9) -> some AppExtensionScene
Builds an extension scene by combining ten scenes.
Sendable, SendableMetatype
protocol AppExtensionScene
An interface you use to provide a specific scene from your app extension’s UI.
struct PrimitiveAppExtensionScene
A type you use to deliver the contents of your app-extension-based UI.
Relationships
Conforms To
See Also
UI definition


