# Platform support.pdf

## Page 1

Use this type to wrap pieces of text describing the image you want to create. You can also specify
larger pieces of text that contain important concepts to extract and use to guide the image-
creation process.
static func text(String) -> ImagePlaygroundConcept
Creates a concept structure that includes a short text description.
static func extracted(from: String, title: String?) -> ImagePlayground
Concept
Creates a concept structure from a long-form string and a title that guides the extraction of
concepts from that string.
static func drawing(PKDrawing) -> ImagePlaygroundConcept
Creates a concept structure from a PencilKit drawing.
static func image(CGImage) -> ImagePlaygroundConcept
Overview
Topics
Describing the image
Image Playground / ImagePlaygroundConcept
Structure
ImagePlaygroundConcept
Text elements that specify the content to include in the image.
iOS 18.1+
iPadOS 18.1+
Mac Catalyst 18.1+
macOS 15.1+
visionOS 2.4+


## Page 2

Creates a concept structure from the specified image object.
static func image(URL) -> ImagePlaygroundConcept?
Creates a concept structure from the image at the specified URL.
struct ImagePlaygroundStyle
Style options that determine the appearance of generated images.
See Also
Platform support


## Page 3

When you create images programmatically, you can ask the system to create images in a particula
style. The generative model takes the requested style option and applies it to the content it
generates.
static let animation: ImagePlaygroundStyle
An option that yields animated images.
static let illustration: ImagePlaygroundStyle
An option that yields images in a 2D cartoon style.
static let sketch: ImagePlaygroundStyle
An option that yields images in the style of a hand-drawn sketch.
static var all: [ImagePlaygroundStyle]
An option that allows the creation of images in any style.
Overview
Topics
Getting the style options
Image Playground / ImagePlaygroundStyle
Structure
ImagePlaygroundStyle
Style options that determine the appearance of generated images.
iOS 18.4+
iPadOS 18.4+
Mac Catalyst 18.4+
macOS 15.4+
visionOS 2.4+


## Page 4

let id: String
A text-based description of the style option.
static let externalProvider: ImagePlaygroundStyle
An option that yields images in a style provided by an external provider
Decodable
Encodable
Equatable
Hashable
Identifiable
Sendable
SendableMetatype
struct ImagePlaygroundConcept
Text elements that specify the content to include in the image.
Getting the style identifier
Type Properties
Relationships
Conforms To
See Also
Platform support


