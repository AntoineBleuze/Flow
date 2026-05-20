# 002_CPAlertAction.pdf

## Page 1

Use an alert action to display a button on an alert. The combination of the alert and the action
styles determines the appearance of the action button. To perform an action after the user taps th
button, provide a block to the action’s handler property.
init(title: String, style: CPAlertAction.Style, handler: CPAlertAction
Handler)
Creates an alert action with a title, style, and action handler.
var title: String
The action button’s title.
Overview
Topics
Creating an Alert Action
Getting the Title
CarPlay / CPAlertAction
Class
CPAlertAction
An object that encapsulates an action the user can perform on an action sheet or
alert.
iOS 12.0+
iPadOS 12.0+
Mac Catalyst 13.1+


## Page 2

var style: CPAlertAction.Style
The display style for the action button.
enum Style
Display styles for an alert’s action button.
var handler: CPAlertActionHandler
The closure that CarPlay invokes after the user taps the action button.
typealias CPAlertActionHandler
The declaration for an alert action handler.
init(title: String, color: UIColor, handler: CPAlertActionHandler)
var color: UIColor?
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
Getting the Action Style
Getting the Action Handler
Initializers
Instance Properties
Relationships
Inherits From
Conforms To


## Page 3

NSCoding
NSObjectProtocol
NSSecureCoding
class CPActionSheetTemplate
A template that displays a modal action sheet.
class CPAlertTemplate
A template that displays a modal alert.
See Also
Actions and Alerts


