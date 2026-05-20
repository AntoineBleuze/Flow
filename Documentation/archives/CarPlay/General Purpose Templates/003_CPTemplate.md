# 003_CPTemplate.pdf

## Page 1

CPTemplate is an abstract base class for defining CarPlay user interface templates. It provides
the common functionality present in all templates.
You don’t use this class directly, or create your own subclasses. Instead, you must use one of the
prebuilt templates, such as CPListTemplate or CPGridTemplate.
var userInfo: Any?
Any custom data or object that you want to associate with the template.
var tabTitle: String?
A short title that describes the content of the tab.
var tabImage: UIImage?
Overview
Topics
Accessing Template Information
Accessing Tab Information
CarPlay / CPTemplate
Class
CPTemplate
An abstract base class for interface templates.
iOS 12.0+
iPadOS 12.0+
Mac Catalyst 13.1+


## Page 2

An image that represents the content of the tab.
var tabSystemItem: UITabBarItem.SystemItem
A system object that provides a title and image for common tab content, such as contacts o
favorites.
var showsTabBadge: Bool
An indicator you use to call attention to the tab.
NSObject
CPActionSheetTemplate
CPAlertTemplate
CPContactTemplate
CPGridTemplate
CPInformationTemplate
CPListTemplate
CPMapTemplate
CPNowPlayingTemplate
CPPointOfInterestTemplate
CPSearchTemplate
CPTabBarTemplate
CPVoiceControlTemplate
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCoding
NSObjectProtocol
NSSecureCoding
Relationships
Inherits From
Inherited By
Conforms To


## Page 3

Sendable
class CPListTemplate
A template that displays and manages a list of items.
class CPGridTemplate
A template that displays and manages a grid of items.
class CPTabBarTemplate
A container template that displays and manages other templates, presenting them as tabs.
protocol CPBarButtonProviding
The methods that templates use to provide buttons for the navigation bar.
See Also
General Purpose Templates


