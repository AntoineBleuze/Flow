# 001_CPGridTemplate.pdf

## Page 1

Use this template to display a grid of items as buttons. When creating the grid template, provide a
array of CPGridButton objects. Each button contains a title, an image, and an optional handler
that the system invokes after the user taps the button on the CarPlay screen.
When there are more than eight buttons in the array, the template displays only the first eight.
When there are more than four buttons, the template balances the display of the buttons betweem
two rows.
init(title: String?, gridButtons: [CPGridButton])
Creates a grid template with a title and a set of buttons.
class CPGridButton
A menu item button displayed on a grid template.
Overview
Topics
Creating a Grid Template
Getting the Grid Title
CarPlay / CPGridTemplate
Class
CPGridTemplate
A template that displays and manages a grid of items.
iOS 12.0+
iPadOS 12.0+
Mac Catalyst 13.1+


## Page 2

var title: String
The title shown in the grid template’s navigation bar.
var gridButtons: [CPGridButton]
The array of grid buttons displayed on the template.
func updateGridButtons([CPGridButton])
func updateTitle(String)
class var maximumGridButtonImageSize: CGSize
The expected image size for your @c CPGridButton.
CPTemplate
CPBarButtonProviding
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCoding
NSObjectProtocol
NSSecureCoding
Sendable
Getting the Grid Buttons
Instance Methods
Type Properties
Relationships
Inherits From
Conforms To


## Page 3

SendableMetatype
class CPListTemplate
A template that displays and manages a list of items.
class CPTabBarTemplate
A container template that displays and manages other templates, presenting them as tabs.
class CPTemplate
An abstract base class for interface templates.
protocol CPBarButtonProviding
The methods that templates use to provide buttons for the navigation bar.
See Also
General Purpose Templates


