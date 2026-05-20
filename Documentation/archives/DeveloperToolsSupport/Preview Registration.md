# Preview Registration.pdf

## Page 1

Preview macros make use of this protocol on your behalf. Don’t use it directly. Instead, use one of
the preview macros, like Preview(_:body:).
Important
If you define a preview registry directly, the behavior is undefined.
static var column: Int
Required
static var fileID: String
Required
static var line: Int
Required
Overview
Topics
Type Properties
DeveloperToolsSupport / PreviewRegistry
Protocol
PreviewRegistry
A protocol that the system uses to locate previews at runtime.
iOS 17.0+
iPadOS 17.0+
Mac Catalyst 17.0+
macOS 14.0+
tvOS 17.0+
visionOS 1.0+
watchOS 10.0+


## Page 2

static var preview: Preview
Required Default implementation provided.
Deprecated
static func makePreview() throws -> Preview
Required
struct Preview
A base type that preview macros use to create previews.
enum PreviewLayout
A size constraint for a preview.
struct PreviewTrait
Customizations that you can apply to a preview.
Type Methods
See Also
Preview Registration


## Page 3

Frameworks like SwiftUI and WidgetKit define initializers for this type, along with framework-
specific preview macros that rely on this type. You don’t use this type directly. Instead, use one of
the preview macros, like Preview(_:body:).
init<Attributes>(String?, as: ActivityPreviewViewKind, using: Attribute
, widget: () -> some Widget, contentStates: () async -> [Attributes.
ContentState])
Creates a preview of a live activity widget.
init<Provider>(String?, as: WidgetFamily, using: Provider.Intent, widge
: () -> some Widget, timelineProvider: () -> Provider)
Creates a preview of a widget with an AppIntent configuration.
init<Provider>(String?, as: WidgetFamily, using: Provider.Intent, widge
: () -> some Widget, timelineProvider: () -> Provider)
Overview
Topics
Initializers
DeveloperToolsSupport / Preview
Structure
Preview
A base type that preview macros use to create previews.
iOS 17.0+
iPadOS 17.0+
Mac Catalyst 17.0+
macOS 14.0+
tvOS 17.0+
visionOS 1.0+
watchOS 10.0+


## Page 4

Creates a preview of a widget with an INIntent configuration.
init(String?, as: WidgetFamily, widget: () -> some Widget, timeline: ()
async -> [any TimelineEntry])
Creates a preview of a timeline-style widget.
init(String?, as: WidgetFamily, widget: () -> some Widget, timeline
Provider: () -> some TimelineProvider)
Creates a preview of a widget with a static configuration.
init(String?, immersionStyle: some ImmersionStyle, traits: PreviewTrait
Preview.ViewTraits>..., body: () -> any View, cameras: () -> [Preview
Camera])
Creates a preview of a SwiftUI view in an immersive space with custom viewpoints.
init(String?, traits: PreviewTrait<Preview.ViewTraits>..., body: () ->
NSView)
Creates a preview of an NSView.
init(String?, traits: PreviewTrait<Preview.ViewTraits>..., body: () ->
NSViewController)
Creates a preview of an NSViewController.
init(String?, traits: PreviewTrait<Preview.ViewTraits>..., body: () ->
UIView)
init(String?, traits: PreviewTrait<Preview.ViewTraits>..., body: () ->
any View)
Creates a preview of a SwiftUI view.
init(String?, traits: PreviewTrait<Preview.ViewTraits>..., body: () ->
UIViewController)
init(String?, traits: PreviewTrait<Preview.ViewTraits>..., body: () ->
any View, cameras: () -> [PreviewCamera])
Creates a preview of a SwiftUI view using the specified traits and custom viewpoints.
init<Entry>(String?, widget: () -> some Widget, relevanceEntries: ()
async -> [Entry])
Creates a preview of a relevance-driven widget.
init<Provider>(String?, widget: () -> some Widget, relevanceProvider: (
-> Provider)
Creates a preview of a relevance-driven widget.


## Page 5

init<Provider>(String?, widget: () -> some Widget, relevanceProvider: (
-> Provider, relevance: () async -> WidgetRelevance<Provider.
Configuration>)
Creates a preview of a relevance-driven widget.
init(String?, windowStyle: some WindowStyle, traits: PreviewTrait<
Preview.ViewTraits>..., body: () -> any View, cameras: () -> [Preview
Camera])
Creates a preview of a SwiftUI view in a window with custom viewpoints.
enum ViewTraits
Traits that apply to previews of views and view controllers.
Sendable, SendableMetatype
protocol PreviewRegistry
A protocol that the system uses to locate previews at runtime.
enum PreviewLayout
A size constraint for a preview.
struct PreviewTrait
Customizations that you can apply to a preview.
Enumerations
Relationships
Conforms To
See Also
Preview Registration


## Page 6

Customize the layout of a preview that you define using the PreviewProvider protocol by
providing one of the preview layout values to the previewLayout(_:) view modifier. For
example, you can tell the preview to take up only the amount of space that the view requires with
PreviewLayout.sizeThatFits:
Note
When you migrate away from preview providers and to preview macros, you specify layout
using one of the PreviewTrait layout values with a macro that takes traits, like
Preview(_:traits:_:body:).
Overview
Topics
DeveloperToolsSupport / PreviewLayout
Enumeration
PreviewLayout
A size constraint for a preview.
iOS 13.0+
iPadOS 13.0+
Mac Catalyst 13.0+
macOS 10.15+
tvOS 13.0+
visionOS 1.0+
watchOS 6.0+


## Page 7

case device
Center the preview in a container the size of the device on which the preview is running.
case fixed(width: CGFloat, height: CGFloat)
Center the preview in a fixed size container with the given dimensions.
case fixed3D(width: CGFloat, height: CGFloat, depth: CGFloat)
Centers the preview in a fixed-size, 3D container.
case sizeThatFits
Fit the container to the size of the preview when offered the size of the device that the
preview is running on.
Sendable, SendableMetatype
protocol PreviewRegistry
A protocol that the system uses to locate previews at runtime.
struct Preview
A base type that preview macros use to create previews.
struct PreviewTrait
Customizations that you can apply to a preview.
Enumeration Cases
Relationships
Conforms To
See Also
Preview Registration


## Page 8

init(PreviewTrait<T>...)
Convenience to compose multiple traits into a single trait.
static var assistiveAccess: PreviewTrait<Preview.ViewTraits>
Apply the visual style used in Assistive Access on iOS and iPadOS. On other platforms, this i
a no-op.
static var defaultLayout: PreviewTrait<Preview.ViewTraits>
Center the preview in a container the size of the device on which the preview is running.
static var landscapeLeft: PreviewTrait<Preview.ViewTraits>
The device is in landscape mode, with the top of the device on the left.
static var landscapeRight: PreviewTrait<Preview.ViewTraits>
The device is in landscape mode, with the top of the device on the right.
Topics
Initializers
Type Properties
DeveloperToolsSupport / PreviewTrait
Structure
PreviewTrait
Customizations that you can apply to a preview.
iOS 17.0+
iPadOS 17.0+
Mac Catalyst 17.0+
macOS 14.0+
tvOS 17.0+
visionOS 1.0+
watchOS 10.0+


## Page 9

static var portrait: PreviewTrait<Preview.ViewTraits>
The device is in portrait mode, with the top of the device on top.
static var portraitUpsideDown: PreviewTrait<Preview.ViewTraits>
The device is in portrait mode, but is upside down.
static var sizeThatFitsLayout: PreviewTrait<Preview.ViewTraits>
Fit the container to the size of the preview when offered the size of the device that the
preview is running on.
static func fixedLayout(width: CGFloat, height: CGFloat) -> PreviewTrai
<T>
Center the preview in a fixed size container with the given dimensions.
static func fixedLayout(width: CGFloat, height: CGFloat, depth: CGFloat
-> PreviewTrait<T>
Centers the preview in a fixed-size, 3D container.
static func modifier(some PreviewModifier) -> PreviewTrait<T>
Attach a PreviewModifier to the preview.
Sendable, SendableMetatype
protocol PreviewRegistry
A protocol that the system uses to locate previews at runtime.
Type Methods
Relationships
Conforms To
See Also
Preview Registration


## Page 10

struct Preview
A base type that preview macros use to create previews.
enum PreviewLayout
A size constraint for a preview.


