# 003_CLSQuantityItem.pdf

## Page 1

Use an activity item of this type to associate a discrete value with a task. For example, you might
use it to indicate how many times the user requested a hint while taking a quiz.
init(identifier: String, title: String)
Initializes an activity item that records a discrete quantity.
var quantity: Double
A quantity associated with the task.
Overview
Topics
Creating Quantity Activity Items
Managing the Quantity
Relationships
ClassKit / CLSQuantityItem
Class
CLSQuantityItem
Activity information that signifies a quantity.
iOS 11.3+
iPadOS 11.3+
Mac Catalyst 11.3+
macOS 11.0+
visionOS 1.0+


## Page 2

CLSActivityItem
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
class CLSActivityItem
An abstract base class for gathering information about an activity.
Inherits From
Conforms To
See Also
Activity items


