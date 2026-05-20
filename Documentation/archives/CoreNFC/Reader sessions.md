# Reader sessions.pdf

## Page 1

As with the NFCReaderSession base class, only one NFC NDEF reader session can be active in
the system at a time. If you create an additional session, the system puts it in a queue and
processes it in first-in, first-out (FIFO) order.
init(delegate: any NFCNDEFReaderSessionDelegate, queue: dispatch_queue_
?, invalidateAfterFirstRead: Bool)
Creates and initializes a new NFC NDEF reader session.
protocol NFCNDEFReaderSessionDelegate
A protocol that an object implements to serve as an NDEF reader session delegate.
func connect(to: any NFCNDEFTag, completionHandler: ((any Error)?) ->
Void)
Overview
Topics
Creating a Session
Connecting to a Tag
Core NFC / NFCNDEFReaderSession
Class
NFCNDEFReaderSession
A reader session for detecting NFC Data Exchange Format (NDEF) tags.
iOS 11.0+
iPadOS 11.0+
Mac Catalyst 13.1+


## Page 2

Connects the reader session to a tag and activates that tag.
func restartPolling()
Restarts the polling sequence so the reader session can discover new tags.
NFCReaderSession
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NFCReaderSessionProtocol
NSObjectProtocol
class NFCTagReaderSession
A reader session for detecting ISO7816, ISO15693, FeliCa, and MIFARE tags.
class NFCPaymentTagReaderSession
A reader session that supports the use of payment tags.
class NFCVASReaderSession
A reader session for processing Value Added Service (VAS) tags.
Restarting the Polling Sequence
Relationships
Inherits From
Conforms To
See Also
Reader sessions


## Page 3

class NFCReaderSession
The abstract base class that represents a reader session for detecting NFC tags.
protocol NFCReaderSessionProtocol
A general interface for interacting with a reader session.
Near Field Communication Tag Reader Session Formats Entitlement
The Near Field Communication data formats an app can read.


## Page 4

Use NFCTagReaderSession to interact with one of the tag types listed in NFCTagType. To use thi
reader session, you must:
Include the Near Field Communication Tag Reader Session Formats
Entitlement in your app.
Provide a non-empty string for the NFCReaderUsageDescription key in your app’s
information property list file.
To interact with ISO 7816 tags, add the list of the application identifiers supported in your app to
the ISO7816 application identifiers for NFC Tag Reader Session information
property list key. If you include the application identifier D2760000850101—the identifier for the
NDEF application on MIFARE DESFire tags (NFC Forum T4T tag platform)—and the reader session
finds a tag matching this identifier, it sends the delegate an NFCISO7816Tag tag object. To get
the MIFARE DESFire tag as an NFCMiFareTag object, don’t include D2760000850101 in the
application identifier list.
Only one reader session of any type can be active in the system at a time. The system puts
additional sessions in a queue and processes them in first-in, first-out (FIFO) order.
Overview
Core NFC / NFCTagReaderSession
Class
NFCTagReaderSession
A reader session for detecting ISO7816, ISO15693, FeliCa, and MIFARE tags.
iOS 13.0+
iPadOS 13.0+
Mac Catalyst 13.1+


## Page 5

Important
NFCTagReaderSession doesn’t support selection of payment-related application IDs. In the
European Union (EU), you can use NFCPaymentTagReaderSession, as described in that
class’s documentation.
convenience init?(pollingOption: NFCTagReaderSession.PollingOption,
delegate: any NFCTagReaderSessionDelegate, queue: DispatchQueue?)
Creates an NFC tag reader session.
struct PollingOption
Options that determine the type of tags that a reader session should detect during a polling
sequence.
protocol NFCTagReaderSessionDelegate
A protocol that an object implements to receive callbacks sent from an NFC tag reader
session.
func connect(to: NFCTag, completionHandler: ((any Error)?) -> Void)
Connects the reader session to a tag and activates that tag.
var connectedTag: NFCTag?
The tag connected to the reader session.
func restartPolling()
Restarts the polling sequence so the reader session can discover new tags.
func connect(to: NFCTag) async throws
Topics
Creating a Tag Reader Session
Connecting to a Tag
Restarting the Polling Sequence
Instance Methods


## Page 6

NFCReaderSession
NFCPaymentTagReaderSession
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NFCReaderSessionProtocol
NSObjectProtocol
class NFCNDEFReaderSession
A reader session for detecting NFC Data Exchange Format (NDEF) tags.
class NFCPaymentTagReaderSession
A reader session that supports the use of payment tags.
class NFCVASReaderSession
A reader session for processing Value Added Service (VAS) tags.
class NFCReaderSession
The abstract base class that represents a reader session for detecting NFC tags.
protocol NFCReaderSessionProtocol
Relationships
Inherits From
Inherited By
Conforms To
See Also
Reader sessions


## Page 7

A general interface for interacting with a reader session.
Near Field Communication Tag Reader Session Formats Entitlement
The Near Field Communication data formats an app can read.


## Page 8

This subclass of NFCTagReaderSession adds support for payment tags, when someone uses
your app in certain regions. To support payment tags in your app, intialize this class with a NFCTa
ReaderSessionDelegate. The delegate receives an object that conforms to the
NFCISO7816Tag protocol when the NFCTagReaderSession detects an ISO 7816-compatible
tag. For the delegate to receive the tag object, your app must include:
The Near Field Communication Tag Reader Session Formats Entitlement
A list of supported application identifiers in the ISO7816 application identifiers for
NFC Tag Reader Session information property list key
When the session discovers an ISO 7816-compatible tag, the session performs a SELECT
command for each application identifier provided in ISO7816 application identifiers
for NFC Tag Reader Session. The SELECT command searches for the identifiers in the
order in which they appear in the array. The session calls the tagReaderSession:didDetect
Tags: delegate method after the first successful SELECT command. The initialSelectedAI
property of the found tag contains the selected identifier.
The tag must be available to the reader session, so it can read and write data to the tag. Use the i
Available property to check the tag’s availability. To connect to an available tag, call the
superclass’s connect(to:completionHandler:) method.
The system only supports one active NFCReaderSession at a time. The system queues and
processes subsequently opened sessions in first-in-first-out order.
Overview
Core NFC / NFCPaymentTagReaderSession
Class
NFCPaymentTagReaderSession
A reader session that supports the use of payment tags.
iOS 26.0+
iPadOS 26.0+
Mac Catalyst 26.0+


## Page 9

Important
The system supports use of NFCPaymentTagReaderSession only within the European
Union (EU). People using your app must have an account registered in the EU, and their device
must be located within the EU. These registration and device location requirements also apply
to developing and testing apps that use this API. If the device isn’t currently eligible to use
NFCPaymentTagReaderSession, the NFCPaymentTagReaderSession.reading
Available property is false.
convenience init(delegate: any NFCTagReaderSessionDelegate, queue:
DispatchQueue?)
Creates a new session instance for processing NFC payment tags.
protocol NFCTagReaderSessionDelegate
A protocol that an object implements to receive callbacks sent from an NFC tag reader
session.
NFCTagReaderSession
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NFCReaderSessionProtocol
NSObjectProtocol
Topics
Creating a tag reader session
Relationships
Inherits From
Conforms To


## Page 10

class NFCNDEFReaderSession
A reader session for detecting NFC Data Exchange Format (NDEF) tags.
class NFCTagReaderSession
A reader session for detecting ISO7816, ISO15693, FeliCa, and MIFARE tags.
class NFCVASReaderSession
A reader session for processing Value Added Service (VAS) tags.
class NFCReaderSession
The abstract base class that represents a reader session for detecting NFC tags.
protocol NFCReaderSessionProtocol
A general interface for interacting with a reader session.
Near Field Communication Tag Reader Session Formats Entitlement
The Near Field Communication data formats an app can read.
See Also
Reader sessions


## Page 11

Note
Using NFCVASReaderSession requires an entitlement from Apple. Updates will include
information about the entitlement and a link to the entitlement request form.
init(vasCommandConfigurations: [NFCVASCommandConfiguration], delegate:
any NFCVASReaderSessionDelegate, queue: dispatch_queue_t?)
Creates a VAS reader session.
class NFCVASCommandConfiguration
An object providing the configuration for a GET VAS DATA command.
protocol NFCVASReaderSessionDelegate
Overview
Topics
Creating a VAS Reader Session
Core NFC / NFCVASReaderSession
Class
NFCVASReaderSession
A reader session for processing Value Added Service (VAS) tags.
iOS 13.0+
iPadOS 13.0+
Mac Catalyst 13.1+


## Page 12

A protocol that an object implements to receive callbacks from a VAS reader session.
NFCReaderSession
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NFCReaderSessionProtocol
NSObjectProtocol
class NFCNDEFReaderSession
A reader session for detecting NFC Data Exchange Format (NDEF) tags.
class NFCTagReaderSession
A reader session for detecting ISO7816, ISO15693, FeliCa, and MIFARE tags.
class NFCPaymentTagReaderSession
A reader session that supports the use of payment tags.
class NFCReaderSession
The abstract base class that represents a reader session for detecting NFC tags.
protocol NFCReaderSessionProtocol
A general interface for interacting with a reader session.
Relationships
Inherits From
Conforms To
See Also
Reader sessions


## Page 13

Near Field Communication Tag Reader Session Formats Entitlement
The Near Field Communication data formats an app can read.


## Page 14

You do not create instances of this class. Instead, you create and use an instance of
NFCNDEFReaderSession or NFCTagReaderSession. Only one reader session of any type ca
be active in the system at a time. The system puts additional sessions in a queue and processes
them in FIFO order.
class var readingAvailable: Bool
A Boolean value that determines whether the device supports NFC tag reading.
var delegate: AnyObject?
The delegate of the reader session.
var sessionQueue: dispatch_queue_t
Overview
Topics
Determining Tag Reading Capability
Working with a Session
Core NFC / NFCReaderSession
Class
NFCReaderSession
The abstract base class that represents a reader session for detecting NFC tags.
iOS 11.0+
iPadOS 11.0+
Mac Catalyst 13.1+


## Page 15

The queue on which the reader session delegate callbacks and completion block handlers ar
dispatched.
NSObject
NFCNDEFReaderSession, NFCTagReaderSession, NFCVASReaderSession
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NFCReaderSessionProtocol
NSObjectProtocol
class NFCNDEFReaderSession
A reader session for detecting NFC Data Exchange Format (NDEF) tags.
class NFCTagReaderSession
A reader session for detecting ISO7816, ISO15693, FeliCa, and MIFARE tags.
class NFCPaymentTagReaderSession
A reader session that supports the use of payment tags.
class NFCVASReaderSession
Relationships
Inherits From
Inherited By
Conforms To
See Also
Reader sessions


## Page 16

A reader session for processing Value Added Service (VAS) tags.
protocol NFCReaderSessionProtocol
A general interface for interacting with a reader session.
Near Field Communication Tag Reader Session Formats Entitlement
The Near Field Communication data formats an app can read.


## Page 17

var isReady: Bool
A Boolean value that indicates whether the reader session is started and ready to use.
Required
var isReady: Bool
A Boolean value that indicates whether the reader session is started and ready to use.
Required
func begin()
Starts the reader session.
Required
func invalidate()
Closes the reader session, which prevents it from being reused.
Required
func invalidate(errorMessage: String)
Topics
Determining Reader Session Readiness
Managing a Reader Session
Core NFC / NFCReaderSessionProtocol
Protocol
NFCReaderSessionProtocol
A general interface for interacting with a reader session.
iOS 11.0+
iPadOS 11.0+
Mac Catalyst 13.1+


## Page 18

Closes the reader session and displays an error message to the user.
Required
var alertMessage: String
A custom description that helps users understand how they can use NFC reader mode in you
app.
Required
func begin()
Starts the reader session.
Required
func invalidate()
Closes the reader session, which prevents it from being reused.
Required
func invalidate(errorMessage: String)
Closes the reader session and displays an error message to the user.
Required
var alertMessage: String
A custom description that helps users understand how they can use NFC reader mode in you
app.
Required
NSObjectProtocol
NFCNDEFReaderSession
NFCPaymentTagReaderSession
NFCReaderSession
NFCTagReaderSession
NFCVASReaderSession
Relationships
Inherits From
Conforming Types


## Page 19

class NFCNDEFReaderSession
A reader session for detecting NFC Data Exchange Format (NDEF) tags.
class NFCTagReaderSession
A reader session for detecting ISO7816, ISO15693, FeliCa, and MIFARE tags.
class NFCPaymentTagReaderSession
A reader session that supports the use of payment tags.
class NFCVASReaderSession
A reader session for processing Value Added Service (VAS) tags.
class NFCReaderSession
The abstract base class that represents a reader session for detecting NFC tags.
Near Field Communication Tag Reader Session Formats Entitlement
The Near Field Communication data formats an app can read.
See Also
Reader sessions


## Page 20

Key
com.apple.developer.nfc.readersession.formats
Type
Array of strings
TAG
Allows read and write access to a tag using NFCTagReaderSession.
To add this entitlement to your app, enable the Near Field Communication Tag Reading capability 
Xcode.
Details
Possible Values
Discussion
See Also
Wireless interfaces
Bundle Resources / Entitlements / Near Field Communication Tag Reader Session Formats Entitlement
Property List Key
Near Field Communication Tag Reader
Session Formats Entitlement
The Near Field Communication data formats an app can read.
iOS 11.0+
iPadOS 11.0+


## Page 21

Access Wi-Fi Information Entitlement
A Boolean value indicating whether your app can access information about the connected W
Fi network.
Key: com.apple.developer.networking.wifi-info
Wireless Accessory Configuration Entitlement
A Boolean value that indicates whether your app may configure MFi Wi-Fi accessories.
Key: com.apple.external-accessory.wireless-configuration
Multipath Entitlement
A Boolean value indicating whether your app may use Multipath protocols to seamlessly
transition between Wi-Fi and cellular networks.
Key: com.apple.developer.networking.multipath
Hotspot Configuration Entitlement
A Boolean value indicating whether your app can use the hotspot manager to configure Wi-F
networks.
Key: com.apple.developer.networking.HotspotConfiguration
HotSpot Helper
An entitlement that permits an app to participate in navigating Wi-Fi network hotspots.
Key: com.apple.developer.networking.HotspotHelper
ISO18092 system codes for NFC Tag Reader Session
A list of FeliCa system codes that the app supports.
Key: com.apple.developer.nfc.readersession.felica.systemcodes
ISO7816 application identifiers for NFC Tag Reader Session
A list of application identifiers that the app supports.
Key: com.apple.developer.nfc.readersession.iso7816.select-identifiers
com.apple.developer.nfc.hce
A Boolean value indicating whether your app can use the card session API.
com.apple.developer.nfc.hce.iso7816.select-identifier-prefixes
An array of identifier strings the app handles with the card session API.
com.apple.developer.nfc.hce.default-contactless-app
A Boolean value indicating whether your app can be a default app for contactless NFC with
the card session API.


