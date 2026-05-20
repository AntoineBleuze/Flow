# Caller ID.pdf

## Page 1

Use the Call Directory app extension to manage callers by their phone number. The system
communicates with the app extension and checks a person’s contacts and block lists to identify
callers.
Note
The CXCallDirectoryPhoneNumber type represents phone numbers in a Call Directory
app extension, and consists of a country calling code (such as 1 for the United States)
followed by a sequence of digits.
You can create a Call Directory app extension for your containing app by adding a new project
target and selecting the Call Directory Extension template under Application Extension.
Overview
Create a Call Directory app extension
CallKit / Identifying and blocking calls
Article
Identifying and blocking calls
Create a Call Directory app extension to identify and block incoming callers by
their phone number.


## Page 2

You set up both identification and blocking of incoming calls in the implementation of the begin
Request(with:) method of the CXCallDirectoryProvider subclass of your Call Directory
app extension. The system calls this method when it launches the app extension.
For more information about how app extensions work, see App extensions.
When a phone receives an incoming call, the system first checks the person’s contacts to find a
matching phone number. If there’s no match, the system then checks your app’s Call Directory ap
extension to find a matching entry to identify the phone number. This is useful for apps that
maintain a contact list that’s separate from the system contacts, such as for a social network, or f
identifying incoming calls that may initiate from within the app, such as for customer service
support or a delivery notification.
For example, consider a person who is friends with Maria in a social networking app, but who
doesn’t have her phone number in their contacts. The social networking app has a Call Directory
app extension, which downloads and adds the phone numbers of all of the person’s friends.
Because of this, when there’s an incoming call from Maria, the system displays something like (Ap
Name) Caller ID: Maria Ruiz rather than Unknown Caller.
Identify incoming callers


## Page 3

To provide identifying information about incoming callers, you use the addIdentification
Entry(withNextSequentialPhoneNumber:label:) method in the implementation of
beginRequest(with:).
Because the system calls this method only when it launches the app extension and not for each
individual call, you need to specify call identification information all at once. For example, you can
make a request to a web service to find information about an incoming call.
When a phone receives an incoming call, the system first checks the person’s block list to
determine whether to block the call. If the phone number isn’t on a user- or system-defined block
list, the system then checks your app’s Call Directory app extension to find a matching blocked
number. This is useful for apps that maintain a database of known solicitors, or allow someone to
block any numbers that match a set of criteria.
To block incoming calls for a particular phone number, you use the addBlockingEntry(with
NextSequentialPhoneNumber:) method in the implementation of beginRequest(with:)
Note
You can specify that your Call Directory app extension adds identification and blocks phone
numbers in its implementation of beginRequest(with:).
Objective-C
Block incoming calls
Objective-C
Swift
Swift


## Page 4

Like other audio apps, VoIP apps need to handle audio session interruptions. Interruptions may
occur for several reasons, including a person accepting another call or closing the Smart Folio of
their iPad. In these situations, an interruption notification contains the reason for the interruption
and allows your app to correctly terminate the call, if necessary. For more information, see Handli
audio interruptions.
class CXCallDirectoryProvider
The principal object for a Call Directory app extension for a host app.
class CXCallDirectoryExtensionContext
A programmatic interface for adding identification and blocking entries to a Call Directory ap
extension.
protocol CXCallDirectoryExtensionContextDelegate
A collection of methods a Call Directory extension context object calls when a request fails.
class CXCallDirectoryManager
The programmatic interface to an object that manages a Call Directory app extension.
Handle audio session interruptions
See Also
Caller ID


## Page 5

Identifying and blocking calls
func beginRequest(with: CXCallDirectoryExtensionContext)
Tells the extension to prepare for a host app’s request.
NSObject
Mentioned in
Topics
Beginning a Request
Relationships
Inherits From
Conforms To
CallKit / CXCallDirectoryProvider
Class
CXCallDirectoryProvider
The principal object for a Call Directory app extension for a host app.
iOS 10.0+
iPadOS 10.0+
Mac Catalyst 10.0+
visionOS 1.0+


## Page 6

CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSExtensionRequestHandling
NSObjectProtocol
Identifying and blocking calls
Create a Call Directory app extension to identify and block incoming callers by their phone
number.
class CXCallDirectoryExtensionContext
A programmatic interface for adding identification and blocking entries to a Call Directory ap
extension.
protocol CXCallDirectoryExtensionContextDelegate
A collection of methods a Call Directory extension context object calls when a request fails.
class CXCallDirectoryManager
The programmatic interface to an object that manages a Call Directory app extension.
See Also
Caller ID


## Page 7

The system doesn’t initialize CXCallDirectoryExtensionContext objects directly, but
instead passes them as arguments to the CXCallDirectoryProvider instance method begi
Request(with:).
var delegate: (any CXCallDirectoryExtensionContextDelegate)?
Sets a delegate that can handle request failures for the Call Directory extension context
object.
func addIdentificationEntry(withNextSequentialPhoneNumber: CXCall
DirectoryPhoneNumber, label: String)
Adds an identification entry with the specified phone number and label.
Overview
Topics
Setting the Delegate
Adding Entries
CallKit / CXCallDirectoryExtensionContext
Class
CXCallDirectoryExtensionContext
A programmatic interface for adding identification and blocking entries to a Call
Directory app extension.
iOS 10.0+
iPadOS 10.0+
Mac Catalyst 10.0+
visionOS 1.0+


## Page 8

func addBlockingEntry(withNextSequentialPhoneNumber: CXCallDirectory
PhoneNumber)
Adds a blocking entry with the specified phone number.
func removeAllBlockingEntries()
Removes all stored blocking entries.
func removeAllIdentificationEntries()
Removes all stored identification entries.
func removeBlockingEntry(withPhoneNumber: CXCallDirectoryPhoneNumber)
Removes a blocking entry that contains the specified phone number.
func removeIdentificationEntry(withPhoneNumber: CXCallDirectoryPhone
Number)
Removes an identification entry that contains the specified phone number.
var isIncremental: Bool
A Boolean value that indicates whether the request provides data incrementally.
func completeRequest(completionHandler: ((Bool) -> Void)?)
Completes the request to the extension context.
typealias CXCallDirectoryPhoneNumber
A value that represents a phone number consisting of a country calling code followed by a
sequence of digits.
let CXCallDirectoryPhoneNumberMax: CXCallDirectoryPhoneNumber
The maximum allowable value for a phone number.
Removing Entries
Completing Requests
Types
Relationships


## Page 9

NSExtensionContext
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Sendable
SendableMetatype
Identifying and blocking calls
Create a Call Directory app extension to identify and block incoming callers by their phone
number.
class CXCallDirectoryProvider
The principal object for a Call Directory app extension for a host app.
protocol CXCallDirectoryExtensionContextDelegate
A collection of methods a Call Directory extension context object calls when a request fails.
class CXCallDirectoryManager
The programmatic interface to an object that manages a Call Directory app extension.
Inherits From
Conforms To
See Also
Caller ID


## Page 10

func requestFailed(for: CXCallDirectoryExtensionContext, withError: any
Error)
Called when a Call Directory app extension request fails.
Required
NSObjectProtocol
Topics
Handling Request Failures
Relationships
Inherits From
CallKit / CXCallDirectoryExtensionContextDelegate
Protocol
CXCallDirectoryExtensionContext
Delegate
A collection of methods a Call Directory extension context object calls when a
request fails.
iOS 10.0+
iPadOS 10.0+
Mac Catalyst 10.0+
visionOS 1.0+


## Page 11

Identifying and blocking calls
Create a Call Directory app extension to identify and block incoming callers by their phone
number.
class CXCallDirectoryProvider
The principal object for a Call Directory app extension for a host app.
class CXCallDirectoryExtensionContext
A programmatic interface for adding identification and blocking entries to a Call Directory ap
extension.
class CXCallDirectoryManager
The programmatic interface to an object that manages a Call Directory app extension.
See Also
Caller ID


## Page 12

class var sharedInstance: CXCallDirectoryManager
Returns the shared call directory manager instance for the app.
func getEnabledStatusForExtension(withIdentifier: String, completion
Handler: (CXCallDirectoryManager.EnabledStatus, (any Error)?) -> Void)
Asynchronously returns the enabled status of the extension with the specified identifier.
func reloadExtension(withIdentifier: String, completionHandler: (((any
Error)?) -> Void)?)
Asynchronously reloads the extension with the specified identifier.
enum EnabledStatus
The enabled status of a Call Directory app extension, as reported by the getEnabled
StatusForExtension(withIdentifier:completionHandler:) method.
Topics
Accessing the Shared Instance
Working with a Call Directory App Extension
CallKit / CXCallDirectoryManager
Class
CXCallDirectoryManager
The programmatic interface to an object that manages a Call Directory app
extension.
iOS 10.0+
iPadOS 10.0+
Mac Catalyst 10.0+
visionOS 1.0+


## Page 13

func openSettings(completionHandler: (((any Error)?) -> Void)?)
Opens the iOS Settings app and shows the Call Blocking & Identification settings.
enum EnabledStatus
The enabled status of a Call Directory app extension, as reported by the getEnabled
StatusForExtension(withIdentifier:completionHandler:) method.
struct CXErrorCodeCallDirectoryManagerError
Errors when interacting with a call directory manager.
enum Code
Error codes the CallKit framework returns.
let CXErrorDomainCallDirectoryManager: String
Domain for errors when interacting with a call directory manager.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Opening the Settings App
Errors
Relationships
Inherits From
Conforms To


## Page 14

Identifying and blocking calls
Create a Call Directory app extension to identify and block incoming callers by their phone
number.
class CXCallDirectoryProvider
The principal object for a Call Directory app extension for a host app.
class CXCallDirectoryExtensionContext
A programmatic interface for adding identification and blocking entries to a Call Directory ap
extension.
protocol CXCallDirectoryExtensionContextDelegate
A collection of methods a Call Directory extension context object calls when a request fails.
See Also
Caller ID


