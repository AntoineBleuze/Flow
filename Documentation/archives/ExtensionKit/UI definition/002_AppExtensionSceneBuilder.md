# 002_AppExtensionSceneBuilder.pdf

## Page 1

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


## Page 2

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


