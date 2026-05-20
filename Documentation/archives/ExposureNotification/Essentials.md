# Essentials.pdf

## Page 1

iOS 13.7 and later can inform people of potential exposure to COVID-19 without a dedicated
Exposure Notifications app. This app-less functionality is called Exposure Notifications Express an
is only available when a Public Health Authority (PHA) supports it.
iOS continues to support dedicated Exposure Notifications apps, and a PHA can offer Exposure
Notifications apps and the app-less Exposure Notifications Express at the same time. When a use
enables Exposure Logging, iOS uses the PHA’s app if one is installed, and falls back to the app-les
experience if no app is installed and the PHA supports Exposure Notifications Express.
To support Exposure Notifications Express, a PHA must deploy two different types of servers:
Test verification server: Validates positive diagnoses during key upload. For more information,
see Setting Up an Exposure Notifications Express Test Verification Server.
Key server: Handles key uploads and downloads. The same key server handles key upload and
download for Exposure Notifications apps and Exposure Notifications Express. For more
information, see Configuring a Key Server for Exposure Notifications Express. For information o
setting up a key server, see Setting Up a Key Server.
Note
Prior to the introduction of Exposure Notifications Express in iOS 13.7, the Exposure
Notifications Key Server was referred to as the “Exposure Notifications Server” or the “EN
Server”.
Overview
Deploy Exposure Notifications Express Servers
Exposure Notification / Supporting Exposure Notifications Express
Supporting Exposure Notifications
Express
Configure servers to notify users of potential exposures to COVID-19 without an
app.


## Page 2

Exposure Notifications Express works by communicating with the test verification server and the
key server at specific times in a defined process, as depicted in the figure below.
Here are the steps involved with verifying and submitting a positive diagnosis with Exposure
Notifications Express.
1. First, a user with Exposure Notifications enabled on their iPhone running iOS 13.7 or later gets
tested for COVID-19.
2. The test center or other health care provider determines that the user has a positive test result
and reports it to the PHA.
3. The PHA generates a verification code using the test verification server.
4. The PHA sends the verification code to the user. The code may be emailed, read over the phon
or provided as a clickable deep link in a text message.
5. The user enters the verification code or clicks the provided link to inform their iPhone of the
positive diagnosis.
6. The user’s iPhone contacts the test verification server to validate the verification code. If the
code is valid, it receives back a long-term authentication token from the test verification server
and stores it.
7. If necessary, the user’s iPhone prompts the user for additional information.
Verify Diagnoses and Send Notifications


## Page 3

8. The user’s iPhone creates a hashed message authentication code (HMAC) calculated from the
user’s exposure key data and sends it to the test verification server along with the user’s
authentication token, receiving in return a certificate and additional per-key metadata. For mor
information on the HMAC calculation, see Public Health Authority Diagnosis Verification Protoc
9. The user’s iPhone validates the returned certificate and metadata and stores them.
10. iPhone prompts the user for permission to submit their keys to the key server.
11. If the user grants permission, their iPhone uploads their temporary exposure keys to the key
server along with the authentication token, certificate, and metadata received from the test
verification server.
12. If the test verification server validates the uploaded keys, it adds them to its database and
returns a revision token that can be used to upload a diagnosis change for the uploaded keys.
The validated and uploaded keys are available for download by other devices to be used for on-
device exposure detection. To look at a sample implementation of a key server that supports both
Exposure Notifications Express as well as Exposure Notifications client apps, see Exposure
Notifications Reference Key Server. To look at a sample implementation of a test verification serve
see Exposure Notifications Verification System Reference Server.
Setting Up an Exposure Notifications Express Test Verification Server
Validate positive diagnoses for app-less exposure notifications.
Configuring a Key Server for Exposure Notifications Express
Support exposure key upload and download for app-less exposure notifications.
Building an App to Notify Users of COVID-19 Exposure
Inform people when they may have been exposed to COVID-19.
Setting Up a Key Server
Ensure that your server meets the requirements for supporting Exposure Notifications.
Topics
Server Configuration
See Also
Essentials


## Page 4

class ENManager
A class that manages exposure notifications.
ENDeveloperRegion
A string that specifies the region that the app supports.
ENAPIVersion
A number that specifies the version of the API to use.
Changing Configuration Values Using the Server‑to‑Server API
Update Exposure Notifications configuration values from a Public Health Authority’s server.
Testing Exposure Notifications Apps in iOS 13.7 and Later
Perform end-to-end validation of Exposure Notifications apps on a device by manually loadin
configuration files.
Supporting Exposure Notifications in iOS 12.5
Prepare your Exposure Notifications app to run on a previous version of iOS.


## Page 5

This code project uses the Exposure Notification framework to build a sample app that
demonstrates how to notify people when they have come into contact with someone who meets a
set of criteria for a case of COVID-19. When using the project as a reference for designing an
Exposure Notifications app, you can define the criteria for how the framework determines whethe
the risk is high enough to report to the user.
The sample app includes code to simulate server responses. When building an Exposure
Notifications app based on this project, create a server environment to provide diagnosis keys an
exposure criteria, and add code to your app to communicate with this server. If the app you build
operates in a country that authenticates medical tests for COVID-19, you may need to include
additional network code to communicate with those authentication services.
Exposure Notifications is available on all iOS devices running iOS 13.5 or later. It’s also available on
iOS 12.5 with some additional setup. The Xcode project has two targets:
ExposureNotificationApp — Supports iOS 13.5 and later
ExposureNotificationApp-iOS12 — Supports iOS 12.5, and iOS 13.5 and later
For more information on the architecture and security of the Exposure Notification service, see
Privacy-Preserving Contact Tracing. For more information on supporting iOS 12.5 in your Exposur
Notifications App, see Supporting Exposure Notifications in iOS 12.5.
Overview
Configure the Sample Code Project
Exposure Notification / Building an App to Notify Users of COVID-19 Exposure
Sample Code
Building an App to Notify Users of COVID-
19 Exposure
Inform people when they may have been exposed to COVID-19.
Download
iOS 12.5+
iPadOS 12.5+
Xcode 12.4+


## Page 6

Before you run the sample code project in Xcode, make sure:
Your iOS device is running either iOS 12.5 or 13.5 or later.
You are running Xcode 12 or later.
You configure the project with a provisioning profile that includes the Exposure Notification
entitlement. To get permission to use this entitlement, see Exposure Notification Entitlement
Request.
Users must explicitly authorize an app to use Exposure Notifications. The ENManager class
provides information on the user’s authorization status and requests authorization. The project ha
a singleton class called ExposureManager that instantiates and manages the life cycle of an
ENManager object. During init, It calls activate(completionHandler:) on ENManager,
then checks the callback to find out if Exposure Notifications is enabled. If it isn’t, Exposure
Manager attempts to enable it.
The app stores information about test results and high-risk exposures in the user defaults
directory. The local data is private and stays on the device.
A custom property wrapper transforms data between its native format and a JSON-formatted
equivalent, reads and writes data in the user defaults dictionary, and posts notifications to the app
when local data changes. The LocalStore class manages the user’s private data, defined as a
series of properties that all use this property wrapper.
Authorize Exposure Notifications
Store User Data Locally


## Page 7

The app defines its own data structures for any data it persists. For example, a test result records
the date the user took the test, and whether the user shared this data with the server. This
information is used to populate the user interface.
A user with a diagnosis for COVID-19 can upload diagnosis keys to the server. Each instance of th
app periodically downloads diagnosis keys to search the device’s private interaction data for
matching interactions.
Share Diagnosis Keys with the Server


## Page 8

This project simulates a remote server with which the app communicates. There is a single Serve
object in the app that stores the received diagnosis keys and provides them on demand. The
sample server does not partition the data by region. It maintains a single list of keys, and provides
the entire list upon request.
As with the local store, this local server stores the data in JSON format, using the same
Persisted property wrapper.
The sample app demonstrates a strategy in which a recognized medical authority tested the user
and found positive COVID-19 indicators. The sample app provides a way for users to enter an
authentication code, but doesn’t submit this data to an authentication service, so all codes
automatically pass.
When the user provides information about a positive test result, the app records the test result in
the local store and asks the user to share it. To share the result, the app needs to get a list of
diagnosis keys and send the list to the server. To get the keys, the app calls the singleton
ENManager object’s getDiagnosisKeys(completionHandler:) method, as shown in the
code below.
Ask Users to Share COVID-19 Indicators


## Page 9

Each time the app calls this method, the user must authorize the transaction. The framework then
returns the list of keys to the app. The app sends those keys as-is to the server and then updates
the test record to indicate that it was shared.
The sample app’s server implementation appends the keys onto a list it maintains, skipping any
keys that are already there. It stores the keys sequentially so that the app can request just the key
it hasn’t received before.
Starting with iOS 14.4, the Exposure Notification framework allows apps to ask users for permissio
to release temporary exposure keys when they take a COVID-19 diagnostic test. This authorizatio
lasts for up to five days and should be requested only if the app determines that the user is about
to take a test and the app has a way to determine the results. To request preauthorization, the ap
calls preAuthorizeDiagnosisKeys(completionHandler:).
Ask Users to Preauthorize Key Release at the Time of the
Test


## Page 10

Within five days of being granted permission, if the app determines that the user has received a
positive test result, it can request the preauthorized keys and submit them to the key server.
ENManager sends keys to the app using a completion handler property called diagnosisKeys
AvailableHandler, which the app sets before requesting the keys:
After setting the diagnosisKeysAvailableHandler property, the app requests the keys by
calling requestPreAuthorizedDiagnosisKeys(completionHandler:). This call returns
an error if the user doesn’t authorize release or if more than five days pass after authorization.
Otherwise, the completion handler is called with the keys. When the sample app releases the keys
it notifies the user that because they’ve had a positive test result, their keys are being shared
pursuant to their prior authorization.


## Page 11

Important
PHAs must notify users that they’ve tested positive before the app calls requestPre
AuthorizedDiagnosisKeys(completionHandler:). They must also notify users that
their keys are being submitted to the PHA’s key server.
The Exposure Notifications APIs are available in the following distinct versions that implement
slightly different versions of the detection algorithm:
Version 1 — Devices running iOS 13.5 or iOS 13.6 support the version 1 API only. To prevent
runtime errors, Exposure Notifications apps for iOS 13.5 and iOS 13.6 must fall back to this
version.
Version 2 — When available, apps should use this version of the API.
The sample app includes a utility function to determine which API versions are available on the
current device:
Detect Exposure Notifications API Version at Runtime


## Page 12

The main difference between using the two API versions is the method called to detect exposures
When running on devices that only support version 1, the sample app uses getExposure
Info(summary:userExplanation:) to evaluate diagnosis keys for potential exposures. Whe
running on devices that support version 2 of the API, it uses getExposureWIndows(summary:
completionHandler:) instead.


## Page 13

The ExposureNotificationApp target demonstrates how to create a background task in iOS 13.5 or
later to periodically download new keys and check whether the user may have been exposed to a
individual with COVID-19.
The app’s Info.plist file declares a background task named com.example.apple-
samplecode.ExposureNotificationSampleApp.exposure-notification. The
Background Task framework automatically detects apps that contain the Exposure Notification
entitlement and a background task that ends in exposure-notification. The operating
system automatically launches these apps when they aren’t running and guarantees them more
background time to ensure that the app can test and report results promptly.
First, the background task provides a handler in case it runs out of time. Then it calls the app’s
detectExposures method to test for exposures. Finally, it schedules the next time the system
should execute the background task.
Check for Exposures in iOS 13.5+


## Page 14

To support iOS 12.5, apps must register an activity handler with ENManager’s setLaunch
ActivityHandler() instead of creating a background task, but only when running on iOS 12.5
This step is necessary because Background Tasks do not exist in iOS 12.5. Instead, ENManager
provides apps that register an activity handler with 3.5 minutes of background processing at least
once per day.
Check for Exposures in iOS 12.5


## Page 15

The remaining sections describe how the app obtains the set of diagnosis keys and submits them
to the framework for evaluation.
The app downloads diagnosis keys from the server to pass to the framework, starting with the firs
key the app hasn’t downloaded before. This design ensures that the app checks each diagnosis
key only once on any given device.
The app needs to provide signed key files to the framework. The app asks the server for the URLs
of any key files that the server generated after the last file that the app checked. After receiving t
URLs from the server, the app uses a dispatch group to download the files to the device.
Finally, the app creates an array of the local URLs for the downloaded files.
Download Diagnosis Keys


## Page 16

The framework will compare locally saved interaction data against the diagnosis keys provided by
the app. When the framework finds a match, it calculates a risk score for that interaction based o
a number of different factors, such as when the interaction took place and how long the devices
were in proximity to each other.
To provide specific guidance to the framework about how risk should be evaluated, the app creat
an ENExposureConfiguration object. The app requests the criteria from the Server object,
which creates and returns an ENExposureConfiguration object as shown below. The sample
configuration has placeholder data that evaluates any interaction as risky, so the framework retur
all interactions that match the diagnosis keys.
Configure Criteria to Estimate Risk


## Page 17



## Page 18

After downloading the key files, the app performs the search for exposures using a series of
asynchronous steps. First, the app requests the criteria from the server, which calls into the code
shown in the Configure Criteria to Estimate Risk section above. Then the app calls the ENManage
objects’s detectExposures(configuration:diagnosisKeyURLs:completion
Handler:) method, passing the criteria and the URLs for the downloaded key files. This method
returns a summary of the search results.
Submit Diagnosis Keys to the Framework


## Page 19

The code then passes off the downloaded keys to one of two different methods based on which
API version is available on the device.
Finally, the app calls its finish method to complete the search. The finish method updates th
local store with the new data, including any exposures, the date and time the app executed the
search, and the index for the key file to check next time.
Supporting Exposure Notifications Express
Configure servers to notify users of potential exposures to COVID-19 without an app.
Setting Up a Key Server
Ensure that your server meets the requirements for supporting Exposure Notifications.
See Also
Essentials


## Page 20

class ENManager
A class that manages exposure notifications.
ENDeveloperRegion
A string that specifies the region that the app supports.
ENAPIVersion
A number that specifies the version of the API to use.
Changing Configuration Values Using the Server‑to‑Server API
Update Exposure Notifications configuration values from a Public Health Authority’s server.
Testing Exposure Notifications Apps in iOS 13.7 and Later
Perform end-to-end validation of Exposure Notifications apps on a device by manually loadin
configuration files.
Supporting Exposure Notifications in iOS 12.5
Prepare your Exposure Notifications app to run on a previous version of iOS.


## Page 21

Apps that use the Exposure Notification framework rely on a key server to identify potential
exposure to individuals diagnosed with COVID-19, the disease caused by the SARS-CoV-2 virus.
The key server is responsible for collecting and distributing exposure keys to allow on-device
exposure detection. This article describes how to provide the data that allows exposure notificatio
to work, and details the data format the Exposure Notification framework requires.
A key server, at a minimum, must allow exposure notification clients to:
Retrieve diagnosis keys so they can check for potential exposures
Submit temporary exposure keys
If providing a client app, a Health Authority can choose how to implement these capabilities as lon
as the data that passes to and from the exposure notification client conforms to the data formats
this article describes. To support Exposure Notifications Express, which allows exposure
notifications without an app in iOS 13.7 and above, a key server’s functionality must conform to
specific requirements. For more information on how to support Exposure Notifications Express wi
your key server, see Configuring a Key Server for Exposure Notifications Express.
Google has created an implementation of a key server that you can use as a reference, or as a
starting point for creating your own key server.
Note
Diagnosis keys are temporary exposure keys for individuals who have had a positive diagnosis
of COVID-19.
Overview
Exposure Notification / Setting Up a Key Server
Article
Setting Up a Key Server
Ensure that your server meets the requirements for supporting Exposure
Notifications.


## Page 22

Before you begin setting up your key server, request an Exposure Notification Entitlement. Once
your request is accepted, you’ll be asked to provide information that clients will use to authentica
the data they receive from your server, such as its public key.
A key server must reject invalid key files uploaded from a client app. Uploaded key data is
considered invalid if:
The period of time covered by the data file exceeds 14 days
TEKRollingPeriod, if included, must be a positive value that is no greater than 144
If TEKRollingPeriod is not included, use a default value of 144. You may optionally want to
validate the clock time the device submits.
For detailed information on implementing key validity checks, see Exposure Notification
Cryptography Specification.
To help ensure that the data sent to client devices canʼt be used to reveal a userʼs identity, your k
server:
Must store temporary exposure keys in randomized order, not in the order in which theyʼre
received, and not grouped by user
Must not distribute temporary exposure key data until at least 2 hours after the end of the keyʼs
expiration window
Must periodically delete any stored temporary exposure keys to ensure that none are over 30
days old
A key server must always sign files with the private key that corresponds to the latest public key
provided to Apple using SHA-256 with ECDSA. Exposure notification clients reject keys retrieved
from a server when they can’t verify them against the current public key.
A key server must deliver diagnosis key data to clients as a zip archive that contains two files, bot
stored at the root level, and both with the same base name, but different extensions. The file that
contains the temporary exposure key data must have the extension .bin and the file that contain
the signature and signature-verification metadata must have the extension .sig.
Reject Invalid Temporary Exposure Keys
Take Precautions with Temporary Exposure Keys
Sign Downloads with the Latest Registered Certificate
Package Temporary Exposure Key Data in a Zip Archive


## Page 23

A key server can send multiple zip archives to the same client, but each archive sent at the same
time must use different base names for the contained files. For compatibility, send a maximum of
15 key files to a single client in a 24-hour period, because clients running on iOS 13.5 and earlier
are limited to 15 key files in this time frame.
For best results, zip archives should be no larger than 16 MB and contain no more than 750,000
keys.
Note
While both the key and signature file specifications support multi-file batches, not all exposure
notification clients accept them. To ensure that all clients can accept your key server’s
diagnosis keys, always set batch_num and batch_size to a value of 1.
The .bin file in the zip archive is a binary file that begins with a 16-byte header that contains ​EK
Export v1​ in UTF-8 encoding, right-padded with whitespace characters. This header represent
the current version of the exposure-key binary format. The header is followed by a serialized ​
protocol buffer​ message named TemporaryExposureKeyExport,​ which uses the following
protocol buffer definition:


## Page 24



## Page 25

The .sig file in the archive contains the signature and information the client needs to validate the
download. The key server generates the signature file by serializing a single TEKSignatureLis
protocol buffer message, which uses the following protocol buffer definition:
To calculate the signature data inside a TEKSignature message, start by generating a digest
of the data file in the archive using the SHA-256 hash algorithm. Then, sign the digest value using
the ECDSA with P-256 algorithm. The private key you use for signing must be the one that
corresponds to the public key registered with Appleʼs key server.


## Page 26

Supporting Exposure Notifications Express
Configure servers to notify users of potential exposures to COVID-19 without an app.
Building an App to Notify Users of COVID-19 Exposure
Inform people when they may have been exposed to COVID-19.
class ENManager
A class that manages exposure notifications.
ENDeveloperRegion
A string that specifies the region that the app supports.
ENAPIVersion
A number that specifies the version of the API to use.
Changing Configuration Values Using the Server‑to‑Server API
Update Exposure Notifications configuration values from a Public Health Authority’s server.
Testing Exposure Notifications Apps in iOS 13.7 and Later
Perform end-to-end validation of Exposure Notifications apps on a device by manually loadin
configuration files.
Supporting Exposure Notifications in iOS 12.5
Prepare your Exposure Notifications app to run on a previous version of iOS.
See Also
Essentials


## Page 27

Important
This class is available in iOS 12.5, and in iOS 13.5 and later.
Before using an instance of this class, call activate(completionHandler:). If the completio
handler completes successfully, you can work with the remaining properties and methods on the
class. Activating this object doesn’t enable exposure notification; it only allows this object to be
used. Once activated, exposure notification can be enabled with setExposureNotification
Enabled(_:completionHandler:), if needed.
If the app no longer needs an instance of this class, you must call invalidate(), which stops
any outstanding operations and invokes the invalidation handler.
Note
Invalidation is asynchronous so it’s possible for handlers to be invoked after calling
invalidate().
The framework invokes the invalidation handler once invalidation finishes, and performs the
invocation exactly once, even if invalidate() is called multiple times. It does not call any
additional handlers.
Overview
Exposure Notification / ENManager
Class
ENManager
A class that manages exposure notifications.
iOS 12.5+
iPadOS 12.5+
Mac Catalyst 12.5+


## Page 28

After calling invalidate(), your app can’t reuse the object. A new object must be created for
subsequent use. The framework clears strong references once invalidation completes to break
potential retain cycles. You don’t need to use weak references within your handlers to avoid retain
cycles when using this class.
func activate(completionHandler: ((any Error)?) -> Void)
Prepares the manager for use.
var activityHandler: ENActivityHandler?
The handler that the framework invokes when the app activates a notification manager.
typealias ENActivityHandler
The handler the system invokes to report activities that occurred while the app wasn’t
running.
struct ENActivityFlags
Activities that occur while the app isn’t running.
func setExposureNotificationEnabled(Bool, completionHandler: ((any Erro
)?) -> Void)
Enables or disables exposure notification.
func detectExposures(configuration: ENExposureConfiguration, diagnosis
KeyURLs: [URL], completionHandler: ENDetectExposuresHandler) -> Progres
Detects exposures using the configuration that you specify for controlling the scoring
algorithm.
func detectExposures(configuration: ENExposureConfiguration, completion
Handler: ENDetectExposuresHandler) -> Progress
Detects exposures using the specified configuration to control the scoring algorithm.
func getExposureWindows(summary: ENExposureDetectionSummary, completion
Handler: ENGetExposureWindowsHandler) -> Progress
Obtains information from the provided summary about the user’s exposure within a window 
time.
Topics
Activating the Manager
Obtaining Exposure Information


## Page 29

typealias ENGetExposureWindowsHandler
The handler the system invokes when the acquisition of windows completes.
func getUserTraveled(completionHandler: (Bool, (any Error)?) -> Void)
Obtains information about the user’s travel within an exposure period.
typealias ENGetUserTraveledHandler
The handler the system invokes when acquistiion of the user’s travel status completes.
func getExposureInfo(summary: ENExposureDetectionSummary, user
Explanation: String, completionHandler: ENGetExposureInfoHandler) ->
Progress
Returns information about each exposure.
Deprecated
func getDiagnosisKeys(completionHandler: ([ENTemporaryExposureKey]?,
(any Error)?) -> Void)
Requests the temporary exposure keys from the user’s device to share with a server.
func getTestDiagnosisKeys(completionHandler: ([ENTemporaryExposureKey]?
(any Error)?) -> Void)
Requests the temporary exposure keys, including the current key, used by this device for
testing.
class ENTemporaryExposureKey
The key used to generate rolling proximity identifiers.
var exposureNotificationStatus: ENStatus
A property that indicates the status of exposure notifications.
var exposureNotificationEnabled: Bool
A property that indicates that a user enabled exposure notification.
class var authorizationStatus: ENAuthorizationStatus
A property that reports the current authorization status of the app, and never prompts the
user.
var dispatchQueue: dispatch_queue_t
Obtaining Exposure Keys
Configuring the Manager


## Page 30

The dispatch queue on which to invoke handlers.
func requestPreAuthorizedDiagnosisKeys(completionHandler: ((any Error)?
-> Void)
Requests diagnosis keys after the user authorizes sharing them.
func preAuthorizeDiagnosisKeys(completionHandler: ((any Error)?) -> Voi
)
Allows users to authorize a one-time release of diagnosis keys within five days of the
authorization.
typealias ENDiagnosisKeysAvailableHandler
The handler the system invokes after requesting diagnosis keys.
var diagnosisKeysAvailableHandler: ENDiagnosisKeysAvailableHandler?
The handler that receives available diagnosis keys after a successful preauthorization.
func invalidate()
Stops any outstanding operations and invalidates the manager.
var invalidationHandler: (() -> Void)?
The handler that the framework invokes when invalidation completes.
NSObject
CVarArg
Preauthorizing Exposure Keys
Invalidating the Manager
Instance Properties
Relationships
Inherits From
Conforms To


## Page 31

CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Supporting Exposure Notifications Express
Configure servers to notify users of potential exposures to COVID-19 without an app.
Building an App to Notify Users of COVID-19 Exposure
Inform people when they may have been exposed to COVID-19.
Setting Up a Key Server
Ensure that your server meets the requirements for supporting Exposure Notifications.
ENDeveloperRegion
A string that specifies the region that the app supports.
ENAPIVersion
A number that specifies the version of the API to use.
Changing Configuration Values Using the Server‑to‑Server API
Update Exposure Notifications configuration values from a Public Health Authority’s server.
Testing Exposure Notifications Apps in iOS 13.7 and Later
Perform end-to-end validation of Exposure Notifications apps on a device by manually loadin
configuration files.
Supporting Exposure Notifications in iOS 12.5
Prepare your Exposure Notifications app to run on a previous version of iOS.
See Also
Essentials


## Page 32

Bundle Resources / Information Property List / ENDeveloperRegion
Property List Key
ENDeveloperRegion
A string that specifies the region that the app supports.
iOS 13.7+
iPadOS 13.7+


## Page 33

Type
String
Important
This type is available in iOS 12.5, and in iOS 13.7 and later.
All ExposureNotification apps must specify the region for which they work by adding this key to th
app’s Info.plist file. The value is a string that represents the app’s region. This value can be a
ISO 3166-1 country code (e.g. “CA” for Canada), or the ISO 3166-1/3166-2 country code plus
subdivision code (“US-CA” for California).
ENAPIVersion
A number that specifies the version of the API to use.
Details
Discussion
See Also
Exposure notification


## Page 34

Type
Number
1
Use version 1 of the API.
2
Use version 2 of the API.
Default: 1
Important
This type is available in iOS 12.5, and in iOS 13.7 and later.
iOS 13.7 introduces a new method to calculate the user’s Exposure Risk Value, described in
ENExposureConfiguration. Set this value to 2 to use this new version and its calculation
Details
Possible Values
Attributes
Discussion
Bundle Resources / Information Property List / ENAPIVersion
Property List Key
ENAPIVersion
A number that specifies the version of the API to use.
iOS 13.7+
iPadOS 13.7+


## Page 35

method, or set this value to 1 to use the earlier API and its calculation method. If you don’t explici
set this value, the default is 1.
ENDeveloperRegion
A string that specifies the region that the app supports.
See Also
Exposure notification


## Page 36

The Exposure Notifications feature reads configuration values to customize behavior for each
region based on values provided by that region’s Public Health Authority (PHA). PHAs can push
changes to these configuration values from their servers using the Exposure Notifications server-
to-server API. A PHA might use the server-to-server API, for example, to automate changes unde
certain conditions, such as changing the polling interval when experiencing unusually high activity
or providing a configuration portal hosted on their own servers.
Exposure Notifications server-to-server API is located at the following URL:
This API expects a POST request with a content-type of application/json. Requests must
include both of the custom headers listed below to authenticate the request. The server rejects
requests that the API can’t authenticate, and doesn’t make any changes to the existing
configuration values.
X-Apple-verification-data
The name of the Health Authority submitting the request as a Base64-encoded UTF-8 string
X-Apple-signature
A digital signature of the string in the X-Apple-verification-data header, signed with
the private key that corresponds to the most recent public key provided to Apple.
The body of the POST request contains a JSON dictionary that uses the following keys:
appBundleID
Overview
Exposure Notification / Changing Configuration Values Using the Server‑to‑Server API
Article
Changing Configuration Values Using the
Server‑to‑Server API
Update Exposure Notifications configuration values from a Public Health
Authority’s server.


## Page 37

Identifier for the client app to which these configuration changes apply. This field isn’t neede
when making changes that only apply to Exposure Notifications Express.
countryCode
The two-letter ISO country code that corresponds to the region for which these configuration
changes apply.
state
The two-letter subdivision code that corresponds to the state, province, or other
administrative division for which these configuration changes apply, if needed.
publicKeyVersion
An integer that represents the version of the PHA’s public key, for use when authenticating
requests using the custom headers, listed above.
config
A JSON dictionary used to specify new configuration values. For a list of available keys and
their expected values, see Configuring Exposure Notifications.
This API responds with an HTTP response code, but won’t send a response body or any custom
headers. If the API can make the requested changes, the API returns an HTTP 200 response code
If the API can’t change the values, it returns one of the following codes:
400 (Invalid Payload)
Can’t validate the JSON in the body of the request. This could be because the JSON is invalid
missing required keys, or includes unrecognized keys.
401 (Unauthorized)
Can’t validate the PHA’s digital signature contained in the custom headers.
404 (Not Found)
Can’t find a configuration for the country and state (or subdivision) specified in the request
JSON.
500 (Internal Server Error)
Encountered some other error. This response code doesn’t necessarily indicate a problem wi
the request.
Supporting Exposure Notifications Express
Configure servers to notify users of potential exposures to COVID-19 without an app.
Building an App to Notify Users of COVID-19 Exposure
See Also
Essentials


## Page 38

Inform people when they may have been exposed to COVID-19.
Setting Up a Key Server
Ensure that your server meets the requirements for supporting Exposure Notifications.
class ENManager
A class that manages exposure notifications.
ENDeveloperRegion
A string that specifies the region that the app supports.
ENAPIVersion
A number that specifies the version of the API to use.
Testing Exposure Notifications Apps in iOS 13.7 and Later
Perform end-to-end validation of Exposure Notifications apps on a device by manually loadin
configuration files.
Supporting Exposure Notifications in iOS 12.5
Prepare your Exposure Notifications app to run on a previous version of iOS.


## Page 39

Exposure Notifications apps automatically download configuration information for the phone’s
current region, such as the public key, public key version, and agency name. During development
those configuration files may not yet be available, or you may need to override the configuration
values, for example, to point your app at a test server. You can manually set the default
configuration values for your region by loading custom configuration files onto your development
iPhone.
To load custom configuration files, you’ll need a Mac running Xcode, a device with your region’s
Exposure Notifications app loaded on it, and the device profile you received from Apple when you
registered as a PHA.
To load a custom Exposure Notifications configuration, the device must have the Developer menu
enabled in the Settings app. If you’ve used the device to test applications from Xcode, the menu i
already enabled. To verify that it’s enabled, go to the Settings app and scroll down to make sure
Developer is listed. Alternatively, type “developer” into the search bar and confirm it’s listed. Once
you confirm the Developer menu is enabled, you’re ready to create your configuration file.
If your iPhone doesn’t have a Developer row in the Settings app, launch Xcode on a Mac, select
Devices & Simulators from the Window menu, and plug your iPhone into your Mac. As Xcode
prepares your device, a yellow bar appears at the top of the Devices & Simulators window. If you’v
never plugged your iPhone into this computer, you’ll be asked if you want to trust it. Select “Trust
on your iPhone. After a few minutes, the yellow bar disappears, which signals that your device is
configured for development.
Overview
Enable the Developer Menu
Exposure Notification / Testing Exposure Notifications Apps in iOS 13.7 and Later
Article
Testing Exposure Notifications Apps in iOS
13.7 and Later
Perform end-to-end validation of Exposure Notifications apps on a device by
manually loading configuration files.


## Page 40

Next, you need to create a configuration file that provides the configuration information your
Exposure Notifications app needs to connect with your region’s servers. Start by copying the JSO
below into a text file:
Create a Configuration File


## Page 41

Modify the JSON so the field values match your desired configuration. At a minimum, you must
replace:
[bundle identifier] with your app’s actual bundle identifier
[public key] with the most recent public key you registered with Apple
[public key version] with the version number of your public key as a string (for example
v2)
[countryCode] with the ENDeveloperRegion value from your app’s info.plist
If your app’s region includes both a country and subdivision code, such as “US-CA”, only include
the country code (for example “US”), not the entire region code in the countryCode field, and
then populate the state field with the full region code (for example, “US-CA”, not just “CA”).
After you’ve made your changes, save the file somewhere on your Mac with the name Test
_Config.json. If you’re testing in iOS 14.1 or later, copy Test_Config.json to the Files app 
your iPhone by using AirDrop, or by adding it to the iCloud Drive folder on your Mac and then
waiting for it to sync to your iPhone. If you’re testing in iOS 14.0 or iOS 13.7, you’ll need to convert
the JSON file you created into a property list before copying it to your iPhone.


## Page 42

To convert the JSON file you created into a property list in iOS 14.0 or iOS 13.7, open the Terminal
app on your Mac, use cd to navigate to the directory where you saved Test_Config.json, the
type the following command to generate the configuration property list to load onto your iPhone:
The plutil command converts your JSON file into a new .plist file called Test_Config
.plist and places it in the same directory as the original JSON file. Copy that new file to the File
app on your iPhone by using AirDrop, or by adding the file to the iCloud Drive folder on your Mac
and then waiting for it to sync to your iPhone.
Once the configuration file is available in the Files app on your iPhone, open the Settings app, scr
down, and tap Developer. Select Exposure Notifications, then tap Developer Server Configuration
to enable it, and choose Override Configuration File. Your phone will prompt you for the location o
the configuration file. Select Test_Config.json if you’re testing in iOS 14.1 or later, or Test
_Config.plist if testing in iOS 14.0 or iOS 13.7. After you select the configuration file, you’ll
receive a notification that says, “Successfully set override configuration file”.
Note
if you don’t see an Exposure Notifications option under the Develop menu in the Settings app,
you may need to install the Exposure Notifications profile provided by Apple, which enables
that option. If you have installed the profile and still don’t see the option, contact Apple
Developer Technical Support.
Navigate back to the top level of the Settings app and tap Exposure Notifications. Select Turn on
Exposure Notifications and then select your app’s region. Once you do this, your phone will use th
information from the custom configuration file. When you want to stop using your custom
configuration file, disable Developer Server Configuration under Exposure Notifications in the
Developer section of the Settings app.
Convert the JSON File to a Property List (iOS 14 and iOS
13.7)
Load the Configuration File
See Also
Essentials


## Page 43

Supporting Exposure Notifications Express
Configure servers to notify users of potential exposures to COVID-19 without an app.
Building an App to Notify Users of COVID-19 Exposure
Inform people when they may have been exposed to COVID-19.
Setting Up a Key Server
Ensure that your server meets the requirements for supporting Exposure Notifications.
class ENManager
A class that manages exposure notifications.
ENDeveloperRegion
A string that specifies the region that the app supports.
ENAPIVersion
A number that specifies the version of the API to use.
Changing Configuration Values Using the Server‑to‑Server API
Update Exposure Notifications configuration values from a Public Health Authority’s server.
Supporting Exposure Notifications in iOS 12.5
Prepare your Exposure Notifications app to run on a previous version of iOS.


## Page 44

To increase adoption and broaden usage, the Exposure Notification framework now supports
iPhones compatible with iOS 12.5. Because Exposure Notifications was originally released in iOS
13.5, special considerations apply when developing for iOS 12.5. However, all privacy protections
put in place with the original release also apply in iOS 12.5.
Depending on your circumstances, you have a couple of options for adopting Exposure
Notifications.
If you havenʼt already developed an Exposure Notifications app, or if you have an existing app tha
uses features in later versions of iOS that arenʼt available in iOS 12.5, consider using Exposure
Notifications Express, which provides an app-less experience. For more information, see
Supporting Exposure Notifications Express.
If you have an app that uses version 1 risk scoring and want to support iOS 12.5, consider updatin
to the more robust version 2 scoring. For more information, see ENExposureConfiguration.
Exposure Notifications for iOS 12.5 requires Xcode 12.3 or later. In your Xcode project’s Build
Settings tab, set the iOS deployment target. From the menu, select Other and type “12.5.”
Overview
Determine the Level of Support You Need
Set the Deployment Target and Link the Framework
Exposure Notification / Supporting Exposure Notifications in iOS 12.5
Article
Supporting Exposure Notifications in iOS
12.5
Prepare your Exposure Notifications app to run on a previous version of iOS.


## Page 45

Select the Exposure Notification framework explicitly in the Link Binary With Libraries section und
Build Phases. Set the status of the framework to Optional.
Extend your app to handle different versions of iOS and Exposure Notifications by incorporating t
following code. Call getSupportedExposureNotificationsVersion() to determine if
Exposure Notifications is available on the device, and if so, which API version to support.
Perform API and iOS Version Checks
Objective-C
Swift


## Page 46

Although iOS 13.0 to 13.4 doesn’t support Exposure Notifications, your app might still download
onto devices with those versions of iOS. If that happens, present a dialog to let the user know
Exposure Notifications isn’t available for their device.
Apps that support Exposure Notifications periodically need time in the background to download
and evaluate temporary exposure keys. Because BGTaskScheduler isn’t available in iOS 12.5,
Bluetooth explicitly grants apps with the Exposure Notifications entitlement 3.5 minutes at least
once a day.
Add the following code to your app to prepare it to receive background processing time at the
defined interval.
Set Background Task Interval and Request Runtime
Objective-C
Swift


## Page 47

Background scheduling starts when the user authorizes and enables Exposure Notifications for th
app. Upon user authorization, the first iteration of the background launch happens after the defin
interval, and after every subsequent interval. If the app loses authorization, scheduling stops
immediately.
Add the following code to your app to extend the setLaunchActivityHandler to download
and detect exposures.
Supporting Exposure Notifications Express
Configure servers to notify users of potential exposures to COVID-19 without an app.
Building an App to Notify Users of COVID-19 Exposure
Inform people when they may have been exposed to COVID-19.
Setting Up a Key Server
Ensure that your server meets the requirements for supporting Exposure Notifications.
class ENManager
Objective-C
See Also
Essentials
Swift


## Page 48

A class that manages exposure notifications.
ENDeveloperRegion
A string that specifies the region that the app supports.
ENAPIVersion
A number that specifies the version of the API to use.
Changing Configuration Values Using the Server‑to‑Server API
Update Exposure Notifications configuration values from a Public Health Authority’s server.
Testing Exposure Notifications Apps in iOS 13.7 and Later
Perform end-to-end validation of Exposure Notifications apps on a device by manually loadin
configuration files.


