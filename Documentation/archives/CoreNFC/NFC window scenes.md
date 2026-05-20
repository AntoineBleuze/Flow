# NFC window scenes.pdf

## Page 1

When the device is eligible to receive NFC-related events, use this protocol to update your user
interface. The received NFCWindowSceneEvent indicates whether the event represents the
presence of a card reader or a gesture to initiate a contactless transaction by the person using th
app.
You typically add conformance to this protocol in your app’s main scene delegate, where you
already conform to UIWindowSceneDelegate.
func windowScene(UIWindowScene, didReceiveNFCWindowSceneEvent: NFCWindo
SceneEvent)
Informs your app that the system has received an NFC-related event.
Required
enum NFCWindowSceneEvent
An NFC-related event that your app uses to update its user interface.
Overview
Topics
Handling events
Core NFC / NFCWindowSceneDelegate
Protocol
NFCWindowSceneDelegate
A protocol to notify your app’s user interface about NFC-related events.
CoreNFC
UIKit
iOS 17.4+
iPadOS 17.4+
Mac Catalyst


## Page 2

enum NFCWindowSceneEvent
An NFC-related event that your app uses to update its user interface.
See Also
NFC window scenes


## Page 3

When the device is eligible to receive NFC-related events, this type indicates the type of received
event. The event may indicate the presence of an NFC reader or a gesture by the person using th
app to initiate a contactless transaction. NFCWindowSceneEvent represents these as the
NFCWindowSceneEvent.readerDetected and NFCWindowSceneEvent.presentation
cases, respectively.
You can receive this event in two scenarios:
When the system calls UISceneDelegate method scene(_:willConnectTo:options:
the system created a new scene in response to the event. In this case, check the connection
Options parameter for the presence of the nfcEvent member, which is an instance of
NFCWindowSceneEvent.
When the system calls the NFCWindowSceneDelegate method windowScene(_:did
ReceiveNFCWindowSceneEvent:), the system delivered the event to an existing scene.
In either case, store the event and use it to update the UI for an NFC interaction. The following
example shows a scene delegate that handles both scenarios, using a ViewModel class to store
the event for use by an appropriate view:
Overview
Core NFC / NFCWindowSceneEvent
Enumeration
NFCWindowSceneEvent
An NFC-related event that your app uses to update its user interface.
CoreNFC
UIKit
iOS 17.4+
iPadOS 17.4+
Mac Catalyst


## Page 4

case readerDetected
The eligible device detected the RF field of an NFC reader.
case presentation
The user performed a gesture to present an NFC display.
Topics
Events
Relationships
Conforms To


## Page 5

CustomStringConvertible
Decodable
Encodable
Equatable
Hashable
protocol NFCWindowSceneDelegate
A protocol to notify your app’s user interface about NFC-related events.
See Also
NFC window scenes


