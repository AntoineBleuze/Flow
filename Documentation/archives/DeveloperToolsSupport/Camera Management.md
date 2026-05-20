# Camera Management.pdf

## Page 1

Use one or more preview cameras with one of the preview macros that takes a cameras input —
like Preview(_:traits:body:cameras:) — to create custom viewpoints for the preview. Th
canvas offers custom cameras in its camera picker along with a set of standard cameras. The
preview uses the first custom camera that you specify as the default viewpoint when the preview
appears.
For example, you can create custom cameras from the top, leading, and front viewpoints:
Overview
Topics
Initializers
DeveloperToolsSupport / PreviewCamera
Structure
PreviewCamera
A camera that defines a viewpoint in a preview.
visionOS 1.0+


## Page 2

init(from: UnitPoint3D, zoom: Double, name: String?)
Creates a camera that looks toward the preview center from a specified unit point.
init(lookingAt: Point3D, from: Point3D, name: String?)
Creates a camera that looks towards a specified point in the preview from a different specifie
point.
Sendable, SendableMetatype
struct PreviewCameraBuilder
A builder type that composes a collection of cameras for previewing a view in a 3D scene.
Relationships
Conforms To
See Also
Camera Management


## Page 3

You implicitly use a preview camera builder when you define a list of PreviewCamera instances
for a preview macro:
static func buildArray([[PreviewCamera]]) -> [PreviewCamera]
Builds a partial result from an array of partial results.
Overview
Topics
Type Methods
DeveloperToolsSupport / PreviewCameraBuilder
Structure
PreviewCameraBuilder
A builder type that composes a collection of cameras for previewing a view in a 3
scene.
visionOS 1.0+


## Page 4

static func buildExpression(PreviewCamera) -> [PreviewCamera]
Builds a partial result from a single camera.
static func buildExpression([PreviewCamera]) -> [PreviewCamera]
Builds a partial result from an array of cameras.
static func buildPartialBlock(accumulated: [PreviewCamera], next: [
PreviewCamera]) -> [PreviewCamera]
Combines an accumulated component with a new component.
static func buildPartialBlock(first: [PreviewCamera]) -> [PreviewCamera
Builds a partial result component from the first component.
struct PreviewCamera
A camera that defines a viewpoint in a preview.
See Also
Camera Management


