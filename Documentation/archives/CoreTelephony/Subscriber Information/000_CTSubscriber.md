# 000_CTSubscriber.pdf

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


