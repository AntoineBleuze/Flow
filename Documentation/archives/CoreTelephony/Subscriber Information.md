# Subscriber Information.pdf

## Page 1

var identifier: String
An implementation-defined identifier used to correlate this subscriber with information
vended by other APIs.
var delegate: (any CTSubscriberDelegate)?
A delegate that receives updates on the subscriber information.
var carrierToken: Data?
A data object containing authorization information about the subscriber.
func refreshCarrierToken() -> Bool
Attempts to refresh the carrier token.
let CTSubscriberTokenRefreshed: String
The name of the notification indicating that the carrier token is available.
Topics
Identifying the subscriber
Working with a delegate
Managing the carrier token
Core Telephony / CTSubscriber
Class
CTSubscriber
A cellular network subscriber.
iOS 7.0+
iPadOS 7.0+


## Page 2

Deprecated
var isSIMInserted: Bool
A Boolean property that indicates whether a SIM is present.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
protocol CTSubscriberDelegate
A protocol to handle changes to subscriber information.
class CTSubscriberInfo
An object that provides an array of cellular network subscribers.
Detecting a SIM
Relationships
Inherits From
Conforms To
See Also
Subscriber Information


## Page 3

func subscriberTokenRefreshed(CTSubscriber)
Tells the delegate the subscriber’s token refreshed.
Required
class CTSubscriber
A cellular network subscriber.
class CTSubscriberInfo
An object that provides an array of cellular network subscribers.
Topics
Handling Token Updates
See Also
Subscriber Information
Core Telephony / CTSubscriberDelegate
Protocol
CTSubscriberDelegate
A protocol to handle changes to subscriber information.
iOS 12.1+
iPadOS 12.1+


## Page 4

Use the CTSubscriber instances provided by this class to identify individual subscribers by the
carrierToken or identifier properties.
class func subscribers() -> [CTSubscriber]
Returns the cellular network subscribers.
class func subscriber() -> CTSubscriber
Returns the cellular network subscribers.
Deprecated
Overview
Topics
Getting Subscriber Information
Relationships
Core Telephony / CTSubscriberInfo
Class
CTSubscriberInfo
An object that provides an array of cellular network subscribers.
iOS 6.0+
iPadOS 6.0+


## Page 5

NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
class CTSubscriber
A cellular network subscriber.
protocol CTSubscriberDelegate
A protocol to handle changes to subscriber information.
Inherits From
Conforms To
See Also
Subscriber Information


