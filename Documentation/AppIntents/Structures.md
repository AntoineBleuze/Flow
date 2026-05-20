# Structures.pdf

## Page 1

If any of the conditions are met, confirmation will be requested.
static let lowConfidenceSource: ConfirmationConditions
Only confirm if initiated from a low-confidence action source.
Equatable
ExpressibleByArrayLiteral
OptionSet
RawRepresentable
Overview
Topics
Type Properties
Relationships
Conforms To
App Intents / ConfirmationConditions
Structure
ConfirmationConditions
Conditions for a confirmation request.
iOS 18.0+
iPadOS 18.0+
Mac Catalyst
macOS 15.0+
tvOS 18.0+
visionOS 2.0+
watchOS 11.0+


## Page 2

Sendable
SendableMetatype
SetAlgebra


## Page 3

static let async: EntityPropertyModifiers
static let readOnly: EntityPropertyModifiers
Equatable
ExpressibleByArrayLiteral
OptionSet
RawRepresentable
SetAlgebra
Topics
Type Properties
Relationships
Conforms To
App Intents / EntityPropertyModifiers
Structure
EntityPropertyModifiers
iOS 26.0+
iPadOS 26.0+
Mac Catalyst
macOS 26.0+
tvOS 26.0+
visionOS 26.0+
watchOS 26.0+


## Page 4

Note that you need to use a universal link for your URL representation, you can’t use a custom UR
scheme. For more information about universal links, see Allowing apps and websites to link to you
content.
init(String)
ExpressibleByExtendedGraphemeClusterLiteral
ExpressibleByStringInterpolation
ExpressibleByStringLiteral
Overview
Topics
Initializers
Relationships
Conforms To
App Intents / EntityURLRepresentation
Structure
EntityURLRepresentation
The URL representation of an app entity.
iOS 18.0+
iPadOS 18.0+
Mac Catalyst
macOS 15.0+
tvOS 18.0+
visionOS 2.0+
watchOS 11.0+


## Page 5

ExpressibleByUnicodeScalarLiteral


## Page 6

Note that you need to use a universal link for your URL representation, you can’t use a custom UR
scheme. For more information about universal links, see Allowing apps and websites to link to you
content.
struct EnumSingleURLRepresentation
init([Enum : EnumURLRepresentation<Enum>.EnumSingleURLRepresentation])
init(String)
Overview
Topics
Structures
Initializers
Relationships
App Intents / EnumURLRepresentation
Structure
EnumURLRepresentation
The URL representation of an app enum.
iOS 18.0+
iPadOS 18.0+
Mac Catalyst
macOS 15.0+
tvOS 18.0+
visionOS 2.0+
watchOS 11.0+


## Page 7

ExpressibleByExtendedGraphemeClusterLiteral
ExpressibleByStringInterpolation
ExpressibleByStringLiteral
ExpressibleByUnicodeScalarLiteral
Conforms To


## Page 8

var draftIdentifier: String?
The document draft identifier, if the document hasn’t been materialized on disk yet.
var fileURL: URL?
A URL that locates a file saved to disk.
var isDraft: Bool
Indicates whether this identifier represents a document draft.
static func draft(identifier: String) -> FileEntityIdentifier
Creates and returns an identifier for a draft document.
static func file(url: URL) throws -> FileEntityIdentifier
Creates and returns an identifier with the provided URL to the file on disk.
Topics
Instance Properties
Type Methods
App Intents / FileEntityIdentifier
Structure
FileEntityIdentifier
An identifier for an app entity that refers to a document or other file.
iOS 18.0+
iPadOS 18.0+
Mac Catalyst
macOS 15.0+
tvOS 18.0+
visionOS 2.0+
watchOS 11.0+


## Page 9

Copyable
Decodable
Encodable
EntityIdentifierConvertible
Equatable
Hashable
Sendable
SendableMetatype
Relationships
Conforms To


## Page 10

Each option includes display text and an optional style that influences its visual presentation. For
example, an option for deleting a file might use a text and style to communicate its destructive
action.
struct Style
Defines the visual style and semantic meaning of an IntentChoiceOption.
init(title: LocalizedStringResource, style: IntentChoiceOption.Style)
Creates a new option for a person to choose to continue an app intent.
Overview
Topics
Structures
Initializers
Instance Properties
App Intents / IntentChoiceOption
Structure
IntentChoiceOption
A structure representing an entry in a list of options for a person to choose from
before an app intent resumes its action.
iOS 26.0+
iPadOS 26.0+
Mac Catalyst
macOS 26.0+
tvOS 26.0+
visionOS 26.0+
watchOS 26.0+


## Page 11

let style: IntentChoiceOption.Style
The style applied to the option, affecting its visual appearance in the system UI.
let title: LocalizedStringResource
The localized text displayed for this option.
static var cancel: IntentChoiceOption
A system-provided option that cancel the app intent.
Equatable
Type Properties
Relationships
Conforms To


## Page 12

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


## Page 13

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


## Page 14

Note that you need to use a universal link for your URL representation, you can’t use a custom UR
scheme. For more information about universal links, see Allowing apps and websites to link to you
content.
init(String)
ExpressibleByExtendedGraphemeClusterLiteral
ExpressibleByStringInterpolation
ExpressibleByStringLiteral
Overview
Topics
Initializers
Relationships
Conforms To
App Intents / IntentURLRepresentation
Structure
IntentURLRepresentation
The URL representation of an app intent.
iOS 18.0+
iPadOS 18.0+
Mac Catalyst
macOS 15.0+
tvOS 18.0+
visionOS 2.0+
watchOS 11.0+


## Page 15

ExpressibleByUnicodeScalarLiteral


