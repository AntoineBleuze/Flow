# App impressions.pdf

## Page 1

Generating JWS impressions
Presenting ads in your app
To record a view-through impression, call beginView() when the ad content corresponding to
the impression becomes visible, and endView() when the ad content disappears. The
advertisement needs to be visible for at least two seconds for AdAttributionKit to record a view
through impression; otherwise, the framework throws an error.
Important
Regenerate an AppImpression for each ad you show. Don’t reuse AppImpression
structures across multiple ads.
To support click-through attribution, place a UIEventAttributionView over the ad content an
call either handleTap(reengagementURL:) or handleTap() after a person taps the ad
content. The framework then validates that a person taps a UIEventAttributionView before
recording the impression, and throws an error if it can’t validate that a tap occurred in a UIEvent
AttributionView.
Mentioned in
Discussion
AdAttributionKit / AppImpression
Structure
AppImpression
A structure that represents an attributable impression you generate in response to
a person’s interaction with an ad in an app.
iOS 17.4+
iPadOS 17.4+
Mac Catalyst


## Page 2

After the framework validates the tap, it records the impression and then attempts to launch one o
the user’s installed marketplaces to show the product page for the advertised app. The system
uses the advertised item ID from the JSON Web Signature (JWS) string you provide to initialize th
AppImpression, in addition to the user’s preferred marketplaces, to help determine which
marketplace the framework needs to launch. If the app is already installed, the framework launche
into the app’s Home Screen instead.
In iOS 18 and later, AppImpression supports reengagement for click-through interactions when
the advertised app is already installed on the device. The system can deep-link into the advertise
app when using handleTap(reengagementURL:). Click-through impressions can also qualify
for reengagement postbacks by opting in for reengagement in the impression JWS. For more
information about opting in for re-engagement, see Generating JWS impressions.
init(compactJWS: String) async throws
Creates a new app impression with the provided compact JSON Web Signature (JWS).
func beginView() async throws
Begins recording a view-through impression when ad content corresponding to the
impression becomes visible.
func endView() async throws
Ends the view-through impression when the ad content corresponding to the impression
disappears.
func handleView() async throws
Handles a view through ad impression.
func handleTap() async throws
Processes click-through interactions on your custom rendered ad content.
func handleTap(reengagementURL: URL) async throws
Processes click-through interactions on your custom rendered ad content, and delivers a UR
to the advertised app if it’s installed.
Topics
Creating an ad impression
Displaying view-through ads
Processing interactions with click-through ads


## Page 3

var adNetworkID: String
The advertising network ID.
var advertisedItemID: UInt64
The advertised item’s ID.
var compactJWSRepresentation: String
A string that presents the compact representation of the impression’s JSON Web Signature
(JWS).
var eligibleForReengagement: Bool
A Boolean value that indicates whether this impression is eligible for reengagement.
var id: UUID
The impression’s unique ID.
var keyID: String
The JSON Web Signature (JWS) key ID.
var publisherItemID: UInt64
The publisher app’s item ID.
var sourceID: Int
A four-digit integer that ad networks define to represent the ad campaign.
var timestamp: Date
The impression’s timestamp, in milliseconds since 1970.
static var isSupported: Bool
A Boolean value that indicates whether the framework supports app impressions on a
person’s device.
static func == (AppImpression, AppImpression) -> Bool
Returns a Boolean value that indicates whether two values are equal.
Accessing ad impression properties
Checking device support
Comparing and hashing ad impressions


## Page 4

func hash(into: inout Hasher)
A function that hashes the essential components of the value by passing them into the hash
Equatable
Hashable
Identifiable
Sendable
SendableMetatype
Relationships
Conforms To


