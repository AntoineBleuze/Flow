# 001_Build an Educational Assessment App.pdf

## Page 1

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


## Page 2

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


## Page 3

Finally, the sample starts the assessment session.
Implement the AEAssessmentSessionDelegate methods to be notified of assessment sessio
lifecycle events. For example, the assessmentSession(_:wasInterruptedWithError:)
delegate method handles the case of a system failure interrupting the assessment session.
When the student finishes taking the assessment, save the results and end the assessment
session.
Handle Assessment Session Events
End the Session
See Also


## Page 4

Preparing an educational assessment app for distribution
Ensure your app maintains academic integrity by reviewing assessment practices and
managing system capabilities.
class AEAssessmentConfiguration
Configuration information for an assessment session.
class AEAssessmentSession
A session that your app uses to protect an assessment.
Sessions


