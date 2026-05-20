# 000_SMS and Call Spam Reporting.pdf

## Page 1

To report SMS messages and calls as spam, the user must enable an Unwanted Communication
Reporting extension, called an SMS/Call Reporting extension in the Settings app (see Settings >
Phone > SMS/Call Reporting). The user can only enable one Unwanted Communication Reporting
extension at a time.
In order to report calls, the user swipes left on an item in the Recents list and selects Report. For
SMS messages, they press the Report Messages button when it appears in the Messages
transcript. Users can also select messages by long-pressing a message and selecting additional
messages, then selecting Report Messages.
When the user reports an SMS message or call, the system launches your Unwanted
Communication Reporting extension. Your extension gathers additional information from the user,
before deciding whether to report or block the number, as shown in the figure below.
Specifically, the system:
1. Instantiates your extension’s ILClassificationUIExtensionViewController subclass
2. Calls your controller’s prepare(for:) method and presents the controller to the user.
Overview
SMS and Call Reporting / SMS and Call Spam Reporting
API Collection
SMS and Call Spam Reporting
Create an app extension that lets users report unwanted SMS messages and calls
as junk.


## Page 2

Use your ILClassificationUIExtensionViewController subclass to gather data from th
user. Override the prepare(for:) method to configure your controller.
The system provides a Cancel and a Done button for the controller. By default, the system disable
the Done button. As soon as the user has entered all the information you require, enable the Done
button by setting the view controller’s isReadyForClassificationResponse property to
true.
If the user presses the Cancel button, the system dismisses your view controller, as shown in the
figure below.
If the user presses Done, the system calls your view controller’s classification
Response(for:) method, passing in an ILClassificationRequest object (see the figure
below).
Override the classificationResponse(for:) method to return a ILClassification
Response based on the data the user has entered and information about the SMS message or ca
from the request object.
The system takes different actions based on the response. For ILClassificationAction
.none, the system dismisses your view controller, but doesn’t take any other action, as shown in
the figure below.
Cancel or Complete the Report
Choose a Response


## Page 3

For ILClassificationAction.reportNotJunk or ILClassificationAction.report
Junk, the system generates a report based on your response’s action and userInfo propertie
and then posts it to a network endpoint or sends it using an SMS message, depending on the key
specified in your extension’s Info.plist file.
To send a response over the network connection, you must add an associated domain to your
extension. For general instructions, see Supporting associated domains. Note that you must use
classificationreport instead of webcredentials when specifying the domains. You mus
also specify the network endpoint’s address using the ILClassificationExtensionNetwor
ReportDestination key in your extension’s Info.plist file.
To send your response using SMS, specify a fully qualified destination telephony number using th
ILClassificationExtensionSMSReportDestination key in your extension’s Info.pli
file. When your app uses this report path, the system displays the SMS message to give the user
the opportunity to send or cancel the message.
When the report step is complete, the system dismisses your view controller and any view
controllers related to it (see the figure below).
For ILClassificationAction.reportJunkAndBlockSender, the system responds just lik
in the ILClassificationAction.reportJunk action. However, after the report step, the
system presents an alert letting the user know the number will be blocked. Finally, the system
blocks the SMS or call number, and dismisses your view controller as shown in the figure below.
Blocked numbers are added to the device’s Blocked Contact list. Users can manage this list in the
Settings app.


## Page 4

Finally, to protect user privacy, the system always deletes your extension’s container after your
extension terminates. For more information, see About the iOS File System.
class ILClassificationUIExtensionViewController
The superclass for an Unwanted Communication Reporting extension’s principal view
controller.
class ILCommunication
An abstract superclass representing a message or call to the user.
class ILMessageCommunication
A concrete subclass representing a SMS message.
class ILCallCommunication
A concrete subclass representing a phone call.
class ILClassificationRequest
The abstract superclass for classification requests.
class ILMessageClassificationRequest
A classification request for SMS messages.
class ILCallClassificationRequest
A classification request for phone calls.
class ILClassificationResponse
A response object that tells the system how to handle the reported communications.
enum ILClassificationAction
The actions the system can take in response to the reported communication.
Topics
App Extension
Communications
Requests
Responses


## Page 5

class ILMessageFilterCapabilitiesQueryRequest
A request to query a Message Filter extension about sharing its sub-category capabilities.
protocol ILMessageFilterCapabilitiesQueryHandling
A set of methods implemented by a Message Filter app extension to handle capabilities quer
requests.
class ILMessageFilterCapabilitiesQueryResponse
A response to a message filter capabilities query request.
enum ILMessageFilterSubAction
Responds to a received message with a filter subaction.
Queries
Responses


