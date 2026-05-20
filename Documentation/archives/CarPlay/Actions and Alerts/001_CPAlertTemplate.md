# 001_CPAlertTemplate.pdf

## Page 1

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


## Page 2

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


