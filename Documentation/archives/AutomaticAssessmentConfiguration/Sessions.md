# Sessions.pdf

## Page 1

To help ensure academic integrity for iOS, iPadOS, and macOS assessment apps, it’s critical to
acquire an Automatic Assessment Configuration (AAC) entitlement, assess your security policies,
and manage capabilities. Ensure the AAC entitlement is in your app’s provisioning profile and
decide how to manage system capabilities not already restricted by AAC, and third-party
keyboards. For macOS apps, focus on handling app termination and window operations during
assessments to prevent the system from getting locked in assessment mode and providing a poo
user experience.
Begin by completing the Automatic Assessment Configuration Entitlement Request. After receivin
your AAC entitlement, you must set up provisioning before building your app using AAC.
AAC creates a secure environment for delivering assessments in iOS, iPadOS, and macOS by
restricting hardware and software capabilities at the system level. When a student starts a test in
assessment mode in iOS and iPadOS, the device automatically restricts usage to just that specific
app. This prevents students from accessing any other apps or capabilities.
In assessment mode, iPadOS and iOS automatically turn off certain capabilities, like the
functionality of certain hardware buttons, screen recording and screenshots, remote observation
with Classroom, and dictionary definition lookup. Assessment mode also turns off a set of
Overview
Configure and use the Automatic Assessment
Configuration entitlement
Determine your app’s security requirements
Automatic Assessment …
/ Preparing an educational assessment app for distribution
Article
Preparing an educational assessment app
for distribution
Ensure your app maintains academic integrity by reviewing assessment practices
and managing system capabilities.


## Page 2

configurable features that you can enable to meet specific assessment needs and requirements.
These include:
Typing capabilities like autocorrect, spell checker, predictive text, keyboard text shortcuts, and
smart punctuation, and continuous path keyboard
Dictation
Spoken content
Password autofill
Handoff
In assessment mode, macOS automatically limits access to one or more apps and restricts access
to the following capabilities:
Mission Control
Menu bar
Launching apps using function keys
Notification Center and notifications
Apple Music app
Screen sharing and mirroring
Screen recording and screenshots
Siri
Dictation
Emoji keyboard
Trackpad lookup gesture
Important
Consider your app’s assessment security policies to determine what additional capabilities to
build into your app.
AAC doesn’t restrict third-party software keyboards, and some third-party keyboards support
searching from within the keyboard. If you don’t want these used in your assessment app, you
restrict their use with application(_:shouldAllowExtensionPointIdentifier:) as
shown in the code below:
Restrict third-party software keyboards for iOS and iPadOS


## Page 3

A context menu appears when someone selects text or uses a long-press gesture in a text field in
iOS or iPadOS. AAC removes the Share, Translate, and Scan Text options from the top-level menu
It’s important to carefully review any additional items that appear and remove them from the men
if you don’t want students to access them during testing.
The function buildMenu(with:) removes unwanted items or the entire menu. The following
code in the app’s delegate removes the Autofill menu (which gives access to Contacts and
Passwords) to prevent people from using Autofill to access content they’ve added:
Additionally, the property lookup removes the Lookup menu, which is another item in this menu
that assessment developers often prefer to remove. For more information about this property, see
UIMenu.Identifier.
For more information about context menus, see Human Interface Guidelines > Context menus.
AAC prevents the system from showing notifications to people. This means that notifications
requesting the user to give permissions, like microphone or camera access, aren’t displayed to
users. Therefore, it’s essential to request all necessary permissions before entering AAC, allowing
people to respond appropriately. Additionally, rechecking permissions before entering AAC is
advisable to confirm that users have granted all required permissions.
Control the context menu in iOS and iPadOS
Request permissions for your macOS app


## Page 4

Requesting Authorization for Media Capture on macOS explains how to prompt the user to
authorize access to the camera and microphone.
You can associate a menu with each view. Your view subclasses can arrange to build their own
context menus, or they can customize the default context menu by implementing menuWillOpen
in the menu’s delegate by calling removeAllItems. Another approach is to capture all events at
the top level of the application, via NSEvent.addLocalMonitorForEvents, and return nil fo
click events so they’re ignored, which prevents the appearance of any context menu.
Assessment mode doesn’t block text replacements. A person’s text replacement dictionary, set in
System Settings > Keyboard, is kept in a global default. Your app can override this global default
and replace it with an empty dictionary by adding the following:
Replacing with an empty dictionary ensures that your app doesn’t offer text replacements in
assessment mode. It’s important to do this before anything in your UI is loaded, so add it to
init() of a custom subclass of NSApplication.
If your app includes a window with an exit button for assessment mode, ensure that people can’t
close that window while an assessment is ongoing to prevent premature termination of the
assessment. One solution is to remove the close and minimize buttons from the window’s title bar
and the Close menu item if your app has one. You can edit the window’s properties in the Attribut
inspector or programmatically remove the buttons. You can also arrange to have the window’s
delegate deny the close operation if a test is in progress.
Control the context menu for macOS
Handle text replacement in macOS
Prevent early termination of an assessment in macOS


## Page 5

Even though your app’s menu bar isn’t visible and someone can’t reach it when in assessment
mode, people can still type command key equivalents to invoke menu items, such as Command-Q
for Quit. Check which of your app’s menu items have key equivalents and make sure you handle
them properly.
Important
Test these options carefully. Be careful not to lock your development Mac in assessment mode
accidentally, which happens when Xcode pauses at a breakpoint while the Mac is in this mode,
potentially leaving you with no option but to restart the Mac to exit assessment mode. To
prevent such situations, test these functionalities in a virtual machine, which offers the
flexibility to force quit if required.
AAC restricts network access to every process except those the developer allows. Temporary
network access is granted to any process working on behalf of a process that has network access
Some app-based third-party network solutions, such as content filters and VPNs, may prevent an
assessment app from connecting to the network during AAC. To accommodate AAC usage on Ma
computers with these products, consider these strategies:
Grant internet access to the network product by including it as a participant in the session.
Exclude the domains the assessment app requires from being routed through the network
product.
If necessary, schools may temporarily uninstall the incompatible network product. Alternatively
removal isn’t feasible, developers might provide a version of the app that employs different
methods to secure the Mac for testing, bypassing the need for AAC.
Build an Educational Assessment App
Ensure the academic integrity of your assessment app by using Automatic Assessment
Configuration.
class AEAssessmentConfiguration
Configuration information for an assessment session.
Consider interactions with app-based content filters and
VPNs in macOS
See Also
Sessions


## Page 6

class AEAssessmentSession
A session that your app uses to protect an assessment.


## Page 7

Academic assessment apps need to ensure that students can’t use certain system resources, like
network access, the dictionary, and the calculator. However, depending on the assessment, you
might want to allow students to use one or more of these resources. Use the Automatic
Assessment Configuration framework to enable assessment administrators to chose which of the
system resources, if any, students can use during an assessment.
This app is a web browser, with a Lock and Unlock button to enter and exit from Assessment mod
and additional buttons that can configure and launch the participating Calculator and Dictionary
apps with varying participant app configurations. These configurations are:
No access, where the participant app is prevented from launching
Allowed, with no network access, where the participant app can launch, but it can’t access the
network
Allowed, with full network access, where the participant app can launch, and it has full network
access
You can choose either Objective-C or Swift to build and run the same sample app.
To build and run this sample on your device, you must first select your development team for the
project’s target using these steps:
Overview
Configure the Sample Code Project
Automatic Assessment …
/ Build an Educational Assessment App
Sample Code
Build an Educational Assessment App
Ensure the academic integrity of your assessment app by using Automatic
Assessment Configuration.
Download
macOS 12.0+
Xcode 13.3+


## Page 8

1. Change the sample project’s bundle ID to something unique.
2. Make sure your team has been granted the com.apple.developer.automatic-
assessment-configuration entitlement for macOS.
3. Create an App ID with this capability on the Provisioning Portal. Make sure the ID matches the
bundle ID.
4. Create a Provisioning Profile for Mac Development with the App ID you created.
5. For the project’s target, choose your team from the Team menu in the Signing & Capabilities
pane, and deselect the checkbox so Xcode won’t automatically manage code signing.
6. In the Provisioning Profiles drop-down, chose to download profiles.
Before the app can start an assessment session, it needs to initialize the session.
Then the app configures one or more apps that the student is allowed to use during the
assessment. The sample creates AEAssessmentParticipantConfiguration instances to
allow or disallow network access.
The sample then configures an app with one of the previously created AEAssessment
ParticipantConfiguration instances, as appropriate, by calling an AEAssessment
Configuration instance’s setConfiguration(_:for:) method.
Start the Assessment Session


## Page 9

Finally, the sample starts the assessment session.
Implement the AEAssessmentSessionDelegate methods to be notified of assessment sessio
lifecycle events. For example, the assessmentSession(_:wasInterruptedWithError:)
delegate method handles the case of a system failure interrupting the assessment session.
When the student finishes taking the assessment, save the results and end the assessment
session.
Handle Assessment Session Events
End the Session
See Also


## Page 10

Preparing an educational assessment app for distribution
Ensure your app maintains academic integrity by reviewing assessment practices and
managing system capabilities.
class AEAssessmentConfiguration
Configuration information for an assessment session.
class AEAssessmentSession
A session that your app uses to protect an assessment.
Sessions


## Page 11

Create a configuration instance and pass it to the init(configuration:) initializer of an
AEAssessmentSession instance to create a new assessment session. Before using the
configuration, indicate which exceptions you want to allow for the assessment session’s restrictio
by setting values on the configuration instance. For example, you can set values to allow dictation
and certain aspects of autocorrect:
While you provide a configuration instance when creating a session on iOS, iPadOS, and macOS,
specific exceptions apply only to certain platforms. In particular, on macOS, you can selectively
make specific apps besides your own available during an assessment — for example, to allow use
to access a calculator or a dictionary. All other exceptions apply only to iOS and iPadOS.
Overview
Objective-C
Automatic Assessment …
/ AEAssessmentConfiguration
Class
AEAssessmentConfiguration
Configuration information for an assessment session.
iOS 13.4+
iPadOS 13.4+
Mac Catalyst 14.0+
macOS 10.15.4+
Swift


## Page 12

func setConfiguration(AEAssessmentParticipantConfiguration, for:
AEAssessmentApplication)
Adds an app to the list of apps available during an assessment.
var configurationsByApplication: [AEAssessmentApplication : AEAssessmen
ParticipantConfiguration]
The collection of apps available during an assessment, along with their associated
configurations.
func remove(AEAssessmentApplication)
Removes the availability of a previously allowed app.
var mainParticipantConfiguration: AEAssessmentParticipantConfiguration
The app-specific configuration for the app that invokes the assessment.
class AEAssessmentApplication
A representation of an app that users can access during an assessment.
class AEAssessmentParticipantConfiguration
Configuration information for an app that’s available during an assessment.
var allowsAccessibilitySpeech: Bool
A Boolean value that indicates whether to allow the speech-related accessibility features
during an assessment.
var allowsDictation: Bool
A Boolean value that indicates whether to allow the use of dictation during an assessment.
var allowsContinuousPathKeyboard: Bool
A Boolean value that indicates whether to allow Slide to Type to operate during an
assessment.
Topics
Allowing access to other apps
Allowing accessibility
Allowing typing assistance


## Page 13

var allowsKeyboardShortcuts: Bool
A Boolean value that indicates whether to allow keyboard shortcuts during an assessment.
var allowsPredictiveKeyboard: Bool
A Boolean value that indicates whether to enable the predictive keyboard during an
assessment.
var allowsPasswordAutoFill: Bool
A Boolean value that indicates whether to allow password autofill during an assessment.
var allowsSpellCheck: Bool
A Boolean value that indicates whether to allow spell check during an assessment.
var autocorrectMode: AEAssessmentConfiguration.AutocorrectMode
A Boolean value that indicates whether to allow Autocorrect during an assessment.
struct AutocorrectMode
The set of autocorrect features that you can enable during an assessment.
var allowsActivityContinuation: Bool
A Boolean value that indicates whether to allow Handoff during an assessment.
var allowsAccessibilityKeyboard: Bool
A Boolean value that indicates whether to allow alternative input methods in the Accessibility
Keyboard during an assessment.
var allowsAccessibilityLiveCaptions: Bool
A Boolean value that indicates whether to allow Live Captions during an assessment.
var allowsAccessibilityReader: Bool
A Boolean value that indicates whether to allow the Accessibility Reader during an
assessment.
var allowsAccessibilityTypingFeedback: Bool
Allowing corrections
Allowing handoff
Instance Properties


## Page 14

A Boolean value that indicates whether to allow accessibility typing feedback during an
assessment.
var allowsScreenshots: Bool
A Boolean value that indicates whether to allow screenshots copied to the clipboard during a
assessment.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSCopying
NSObjectProtocol
Preparing an educational assessment app for distribution
Ensure your app maintains academic integrity by reviewing assessment practices and
managing system capabilities.
Build an Educational Assessment App
Ensure the academic integrity of your assessment app by using Automatic Assessment
Configuration.
class AEAssessmentSession
Relationships
Inherits From
Conforms To
See Also
Sessions


## Page 15

A session that your app uses to protect an assessment.


## Page 16

Use the AEAssessmentSession class to manage an assessment session. The system allows on
one active session at a time across all processes. The first session to run gets exclusive access to
the system; subsequent session attempts fail until the first session ends.
To create an assessment session, pass a new AEAssessmentConfiguration instance to the
init(configuration:) method. Then, provide the session with a delegate that conforms to
the AEAssessmentSessionDelegate protocol:
You can indicate exceptions to the restrictions imposed by an assessment session by setting the
properties of the configuration instance, or you can use the default restrictions as shown above.
The session tells its delegate about state changes during its life cycle. To start a session, call the
session’s begin() method:
Overview
Objective-C
Objective-C
Automatic Assessment …
/ AEAssessmentSession
Class
AEAssessmentSession
A session that your app uses to protect an assessment.
iOS 13.4+
iPadOS 13.4+
Mac Catalyst 14.0+
macOS 10.15.4+
Swift
Swift


## Page 17

The method returns immediately, and the session starts disabling system features. After achieving
the desired state, the session calls its delegate’s assessmentSessionDidBegin(_:) method
Only after receiving this callback is it safe to begin your assessment. Be sure to keep a strong
reference to the session as long as you want it to remain active. If the system deallocates an activ
session, the session automatically ends.
Important
Prior to macOS 12.1, a DNS lookup that your app initiates during a session might fail. Be sure
your app resolves all required domain names before beginning a session so that the system
can cache the results. You can do this by using URLSession to send a HEAD request to each
domain name that your app needs to access.
After completing an assessment and hiding all sensitive information, call the session’s end()
method:
After making the call, wait for the session to call its delegate’s assessmentSessionDidEnd(_
method before reporting assessment completion to the user.
During assessment, the session’s delegate might receive an assessmentSession(_:was
InterruptedWithError:) callback to indicate a failure. If this happens, immediately stop the
assessment, hide all sensitive content, and end the session. Because it might take time for your
app to finalize the assessment, the session relies on your app to call the session’s end() method
Objective-C
Objective-C
Swift
Swift


## Page 18

init(configuration: AEAssessmentConfiguration)
Creates a new assessment session.
func update(to: AEAssessmentConfiguration)
Changes the session to use the specified configuration.
var configuration: AEAssessmentConfiguration
The current configuration of the session.
class var supportsMultipleParticipants: Bool
A Boolean that indicates whether the current device or platform supports a configuration wit
one or more participant applications.
class var supportsConfigurationUpdates: Bool
A Boolean that indicates whether the current device or platform supports updating a session
configuration after the session has begun.
var delegate: (any AEAssessmentSessionDelegate)?
A delegate to which the session provides state change updates.
protocol AEAssessmentSessionDelegate
An interface that the session uses to provide information about session state changes to a
delegate.
func begin()
Starts an assessment session.
func end()
Ends an assessment session.
Topics
Creating a session
Managing session configuration
Responding to session updates
Starting and stopping a session


## Page 19

var isActive: Bool
A Boolean that indicates whether an assessment session is running.
NSObject
CVarArg
CustomDebugStringConvertible
CustomStringConvertible
Equatable
Hashable
NSObjectProtocol
Preparing an educational assessment app for distribution
Ensure your app maintains academic integrity by reviewing assessment practices and
managing system capabilities.
Build an Educational Assessment App
Ensure the academic integrity of your assessment app by using Automatic Assessment
Configuration.
class AEAssessmentConfiguration
Configuration information for an assessment session.
Relationships
Inherits From
Conforms To
See Also
Sessions


