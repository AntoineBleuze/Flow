# 006_IntentModes.pdf

## Page 1

TheIntentModes structure provides values that describe an app intent’s behavior. For example,
intent modes describe whether an app intent can run in the background, foreground, or both. If an
app intent supports a IntentModes.ForegroundMode, it can specify additional behaviors.
struct Current
The current behavior for performing an app intent.
struct ForegroundMode
A type defining specific foreground behaviors for an app intent.
static var background: IntentModes
The app intent can perform its action in the background.
Overview
Topics
Structures
Type Properties
App Intents / IntentModes
Structure
IntentModes
A set of options that describe an app intent’s behavior.
iOS 26.0+
iPadOS 26.0+
Mac Catalyst
macOS 26.0+
tvOS 26.0+
visionOS 26.0+
watchOS 26.0+


## Page 2

static var foreground: IntentModes
The app intent requires the app to be in the foreground to perform its action.
static func foreground(IntentModes.ForegroundMode) -> IntentModes
Creates and returns a foreground mode with a specified behavior.
Equatable
ExpressibleByArrayLiteral
Hashable
OptionSet
RawRepresentable
Sendable
SendableMetatype
SetAlgebra
Type Methods
Relationships
Conforms To


