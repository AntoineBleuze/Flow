# Related Types.pdf

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


## Page 4

CarPlay is set to dark appearance by default in most vehicles, but does provide the option to
automatically switch between dark and light appearance. Use an image set to provide images for
both appearances, and CarPlay displays the correct one for the current appearance.
init(lightContentImage: UIImage, darkContentImage: UIImage)
Creates an image set with light and dark versions of an image.
var lightContentImage: UIImage
The image the system displays when the user interface style is light.
var darkContentImage: UIImage
Overview
Topics
Creating an Image Set
Getting Content Images
CarPlay / CPImageSet
Class
CPImageSet
Light and dark representations of an image.
iOS 12.0+
iPadOS 12.0+
Mac Catalyst 13.1+


## Page 5

The image the system displays when the user interface style is dark.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCoding
NSObjectProtocol
NSSecureCoding
class CPButton
A button that displays an image and invokes a handler when the user taps it.
let CarPlayErrorDomain: String
The domain that CarPlay uses for any errors it provides.
Relationships
Inherits From
Conforms To
See Also
Related Types


## Page 6

class CPButton
A button that displays an image and invokes a handler when the user taps it.
class CPImageSet
Light and dark representations of an image.
See Also
Related Types
CarPlay / CarPlayErrorDomain
Global Variable
CarPlayErrorDomain
The domain that CarPlay uses for any errors it provides.
iOS 12.0+
iPadOS 12.0+
Mac Catalyst 14.0+


