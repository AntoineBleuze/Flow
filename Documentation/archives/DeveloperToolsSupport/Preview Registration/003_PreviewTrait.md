# 003_PreviewTrait.pdf

## Page 1

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


## Page 2

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


## Page 3

struct Preview
A base type that preview macros use to create previews.
enum PreviewLayout
A size constraint for a preview.


