# 004_CLSActivityItem.pdf

## Page 1

You don’t typically use an instance of this class directly. Instead, use one of its subclasses to
represent a particular activity metric. For example, use a CLSScoreItem to add a score to a
CLSContextType.quiz activity.
var identifier: String
An identifier for the activity item.
var title: String
A human readable name for the activity item.
Overview
Topics
Accessing Activity Item Information
Relationships
ClassKit / CLSActivityItem
Class
CLSActivityItem
An abstract base class for gathering information about an activity.
iOS 11.3+
iPadOS 11.3+
Mac Catalyst 11.3+
macOS 11.0+
visionOS 1.0+


## Page 2

CLSObject
CLSBinaryItem, CLSQuantityItem, CLSScoreItem
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCoding
NSObjectProtocol
NSSecureCoding
Recording additional metrics about a completed task
Add an activity item to an activity to record additional information about a student’s attempt 
complete a task.
class CLSScoreItem
Activity information that signifies a score out of a possible maximum.
class CLSBinaryItem
Activity information that is true or false, pass or fail, yes or no.
class CLSQuantityItem
Activity information that signifies a quantity.
Inherits From
Inherited By
Conforms To
See Also
Activity items


