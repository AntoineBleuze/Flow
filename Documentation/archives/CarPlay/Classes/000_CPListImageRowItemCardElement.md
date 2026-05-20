# 000_CPListImageRowItemCardElement.pdf

## Page 1

init(image: UIImage, showsImageFullHeight: Bool, title: String?,
subtitle: String?, tintColor: UIColor?)
Initialize an element that is constituted of an image, boolean to entirely cover the element wi
the image, title, subtitle and a tint color.
var showsImageFullHeight: Bool
A Boolean value indicating whether the element should be fill with the image.
var subtitle: String?
The subtitle associated with this element.
var tintColor: UIColor?
A UIColor used to tint the element. When @c showsImageFullHeight is true, the tint color is
applied behind the labels at the bottom of the card. Otherwise, this color is part of the
gradient color at the bottom of the card.
var title: String
The title associated with this element.
Topics
Initializers
Instance Properties
CarPlay / CPListImageRowItemCardElement
Class
CPListImageRowItemCardElement
iOS 26.0+
iPadOS 26.0+
Mac Catalyst 26.0+


## Page 2

class var maximumFullHeightImageSize: CGSize
The expected image size for the image in your @c CPListImageRowItemCardElement when
@c showsImageFullHeight is true. Images provided will be resized to this size.
class var maximumImageSize: CGSize
The expected image size for the image in your @c CPListImageRowItemCardElement when
@c showsImageFullHeight is false. Images provided will be resized to this size.
CPListImageRowItemElement
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Sendable
SendableMetatype
Type Properties
Relationships
Inherits From
Conforms To


