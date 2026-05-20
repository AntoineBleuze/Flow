# 000_CPButton.pdf

## Page 1

You create instances of CPButton to provide a template’s actions. The button displays a custom
image that communicates its function. When a user taps the button, CarPlay invokes the handler
you provide. The template that contains the button manages its appearance.
The framework provides specialized subclasses for common actions, such as CPContactCall
Button or CPContactMessageButton.
init(image: UIImage, handler: ((CPButton) -> Void)?)
Creates a button that displays an image and invokes a handler when the user taps it.
let CPButtonMaximumImageSize: CGSize
The maximum size of a button’s image that CarPlay supports.
var image: UIImage?
Overview
Topics
Creating a Button
Getting the Button’s Image
CarPlay / CPButton
Class
CPButton
A button that displays an image and invokes a handler when the user taps it.
iOS 14.0+
iPadOS 14.0+
Mac Catalyst 14.0+


## Page 2

The button’s image.
var title: String?
The button’s title.
var isEnabled: Bool
A Boolean value that determines whether the button is in an enabled state.
NSObject
CPContactCallButton, CPContactDirectionsButton, CPContactMessageButton
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
class CPImageSet
Light and dark representations of an image.
Configuring the Button’s Attributes
Relationships
Inherits From
Inherited By
Conforms To
See Also
Related Types


## Page 3

let CarPlayErrorDomain: String
The domain that CarPlay uses for any errors it provides.


