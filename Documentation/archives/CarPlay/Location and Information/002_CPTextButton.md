# 002_CPTextButton.pdf

## Page 1

You use a text button to attach custom actions to an instance of CPPointOfInterest or
CPInformationTemplate. When creating a button, you provide a closure that CarPlay invokes
when the user taps the button. You communicate the button’s purpose using a title and a text sty
that the button applies to the title.
init(title: String, textStyle: CPTextButtonStyle, handler: ((CPText
Button) -> Void)?)
Creates a button that displays a title in a specific style.
var title: String
The text the button displays.
Overview
Topics
Creating a Text Button
Managing the Title
CarPlay / CPTextButton
Class
CPTextButton
A button that displays a stylized title.
iOS 14.0+
iPadOS 14.0+
Mac Catalyst 14.0+


## Page 2

var textStyle: CPTextButtonStyle
The text style the button applies to its title.
enum CPTextButtonStyle
The styles a button can apply to its title to communicate its action.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
class CPPointOfInterestTemplate
A template that displays a map with selectable points of interest.
class CPInformationTemplate
A template that provides information for a point of interest, food order, parking location, or
charging location.
Integrating CarPlay with your quick-ordering app
Managing the Button Style
Relationships
Inherits From
Conforms To
See Also
Location and Information


## Page 3

Configure your food-ordering app to work with CarPlay.


