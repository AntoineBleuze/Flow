# Testing eligibility to use alternative browser engines.pdf

## Page 1

class func isEligible(for: BEAvailability.Context, completionHandler: (
Bool, (any Error)?) -> Void)
Tests whether the device is eligible to use an app that contains an alternative browser engine
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
Topics
Testing eligibility
Relationships
Inherits From
Conforms To
BrowserKit / BEAvailability
Class
BEAvailability
A class that tests whether a device is eligible to run an alternative browser engine
iOS 18.4+
iPadOS 18.4+


## Page 2

NSObjectProtocol
enum Context
The category of app for which you determine eligibility.
See Also
Testing eligibility to use alternative browser engines


## Page 3

case webBrowser
The app is a web browser.
init?(rawValue: Int)
Creates a new instance with the specified raw value.
BitwiseCopyable
Equatable
Hashable
RawRepresentable
Topics
App categories
Initialization
Relationships
Conforms To
BrowserKit / BEAvailability / BEAvailability.Context
Enumeration
BEAvailability.Context
The category of app for which you determine eligibility.
iOS 18.4+
iPadOS 18.4+


## Page 4

Sendable
SendableMetatype
class BEAvailability
A class that tests whether a device is eligible to run an alternative browser engine.
See Also
Testing eligibility to use alternative browser engines


