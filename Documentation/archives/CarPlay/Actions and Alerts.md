# Actions and Alerts.pdf

## Page 1

You must present action sheets modally by calling the presentTemplate(_:animated:
completion:) method available on your app’s instance of CPInterfaceController. The us
dismisses the action sheet by pressing a button, or you can dismiss it by calling the interface
controller’s dismissTemplate(animated:completion:) method.
init(title: String?, message: String?, actions: [CPAlertAction])
Creates an action sheet template.
var title: String?
The title of the action sheet.
var message: String?
Overview
Topics
Creating an Action Sheet Template
Getting Action Sheet Template Information
CarPlay / CPActionSheetTemplate
Class
CPActionSheetTemplate
A template that displays a modal action sheet.
iOS 12.0+
iPadOS 12.0+
Mac Catalyst 13.1+


## Page 2

The descriptive message providing details about the reason for displaying the action sheet.
var actions: [CPAlertAction]
The list of actions available on the action sheet.
CPTemplate
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCoding
NSObjectProtocol
NSSecureCoding
Sendable
SendableMetatype
class CPAlertTemplate
A template that displays a modal alert.
class CPAlertAction
An object that encapsulates an action the user can perform on an action sheet or alert.
Relationships
Inherits From
Conforms To
See Also
Actions and Alerts


## Page 3

You must present alerts modally by calling the presentTemplate(_:animated:
completion:) method available on your app’s instance of CPInterfaceController. The us
dismisses the alert by pressing a button, or you can dismiss it by calling the interface controller’s
dismissTemplate(animated:completion:) method.
init(titleVariants: [String], actions: [CPAlertAction])
Creates an alert template.
class var maximumActionCount: Int
The maximum number of actions allowed in an alert template.
var titleVariants: [String]
Overview
Topics
Creating an Alert Template
Getting the Alert Information
CarPlay / CPAlertTemplate
Class
CPAlertTemplate
A template that displays a modal alert.
iOS 12.0+
iPadOS 12.0+
Mac Catalyst 13.1+


## Page 4

The array of title variants.
var actions: [CPAlertAction]
The array of actions available on the alert.
CPTemplate
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCoding
NSObjectProtocol
NSSecureCoding
Sendable
SendableMetatype
class CPActionSheetTemplate
A template that displays a modal action sheet.
class CPAlertAction
An object that encapsulates an action the user can perform on an action sheet or alert.
Relationships
Inherits From
Conforms To
See Also
Actions and Alerts


## Page 5

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


## Page 6

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


## Page 7

NSCoding
NSObjectProtocol
NSSecureCoding
class CPActionSheetTemplate
A template that displays a modal action sheet.
class CPAlertTemplate
A template that displays a modal alert.
See Also
Actions and Alerts


