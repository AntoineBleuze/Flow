# 002_IntentValueQuery.pdf

## Page 1

associatedtype Input : _IntentValue
Required
associatedtype Result : ResultsCollection = [Self.ResultValue]
Required
associatedtype ResultValue = Self.Result.Result.ValueType
Required
init()
Required
func values(for: Self.Input) async throws -> Self.Result
Topics
Associated Types
Initializers
Instance Methods
App Intents / IntentValueQuery
Protocol
IntentValueQuery
A query that provides entity values to the system; for example, for visual
intelligence search.
iOS 26.0+
iPadOS 26.0+
Mac Catalyst
macOS 26.0+
tvOS 26.0+
visionOS 26.0+
watchOS 26.0+


## Page 2

Required
PersistentlyIdentifiable, Sendable, SendableMetatype
Integrating your app with visual intelligence
Enable people to find app content that matches their surroundings or objects onscreen with
visual intelligence.
Visual Intelligence
Include your app’s content in search results that visual intelligence provides.
Relationships
Inherits From
See Also
Visual intelligence


