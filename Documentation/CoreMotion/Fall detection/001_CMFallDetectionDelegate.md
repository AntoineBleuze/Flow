# 001_CMFallDetectionDelegate.pdf

## Page 1

func fallDetectionManager(CMFallDetectionManager, didDetect: CMFall
DetectionEvent, completionHandler: () -> Void)
Indicates a fall detection event occurred.
func fallDetectionManagerDidChangeAuthorization(CMFallDetectionManager)
Indicates the fall detection authorization status changed.
NSObjectProtocol
Topics
Detecting Falls
Detecting Authorization Changes
Relationships
Inherits From
Core Motion / CMFallDetectionDelegate
Protocol
CMFallDetectionDelegate
A delegate that receives information about fall detection events and authorization
status changes.
watchOS 7.2+


## Page 2

class CMFallDetectionManager
An object for managing fall detection events.
class CMFallDetectionEvent
An object that contains data about a fall detection event.
NSFallDetectionUsageDescription
A message to the user that explains the app’s request for permission to access fall detection
event data.
See Also
Fall detection


