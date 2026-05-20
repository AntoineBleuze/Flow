# 002_AEAssessmentConfiguration.pdf

## Page 1

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


## Page 2

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


## Page 3

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


## Page 4

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


## Page 5

A session that your app uses to protect an assessment.


